#xammp

[Põhimõsted](README.md) | [Protseduurid](protseduur.md) | [keys](keys.md) | [xammp](xammp.md) | [kysimused](kysimused.md) | [hotelruum](hotelliruum.md) | [Triger](Triger.md) 

kusutatud 
```
BEGIN 
    SELECT * FROM loomad;
    DELETE FROM loomad WHERE loomID=kustataID;
    SELECT * FROM loomad;
END
```
<img width="713" height="747" alt="{B88515E6-1989-44BA-A00D-9D6DA638A23C}" src="https://github.com/user-attachments/assets/45143d35-917e-40db-887e-b5056ee0bd15" />

Taht
```
BEGIN
    SELECT * FROM loomad
    WHERE loomNimi LIKE Concat(taht, '%');
end
```
<img width="567" height="553" alt="{955A53BF-8BA9-4F8A-A2F8-EF4B5E00167D}" src="https://github.com/user-attachments/assets/d7ba216a-d775-492a-99ab-6a67a6e4e2cd" />

minmax
```
BEGIN
    SELECT MIN(kaal),MAX(kaal), AVG(kaal), SUM(kaal), COUNT(*)
    INTO minKaal, maxKaal, avgKaal, sumKaal, countiLoom
    FROM loomad;
END
```
<img width="942" height="531" alt="{B7D64EB5-A7F0-4B62-9987-10C6D16A36D2}" src="https://github.com/user-attachments/assets/37a3f04c-7780-4866-9c47-430505842ef8" />

suur or vaike
```
BEGIN
    SELECT loomNimi, kaal,
    IF(kaal>10, 'suur loon', 'vaike loon') AS hinnang
    FROM loomad;
    
END

```
<img width="329" height="267" alt="{B3BEB5D8-29AB-4892-94B2-6C20CC27BB87}" src="https://github.com/user-attachments/assets/1ab4d41a-72a5-4cc4-b1de-c3d4cde7d6bb" />


