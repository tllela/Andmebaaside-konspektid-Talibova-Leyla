## Trigger - triger - päästik 
- andmebaasi objekt, mis automaatsrlt käivitud tabeli sundmused (INSERT, UPDATE, DELETE).

```sql
create database trigertitpv24;
use trigertitpv24;

--
Create table linnad(
linnID int PRIMARY KEY IDENTITY (1,1),
linnanimi varchar(15) NOT NULL,
rahvaarv int);

 -- tabel , mis taidab triger
Create table logi(
id int PRIMARY KEY IDENTITY (1,1),
kasutaja varchar(25),
aeg DATETIME,
toiming  varchar(100),
andmed TEXT --triger automaatselt lisab mida sekretaar lisass/kustutas tabelisse linad
)

select * from linnad;
select * from logi;
```
<img width="837" height="706" alt="{621F01E5-36C6-4C63-8EF2-F529DC5081FF}" src="https://github.com/user-attachments/assets/76d202d3-3012-4327-8fe6-2eba1a604383" />

```Trigger
--Trigger lisatud kirjeid jälgimiseks tabelis “linnad” – INSERT
--Jälgib andmete sisestamine tabelis linnad ja teeb vastava kirje tabelis logi


CREATE TRIGGER linnaLisamine
ON linnad --tabelinimi, mis on vaja jälgida
FOR INSERT
AS
INSERT INTO logi(kasutaja, aeg, toiming, andmed)
SELECT
SYSTEM_USER, --kasutaja
GETDATE(),  --aeg
'on tehtud INSERT käsk',  --toiming
inserted.linnanimi  --andmed
FROM inserted;
--kontrollimiseks insert into linnad
INSERT INTO linnad(linnanimi, rahvaarv)
VALUES ('Tartu', 250000);

select * from linnad;
select * from logi;
```
<img width="601" height="313" alt="{636A5DFF-D208-4140-800E-721EA65E6522}" src="https://github.com/user-attachments/assets/02a68b89-ad94-4855-bf20-f2c468b388a8" />

```
--trigeri muutmine
ALTER TRIGGER linnaLisamine
ON linnad --tabelinimi, mis on vaja jälgida
FOR INSERT
AS
INSERT INTO logi(kasutaja, aeg, toiming, andmed)
SELECT
SYSTEM_USER, --kasutaja
GETDATE(),  --aeg
'on tehtud INSERT käsk',  --toiming
CONCAT(' linn: ', inserted.linnanimi, ' rahvaarv: ', inserted.rahvaarv)  --andmed
FROM inserted;


--kontrollimiseks insert into linnad
INSERT INTO linnad(linnanimi, rahvaarv)
VALUES ('Narva', 50000);

select * from linnad;
select * from logi;
```
<img width="603" height="378" alt="{AEDC51FA-4E47-4639-A0DA-43F87689B135}" src="https://github.com/user-attachments/assets/8a414bce-e5c7-4996-8677-ba406ade3f40" />

```

CREATE TRIGGER linnaKustutamine
ON linnad --tabelinimi, mis on vaja jälgida
FOR DELETE
AS
INSERT INTO logi(kasutaja, aeg, toiming, andmed)
SELECT
SYSTEM_USER, --kasutaja
GETDATE(),  --aeg
'on tehtud DELETE käsk',  --toiming
CONCAT(' linn: ', deleted.linnanimi, ' rahvaarv: ', deleted.rahvaarv)  --andmed
FROM deleted;


--kontrol--kustutada tabelist linnad
DELETE FROM linnad WHERE linnID=1;
select * from linnad;
select * from logi;
```
<img width="650" height="376" alt="{00966FC4-635A-4536-ADDE-A01AF704107E}" src="https://github.com/user-attachments/assets/bb34c982-8fc5-4b92-af68-89bfc850f5ac" />

```
--Update triger
CREATE TRIGGER linnaUuendamine
ON linnad --tabelinimi, mis on vaja jälgida
FOR UPDATE
AS
INSERT INTO logi(kasutaja, aeg, toiming, andmed)
SELECT
SYSTEM_USER, --kasutaja
GETDATE(),  --aeg
'on tehtud UPDATE käsk',  --toiming
CONCAT(' VANAD: linn: ', deleted.linnanimi, ' rahvaarv: ', deleted.rahvaarv,
' ||| UUES: linn: ', inserted.linnanimi, ' rahvaarv: ', inserted.rahvaarv)  --andmed
FROM deleted INNER JOIN inserted
ON deleted.linnID=inserted.linnID;


--kontrollimiseks tuleb uuendada tabeli linn
UPDATE linnad SET linnanimi='Parnu-vaike', rahvaarv=50 WHERE linnID=2; 
select * from linnad;
select * from logi;
```
<img width="811" height="380" alt="{E5DDAE05-0499-4C6A-8FC3-B3828313689E}" src="https://github.com/user-attachments/assets/334a2f4c-79b7-4bd6-b2fc-554449a22877" />





