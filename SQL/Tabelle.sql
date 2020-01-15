DROP DATABASE Progetto;

CREATE DATABASE Progetto;
USE Progetto;



-- ENTITA'

-- ------------------------------------
--  Tabella Terreno
-- ------------------------------------
DROP TABLE IF EXISTS Terreno;
CREATE TABLE Terreno(
	IDTerreno INT UNSIGNED NOT NULL AUTO_INCREMENT,
    pH FLOAT NOT NULL,
    Consistenza VARCHAR(50) NOT NULL,
    Permeabilita VARCHAR(50) NOT NULL,
    PRIMARY KEY (IDTerreno)
)ENGINE=InnoDB DEFAULT CHARSET=Latin1;

-- ------------------------------------
--  Tabella Pianta
-- ------------------------------------
DROP TABLE IF EXISTS Pianta;
CREATE TABLE Pianta(
	IDPianta INT UNSIGNED NOT NULL AUTO_INCREMENT,
    Nome VARCHAR(50) NOT NULL,
    Genere VARCHAR(50) NOT NULL,
    Cultivar VARCHAR(50),
    AltezzaMassima FLOAT NOT NULL,
	LarghezzaMassima FLOAT NOT NULL,
    IndiceAccrescimento VARCHAR(50) NOT NULL,
    PeriodoFioritura VARCHAR(50),
    PeriodoFruttificazione VARCHAR(50),
    PeriodoVegetativo VARCHAR(50) NOT NULL,
    SempreVerde CHAR(2) NOT NULL,
    Dioica CHAR(2) NOT NULL,
    IndiceManutenzione VARCHAR(50) NOT NULL,
    PrezzoIndicativo SMALLINT UNSIGNED NOT NULL,
    IDTerreno INT UNSIGNED NOT NULL,
    UNIQUE (Nome, Genere, Cultivar),
    PRIMARY KEY (IDPianta),
	FOREIGN KEY (IDTerreno) REFERENCES Terreno(IDTerreno) ON DELETE NO ACTION ON UPDATE NO ACTION
)ENGINE=InnoDB DEFAULT CHARSET=Latin1;

-- ------------------------------------
--  Tabella Elemento_nutrizionale
-- ------------------------------------
DROP TABLE IF EXISTS Elemento_nutrizionale;
CREATE TABLE Elemento_nutrizionale (
	Simbolo CHAR(2) NOT NULL,
	NomeElemento VARCHAR(25) NOT NULL,
	Tipologia VARCHAR(25) NOT NULL,
	Descrizione VARCHAR(200),
    PRIMARY KEY (Simbolo)
)ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ------------------------------------
--  Tabella Esigenza_nutrizionale
-- ------------------------------------
DROP TABLE IF EXISTS Esigenza_nutrizionale;
CREATE TABLE Esigenza_nutrizionale(
	IDPianta INT UNSIGNED NOT NULL,
	Elemento VARCHAR(50) NOT NULL,
	Concentrazione FLOAT NOT NULL,
    PRIMARY KEY (IDPianta, Elemento),
    FOREIGN KEY (IDPianta) REFERENCES Pianta(IDPianta) ON DELETE CASCADE ON UPDATE NO ACTION,
    FOREIGN KEY (Elemento) REFERENCES Elemento_nutrizionale(Simbolo) ON DELETE CASCADE ON UPDATE NO ACTION
)ENGINE=InnoDB DEFAULT CHARSET=Latin1;

