


--Username: mercurioevent
--Password: swhkEtD6ZDy8


CREATE TABLE CATEGORIA(
	CodCategoria char(5) PRIMARY KEY,
	NomeCategoria varchar(100)
);

CREATE TABLE ARTISTA(
	NomeArte varchar(100) PRIMARY KEY,
	NomeArtista varchar(100),
	CognomeArtista varchar(100)
);

CREATE TABLE EVENTO(
	IdEvento int auto_increment PRIMARY KEY,
	TitoloEvento varchar(200),
	DataEvento DATE,
	Provincia char(2),
	Descrizione varchar(250),
	Categoria char(5),
	
	FOREIGN KEY(Provincia) REFERENCES LUOGO(CodiceProvincia),
	FOREIGN KEY(Categoria) REFERENCES CATEGORIA(CodCategoria)
);

CREATE TABLE PARTECIPAZIONE(
	ArtistaPartecipazione varchar(100),
	EventoPartecipazione int,
	
	FOREIGN KEY(ArtistaPartecipazione) REFERENCES ARTISTA(NomeArte),
	FOREIGN KEY(EventoPartecipazione) REFERENCES EVENTO(IdEvento),
	PRIMARY KEY(ArtistaPartecipazione,EventoPartecipazione)
);

CREATE TABLE UTENTE(
	Email varchar(100) PRIMARY KEY,
	Password varchar(100),
	Username varchar(100) unique,
	NomeUtente varchar(100),
	CognomeUtente varchar(100),
	Residenza char(2),
	
	FOREIGN KEY Residenza REFERENCES LUOGO(CodiceProvincia)
);

CREATE TABLE PREFERENZE( 
	UtentePreferenza varchar(100),
	CategoriaPreferenza char(5),
	
	FOREIGN KEY(UtentePreferenza) REFERENCES UTENTE(Email),
	FOREIGN KEY(CategoriaPreferenza) REFERENCES CATEGORIA(CodCategoria),
	PRIMARY KEY(UtentePreferenza,CategoriaPreferenza)
);

CREATE TABLE LUOGO(
	CodiceProvincia char(2)	PRIMARY KEY,
	ProvinciaEstesa varchar(50),
	Regione varchar(50)
);

CREATE TABLE POST(
	UtentePost varchar(100),
	EventoPost int,
	TitoloPost varchar(100),
	DataPost TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	Voto int,
	Commento varchar(255),
	
	CHECK(Voto>0 and Voto<=5),
	FOREIGN KEY(UtentePost) REFERENCES UTENTE(Email),
	FOREIGN KEY(EventoPost) REFERENCES EVENTO(IdEvento),
	PRIMARY KEY(UtentePost,EventoPost)
);

