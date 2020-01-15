La procedure mostra un elenco di piante in base a tre criteri scelti dall'utente:
	1 - L'utente sceglie l'indice di manutenzione desiderato. Se si sceglie un indice di manutenzione alto saranno selezionate anche le piante cono un indice di manutenzione più basso
	2 - L'utente sceglie se le piante proposte devono fiorire in periodi diversi dell'anno rispetto alle altre sezioni del giardino oppure se non è rilevante.
	3 - L'utente sceglie il prezzo massimo delle piante che saranno suggerite
	
La procedure riceve in ingresso tre parametri:
	_Manutenzione: contiene l'indice di manutenzione scelto dall'utente.
	_Diversificazione_fioritura: booleano che vale 1 se il periodo di fioritura è rilevante, 0 altrimenti.
	_PrezzoMassimo: contiene il prezzo massimo delle piante suggerite.
	_Spazio:Contiente l'identificativo dello spazio che si sta progettando.

-- ---------------------------------
-- SMART DESIGN
-- ---------------------------------

DROP PROCEDURE IF EXISTS SmartDesign;
DELIMITER $$
CREATE PROCEDURE SmartDesign(IN _Manutenzione varchar(50),
							IN _Diversificazione_fioritura TINYINT,
							IN _PrezzoMassimo INT,
							IN _Spazio INT UNSIGNED)
BEGIN

	IF _Diversificazione_fioritura = 0 THEN
		IF _Manutenzione = 'Semplice' THEN
			SELECT * 
			FROM Pianta
			WHERE IndiceManutenzione = 'Semplice'
				AND _PrezzoMassimo >= PrezzoIndicativo;
		ELSEIF _Manutenzione = 'Medio' THEN
			SELECT * 
			FROM Pianta
			WHERE (IndiceManutenzione = 'Semplice'
				OR IndiceManutenzione = 'Medio')
				AND _PrezzoMassimo >= PrezzoIndicativo;
		ELSE 
			SELECT * 
			FROM Pianta
			WHERE 
				_PrezzoMassimo >= PrezzoIndicativo;
		END IF;
	ELSE
		IF _Manutenzione = 'Semplice' THEN
			SELECT * 
			FROM Pianta P1
			WHERE P1.IndiceManutenzione = 'Semplice'
				AND _PrezzoMassimo >= P1.PrezzoIndicativo
				AND (
					P1.PeriodoFioritura NOT IN(
						SELECT P2.PeriodoFioritura 
						FROM
							Settore S
							NATURAL JOIN 
							Componente_giardino CG 
							NATURAL JOIN 
							Pianta P2
						WHERE S.idSpazio = _Spazio)
					OR
						P1.PeriodoFioritura IS NULL
					);
		ELSEIF _Manutenzione = 'Medio' THEN
			SELECT * 
			FROM Pianta P1
			WHERE (P1.IndiceManutenzione = 'Semplice'
				OR P1.IndiceManutenzione = 'Medio')
				AND _PrezzoMassimo >= P1.PrezzoIndicativo
				AND (
					P1.PeriodoFioritura NOT IN(
						SELECT P2.PeriodoFioritura 
						FROM
							Settore S
							NATURAL JOIN 
							Componente_giardino CG 
							NATURAL JOIN 
							Pianta P2
						WHERE S.idSpazio = _Spazio)
					OR
						P1.PeriodoFioritura IS NULL
					);
		ELSE 
			SELECT * 
			FROM Pianta P1
			WHERE 
				_PrezzoMassimo >= P1.PrezzoIndicativo
				AND (
					P1.PeriodoFioritura NOT IN(
						SELECT P2.PeriodoFioritura 
						FROM
							Settore S
							NATURAL JOIN 
							Componente_giardino CG 
							NATURAL JOIN 
							Pianta P2
						WHERE S.idSpazio = _Spazio)
					OR
						P1.PeriodoFioritura IS NULL
					);
		END IF;
	END IF;
