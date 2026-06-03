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

```
--kombineerime insert ja delete triger
CREATE TRIGGER linnaKustutaLisa
ON linnad --tabelinimi, mis on vaja jälgida
FOR DELETE, INSERT 
AS
BEGIN
 INSERT INTO logi(kasutaja, aeg, toiming, andmed)
 SELECT
 SYSTEM_USER, --kasutaja
 GETDATE(),  --aeg
 'on tehtud DELETE käsk',  --toiming
 CONCAT(' linn: ', deleted.linnanimi, ' rahvaarv: ', deleted.rahvaarv)  --andmed
 FROM deleted

 UNION ALL

 SELECT
 SYSTEM_USER, --kasutaja
 GETDATE(),  --aeg
 'on tehtud INSERT käsk',  --toiming
 CONCAT(' linn: ', inserted.linnanimi, ' rahvaarv: ', inserted.rahvaarv)  --andmed
 FROM inserted;
END;

--kontrollimiseks insert into linnad
INSERT INTO linnad(linnanimi, rahvaarv)
VALUES ('Tallinn', 650000);

DELETE FROM linnad WHERE linnID=2;

select * from linnad;
select * from logi;
```
<img width="682" height="361" alt="{5F4F4C95-F4E7-4455-893D-A96187A7FA71}" src="https://github.com/user-attachments/assets/e2bfb022-ad67-471b-9bf2-e8ec261202cb" />

```
--kasutaja sekretarLeyla oigused - lisamine, kastutamine ja uuendamine tabelis linnad,
--ei nae tabeli logi ja ei saa muuta trigerid

GRANT SELECT, INSERT, UPDATE, DELETE ON linnad TO sekretarLeyla;
DENY SELECT ON logi TO sekretarLeyla;

DENY ALTER ANY DATABASE DDL TRIGGER TO sekretarLeyla;
```
<img width="578" height="561" alt="{EEFA5BFA-D5F0-4460-B08B-D1532DE4570B}" src="https://github.com/user-attachments/assets/445af4b6-4c9f-4d70-ac8f-f1159e51fe0a" />

TRIGGERS IN XAMMP 

<img width="641" height="707" alt="{311D9950-D474-47B6-AC56-CEE825F0EDC7}" src="https://github.com/user-attachments/assets/bc6de9d0-cbfb-4ee2-9590-85e14edb5061" />

<img width="687" height="777" alt="{0FAA3859-AC8E-49EB-B56F-82E68A882F00}" src="https://github.com/user-attachments/assets/59d90cd6-b5f8-4c08-a547-7bf132dbebea" />

<img width="647" height="696" alt="{2EE25C72-AA18-4104-9F23-73D63B5E30D7}" src="https://github.com/user-attachments/assets/3d9225fc-db9b-4590-8d99-ac8206cc2f03" />

