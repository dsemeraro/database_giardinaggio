-- ------------------------------------------------------------------------------------
-- Inserimento in Terreno
-- ------------------------------------------------------------------------------------
INSERT INTO Terreno
VALUES(1, 8, 'Argilloso, calcareo', 'medio-alta'),
(2, 7, 'Sabbioso', 'medio-alta'),
(3, 6.5, 'Sabbioso', 'alta'),
(4, 5.5, 'Sabbioso, umifero', 'alta'),
(5, 7, 'Gessoso, argilloso', 'medio-bassa'),
(6, 7.5, 'Gessoso, argilloso', 'media'),
(7, 8.5, 'Argilloso', 'medio-bassa'),
(8, 7, 'Gessoso, sabbioso', 'Bassa'),
(9, 8, 'Gessoso', 'Alta'),
(10, 6, 'Argilloso', 'Bassa');

-- ------------------------------------------------------------------------------------
-- Inserimento in Pianta
-- ------------------------------------------------------------------------------------
INSERT INTO Pianta
VALUES(1, 'Olivo', 'Olea', 'Picholine', 15, 15, 'Molto lento', 'apr - giu', 'ott - dic', 'gen - dic', 'si', 'no', 'Medio', 15, 1),
(2,'Oleandro', 'Nerium', null, 10, 8, 'Medio', 'mag - dic', 'set - ott', 'gen - dic', 'si', 'no', 'Semplice', 5, 1),
(3, 'Verbena Odorosa', 'Aloysia', null, 3, 1.5, 'Veloce', 'mag - giu' , null, 'mar - ott', 'no', 'no', 'Semplice', 3, 2),
(4, 'Palmetto', 'Sabal', 'Bermudana', 25, 8, 'Lento', 'lug - ago', 'set - ott', 'gen - dic', 'si', 'no', 'Semplice', 30, 3),
(5, 'Ortensia', 'Hydrangea', 'Annabelle', 1.5, 1.5, 'Veloce', 'lug - set', null, 'mar - nov', 'no', 'no', 'Medio', 12, 4),
(6, 'Salice piangente', 'Salix', null, 25, 20, 'Lento', 'apr - mag', null, 'feb - ott', 'no', 'si', 'Medio',  35, 5), 
(7, 'Glicine', 'Wisteria', 'Black dragon', 12, 10, 'Medio', 'apr - giu', 'set - ott', 'mar - nov', 'no', 'no', 'Medio', 10, 6),
(8, 'Rosa di Natale', 'Helleborus', 'Emma', 0.35, 0.5, 'Molto veloce', 'gen - feb', null, 'gen - dic', 'si', 'no', 'Semplice', 13, 7),
(9, 'Alloro', 'Laurus', null, 20, 10, 'Molto Lento', 'apr - giu', 'ago - ott', 'gen - dic', 'si', 'si', 'Semplice', 7, 8),
(10, 'Vite', 'Vitis', 'Sangiovese', 12, 8, 'Veloce', 'mag - giu', 'set - ott', 'mar - nov', 'no', 'no', 'Difficile', 2, 9),
(11, 'Filadelfo', 'Philadelphus', 'Belle etoile', 5, 2, 'Medio','mag - giu', null, 'mar - dic', 'no', 'no', 'Semplice', 10, 5);

-- ------------------------------------
-- Inserimento Elemento_nutrizionale
-- ------------------------------------
INSERT INTO Elemento_nutrizionale
VALUES('N', 'Azoto', 'Macroelemento', 'È la sostanza che serve per l’accrescimento delle piante.'),
('P', 'Fosforo', 'Macroelemento', 'Agevola la fioritura e l’accrescimento e relativa maturazione dei frutti oltre che un miglior sviluppo dell’apparato radicale.'),
('K', 'Potassio', 'Macroelemento', 'Favorisce e migliora il sapore, il colore e la consistenza dei frutti; aiuta le piante a resistere al freddo, alla siccità e all’attacco dei parassiti.'),
('Ca', 'Calcio', 'Mesoelemento', 'Rinforza le piante.'),
('Mg', 'Magnesio', 'Mesoelemento', 'Insieme al ferro rappresenta un elemento essenziale della molecola della clorofilla, molto importante per la fotosintesi clorofilliana.'),
('S', 'Zolfo', 'Mesoelemento', 'È la sostanza che concorre al sapore di molti ortaggi e frutti.'),
('Cl', 'Cloro', 'Mesoelemento', 'Aiuta la crescita delle radici'),
('Fe', 'Ferro', 'Microelemento', 'Insieme al magnesio rappresenta un componente principale della molecola della clorofilla.'),
('Cu', 'Rame', 'Microelemento', 'Insieme al ferro partecipa alla produzione della clorofilla oltre che essere un costituente di molti enzimi necessari alla regolazione dei processi vitali della pianta.'),
('Zn', 'Zinco', 'Microelemento', 'Serve per la formazione e lo sviluppo dei semi.'),
('Mn', 'Manganese', 'Microelemento', 'Interviene nella sintesi della clorofilla.'),
('B', 'Boro', 'Microelemento', 'Partecipa, insieme ad altri elementi, alla formazione di fiori, frutti e radici.'),
('Mo', 'Molibdeno', 'Microelemento', 'È una sostanza che serve allo sviluppo e alla crescita delle piante.');