-- ------------------------------------
--  Tabella Esigenza_ambientale
-- ------------------------------------
DROP TABLE IF EXISTS Esigenza_ambientale;
CREATE TABLE Esigenza_ambientale (
	IDEsigenzaAmbientale INT UNSIGNED NOT NULL AUTO_INCREMENT,
	TipoEsposizione VARCHAR(50) NOT NULL,
	OreDiLuce TINYINT NOT NULL,
	PeriodicitaIrrigazione VARCHAR(50) NULL,
	FabbisognoIdrico CHAR(5) NULL,
	TemperaturaMassima TINYINT NOT NULL,
	TemperaturaMinima TINYINT NOT NULL,
	PRIMARY KEY (IDEsigenzaAmbientale)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ------------------------------------
--  Tabella Necessita_1
-- ------------------------------------
DROP TABLE IF EXISTS Necessita_1;
CREATE TABLE Necessita_1(
	IDEsigenzaAmbientale INT UNSIGNED NOT NULL,
	IDPianta INT UNSIGNED NOT NULL,
	Periodo VARCHAR(100),
    PRIMARY KEY (IDEsigenzaAmbientale, IDPianta),
    FOREIGN KEY (IDEsigenzaAmbientale) REFERENCES Esigenza_ambientale(IDEsigenzaAmbientale) ON DELETE CASCADE ON UPDATE NO ACTION,
    FOREIGN KEY (IDPianta) REFERENCES Pianta(IDPianta) ON DELETE CASCADE ON UPDATE NO ACTION
)ENGINE=InnoDB DEFAULT CHARSET=Latin1;

-- ------------------------------------
--  Tabella Esigenza_intervento
-- ------------------------------------
DROP TABLE IF EXISTS Esigenza_intervento;
CREATE TABLE Esigenza_intervento(
	IDEsigenzaIntervento INT UNSIGNED NOT NULL AUTO_INCREMENT,
    NomeIntervento VARCHAR(50) NOT NULL,
    Descrizione VARCHAR(200) NOT NULL,
    PRIMARY KEY (IDEsigenzaIntervento)
)ENGINE=InnoDB DEFAULT CHARSET=Latin1;

-- ------------------------------------
--  Tabella Necessita_2
-- ------------------------------------
DROP TABLE IF EXISTS Necessita_2;
CREATE TABLE Necessita_2(
	IDEsigenzaIntervento INT UNSIGNED NOT NULL,
	IDPianta INT UNSIGNED NOT NULL,
	Periodo VARCHAR(100) NOT NULL,
	Frequenza VARCHAR(100),
	PRIMARY KEY (IDEsigenzaIntervento, IDPianta),
    FOREIGN KEY (IDEsigenzaIntervento) REFERENCES Esigenza_intervento(IDEsigenzaIntervento) ON DELETE CASCADE ON UPDATE NO ACTION,
    FOREIGN KEY (IDPianta) REFERENCES Pianta(IDPianta) ON DELETE CASCADE ON UPDATE NO ACTION
)ENGINE=InnoDB DEFAULT CHARSET=Latin1;

-- ------------------------------------
--  Tabella Patologia
-- ------------------------------------
DROP TABLE IF EXISTS Patologia;
CREATE TABLE Patologia(
	IDPatologia INT UNSIGNED NOT NULL AUTO_INCREMENT,
	NomePatologia VARCHAR(50) NOT NULL,
	AgentePatogeno VARCHAR(50) NOT NULL,
    PRIMARY KEY (IDPatologia)
)ENGINE=InnoDB DEFAULT CHARSET=Latin1;

-- ------------------------------------
--  Tabella Suscettibilita
-- ------------------------------------
DROP TABLE IF EXISTS Suscettibilita;
CREATE TABLE Suscettibilita(
	IDPianta INT UNSIGNED NOT NULL,
	IDPatologia INT UNSIGNED NOT NULL,
	Periodo VARCHAR(50) NOT NULL,
	Probabilita VARCHAR(50) NOT NULL,
	Entita VARCHAR(50) NOT NULL,
	PRIMARY KEY (IDPianta, IDPatologia),
    FOREIGN KEY (IDPianta) REFERENCES Pianta(IDPianta) ON DELETE CASCADE ON UPDATE NO ACTION,
    FOREIGN KEY (IDPatologia) REFERENCES Patologia(IDPatologia) ON DELETE CASCADE ON UPDATE NO ACTION
)ENGINE=InnoDB DEFAULT CHARSET=Latin1;

-- ------------------------------------
--  Tabella Sintomo
-- ------------------------------------
DROP TABLE IF EXISTS Sintomo;
CREATE TABLE Sintomo(
	IDSintomo INT UNSIGNED NOT NULL AUTO_INCREMENT,
	NomeSintomo CHAR(50) NOT NULL,
    Descrizione VARCHAR(200) NOT NULL,
    PRIMARY KEY (IDSintomo)
)ENGINE=InnoDB DEFAULT CHARSET=Latin1;

-- ------------------------------------
--  Tabella Sintomatologia
-- ------------------------------------
DROP TABLE IF EXISTS Sintomatologia;
CREATE TABLE Sintomatologia(
	IDPatologia INT UNSIGNED NOT NULL,
	IDSintomo INT UNSIGNED NOT NULL,
	PRIMARY KEY (IDPatologia, IDSintomo),
    FOREIGN KEY (IDPatologia) REFERENCES Patologia(IDPatologia) ON DELETE CASCADE ON UPDATE NO ACTION,
    FOREIGN KEY (IDSintomo) REFERENCES Sintomo(IDSintomo) ON DELETE CASCADE ON UPDATE NO ACTION
)ENGINE=InnoDB DEFAULT CHARSET=Latin1;

-- ------------------------------------
--  Tabella Immagine_sintomo
-- ------------------------------------
DROP TABLE IF EXISTS Immagine_sintomo;
CREATE TABLE Immagine_sintomo(
	IDImmagine INT UNSIGNED NOT NULL AUTO_INCREMENT,
	Link VARCHAR(250) NOT NULL,
    IDSintomo INT UNSIGNED NOT NULL,
    PRIMARY KEY (IDImmagine),
	FOREIGN KEY (IDSintomo) REFERENCES Sintomo(IDSintomo) ON DELETE CASCADE ON UPDATE NO ACTION
)ENGINE=InnoDB DEFAULT CHARSET=Latin1;

-- ------------------------------------
--  Tabella Prodotto
-- ------------------------------------
DROP TABLE IF EXISTS Prodotto;
CREATE TABLE Prodotto(
	IDProdotto INT UNSIGNED NOT NULL AUTO_INCREMENT,
	NomeCommerciale VARCHAR(50) NOT NULL,
	PrincipiAttivi VARCHAR(200) NOT NULL,
	Formulazione CHAR(2) NOT NULL,
	ModalitaSomministrazione VARCHAR(200) NOT NULL,
	PRIMARY KEY (IDProdotto)
)ENGINE=InnoDB DEFAULT CHARSET=Latin1;

-- ------------------------------------
--  Tabella Cura
-- ------------------------------------
DROP TABLE IF EXISTS Cura;
CREATE TABLE Cura(
	IDPatologia INT UNSIGNED NOT NULL,
	IDProdotto INT UNSIGNED NOT NULL,
	Dosaggio VARCHAR(100) NOT NULL,
    PRIMARY KEY (IDPatologia, IDProdotto),
    FOREIGN KEY (IDPatologia) REFERENCES Patologia(IDPatologia) ON DELETE CASCADE ON UPDATE NO ACTION,
    FOREIGN KEY (IDProdotto) REFERENCES Prodotto(IDProdotto) ON DELETE CASCADE ON UPDATE NO ACTION
)ENGINE=InnoDB DEFAULT CHARSET=Latin1;

-- ------------------------------------
--  Tabella Trattamento
-- ------------------------------------
DROP TABLE IF EXISTS Trattamento;
CREATE TABLE Trattamento(
	IDTrattamento INT UNSIGNED NOT NULL AUTO_INCREMENT,
	IDProdotto INT UNSIGNED NOT NULL,
    Dosaggio VARCHAR(50) NOT NULL,
	DataInizioTrattamento DATE NOT NULL,
	DataFineTrattamento DATE,
	PRIMARY KEY (IDTrattamento),
	FOREIGN KEY (IDProdotto) REFERENCES Prodotto(IDProdotto) ON DELETE CASCADE ON UPDATE NO ACTION
)ENGINE=InnoDB DEFAULT CHARSET=Latin1;

-- ------------------------------------
--  Tabella Sede
-- ------------------------------------
DROP TABLE IF EXISTS Sede;
CREATE TABLE Sede(
	IDSede INT UNSIGNED NOT NULL AUTO_INCREMENT,
	NomeSede VARCHAR(50) NOT NULL,
    Indirizzo VARCHAR(50) NOT NULL,
    Citta VARCHAR(50) NOT NULL,
    NumeroDipendenti SMALLINT UNSIGNED NOT NULL,
    PRIMARY KEY (IDSede)
)ENGINE=InnoDB DEFAULT CHARSET=Latin1;

-- ------------------------------------
--  Tabella Serra
-- ------------------------------------
DROP TABLE IF EXISTS Serra;
CREATE TABLE Serra(
	IDSerra INT UNSIGNED NOT NULL AUTO_INCREMENT,
	NomeSerra VARCHAR(50) NOT NULL,
    Indirizzo VARCHAR(50) NOT NULL,
    Lunghezza SMALLINT NOT NULL,
    Altezza SMALLINT NOT NULL,
    Larghezza SMALLINT NOT NULL,
    IDSede INT UNSIGNED NOT NULL,
    PRIMARY KEY (IDSerra),
	FOREIGN KEY (IDSede) REFERENCES Sede(IDSede) ON DELETE CASCADE ON UPDATE NO ACTION
)ENGINE=InnoDB DEFAULT CHARSET=Latin1;

-- ------------------------------------
--  Tabella Sezione
-- ------------------------------------
DROP TABLE IF EXISTS Sezione;
CREATE TABLE Sezione(
	IDSezione INT UNSIGNED NOT NULL AUTO_INCREMENT,
	NomeSezione VARCHAR(50) NOT NULL,
    CapienzaMassima INT NOT NULL,
    NumeroPiante INT NOT NULL,
    Illuminazione VARCHAR(50) NOT NULL,
    Umidita INT NOT NULL,
    Temperatura INT NOT NULL,
    IDSerra INT UNSIGNED NOT NULL,
    PRIMARY KEY (IDSezione),
	FOREIGN KEY (IDSerra) REFERENCES Serra(IDSerra) ON DELETE CASCADE ON UPDATE NO ACTION
)ENGINE=InnoDB DEFAULT CHARSET=Latin1;

-- ------------------------------------
--  Tabella Ripiano
-- ------------------------------------
DROP TABLE IF EXISTS Ripiano;
CREATE TABLE Ripiano(
	IDRipiano INT UNSIGNED NOT NULL AUTO_INCREMENT,
    Irrigazione VARCHAR(50) NOT NULL,
    IDSezione INT UNSIGNED NOT NULL,
    PRIMARY KEY (IDRipiano),
	FOREIGN KEY (IDSezione) REFERENCES Sezione(IDSezione) ON DELETE CASCADE ON UPDATE NO ACTION
)ENGINE=InnoDB DEFAULT CHARSET=Latin1;

-- ------------------------------------
--  Tabella Contenitore
-- ------------------------------------
DROP TABLE IF EXISTS Contenitore;
CREATE TABLE Contenitore (
	IDContenitore INT UNSIGNED AUTO_INCREMENT NOT NULL,
	DimensioneContenitore VARCHAR(25) NOT NULL,
	AltezzaPianta VARCHAR(25) NOT NULL,
	Prezzo FLOAT NOT NULL,
	IDPianta INT UNSIGNED NOT NULL,
	IDRipiano INT UNSIGNED NOT NULL,
	PRIMARY KEY (IDContenitore),
	FOREIGN KEY (IDPianta) REFERENCES Pianta(IDPianta) ON DELETE NO ACTION ON UPDATE NO ACTION,
	FOREIGN KEY (IDRipiano) REFERENCES Ripiano(IDRipiano) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ------------------------------------
--  Tabella Quarantena
-- ------------------------------------
DROP TABLE IF EXISTS Quarantena;
CREATE TABLE Quarantena(
	IDContenitore INT UNSIGNED NOT NULL,
	IDTrattamento INT UNSIGNED NOT NULL,
	PRIMARY KEY (IDContenitore, IDTrattamento),
    FOREIGN KEY (IDContenitore) REFERENCES Contenitore(IDContenitore) ON DELETE CASCADE ON UPDATE NO ACTION,
    FOREIGN KEY (IDTrattamento) REFERENCES Trattamento(IDTrattamento) ON DELETE CASCADE ON UPDATE NO ACTION
)ENGINE=InnoDB DEFAULT CHARSET=Latin1;

-- ------------------------------------
--  Tabella Rilevazione
-- ------------------------------------
DROP TABLE IF EXISTS Rilevazione;
CREATE TABLE Rilevazione(
	IDContenitore INT UNSIGNED NOT NULL,
    Data DATE NOT NULL,
    Umidita VARCHAR(50) NOT NULL,
    Esalazione VARCHAR(50),
    ConcentrazioneElementi VARCHAR(200) NOT NULL,
	IDPatologia INT UNSIGNED,
    PRIMARY KEY (IDContenitore, Data),
	FOREIGN KEY (IDContenitore) REFERENCES Contenitore(IDContenitore) ON DELETE CASCADE ON UPDATE NO ACTION,
	FOREIGN KEY (IDPatologia) REFERENCES Patologia(IDPatologia) ON DELETE CASCADE ON UPDATE NO ACTION
)ENGINE=InnoDB DEFAULT CHARSET=Latin1;

-- ------------------------------------
--  Tabella Utente
-- ------------------------------------
DROP TABLE IF EXISTS Utente;
CREATE TABLE Utente(
	Nickname VARCHAR(50) NOT NULL,
	Nome VARCHAR(50) NOT NULL,
	Cognome VARCHAR(50) NOT NULL,
    Password VARCHAR(100) NOT NULL,
    Email VARCHAR(100) NOT NULL,
    CittaDiResidenza VARCHAR(50),
    DomandaSegreta VARCHAR(100) NOT NULL,
    RispostaSegreta VARCHAR(100) NOT NULL,
    Credibilita FLOAT,
	PRIMARY KEY (Nickname)
)ENGINE=InnoDB DEFAULT CHARSET=Latin1;

-- ------------------------------------
--  Tabella Preferenza
-- ------------------------------------
DROP TABLE IF EXISTS Preferenza;
CREATE TABLE Preferenza(
	Utente VARCHAR(50),
	IDPianta INT UNSIGNED NOT NULL,
	PRIMARY KEY (Utente, IDPianta),
    FOREIGN KEY (Utente) REFERENCES Utente(Nickname) ON DELETE CASCADE ON UPDATE NO ACTION,
    FOREIGN KEY (IDPianta) REFERENCES Pianta(IDPianta) ON DELETE CASCADE ON UPDATE NO ACTION
)ENGINE=InnoDB DEFAULT CHARSET=Latin1;

-- ------------------------------------
--  Tabella Post
-- ------------------------------------
DROP TABLE IF EXISTS Post;
CREATE TABLE Post(
	IDPost INT UNSIGNED NOT NULL AUTO_INCREMENT,
	Autore VARCHAR(50),
	Timestamp TIMESTAMP NOT NULL,
    Thread VARCHAR(50),
    Testo TEXT NOT NULL,
    SommaVoti INT UNSIGNED,
	NumeroVoti INT UNSIGNED,
    link VARCHAR(200),
    PRIMARY KEY (IDPost),
	FOREIGN KEY (Autore) REFERENCES Utente(Nickname) ON DELETE SET NULL ON UPDATE NO ACTION
)ENGINE=InnoDB DEFAULT CHARSET=Latin1;

-- ------------------------------------
--  Tabella Ordine
-- ------------------------------------
DROP TABLE IF EXISTS Ordine;
CREATE TABLE Ordine(
	IDOrdine INT UNSIGNED NOT NULL AUTO_INCREMENT,
    Timestamp TIMESTAMP NOT NULL,
    Stato VARCHAR(50) NOT NULL,
	Utente VARCHAR(50) NOT NULL,
	Indirizzo VARCHAR(100) NOT NULL,
	Destinatario VARCHAR(100) NOT NULL,
	IDPianta INT UNSIGNED NOT NULL,
	IDContenitore INT UNSIGNED,
    PRIMARY KEY (IDOrdine),
	FOREIGN KEY (Utente) REFERENCES Utente(Nickname) ON DELETE CASCADE ON UPDATE NO ACTION,
	FOREIGN KEY (IDContenitore) REFERENCES Contenitore(IDContenitore) ON DELETE SET NULL ON UPDATE NO ACTION
)ENGINE=InnoDB DEFAULT CHARSET=Latin1;

-- ------------------------------------
--  Tabella Scheda
-- ------------------------------------
DROP TABLE IF EXISTS Scheda;
CREATE TABLE Scheda(
	IDScheda INT UNSIGNED NOT NULL AUTO_INCREMENT,
    Dimensione VARCHAR(100) NOT NULL,
    AttualeCollocazione VARCHAR(50) NOT NULL,
	DimensioneVaso VARCHAR(50), 
    IDPianta INT UNSIGNED NOT NULL,
    Utente VARCHAR(50) NOT NULL,
    PRIMARY KEY (IDScheda),
	FOREIGN KEY (IDPianta) REFERENCES Pianta(IDPianta) ON DELETE NO ACTION ON UPDATE NO ACTION,
	FOREIGN KEY (Utente) REFERENCES Utente(Nickname) ON DELETE CASCADE ON UPDATE NO ACTION
)ENGINE=InnoDB DEFAULT CHARSET=Latin1;

-- ------------------------------------
--  Tabella Intervento
-- ------------------------------------
DROP TABLE IF EXISTS Intervento;
CREATE TABLE Intervento(
	IDIntervento INT UNSIGNED NOT NULL AUTO_INCREMENT,
	TipoIntervento VARCHAR(100),
	Indirizzo VARCHAR(100),
    Costo SMALLINT UNSIGNED,
    Data DATE NOT NULL,
	Ricorrenza VARCHAR(100),
    IDEsigenzaIntervento INT UNSIGNED NOT NULL,
    IDScheda INT UNSIGNED NOT NULL,
    PRIMARY KEY (IDIntervento),
	FOREIGN KEY (IDEsigenzaIntervento) REFERENCES Esigenza_intervento(IDEsigenzaIntervento) ON DELETE CASCADE ON UPDATE NO ACTION,
	FOREIGN KEY (IDScheda) REFERENCES Scheda(IDScheda) ON DELETE CASCADE ON UPDATE NO ACTION
)ENGINE=InnoDB DEFAULT CHARSET=Latin1;

-- ------------------------------------
--  Tabella Spazio
-- ------------------------------------
DROP TABLE IF EXISTS Spazio;
CREATE TABLE Spazio(
	IDSpazio INT UNSIGNED NOT NULL AUTO_INCREMENT,
	Preventivo INT NOT NULL,
    Utente CHAR(50) NOT NULL,
	PRIMARY KEY (IDSpazio),
	FOREIGN KEY (Utente) REFERENCES Utente(Nickname) ON DELETE CASCADE ON UPDATE NO ACTION
)ENGINE=InnoDB DEFAULT CHARSET=Latin1;

-- ------------------------------------
--  Tabella Settore
-- ------------------------------------
DROP TABLE IF EXISTS Settore;
CREATE TABLE Settore(
	IDSettore INT UNSIGNED NOT NULL AUTO_INCREMENT,
	Coltivabile CHAR(2) NOT NULL,
    TipoLuce VARCHAR(50) NOT NULL,
    OreLuceGiornaliere TINYINT NOT NULL,
    EsposizioneCardinale VARCHAR(50) NOT NULL,
    IDSpazio INT UNSIGNED NOT NULL,
    PRIMARY KEY (IDSettore),
	FOREIGN KEY (IDSpazio) REFERENCES Spazio(IDSpazio) ON DELETE CASCADE ON UPDATE NO ACTION
)ENGINE=InnoDB DEFAULT CHARSET=Latin1;

-- ------------------------------------
--  Tabella Vertice
-- ------------------------------------
DROP TABLE IF EXISTS Vertice;
CREATE TABLE Vertice(
	IDVertice INT UNSIGNED NOT NULL AUTO_INCREMENT,
	CoordinataX DOUBLE NOT NULL,
	CoordinataY DOUBLE NOT NULL,
	PRIMARY KEY (IDVertice)
)ENGINE=InnoDB DEFAULT CHARSET=Latin1;

-- ------------------------------------
--  Tabella Confine
-- ------------------------------------
DROP TABLE IF EXISTS Confine;
CREATE TABLE Confine(
	IDVertice INT UNSIGNED NOT NULL,
	IDSettore INT UNSIGNED NOT NULL,
    PRIMARY KEY (IDVertice, IDSettore),
    FOREIGN KEY (IDVertice) REFERENCES Vertice(IDVertice) ON DELETE CASCADE ON UPDATE NO ACTION,
    FOREIGN KEY (IDSettore) REFERENCES Settore(IDSettore) ON DELETE CASCADE ON UPDATE NO ACTION
)ENGINE=InnoDB DEFAULT CHARSET=Latin1;

-- ------------------------------------
--  Tabella Componente_giardino
-- ------------------------------------
DROP TABLE IF EXISTS Componente_giardino;
CREATE TABLE Componente_giardino (
	IDComponente INT UNSIGNED NOT NULL AUTO_INCREMENT,
	CoordinataX DOUBLE NOT NULL,
	CoordinataY DOUBLE NOT NULL,
	Raggio DOUBLE NOT NULL,
	IDPianta INT UNSIGNED NOT NULL,
	IDSettore INT UNSIGNED NOT NULL,
	PRIMARY KEY (IDComponente),
	FOREIGN KEY (IDPianta) REFERENCES Pianta(IDPianta) ON DELETE CASCADE ON UPDATE NO ACTION,
	FOREIGN KEY (IDSettore) REFERENCES Settore(IDSettore) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ------------------------------------
--  Tabella Vaso
-- ------------------------------------
DROP TABLE IF EXISTS Vaso;
CREATE TABLE Vaso(
	IDVaso INT UNSIGNED NOT NULL AUTO_INCREMENT,
	Materiale VARCHAR(50) NOT NULL,
	CoordinataX DOUBLE NOT NULL,
	CoordinataY DOUBLE NOT NULL,
	Raggio DOUBLE NOT NULL,
	IDSettore INT UNSIGNED NOT NULL,
    PRIMARY KEY (IDVaso),
	FOREIGN KEY (IDSettore) REFERENCES Settore(IDSettore) ON DELETE CASCADE ON UPDATE NO ACTION
)ENGINE=InnoDB DEFAULT CHARSET=Latin1;






