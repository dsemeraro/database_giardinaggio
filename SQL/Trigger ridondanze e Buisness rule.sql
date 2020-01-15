/*il trigger incrementa l'attributo NumeroPiante ogni volta che viene inserita un nuovo 
contenitore in una sezione e impedisce l'inserimento nel caso in cui la sezione sia piena*/

DROP TRIGGER IF EXISTS Aggiorna_NumeroPiante_ins;

DELIMITER $$ 

CREATE TRIGGER Aggiorna_NumeroPiante_ins
BEFORE INSERT ON Contenitore
FOR EACH ROW
BEGIN
	DECLARE _sez INT UNSIGNED DEFAULT 0;
	DECLARE _ok INT DEFAULT 0;
	
	SET _ok = (
		SELECT
			IF(S.NumeroPiante < S.CapienzaMassima, 1, 0)
		FROM 
			Ripiano R
			NATURAL JOIN
			Sezione S
		WHERE IDRipiano = new.IDRipiano
	);
	
	IF _ok = 0 THEN
		SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT = 'La sezione ha raggiunto la capienza massima.';
	ELSE
		UPDATE 
			Sezione S
			NATURAL JOIN 
			(SELECT IDSezione
			FROM Ripiano
			WHERE IDRipiano = new.IDRipiano) as D
		SET S.NumeroPiante = S.NumeroPiante + 1;
	END IF;
END $$

DELIMITER ;

/*Trigger che decrementa la variabile NumeroPiante nel caso in cui una pianta della
sezione sia cancellata dal database*/

DROP TRIGGER IF EXISTS Aggiorna_NumeroPiante_del;

DELIMITER $$ 

CREATE TRIGGER Aggiorna_NumeroPiante_del
AFTER DELETE ON Contenitore
FOR EACH ROW
BEGIN
	UPDATE 
		Sezione S
		NATURAL JOIN 
		(SELECT IDSezione
		FROM Ripiano
		WHERE IDRipiano = OLD.IDRipiano) as D
	SET S.NumeroPiante = S.NumeroPiante - 1;
END $$

DELIMITER ;

/*Procedure che ricalcola il valore della variabile Preventivo.
 La procedure viene chiamata ogni volta che si salva una configurazione di uno spazio*/
 
DROP PROCEDURE IF EXISTS Aggiorna_Preventivo;

DELIMITER $$

CREATE PROCEDURE Aggiorna_Preventivo(IN _spazio INT UNSIGNED)
BEGIN
	DECLARE _pre DOUBLE DEFAULT 0;
	
	SET _pre = (
		SELECT SUM(P.PrezzoIndicativo)
		FROM 
			Settore S
			NATURAL JOIN 
			Componente_giardino CG
			NATURAL JOIN
			Pianta P
		WHERE
			S.IDSpazio = _spazio);
			
	UPDATE Spazio
	SET Preventivo = _pre
	WHERE IDSpazio = _spazio;
END $$

DELIMITER ;

/*Trigger per aggiornare l'attributo ridondante Credibilità della tabella Utente. */

DROP TRIGGER IF EXISTS Calcola_Credibilita;

DELIMITER $$ 

CREATE TRIGGER Calcola_Credibilita
AFTER UPDATE ON Post
FOR EACH ROW 
BEGIN
	DECLARE NumeroPost INT DEFAULT 0;
	DECLARE SommaMedie DOUBLE DEFAULT 0;
	DECLARE VotoPost DOUBLE DEFAULT 0;
	DECLARE Finito INT DEFAULT 0;
	
	DECLARE CursoreMedia CURSOR FOR
		SELECT SommaVoti/NumeroVoti AS Media
		FROM Post
		WHERE Autore = NEW.Autore
			AND NumeroVoti IS NOT NULL
			AND NumeroVoti <> 0;
	
	DECLARE CONTINUE HANDLER FOR NOT FOUND 
		SET Finito = 1;
	
	OPEN CursoreMedia;
	
	scan: LOOP
		FETCH CursoreMedia INTO VotoPost;
		
		IF Finito = 1 THEN 
			LEAVE scan;
		END IF;
		
		SET SommaMedie = SommaMedie + VotoPost;
		SET NumeroPost = NumeroPost + 1;
		
	END LOOP scan;
	CLOSE CursoreMedia;
	
	UPDATE Utente 
	SET Credibilita = SommaMedie/NumeroPost
	WHERE Nickname = NEW.Autore;
END $$

DELIMITER ;

/*Trigger per impedire l'inserimento di un trattamento per una pianta che è già sotto trattamento*/

DROP TRIGGER IF EXISTS Impedisci_Trattamento;

DELIMITER $$ 

CREATE TRIGGER Impedisci_Trattamento
BEFORE INSERT ON Quarantena
FOR EACH ROW
BEGIN
	
	DECLARE _alt TINYINT DEFAULT 0;
	SET _alt = (
		SELECT COUNT(*)
		FROM
			Quarantena Q
			NATURAL JOIN
			Trattamento T
		WHERE
			NEW.IDContenitore = Q.IDContenitore
			AND (T.DataFineTrattamento IS NULL 
				OR CURRENT_DATE < T.DataFineTrattamento)
		);
	
	IF _alt <> 0 THEN 
		SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT = 'Impossibile inserire dati. La pianta è già in quarantena.';
	END IF;
	
END $$

DELIMITER ;