-- ------------------------------------
--  Inserimento Esigenza_nutrizionale
-- ------------------------------------
INSERT INTO Esigenza_nutrizionale
VALUES(1, 'N', 1.22),
(1, 'Ca', 2.64),
(1, 'Mg', 0.22),
(2, 'P', 1.42),
(2, 'K', 1.65),
(3, 'K', 1.4),
(3, 'Fe', 0.21),
(5, 'Fe', 0.6),
(5, 'N', 1.5),
(7, 'K', 1.3),
(7, 'P', 0.9),
(8, 'K', 1.3),
(9, 'N', 1.6),
(9, 'Mn', 0.6),
(9, 'Zn', 0.12);

-- ------------------------------------
--  Inserimento Esigenza_ambientale
-- ------------------------------------
INSERT INTO Esigenza_ambientale
VALUES(1, 'Mezzombra, pieno sole', 12, 'Una volta alla settimana', 'Basso', 40, -5),
(2, 'Mezzombra, pieno sole', 8, 'Mai', 'Nullo', 30, -5),
(3, 'Pieno sole', 10, 'Una volta ogni tre giorni', 'Basso', 40, 5),
(4, 'Pieno sole', 12, 'Una volta ogni due giorni', 'Medio', 40, 5),
(5, 'Mezzombra', 10, 'Ogni giorno', 'alto', 36, 0),
(6, 'Mezzombra, ombra', 8, 'Mai', 'Nullo', 20, -10),
(7, 'Pieno sole', 10, 'Ogni giorno', 'alto', 37, -10),
(8, 'Pieno sole', 12, 'Solo nei periodi di siccità prolungata', 'Basso', 37, -15),
(9, 'Ombra', 9, 'Una volta alla settimana', 'Basso', 30, -15),
(10, 'Mezzombra, pieno sole', 10, 'Solo nei periodi di siccità prolungata', 'Basso', 40, -10);

-- ------------------------------------
--  Inserimento Necessita_1
-- ------------------------------------
INSERT INTO Necessita_1
VALUES(1, 1, 'mar - ott'),
(2, 1, 'nov - feb'),
(1, 2, "tutto l'anno"),
(3, 3, 'mar - ott'),
(4, 4, 'mar - set'),
(5, 5, 'mar - nov'),
(6, 5, 'dic - feb'),
(7, 6, 'feb - ott'),
(8, 7, "tutto l'anno"),
(9, 8, "tutto l'anno"),
(10, 9, "tutto l'anno"),
(8, 10, "tutto l'anno");

-- ------------------------------------
--  Inserimento Esigenza_intervento
-- ------------------------------------
INSERT INTO Esigenza_intervento
VALUES(1, 'Concimazione', 'Concimare con elementi nutritivi mancanti nel terreno'),
(2, 'Potatura di ringiovanimento', 'Tagliare tutti i rami vecchi, secchi o improduttivi'),
(3, 'Spollonatura', 'Tagliare i polloni'),
(4, 'Diradamento', 'Tagliare i rami ritenuti in soprannumero'),
(5, 'Potatura di contenimento', 'Tagliare i rami per contenere le dimensioni della pianta'),
(6, 'Rinvaso', 'Spostare la pianta in un vaso delle dimensioni adeguate'),
(7, 'Spuntatura', 'Accorciare tutti i rami giovani e che hanno fiorito, lasciando per ognuno di essi tre o quattro gemme'),
(8, 'Potatura di riforma', "Praticata quando sorge l'esigenza di variare la forma di un albero"),
(9, 'Potatura di fruttificazione', "Praticata per favorire lo sviluppo dei rami che portano fiori e/o frutti per migliorarne la qualità"),
(10, 'Cimatura', 'Eliminare i nodi terminali di un ramo');

