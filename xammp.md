#xammp
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
