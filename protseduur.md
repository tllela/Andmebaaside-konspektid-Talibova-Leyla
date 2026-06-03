## SQL Protseduurid

 [Põhimõsted](README.md) | [Protseduurid](protseduur.md) | [keys](keys.md) | [xammp](xammp.md) | [kysimused](kysimused.md) | [hotelruum](hotelliruum.md) | [Triger](Triger.md) 

 * stored procedure — salvestatud protseduurid — хранимые процедуры
 * sama nagu funktsioonid programmeerimises — mingi tegevused mis käivitakse automaatselt protseduuri kasutamisel 
```

-- ab hotell
CREATE TABLE guestt(
guestID int Primary key identity(1,1),
firstname varchar(80),
lastname varchar(80) not null,
memberSince DATE);

SELECT * FROM guestt;

INSERT INTO guestt
VALUES ('leyla', 'talibova', '2026-05-20');
```
<img width="308" height="100" alt="{F7DE3F8B-6B29-4E75-8FDC-DD41BF54E381}" src="https://github.com/user-attachments/assets/99564091-1d6c-40fd-9135-9ce68fdb59c2" />

```
-- protseduur, mis lisab uus guest ja kuvab tabeli
CREATE PROCEDURE lisaGuestt
--@parameetrid
@ussNimi varchar(25),
@uusPerenimi varchar(30),
@kuupaev date
AS
BEGIN

--protseduuri
INSERT INTO guestt(firstname, lastname, memberSince)
VALUES (@ussNimi, @uusPerenimi, @kuupaev);
SELECT * FROM guestt;
END
--kutse
EXEC lisaGuest 'tanya', 'Kopli', '2026-06-07'
```
<img width="388" height="96" alt="{526108D0-E784-4CAD-96D9-BA05F5F3E0F4}" src="https://github.com/user-attachments/assets/3e51cf4d-f071-40d2-98de-819ba36a6028" />

```
--protseduur, mis kustutab guest id järgi
CREATE PROCEDURE kustutaGuestt
@kustutaId int
AS
BEGIN
SELECT * FROM guestt;
DELETE FROM guestt WHERE guestID=@kustutaId;
SELECT * FROM guestt;
END
--kutse
EXEC kustutaGuestt 1;
```
<img width="366" height="323" alt="{13CF8603-4A51-42EF-BC64-3E6C4214994C}" src="https://github.com/user-attachments/assets/0ee23020-29ef-4aec-902d-a4b938cd1db5" />

```
--otsing esimese tähe järgi
CREATE PROCEDURE otsing1tahtt
@taht char(1)
AS
BEGIN
    SELECT * FROM guestt WHERE firstname LIKE @taht + '%'; --% - teised sümboolid
END

--kutse
EXEC otsing1tahtt 'L'
```
```
--lisame us veerg
ALTER TABLE guest ADD arveSumma money;
SELECT * FROM guest

Update guest set arveSumma=800 WHERE guestId=2
```
<img width="403" height="138" alt="{4A7AF73D-A258-493F-BBF3-3B541769260A}" src="https://github.com/user-attachments/assets/1fae3be1-b1c4-4418-aca1-84352b8f76df" />

```
--5. OUTPUT parameetrid (min ja max väärtus)
CREATE PROCEDURE minmaxArvee
    @minArvee MONEY OUTPUT,
    @maxArvee MONEY OUTPUT
AS
BEGIN
    SELECT
        @minArvee = MIN(arveeSumma),
        @maxArvee = MAX(arveeSumma)
    FROM guestt;
END;

--kutse
DECLARE @minArve MONEY, @maxArve MONEY;
EXEC minmaxArve @minArve OUTPUT, @maxArve OUTPUT;
PRINT 'Min hind = ' + CONVERT(varchar, @minArve);
PRINT 'Max hind = ' + CONVERT(varchar, @maxArve);
```
<img width="681" height="122" alt="{F037CABE-53A7-4E75-AF50-6C6B2209F74E}" src="https://github.com/user-attachments/assets/b1e1c405-1325-4eaa-8d1c-6341bda7fa12" />

```
--Dünaamiline
CREATE PROCEDURE muudatus
    @tegevus varchar(10),
    @tabelinimi varchar(25),
    @veerunimi varchar(25),
    @tyyp varchar(25) = NULL
AS
BEGIN
    DECLARE @sqltegevus varchar(max);

    SET @sqltegevus = CASE 
        WHEN @tegevus = 'add' THEN 
            CONCAT('ALTER TABLE ', @tabelinimi, ' ADD ', @veerunimi, ' ', @tyyp)

        WHEN @tegevus = 'drop' THEN 
            CONCAT('ALTER TABLE ', @tabelinimi, ' DROP COLUMN ', @veerunimi)
    END;

    PRINT @sqltegevus;
    EXEC (@sqltegevus);
END;

--kutse
EXEC muudatus 'add', 'guest', 'testveerg', int
SELECT * FROM guest
EXEC muudatus 'drop', 'guest', 'testveerg'
```
<img width="522" height="171" alt="{045EA28F-E23B-43B1-ABBB-AA30FABD9FDE}" src="https://github.com/user-attachments/assets/e61f6e2b-d26d-46ad-8caf-d3ff91dbded0" />

```
--7. Protseduur, mis kuvab eesnimi, arveSumma ja lisab automaatselt hinnangu
CREATE PROCEDURE kuvaArveHinnang
AS
BEGIN
    SELECT 
        firstname,
        arveSumma,
        CASE
            WHEN arveSumma <= 1000 THEN 'väike summa'
            ELSE 'suur summa'
        END AS hinnang
    FROM guest;
END;

--kutse
EXEC kuvaArveHinnang
```
<img width="275" height="153" alt="{6058FD04-7D4C-47A4-AFEB-D95D04ABE021}" src="https://github.com/user-attachments/assets/0ee4910b-3c56-4b93-a769-9fea2d252b96" />