-- ------------------------------------
--  Inserimento Necessita_2
-- ------------------------------------
INSERT INTO Necessita_2 
VALUES(1, 1, 'Febbraio-marzo', 'Ogni 4 anni'),
(2, 1, 'Marzo-maggio', 'Ogni 4 anni'),
(3, 1, 'Marzo-maggio', 'Ogni 2 anni'),
(4, 2, 'Febbraio-marzo o settembre-ottobre', 'Ogni anno'),
(2, 2, "Durante tutto l'anno", 'Ogni anno'),
(5, 5, "Durante tutto l'anno", 'Ogni 3 anni'),
(1, 5, 'Gennaio-Febbraio', 'Ogni 3 anni'),
(7, 7, 'Gennaio-febbraio', 'Ogni anno'),
(1, 8, 'Marzo-novembre', 'Ogni anno'),
(8, 9, 'Gennaio-Febbraio', 'Ogni anno'),
(1, 10,'Gennaio-Febbraio', 'Ogni anno');

-- ------------------------------------
--  Inserimento Patologia 
-- ------------------------------------
INSERT INTO Patologia
VALUES(1, "Complesso del disseccamento rapido dell'olivo", 'Xylella fastidiosa'),
(2, "Rogna", 'Pseudomonas savastanoi'),
(3, 'Infestazione da punteruolo rosso', 'Rhynchophorus ferrugineus'),
(4, 'Infestazione da ragnetto rosso', 'Tetranychus urticae'),
(5, 'Infestazione da afidi', 'Aphidoidea'),
(6, 'Infestazione da cocciniglia scudettata', 'Coccidi'),
(7, 'Botrite', 'Botris cinerea'),
(8, 'Oidio', 'Erysiphaceae'),
(9, 'Infestazione da Metcalfa', 'Metcalfa Pruinosa'),
(10, 'Infestazione da Psilla', 'Trioza alacris');

-- ------------------------------------
--  Inserimento Suscettibilita
-- ------------------------------------
INSERT INTO Suscettibilita
VALUES(1, 1, "Tutto l'anno", 'Bassa', 'Grave'),
(1, 2, "Tutto l'anno", 'Alta', 'Lieve'),
(2, 2, "Tutto l'anno", 'Alta', 'Lieve'),
(4, 3, 'feb - set', 'Alta', 'Grave'),
(4, 5, 'feb -giu', 'Alta', 'Lieve'),
(5, 4, 'apr - ago', 'Media', 'Lieve'),
(7, 6, 'mar - set', 'Media', 'Lieve'),
(7, 8, 'giu - lug', 'Bassa', 'Media'),
(8, 5, 'feb -giu', 'Media', 'Lieve'),
(9, 10, 'mar - mag', 'Media', 'Media'),
(10, 7, 'ago - set', 'Media', 'Grave');

-- ------------------------------------
--  Inserimento Sintomo
-- ------------------------------------
INSERT INTO Sintomo
VALUES(1, 'Bruscatura', 'Disseccamento delle foglie nella parte apicale e/o marginale'),
(2, 'Escrescenze', 'Crescita di protuberanze tumorali sui rami e/o sulle foglie'),
(3, 'Chioma ad ombrello aperto', 'Portamento anomalo della chioma delle piante'),
(4, 'Perdita della chioma', 'La pianta perde la chioma e appare come "capitozzata"'),
(5, 'Ingiallimento', 'Le foglie prendono un aspetto giallo-rugginoso'),
(6, 'Arrotolamento fogliare', 'Il lembo fogliare si ripiega su se stesso'),
(7, 'Fumaggine', 'Feltro di colore nerastro sulle foglie'),
(8, 'Deformazione fogliare', 'Le foglie appaiono deformate'),
(9, 'Muffa grigia', 'Comparsa di macchie grigiastre sulle foglie, sui germogli o sui frutti in via di maturazione'),
(10, 'Macchie bianche', 'Chiazze bianche sulla pagina superiore delle foglie, sui germogli e sui fiori');

-- ------------------------------------
--  Inserimento Sintomatologia
-- ------------------------------------
INSERT INTO Sintomatologia
VALUES(1, 1),
(2, 2),
(3, 3),
(3, 4),
(4, 5),
(5, 6),
(5, 7),
(6, 7),
(6, 8),
(7, 9),
(8, 10),
(9, 7),
(10, 5),
(10, 6);

