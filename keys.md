„Andmebaasi võtmed (Keys)“

[Põhimõsted](README.md) | [Protseduurid](protseduur.md) | [keys](keys.md) | [xammp](xammp.md) | [kysimused](kysimused.md) | [hotelruum](hotelliruum.md) | [Triger](Triger.md) 

Primary key
Definitsioon:
A primary key is a column or columns in a database table with values that uniquely identify each row or record. For example, an employee ID column could be a primary key in a table of employee information.
https://www.ibm.com/think/topics/primary-key

<img width="259" height="91" alt="{F79DAE7B-5C59-4AF1-9F49-7A843BD8A5FE}" src="https://github.com/user-attachments/assets/86241d2f-02a1-418d-bb39-c10389e1f07d" />
<img width="223" height="119" alt="{19022EBD-5EF1-40EB-8790-E4EC51488800}" src="https://github.com/user-attachments/assets/23c0d659-8250-4a90-8e8e-a58e87fefff5" />

Foreign key
Definitsioon:
A foreign key is defined as an attribute or set of attributes in a relation whose values match a primary key in another relation. The syntax to add such a constraint to an existing table is defined in SQL:2003 as shown below.
https://en.wikipedia.org/wiki/Foreign_key#:~:text=A%20foreign%20key%20is%20defined,SQL%3A2003%20as%20shown%20below.

<img width="579" height="198" alt="{D5AC5632-0CD7-412A-A0CD-AD63E3F1FA1E}" src="https://github.com/user-attachments/assets/bfb31aa8-9c94-49e1-9183-5be3303084aa" />
<img width="229" height="211" alt="{612B8FCF-6916-4F11-8124-F03A0516BFF6}" src="https://github.com/user-attachments/assets/8f265e31-2a88-4ed9-b4cd-f1410ffeb0c9" />

Unique key 
Definitsioon:
Unique key võivad sisaldada ühte NULL-väärtust.
Tabelis võib olla rohkem kui üks unique key.
Unique key saab uuendada või kustutada ning see ei mõjuta tabeli terviklikkuse piiranguid.
https://www.w3schools.com/sql/sql_unique.asp
<img width="338" height="100" alt="{C42D43B9-1E99-42FB-9696-D6EE901326ED}" src="https://github.com/user-attachments/assets/ae3513ad-c99d-43df-9930-4cccf8c00616" />
<img width="243" height="122" alt="{63386301-AFC5-46FA-ACD0-4CDC424B8F8C}" src="https://github.com/user-attachments/assets/dc80a837-f1bf-4ee1-887e-a142d3f9a955" />

Simple key
Definitsioon:
Simple Key Management for Internet Protocols (SKIP) is similar to SSL, except that it establishes a long-term key once, and then requires no prior communication in order to establish or exchange keys on a session-by-session basis. Therefore, no connection setup overhead exists and new keys values are not continually generated.
https://en.wikipedia.org/wiki/Simple_Key-Management_for_Internet_Protocol
<img width="330" height="96" alt="{96E386A0-2F99-48C2-8931-8E8D458BB69D}" src="https://github.com/user-attachments/assets/9ef1773e-fce4-40c2-9cb0-a0cf680efd1f" />
<img width="289" height="129" alt="{52A24DB6-79A3-4D64-864D-965C475D58DF}" src="https://github.com/user-attachments/assets/25f80e57-0841-4bb3-8d26-633edeb4b4c2" />

Composite Key
Definitsioon:
See toimib primaarvõtmena, kui tabelis puudub primaarvõti.
Kahe või enama atribuudi abil moodustatakse liitvõti.
Erinevad atribuudi kombinatsioonid võivad tagada erineva täpsuse ridade unikaalse tuvastamise osas.
https://en.wikipedia.org/wiki/Composite_key
<img width="375" height="114" alt="{14384EE9-F5D0-49CD-8A83-BD1CA11387DB}" src="https://github.com/user-attachments/assets/3278d9ae-2c6a-4060-8ca9-69a55ac6f67b" />
 <img width="237" height="129" alt="{BE8C1AC9-30CC-4A19-8A5A-E7C1C623E9C2}" src="https://github.com/user-attachments/assets/c3620ca5-a77d-4a85-9bfb-0c2df283517d" />

