-- registrazione utente 
insert into UTENTE (Email, Password, Username, NomeUtente, CognomeUtente, Provincia)
VALUES (?,?,?,?,?);

-- login  utente 
select *
from UTENTE
where Password = ? AND Username = ?;
-- i dati dell'utente li salveremo in un cookie cosi da poterli usare per le query successive 
-- preferenze dall utente 
select C.NomeCategoria, U.Username
from PREFERENZE P
inner join UTENTE U on P.UtentePreferenza = U.IdUtente
inner join CATEGORIA C on P.CategoriaPreferenza = C.CodCategoria
where U.Username = ? ;

-- inserimento delle preferenze 
insert into PREFERENZE(UtentePreferenza, CategoriaPreferenza)
values (?,?);

-- selezione dell'evento 
select * 
from EVENTO
where TitoloEvento = ? and DataEvento = ? and Luogo = ?;