END $$
DELIMITER ;


'


-- ---------------------------------
-- REPORTING
-- ---------------------------------

CREATE OR REPLACE VIEW Acquisti_Piante AS
SELECT P.IDPianta, IF(D.IDOrdine IS NULL, 0, COUNT(D.IDOrdine)) AS NumeroAcquisti
FROM 
	Pianta P
	LEFT OUTER JOIN
	(SELECT	IDPianta, IDORDINE
	FROM Ordine O
    WHERE MONTH(O.Timestamp) = MONTH(CURRENT_DATE)
    ) AS D  USING(IDPianta)
GROUP BY IDPianta;

CREATE OR REPLACE VIEW Patologia_Piante AS
SELECT	C.IDPianta, 
		R.IDPatologia,
        Pat.NomePatologia,
        COUNT(*) AS FrequenzaPatologia
FROM
	Contenitore C
    NATURAL JOIN
	Rilevazione R
	NATURAL JOIN
	Patologia Pat
WHERE R.IDPatologia IS NOT NULL
	AND MONTH(R.Data) = MONTH(CURRENT_DATE)
    AND YEAR(R.Data) = YEAR(CURRENT_DATE)
GROUP BY C.IDPianta, R.IDPatologia; 

CREATE TABLE lOG_Reporting(
	IDRep INT UNSIGNED NOT NULL AUTO_INCREMENT,
    Mese INT NOT NULL,
    Anno INT NOT NULL,
    IDPianta INT UNSIGNED NOT NULL,
    Nome VARCHAR(50) NOT NULL,
    Genere VARCHAR(50) NOT NULL,
    Cultivar VARCHAR(50),
    NumeroAcquisti INT NOT NULL,
    IDPatologia INT UNSIGNED,
    NomePatologia VARCHAR(50),
    FrequenzaPatologia VARCHAR(50)
    PRIMARY KEY (IDRep)
)ENGINE=InnoDB DEFAULT CHARSET=Latin1;

DROP EVENT IF EXISTS Reporting;
DELIMITER $$
CREATE EVENT Reporting
ON SCHEDULE EVERY 1 MONTH
STARTS '2016-01-31 23:55:00' 
DO
	INSERT INTO LOG_Reporting(Mese, Anno, IDPianta, Nome, Genere, Cultivar, NumeroAcquisti, IDPatologia, NomePatologia, FrequenzaPatologia)
    SELECT
		MONTH(CURRENT_DATE) AS Mese,
		YEAR(CURRENT_DATE) AS Anno,
		P.IDPianta,
		P.Nome,
		P.Genere,
		P.Cultivar,
		AP.NumeroAcquisti,
		PP.IDPatologia,
		PP.NomePatologia,
		PP.FrequenzaPatologia
	FROM
		Acquisti_Piante AP
		LEFT OUTER JOIN
		Patologia_Piante PP USING(IDPianta)
		NATURAL JOIN 
		Pianta P;

	

-- ---------------------------------
-- INDAGINI STATISTICHE
-- ---------------------------------

DROP PROCEDURE IF EXISTS SmartDesign;

DELIMITER $$

CREATE PROCEDURE SmartDesign(IN _p VARCHAR (100))
BEGIN
SELECT	
	se.NomeSerra,
	sz.NomeSezione,
	sz.Umidita as UmiditaSezione,
    sz.Temperatura as TemperaturaSezione,
    pa.NomePatologia,
    ri.Data as DataRilevazione,
	ri.ConcentrazioneElementi
FROM
	Serra se
	NATURAL JOIN
	Sezione sz
	NATURAL JOIN
	Ripiano rp
    NATURAL JOIN
    Contenitore c
	INNER JOIN
    Rilevazione ri USING(IDContenitore) 
    NATURAL JOIN
    Patologia pa
WHERE pa.NomePatologia = _p
ORDER BY pa.NomePatologia, ri.Data, se.NomeSerra;

END $$
DELIMITER ; 