Compound Key
Definitsioon:
A Composite Key is a type of candidate key that consists of two or more attributes or columns in a table. These attributes together uniquely identify each record in the table. It is widely used in database management systems to enhance data retrieval speed and ensure data integrity.
https://www.dremio.com/wiki/composite-key/
<img width="400" height="115" alt="{EB40581F-9679-46FD-AAD8-1EB11EC84F4A}" src="https://github.com/user-attachments/assets/5d422e62-2655-4608-9955-93d78135e3e6" />
<img width="221" height="132" alt="{1165F3D4-D533-4565-82D6-854BCC783AB5}" src="https://github.com/user-attachments/assets/d7b97bac-6483-4f91-aea9-4f44db992f40" />

 Superkey
 Definitsioon:
 Relatsioonandmemudeli supervõti on seose atribuutide alamhulk, mis vastab ainulaadsuse nõudele: antud seoses ei ole kahte tuuplet, milles selle atribuutide alamhulga väärtused langevad kokku (on võrdsed).
 https://ru.wikipedia.org/wiki/%D0%A1%D1%83%D0%BF%D0%B5%D1%80%D0%BA%D0%BB%D1%8E%D1%87
 <img width="281" height="114" alt="{92523BBF-1384-4036-B7BC-2095B45ADB76}" src="https://github.com/user-attachments/assets/8bc1e19e-eaf4-48e6-83ed-d9f55c896006" />
<img width="353" height="130" alt="{E0E1668B-8215-4A7D-8DF3-E40469ED7225}" src="https://github.com/user-attachments/assets/1dee2bd3-0e65-4e5b-8f2b-b57222c1035c" />

 Candidate Key
 Definitsioon:
 Candidate key on minimaalne supervõti, mis tähendab, et see suudab üheselt tuvastada kirje, kuid ei sisalda liigseid atribuute.
See on supervõti ilma korduvate andmeteta, mida nimetatakse potentsiaalvõtiks.
https://en.wikipedia.org/wiki/Candidate_key
<img width="338" height="116" alt="{5E29B67C-EF61-493C-8E6A-CC12813037CC}" src="https://github.com/user-attachments/assets/6b122c80-ead1-4ece-9247-f1d46cc685eb" />
<img width="241" height="124" alt="{D5704EE5-3152-4227-A47A-DA232B7CB7BC}" src="https://github.com/user-attachments/assets/c4484604-6a09-4664-83d3-52a1a46e5271" />

Alternate Key
Definitsioon:
Alternate key on mis tahes potentsiaalvõti tabelis, mida ei ole valitud primaarvõtmeks. Teisisõnu, kõik võtmed, mida ei ole määratud primaarvõtmeks, loetakse alternatiivvõtmeteks.
Alternate key nimetatakse ka teisesevõtmeks, kuna see suudab üheselt tuvastada kirjeid tabelis samamoodi nagu primaarvõti.
Alternate key võib koosneda ühest või mitmest veerust (väljast), mis võimaldavad kirjet üheselt tuvastada, kuid see ei ole primaarvõti.
https://en.wikipedia.org/wiki/Alt_key

<img width="310" height="82" alt="{97821C7C-7DB2-442F-B40E-D3541867CA33}" src="https://github.com/user-attachments/assets/19cedee6-ac39-431e-a345-ad10178b9cee" />
<img width="209" height="105" alt="{7B5DB210-1A0A-4061-9172-C943FAB16BC1}" src="https://github.com/user-attachments/assets/aff0d290-6c6e-4462-9592-4f10db4dda78" />