/*
Inserimento Province
*/
INSERT INTO LUOGO(CodiceProvincia,ProvinciaEstesa,Regione)
VALUES("AG", "Agrigento", "Sicilia"),
("AL", "Alessandria", "Piemonte"),
("AN", "Ancona", "Marche"),
("AO", "Aosta", "Valle d'Aosta"),
("AR", "Arezzo", "Toscana"),
("AP", "Ascoli Piceno", "Marche"),
("AT", "Asti", "Piemonte"),
("AV", "Avellino", "Campania"),
("BA", "Bari", "Puglia"),
("BT", "Barletta-Andria-Trani", "Puglia"),
("BL", "Belluno", "Veneto"),
("BN", "Benevento", "Campania"),
("BG", "Bergamo", "Lombardia"),
("BI", "Biella", "Piemonte"),
("BO", "Bologna", "Emilia-Romagna"),
("BZ", "Bolzano", "Trentino-Alto Adige/Südtirol"),
("BS", "Brescia", "Lombardia"),
("BR", "Brindisi", "Puglia"),
("CA", "Cagliari", "Sardegna"),
("CL", "Caltanissetta", "Sicilia"),
("CB", "Campobasso", "Molise"),
("CI", "Carbonia-Iglesias", "Sardegna"),
("CS", "Caserta", "Campania"),
("CT", "Catania", "Sicilia"),
("CZ", "Catanzaro", "Calabria"),
("CH", "Chieti", "Abruzzo"),
("CO", "Como", "Lombardia"),
("CS", "Cosenza", "Calabria"),
("CR", "Cremona", "Lombardia"),
("KR", "Crotone", "Calabria"),
("CN", "Cuneo", "Piemonte"),
("EN", "Enna", "Sicilia"),
("FM", "Fermo", "Marche"),
("FE", "Ferrara", "Emilia-Romagna"),
("FI", "Firenze", "Toscana"),
("FG", "Foggia", "Puglia"),
("FC", "Forlì-Cesena", "Emilia-Romagna"),
("FR", "Frosinone", "Lazio"),
("GE", "Genova", "Liguria"),
("GO", "Gorizia", "Friuli Venezia Giulia"),
("GR", "Grosseto", "Toscana"),
("IM", "Imperia", "Liguria"),
("IS", "Isernia", "Molise"),
("SP", "La Spezia", "Liguria"),
("AQ", "L'Aquila", "Abruzzo"),
("LT", "Latina", "Lazio"),
("LE", "Lecce", "Puglia"),
("LC", "Lecco", "Lombardia"),
("LI", "Livorno", "Toscana"),
("LO", "Lodi", "Lombardia"),
("LU", "Lucca", "Toscana"),
("MC", "Macerata", "Marche"),
("MN", "Mantova", "Lombardia"),
("MS", "Massa-Carrara", "Toscana"),
("MT", "Matera", "Basilicata"),
("ME", "Messina", "Sicilia"),
("MI", "Milano", "Lombardia"),
("MO", "Modena", "Emilia-Romagna"),
("MB", "Monza e Brianza", "Lombardia"),
("NA", "Napoli", "Campania"),
("NO", "Novara", "Piemonte"),
("NU", "Nuoro", "Sardegna"),
("OT", "Olbia-Tempio", "Sardegna"),
("OR", "Oristano", "Sardegna"),
("PD", "Padova", "Veneto"),
("PA", "Palermo", "Sicilia"),
("PR", "Parma", "Emilia-Romagna"),
("PV", "Pavia", "Lombardia"),
("PG", "Perugia", "Umbria"),
("PU", "Pesaro e Urbino", "Marche"),
("PE", "Pescara", "Abruzzo"),
("PC", "Piacenza", "Emilia-Romagna"),
("PI", "Pisa", "Toscana"),
("PT", "Pistoia", "Toscana"),
("PN", "Pordenone", "Friuli Venezia Giulia"),
("PZ", "Potenza", "Basilicata"),
("PO", "Prato", "Toscana"),
("RG", "Ragusa", "Sicilia"),
("RA", "Ravenna", "Emilia-Romagna"),
("RC", "Reggio Calabria", "Calabria"),
("RE", "Reggio Emilia", "Emilia-Romagna"),
("RI", "Rieti", "Lazio"),
("RM", "Roma", "Lazio"),
("RO", "Rovigo", "Veneto"),
("SA", "Salerno", "Campania"),
("SS", "Sassari", "Sardegna"),
("SV", "Savona", "Liguria"),
("SI", "Siena", "Toscana"),
("SR", "Siracusa", "Sicilia"),
("SO", "Sondrio", "Lombardia"),
("TA", "Taranto", "Puglia"),
("TE", "Teramo", "Abruzzo"),
("TR", "Terni", "Umbria"),
("TO", "Torino", "Piemonte"),
("TP", "Trapani", "Sicilia"),
("TN", "Trento", "Trentino-Alto Adige/Südtirol"),
("VV", "Vibo Valentia", "Calabria"),
("VI", "Vicenza", "Veneto"),
("VT", "Viterbo", "Lazio");