-- ------------------------------------
--  Inserimento Immagine_sintomo
-- ------------------------------------
INSERT INTO Immagine_sintomo
VALUES(1, 'http://2.bp.blogspot.com/-207ACJTAQe4/VOcgLVL3GtI/AAAAAAAAADg/c3ncrxoe9rQ/s1600/xyl1.jpeg', 1),
(2, 'http://agroambiente.info.arsia.toscana.it/docs/lab/rognaOlivoRicciolini/images/untitled_009.jpg', 2),
(3, 'http://img05.comecoltivare.it/it/piante_coltivazione/oleandro/immagini/pseudomonas_syringae_savastanoi.jpg', 2),
(4, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQNHHNlOgaZ6qkz3bZRqZ3n5dJENDhvnSePRgrb-zNoP18T70px', 3),
(5, 'http://www.qlnews.it/wp-content/uploads/2015/11/palma-punteruolo-rosso.jpg', 4),
(6, 'http://www.idroponica.it/db_img/img/attacco-foglie-ragnetto-rosso_13B-4088.jpg', 5),
(7, 'http://www.coltivarelorto.it/Images/2014/012DIC/09713-2012-12-07-FIG-003-FERRO.jpg', 5),
(8, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTeEy25YsVQRNTyPyqVgEnpDFUcy9XTZx0SBaJ64zyx-SVRFoZ_AGU-A2w', 6),
(9, 'https://upload.wikimedia.org/wikipedia/commons/thumb/3/38/Scale_and_sooty_mold_on_a_Eucalyptus_tree.jpg/220px-Scale_and_sooty_mold_on_a_Eucalyptus_tree.jpg', 7),
(10, 'http://www.auroras.eu/wp-content/uploads/botritegrappo-263x300.png', 9),
(11, 'http://www.legeorgiche.it/wp-content/uploads/2014/09/botrite-muffa-grigia-come-eliminarla.jpg', 9);

-- ------------------------------------
--  Inserimento Prodotto
-- ------------------------------------
INSERT INTO Prodotto
VALUES(1, 'Reldan 22', 'Clorpirifos-metile', 'EC', 'Nebulizzazione, irrigazione, applicazione localizzata'),
(2, 'Kohinor Plus Palme Tris', 'Imidacloprid e Ciflutrin', 'EC', 'Nebulizzazione, applicazione localizzata'),
(3, 'Borneo', 'Etoxazole', 'SC', 'Nebulizzazione'),
(4, 'Confidor', 'Imidacloprid',  'SL', 'Nebulizzazione, irrigazione'),
(5, 'Calypso Garden Protector', 'Thiacloprid', 'SE', 'Nebulizzazione, irrigazione'),
(6, 'Scala', 'Pyrimethanil', 'SC', 'Nebulizzazione'),
(7, 'Folicur giardino', 'Tebuconazolo', 'SE', 'Nebulizzazione'),
(8, 'Emerald 40', 'Tetraconazolo', 'EW', 'Nebulizzazione'),
(9, 'Neemazal T/S', 'Azadiractina', 'EC', 'Nebulizzazione'),
(10, 'Vermitec', 'Abamectina', 'EC', 'Nebulizzazione');

-- ------------------------------------
--  Inserimento Cura
-- ------------------------------------
INSERT INTO Cura
VALUES(3, 1, "2. ml/l d'acqua"),
(3, 2, "5 ml/l d'acqua"),
(4, 3, "0,35 ml/l d'acqua"),
(5, 4, "0,5 ml/l d'acqua"),
(6, 4, "0,75 ml/l d'acqua"),
(5, 5, "15 ml/l d'acqua"),
(6, 5, "20 ml/l d'acqua"),
(9, 5, "20 ml/l d'acqua"),
(7, 6, "2 ml/l d'acqua"),
(8, 7, "3 ml/l d'acqua"),
(8, 8, "0,7 ml/l d'acqua"),
(10, 9, "3 ml/l d'acqua"),
(10, 10, "0,6 ml/l d'acqua");

-- ------------------------------------
--  Inserimento Sede
-- ------------------------------------
INSERT INTO Sede
VALUES(1, 'Noncello', 'Via Cappuccini, 23', 'Pordenone', 12),
(2, 'Mazzini', 'Torino', 'Via Sandro Botticelli', 35),
(3, 'Fibonacci', 'Via Cisanello, 12', 'Pisa', 20),
(4, 'Galante', 'Contrada Galante, 5', 'Lecce', 15),
(5, 'Pinelli', 'Via Fatebenefratelli, 11', 'Milano', 43),
(6, 'Modugno', 'Via Francesco Crispi, 43', 'Bari', 38),
(7, 'De Meis', 'Via Luigi Pirandello, 100', 'Roma', 32),
(8, 'Impastato', 'Via Quintino Sella, 4' , 'Palermo', 19),
(9, 'Nduja', 'Via Savocello, 10', 'Tiriolo', 24),
(10, 'Da Vinci', 'Corso Vittorio Emanuele II, 80', 'Napoli', 36);

-- ------------------------------------
--  Inserimento Serra
-- ------------------------------------
INSERT INTO Serra 
VALUES(1, 'Blu', 'Via Cappuccini, 23', 12, 3, 7, 1),
(2, 'Verde', 'Via Cappuccini, 23', 18, 3, 7, 1),
(3, 'Alberi', 'Via Giaveno, 5', 20, 4, 10, 2),
(4, 'Fiori', 'Via Giaveno, 5', 15, 4, 15, 2),
(5, 'Serra_1', 'Viale dei Caduti', 30, 10, 20, 5),
(6, 'De Meis', 'Via Luigi Pirandello, 100', 20, 5, 10, 7),
(7, 'Serra A', 'Via Chieti', 11, 3, 5, 8),
(8, 'Serra B', 'via Marco Polo, 12', 10, 3, 10, 8),
(9, 'Serra C', 'via Amerigo Vespucci', 15, 5, 15, 8),
(10, 'Grandi Speranze', 'Via Domodossola, 8', 20, 5, 25, 10);

-- ------------------------------------
--  Inserimento Sezione
-- ------------------------------------
INSERT INTO Sezione
VALUES(1, 'SezBlu', 60, 20, '12 ore al giorno', 60, 25, 1),
(2, 'Verde est', 30, 30, '10 ore al giorno', 70, 30, 2),
(3, 'Verde ovest', 45, 13, '8 ore al giorno', 55, 30, 2),
(4, 'Frutta', 30, 20, 'luce solare', 70, 20, 3),
(5, 'Estivi', 60, 55, '10 ore al giorno', 45, 25, 4),
(6, 'Perenni', 60, 30, '10 ore al giorno', 45, 25, 4),
(7, 'Sez 1', 20, 5, '9 ore al giorno', 63, 30, 7),
(8, 'Sez 2', 30, 0, '10 ore al giorno', 52, 23, 7),
(9, 'Crescita rapida', 35, 35, 'luce solare', 45, 30, 9),
(10, 'Esotica', 50, 38, '12 ore al giorno', 76, 35, 10);

-- ------------------------------------
--  Inserimento Ripiano
-- ------------------------------------
INSERT INTO Ripiano 
VALUES(1, 'alta', 1),
(2, 'media', 1),
(3, 'alta', 2),
(4, 'alta', 3),
(5, 'bassa', 5),
(6, 'media', 5),
(7, 'alta', 4),
(8, 'bassa', 7),
(9, 'media', 8),
(10, 'alta', 10);

-- ------------------------------------
--  Inserimento Contenitore
-- ------------------------------------
INSERT INTO Contenitore
VALUES(1, 'D:20cm A:25cm', '50 cm', 4.99, 2, 1),
(2, 'D:30cm A:35cm', '1.5 m', 12.99, 1, 2),
(3, 'D:20cm A:20cm', '1 m', 3.99, 3, 5),
(4, 'D:20cm A:25cm', '75 cm', 3.99, 10, 4),
(5, 'D:15cm A:15cm', '25 cm', 10.59, 8, 3),
(6, 'D:15cm A:15cm', '35 cm', 12.99, 8, 3),
(7, 'D:25cm A:25cm', '1 m', 5.99, 9, 7),
(8, 'D:30cm A:40cm', '2 m', 28.99, 4, 8),
(9, 'D:25cm A:25cm', '1 m', 15.99, 6, 9),
(10, 'D:20cm A:15cm', '45 cm', 9.99, 5, 10);

-- ------------------------------------
--  Inserimento Trattamento
-- ------------------------------------
INSERT INTO Trattamento
VALUES(1, 3, "0,35 ml/l d'acqua", '2014-06-13', '2014-06-19'),
(2, 4, "0,5 ml/l d'acqua", '2016-04-01', '2016-04-27'),
(3, 4, "0,6 ml/l d'acqua", '2017-02-15', null),
(4, 5, "20 ml/l d'acqua", '2016-09-21', '2016-10-30'),
(5, 2, "5 ml/l d'acqua", '2015-02-02', '2015-03-02'),
(6, 2, "5 ml/l d'acqua", '2015-02-08', '2015-02-15'),
(7, 7, "3 ml/l d'acqua", '2017-01-31', null),
(8, 7, "3,5 ml/l d'acqua", '2016-04-20', '2016-05-27'),
(9, 7, "3,5 ml/l d'acqua", '2016-04-30', '2016-05-17'),
(10, 9, "3 ml/l d'acqua", '2017-02-10', null);

-- ------------------------------------
--  Inserimento Quarantena
-- ------------------------------------
INSERT INTO Quarantena 
VALUES(1, 1),
(3, 2),
(4, 2),
(3, 3),
(4, 3),
(5, 2),
(6, 2),
(7, 9),
(8, 9),
(9, 9),
(10, 5);

-- ------------------------------------
--  Inserimento Rilevazione
-- ------------------------------------
INSERT INTO Rilevazione
VALUES(1, '2017-02-09', '50%', null, 'N:0.8g, Cu:0.4g, K:1.2g', null),
(1, '2017-02-10', '50%', null, 'N:0.82g, Cu:0.4g, K:1.18g', null),
(2, '2017-02-09', '63%', 'Metano', 'Ca:0.8g, Mn:0.3g', null),
(3, '2017-02-10', '58%', null, 'K:0.91g, Fe:0.12g', 2),
(4, '2017-02-09', '62%', null, 'P:0.78g, Fe:0.29g K:0.23g', null),
(5, '2017-02-08', '74%', 'Ammoniaca', 'N:0.52g, K:0.67g, Fe:0.12g', 7),
(7, '2017-02-10', '62%', null,'Ca:0.46g, Fe:0.2g, K:1.12g', 5),
(8, '2017-02-9', '43%', 'Metano', 'Fe:0.2g, N:0.43g', 3),
(8, '2017-02-10', '42%', 'Metano', 'Fe:0.3g, N:0.48g K:0.3g', 3),
(10, '2017-02-09', '69%', null, 'Zn:0.3g, P:1.02g', 6);

-- ------------------------------------
--  Inserimento Utente
-- ------------------------------------
INSERT INTO Utente
VALUES('Billy82', 'Roberto', 'Pasolini', 'abc123d', 'r.pasolini@gmail.com', 'Milano', 'Il nome del tuo primo animale domestico?', 'Gorzorg', 2.5),
('Fragolina1', 'Giovanna', 'Angiolini', 'IpsoDicto', 'giovannanna.a@outlook.com', 'Bassano Del Grappa', 'nome della tua zia preferita?', 'Mariolina', 3.4),
('NikoBellic', 'Domenico', 'Dellisanti', 'mich3l4', 'ilmastino12@yahoo.com', 'Squinzano', 'Il compleanno di tua moglie?', 'non lo so', 0),
('Giups', 'Giuseppe', 'Pompilio', 'ForzaAtalanta', 'giu.seppe1a@gmail.com', 'Volterra', 'il nome del gatto?', 'Attila', 4.5),
('IlSignorMarioRossi', 'Mario', 'Rossi', 'HoComprato2Mele', 'mario.rossi@example.it', 'Milano', 'Il tuo piatto preferito?', 'Cozze gratinate', 5),
('Nicole23', 'Nicole', 'Landi', 'a1b2c3scaccoalre', 'nic.min123@hotmail.it', 'Rovigo', 'Il Cognome di tua madre?', 'Wilson', 1.4),
('AjejeBrazorf', 'Aldo', 'Baglio', '4ld0', 'pdor.kmer@outlook.com', null, 'Il nome del tuo cane?', 'Ringhio', 4.3),
('IlMoralizzatore', 'Ludovica', 'Cerini', 'Schell3e4t0', 'cerini.ludovica@gmail.it', 'Bologna', 'Il giorno del tuo matrimonio?', '25/08/2013', 4.3),
('Royksopp', 'Alberto', 'Bianchi', '123asd987', 'berto.white@yahoo.com', null, 'Il nome di tua nonna?', 'Leonarda', 3),
('Mammolo83', 'Guido', 'Calandrin', 'O5tr3gA', 'guido.cala83@hotmail.it', 'Venezia', 'Il nome del pappagallo?', 'Flint', 4.2);


-- ------------------------------------
--  Inserimento Preferenza
-- ------------------------------------
INSERT INTO Preferenza
VALUES('Billy82', 2),
('Billy82', 8),
('Fragolina1', 4),
('Giups', 5),
('Giups', 7),
('Giups', 6),
('Royksopp', 10),
('Mammolo83', 2),
('Mammolo83', 3),
('Nicole23', 1);

-- ------------------------------------
--  Inserimento Scheda
-- ------------------------------------
INSERT INTO Scheda
VALUES(1, 'Altezza: 10m, diametro: 3m', 'Piena terra', null, 4, 'Billy82'),
(2, 'Altezza: 10m, diametro: 3m', 'Piena terra', null, 4,'Billy82'),
(3, 'Altezza: 1m, diametro: 1m', 'Vaso', 'Altezza: 1m, Diametro: 1m', 3, 'Fragolina1'),
(4, 'Altezza: 2m, diametro: 1.5m', 'Piena terra', null, 9, 'Giups'),
(5, 'Altezza: 12m, diametro: 4m', 'Piena terra', null, 6, 'IlSignorMarioRossi'),
(6, 'Altezza: 0.35m, diametro: 0.5m', 'Vaso', 'Altezza: 0.25m, diametro: 0.25m', 8, 'NikoBellic'),
(7, 'Altezza: 1.5m, diametro: 1m', 'Piena terra', null, 10, 'Mammolo83'),
(8, 'Altezza: 5m, diametro: 5m', 'Piena terra', null, 1,'Royksopp'),
(9, 'Altezza: 1m, diametro: 0.5m', 'Vaso', 'Altezza: 0.35m, diametro: 0.35m', 7,'AjejeBrazorf'),
(10, 'Altezza: 2m, diametro: 3m', 'Vaso', 'Altezza: 0.35m, diametro: 0.35m', 2, 'Nicole23');

-- ------------------------------------
--  Inserimento Intervento
-- ------------------------------------
INSERT INTO Intervento
VALUES(1, 'Programmata', 'Via Pico Della Mirandola, 12', 25, '2017-03-21', 'Ogni anno', 2, 4),
(2, 'Richiesta', 'Via Giuseppe Giusti, 82', 35, '2016-08-10', null, 6, 3),
(3, null, null, null, '2015-04-12', null, 5, 1),
(4, 'Richiesta', 'Via Roma, 5', 30, '2017-03-08', null, 8, 5),
(5, 'Programmata', 'Via Botticelli, 102', 40, '2017-05-10', 'Ogni 4 anni', 9, 8),
(6, 'Richiesta', 'Via Galileo Galilei, 1', null, '2017-07-16', null, 6, 9),
(7, 'Automatica', 'Via Cosenza, 52', null, '2017-03-01', 'Ogni 2 anni', 3, 4),
(8, null, null, null, '2015-07-27', null, 4, 10),
(9, 'Programmata', 'Via Crispi, 8', 25, '2017-05-15', 'Ogni anno', 2, 7),
(10, null, 'Via Antonio Gramsci', null, '2016-08-08', null, 6, 6);

-- ------------------------------------
--  Inserimento Post
-- ------------------------------------
INSERT INTO Post
VALUES(1, 'Fragolina1', '2016-05-12 15:24:13', 'Aiuto afidi!', 'Stamattina ho notato che le mie rose erano piene di afidi...come faccio?', null, null, null),
(2, 'Giups', '2016-05-12 18:08:43', 'Aiuto afidi!', 'Prova con Confidor', 26, 6, 'http://www.bayergarden.it/Prodotti/c/Confidor-200-SL'),
(3, 'Nicole23', '2016-05-13 09:32:14', 'Aiuto afidi!', "Se non vuoi usare prodotti chimici prova a spurzzarci sopra un decotto all'aglio.", 56, 12, null),
(4, 'Royksopp', '2016-08-21 16:54:51', 'Raccolta noci', 'Qualcuno sa quando è il periodo migliore per raccogliere le noci?', null, null, null),
(5, 'AjejeBrazorf', '2017-01-23 18:21:39', 'Consigli Dionea', 'Sono alla prima esperienza, ho comprato una dionea ma in due settimane è cresciuto un fusto centrale stretto e lungo di almeno 10 cm! è normale?', null, null, null),
(6, 'Mammolo83', '2017-01-23 18:54:12', 'Consigli Dionea', 'Ciao. Tranquillo è solo uno stelo fiorale. ti lascio un link con altre informazioni utili.', 52, 11, 'https://www.giardinaggio.it/piante-grasse/piante-carnivore/pianta-carnivora-dionea.asp'),
(7, 'NikoBellic', '2016-12-03 15:32:16', "Un po' di fiori", 'Visto che ora la natura è un tripudio di fiori, ne posto alcuni dei miei bonsai', null, null, 'https://giardinaggio.it/attachments/a-004-jpg.145020/'),
(8, 'IlMoralizzatore', '2016-12-03 18:02:23', "Un po' di fiori", 'Sono orribili!', 5, 9, null),
(9, 'IlSignorMarioRossi','2017-02-03 11:40:12', 'Lavanda più profumata', 'Buongiorno! Questa primavera vorrei piantare della lavanda in giardino. Però, come da titolo,vorrei sapere quale sia la varietà più profumata. Grazie :)', null, null, null),
(10, 'Giups', '2017-02-04 15:09:25', 'Lavanda più profumata', "Dipende dagli spazi che hai...Io conosco l'angustifolia (che rimane più piccolina)", 21, 6, 'https://www.giardinaggio.it/giardino/piante/lavanda_NG3.jpg');

-- ------------------------------------
--  Inserimento Ordine
-- ------------------------------------
INSERT INTO Ordine
VALUES(1, '2017-02-5 13:03:14', 'Spedito', 'NikoBellic', 'Via Luigi Masi, 4, Squinzano (LE)', 'Domenico Dellisanti', 3, 3),
(2, '2017-02-10 08:21:16', 'In processazione', 'Nicole23', 'Via Giovanni Pascoli, 3, Rovigo (RO)', 'Nicole Landi', 10, 4),
(3, '2016-12-14 12:05:23', 'Evaso', 'Royksopp', 'Corso Pietro Vannucci, 20, Perugia (PG)', 'Goffredo Bianchi', 2, null),
(4, '2016-11-28 17:25:54', 'Evaso', 'Fragolina1', 'Viale Venezia, 82, Bassano del Grappa (VI)', 'Giovanna Angiolini', 5, null),
(5, '2017-01-20 09:39:42', 'In preparazione', 'Fragolina1', 'Viale Venezia, 82, Bassano del Grappa (VI)', 'Giovanna Angiolini', 1, 2),
(6, '2017-02-04 11:12:13', 'Pendente', 'AjejeBrazorf', 'Via Napoleone Colajanni, 42, Bari (BA)', 'Aldo Baglio', 1, null),
(7, '2016-12-23 21:54:02', 'Evaso', 'IlSignorMarioRossi', 'Via Antonio Rosmini, 5, Milano (MI)', 'Mario Rossi', 8, null),
(8, '2016-10-10 16:42:38', 'Pendente', 'Mammolo83', 'Via Rizzetti, 39, Castelfranco Veneto (TV)', 'Guido Calandrin', 1, null),
(9, '2017-01-03 20:32:00', 'Spedito', 'Billy82', 'Via Dalmazia, 17, Lanciano (CH)', 'Lucrezia Bellanova', 6, 9),
(10, '2017-02-01 21:03:43', 'In Processazione', 'Royksopp', 'Corso Pietro Vannucci, 20, Perugia (PG)', 'Alberto Bianchi', 9, 7);

-- ------------------------------------
--  Inserimento Spazio
-- ------------------------------------
INSERT INTO Spazio 
VALUES(1, 110, 'NikoBellic'),
(2, 95, 'NikoBellic'),
(3, 84, 'Nicole23'),
(4, 62, 'Giups'),
(5, 76, 'Giups'),
(6, 80, 'Giups'),
(7, 138, 'IlMoralizzatore'),
(8, 50, 'Fragolina1'),
(9, 52, 'Fragolina1'),
(10, 86, 'Mammolo83');

-- ------------------------------------
--  Inserimento Settore
-- ------------------------------------
INSERT INTO Settore 
VALUES(1, 'no', 'Diretta', 12, 'sud', 1),
(2, 'si', 'Diretta', 12, 'sud', 1),
(3, 'si', "Mezz'ombra", 10, 'est', 1),
(4, 'si', 'Diretta', 8, 'nord', 3),
(5, 'no', 'Ombra', 5, 'nord', 3),
(6, 'si', 'Diretta', 12, 'sud', 4),
(7, 'no', "Mezz'ombra", 8, 'ovest', 5),
(8, 'si', 'Diretta', 11, 'sud', 5),
(9, 'si', "Mezz'ombra", 9, 'sud', 6),
(10, 'no', 'Diretta', 10, 'est', 6);

-- ------------------------------------
--  Inserimento Vertice
-- ------------------------------------
INSERT INTO Vertice
VALUES(1, 0, 0),
(2, 0, 4.5),
(3, 4.5, 4.5),
(4, 0, 6),
(5, 5.8, 12),
(6, 5.8, 0),
(7, 0, 0),
(8, 0, 12),
(9, 0.5, 0),
(10, 0.5, 4),
(11, 5.5, 0),
(12, 5.5, 4);

-- ------------------------------------
--  Inserimento Confine
-- ------------------------------------
INSERT INTO Confine
VALUES(1, 1),
(2, 1),
(3, 1),
(4, 4),
(5, 4),
(6, 4),
(7, 4),
(4, 5),
(8, 5),
(5, 5),
(9, 6),
(10, 6),
(11, 6),
(12, 6);

-- ------------------------------------
--  Inserimento Vaso
-- ------------------------------------
INSERT INTO Vaso
VALUES(1, 'Plastica', 1, 1, 0.2, 1),
(2, 'Terracotta', 4, 4, 0.3, 1),
(3, 'Plastica',  1, 3.5, 0.2, 1),
(4, 'Plastica', 1.4, 2.3, 0.25, 3),
(5, 'Cemento', 2, 2.5, 0.30, 7),
(6, 'Terracotta', 2, 1, 0.15, 6),
(7, 'Terracotta', 2, 5, 0.15, 6),
(8, 'Plastica', 8.3, 2.1, 0.20, 2),
(9, 'Cemento', 5, 5, 0.22, 7),
(10, 'Plastica', 10.5, 5, 0.22, 7);
 
-- ------------------------------------
--  Inserimento Componente_giardino
-- ------------------------------------
INSERT INTO Componente_giardino
VALUES(1, 1, 1, 0.15, 8, 1),
(2, 1, 3.5, 0.15, 8, 1),
(3, 2, 2.5, 2.5, 1, 3),
(4, 2.5, 6.3, 0.5, 7, 4),
(5, 1.3, 1, 0.4, 10, 8),
(6, 4.3, 1, 0.4, 10, 8),
(7, 2.1, 2.2, 1.5, 6, 7),
(8, 10.5, 5, 0.20, 5, 7),
(9, 5.41, 3.75, 1, 9, 6),
(10, 8, 8, 2, 4, 3);