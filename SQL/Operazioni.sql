-- --------------------------------
-- Operazione 1
-- --------------------------------

DROP PROCEDURE IF EXISTS SpazioDisponibile;

DELIMITER $$
CREATE PROCEDURE SpazioDisponibile(IN _sez INT UNSIGNED)
BEGIN
	SELECT (CapienzaMassima - NumeroPiante) as Numero
	FROM Sezione
	WHERE IDSezione = _sez;
END $$

DELIMITER ;

-- --------------------------------
-- Operazione 2
-- --------------------------------

DROP PROCEDURE IF EXISTS InserisciContenitore;

DELIMITER $$
CREATE PROCEDURE InserisciContenitore(IN _dimensione_cont VARCHAR(100),
				IN _altezza_pianta VARCHAR(100),
				IN _prezzo FLOAT,
				IN _pianta INT UNSIGNED,
				IN _ripiano INT UNSIGNED)
BEGIN
	INSERT INTO Contenitore(DimensioneContenitore, AltezzaPianta, Prezzo, IDPianta, IDRipiano)
	VALUES(_dimensione_cont, _altezza_pianta, _prezzo, _pianta, _ripiano);
END $$

DELIMITER ;

-- --------------------------------
-- Operazione 3
-- --------------------------------

DROP PROCEDURE IF EXISTS ElencoCosti;

DELIMITER $$
CREATE PROCEDURE ElencoCosti(IN _utente VARCHAR(100))
BEGIN
	SELECT IDSpazio, Preventivo
	FROM Spazio
	WHERE Utente = _utente;
END $$

DELIMITER ;

-- --------------------------------
-- Operazione 4
-- --------------------------------

DROP PROCEDURE IF EXISTS InserisciComponente;
DELIMITER $$

CREATE PROCEDURE InserisciComponente(IN _x DOUBLE,
									IN _y DOUBLE,
									IN _raggio DOUBLE,
									IN _pianta INT UNSIGNED,
									IN _settore INT UNSIGNED)
BEGIN
	INSERT INTO Componente_giardino(CoordinataX, CoordinataY, Raggio, IDPianta, IDSettore)
	VALUES(_x, _y, _raggio, _pianta, _settore);
END $$

DELIMITER ;

-- --------------------------------
-- Operazione 5
-- --------------------------------

DROP PROCEDURE IF EXISTS ElencoRilevazioni;
DELIMITER $$

CREATE PROCEDURE ElencoRilevazioni(IN _cont INT UNSIGNED)
BEGIN
	SELECT *
    FROM Rilevazione
    WHERE IDContenitore = _cont;
END $$

DELIMITER ;

-- --------------------------------
-- Operazione 6
-- --------------------------------

DROP PROCEDURE IF EXISTS ElencoUtenti;
DELIMITER $$

CREATE PROCEDURE ElencoUtenti()
BEGIN
	SELECT *
    FROM Utente
    ORDER BY Credibilita DESC;
END $$

DELIMITER ;

-- --------------------------------
-- Operazione 7
-- --------------------------------

DROP PROCEDURE IF EXISTS  AggiornaVoto;
DELIMITER $$

CREATE PROCEDURE AggiornaVoto(IN _voto INT,
							IN _post INT UNSIGNED)
BEGIN
	UPDATE Post
    SET 
		SommaVoti = SommaVoti + _voto,
		NumeroVoti = NumeroVoti + 1
	WHERE IDPost = _post;
END $$

DELIMITER ;

-- --------------------------------
-- Operazione 8
-- --------------------------------

DROP PROCEDURE IF EXISTS  ElencoPendenti;
DELIMITER $$

CREATE PROCEDURE ElencoPendenti()
BEGIN
	SELECT o.Utente, o.Timestamp, P.Nome, P.Genere, P.Cultivar
    FROM 
		Ordine o
		NATURAL JOIN
		Pianta P
    WHERE O.Stato = 'Pendente';
END $$

DELIMITER ;