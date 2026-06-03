# Andmebaaside konspektid Talibova Leyla 

[Põhimõsted](README.md) | [Protseduurid](protseduur.md) | [keys](keys.md) | [xammp](xammp.md) | [kysimused](kysimused.md) | [hotelruum](hotelliruum.md) | [Triger](Triger.md) 


# Andmebaasid
andmebaasidega seotud SQL kood ja konspektid
##sisukord
- [Põhimõisted](#-põhimõisted)
- [Andmetüübid](#-ändmetüübid)
- [SQL - structure Query Language - struktureeritud päringu keel](#sQL - structure Query Language - struktureeritud päringu keel)
- [ALTER TABLE](#-alter table)
## Põhimõisted

- andmebaas - struktureeritud andmete kogum
- tabel - olem - сущность - entity
- veerg - väli - поле*столбец
- rida - kirje - запись
- andmebaasi haldussüsteem - tarkvara, millega abil saab luua andmebaas: mariaDB / XAMPP, SQL SERVER management Studio
- <img width="528" height="538" alt="{779BF74D-BC8B-4A89-8D95-003A54261B9B}" src="https://github.com/user-attachments/assets/c00fb4e6-aaa9-48c0-9289-ddcf106530e4" />

- primaarne võti - PRIMARY KEY - veerg (tavaliselt id nimega), unikaalne identifikaator, mis eristab iga kirje.
- välisvõti - FOREIGN KEY - FK - veerg, mis loob seos teise tabeli primaarvõtmega.
- päring - QUERY - запрос

## Andmetüübid

1. Numbrilised: INT, SmallINT, float, decimal(5,2)
2. Tekst/sümbolised: varchar(255), char(5), TEXT
3. Loogilised: boolean, true/false, bit, bool
4. Kuupäev: date, time, datetime

## SQL - structure Query Language - struktureeritud päringu keel
- Tabeli loomine
    ```
    CREATE TABLE opilane(
    opilaneID int Primary Key identity(1,1), --automaatselt täisab numbri
    eesnimi varchar(25),
    perenimi varchar(30) NOT NULL,
    synniaeg DATE,
    stip bit,
    mobiil varchar(13),
    aadress TEXT,
    keskmineHinne decimal(2,1) --(2--kokku, 1-peale komatnt 4.5)
    );

    SELECT * FROM opilane;

    ```
##Admete sisetamine tabelisse
## Seosed (tabelivahelised seosed)
    - ülk-ühele (nt mees-naine)
    - üks-mitmele (nt ema-lapsed)
    <img width="300" height="300" alt="{95A32110-C29B-4A97-92B8-81AA90C89945}" src="https://github.com/user-attachments/assets/ea44d13c-d0b6-41c8-973a-4bd06dcea69b" />
    - mitu-mitmele (nt õpilane - õpetajad)

      ## Piirangud
      constraint - ограничения (5)
      1. PRIMARY KEY
      2. FOREIGN KEY
      3. CHECK
      4. NOT NULL
      5. UNIQUE

--õpetaja
```
CREATE TABLE opetaja(
opetajaID int Primary Key identity(1,1),
nimi varchar(25),
epost varchar(35),
ruhm  varchar(30) );

SELECT * FROM opetaja;
INSERT INTO opetaja
VALUES ('Anton', 'anton@gmail.com','TITpv24');

INSERT INTO opetaja (nimi, epost, ruhm)
VALUES ('Lury', 'lury@gmail.com', 'TITpv24'),
('Agapov', 'agapov@gmail.com','TITpv24');

--2
CREATE TABLE tund(
tundId int PRIMARY KEY identity(1,1),
kuupaev DATE,
tundnimi varchar(30),
opetajaID int,
FOREIGN KEY (opetajaID) REFERENCES opetaja(opetajaID),
opetamineID int,
FOREIGN KEY (opetamineID) REFERENCES opetaja(opetamineID)
);

SELECT * FROM tund;

INSERT INTO tund(kuupaev, tundnimi, opetajaID, opetamineID)
VALUES ('2026-04-16', 'Windows', 1,1),
('2026-04-17', 'Linux', 2,2),
('2026-04-18', 'Operatsioone', 3,3);
TRUNCATE TABLE tund;

DROP TABLE tund
```

```

INSERT INTO opilane
VALUES ('Artjom', 'Jegorov', '2000-12-10', 1, '+325689', 'Tallinn', 4.5);

INSERT INTO opilane (perenimi, eesnimi, keskminehinne)
VALUES ('Sereda', 'Ivan', 4.2),
       ('Holovanov', 'Ivan', 4.2),
       ('Suvorov', 'Marko', 5.0);
```


## ALTER TABLE 
```
-tabeli struktuuri muutmine (struktuur: veerudenimed, andmetuubid, piirangud)
1. uue veeru lisamine
 --uue veeru lisamine
	ALTER TABLE opilane ADD isikukood varchar(11);

	--veeru kustutamine
	ALTER TABLE opilane DROP COLUMN isikukood;

	--andmetuubi muutmine varchar(11)-->char(11)
	ALTER TABLE opilane ALTER COLUMN isikukood char(11);

	ALTER TABLE opilane DROP COLUMN isikukoodd;

	--Sissdehitatud protseduur -mis naftab tabeli-Struktuur
    Sp_help opilane;

   --piirangute lisamine
	CREATE TABLE ryhm(
	ryhmId int,
	ryhmNimi char(10)
	);
	drop table ryhm;

	EXEC Sp_help ryhm;
	 
	--PK lisamine
	ALTER TABLE ryhm ADD CONSTRAINT pk_ryhm PRIMARY KEY (ryhmId);
    --UNIQUE lisamine 
	ALTER TABLE ryhm ADD CONSTRAINT un_ryhm UNIQUE (ryhmNimi);

	--kontollimiseks taidame tabelit ryhm
	SELECT * FROM ryhm;
	INSERT INTO ryhm (ryhmId,ryhmNimi)
	VALUES (2, 'TITpe24')

    --kontollimiseks taidame tabelit ryhm
	SELECT * FROM ryhm;
	INSERT INTO ryhm (ryhmId,ryhmNimi)
	VALUES (1, 'TITpv24')

	--lisame foreing key - voorvoti-valisvoti 
	ALTER TABLE opilane ADD ryhmId int;
	SELECT * FROM opilane;
	SELECT * FROM ryhm;
	ALTER TABLE opilane ADD CONSTRAINT fk_ryhm 
	FOREIGN KEY (ryhmId) REFERENCES ryhm(ryhmId);

	--kontrollimiseks- taidame tabeli opilane
	INSERT INTO opilane
	VALUES ('Leena','Jegorova', '2002-12-10',1,'+3727473','Tallinn', 4.5, '28490203', 1);
```

   
