# Hotel-Booking-Demand
Proiect realizat in cadrul cursului Fundamente de Big Data - Anul III
## 1.	Introducere

În cadrul acestui proiect am analizat un set de date ce ține de industria ospitalității. Astfel, rezultate acestui studiu sunt utile persoanelor care lucrează în această zonă, mai exact celor care care lucrează în domeniul hotelier, sau persoanelor care doresc să înțeleagă care sunt factorii care influnețează oaspeții hotelurilor să renunțe la rezervările lor, dar și cum se poate prezice anularea acestora.
Prin acest proiect am dorit să descopăr cât de bine se poate prezice posibilitatea anulării rezervărilor, dar și ce anume influențează anularea lor. Alegerea acestor task-uri este relevantă, întrucât rezolvarea lor îi poate ajuta pe utilizatorii informațiilor (managerii celor două hotelurilor) să înțeleagă mai bine probleme legate de clienți sau rezervări.

## 2.	Setul de date

Setul de date utilizat în cadrul proiectului (hotel_bookings.cvs) conține informații cu privire la rezervările a două hoteluri din categorii diferite (resort hotel și city hotel) pe perioada a aproximativ 4 ani. Amândouă hoteluri sunt situate în Portugalia.
Hotel bookings conține 32 de coloane:
<table style="width:100%">
  <tr>
    <th>Atribut</th>
    <th>Descriere</th>
    <th>Tip</th>
  </tr>
  <tr>
    <td><b>adr</b></td>
    <td>= average daily rate<br>
        arată venitul mediu care se realizează pe cameră</td>
    <td>numeric</td>
  </tr>
  <tr>
    <td><b>adults</b></td>
    <td>numarul de adulti</td>
    <td>numeric</td>
  </tr>
  <tr>
    <td><b>agents</b></td>
    <td>id-ul agentiei de turism<br><b>Obs:</b> Poate fi <i>null</i> indicand ca rezervarea nu s-a realizat printr-o agentie</td>
    <td>categoric</td>
  </tr>
  <tr>
    <td><b>arrival_date_day_of_month</b></td>
    <td> ziua lunii in care au sosit oaspetii</td>
    <td>integer </td>
  </tr>
  <tr>
    <td><b>arrival_date_month</b></td>
    <td>luna de cazare </td>
    <td>categoric</td>
  </tr>
  <tr>
    <td><b>arrival_date_week_number</b></td>
    <td> numarul saptamanii</td>
    <td>integer</td>
  </tr>
  <tr>
    <td><b>arrival_date_year</b></td>
    <td>anul cazarii </td>
    <td>integer</td>
  </tr>
  <tr>
    <td><b>assigned_room_type</b></td>
    <td>tipul camerei rezervate </td>
    <td>categoric </td>
  </tr>
  <tr>
    <td><b>babies</b></td>
    <td>numarul de bebelusi </td>
    <td>integer </td>
  </tr>
  <tr>
    <td><b>booking_changes</b></td>
    <td>numarul de schimbari asupra rezervarii</td>
    <td>integer </td>
  </tr>
  <tr>
    <td><b>children</b></td>
    <td>numarul de copii </td>
    <td>integer</td>
  </tr>
  <tr>
    <td><b>company</b></td>
    <td>id-ul companiei care a facut rezervarea/a platit oentru rezervare</td>
    <td>categoric </td>
  </tr>
  <tr>
    <td><b>country</b></td>
    <td>tara de origine a oaspetilor</td>
    <td>categoric</td>
  </tr>
  <tr>
    <td><b>customer_type</b></td>
    <td>tipul de rezervare<br>
    <b>Obs:</b><br>
        <ul>
          <li><i>contract</i> - cand rezervarea are un contract asociat</li>
          <li><i>group</i> - cand rezervarea a fost facuta pentru un grup</li>
          <li><i>transient</i> - cand rezervarea nu face parte dintr-un grup/contract</li>
          <li><i>transient-party</i> - cand rezervarea este de tip <i>transient</i>, dar e asociata cu o alta rezervare de tip <i>transient</i></li>
</ul></td>
    <td>categoric </td>
  </tr>
  <tr>
    <td><b>days_in_waiting_list </b></td>
    <td> numarul de zile din lista de astepatare pana la confirmarea rezervarii</td>
    <td>integer </td>
  </tr>
  <tr>
    <td><b>deposit_type</b></td>
    <td>indica daca clientul a facut un depozit pentru garantarea rezervarii<br>
<b>Obs:</b><br><i>no deposit <br> non refund <br> refundable <br></i> </td>
    <td>categoric</td>
  </tr>
  <tr>
    <td><b> distribution_channel</b></td>
    <td>pe ce canal s-a facut rezervarea<br><b>Obs:</b><br><i>corporate<br>direct<br>GSD<br>TA/TO<br>undefined</i> </td>
    <td>categoric </td>
  </tr>
  <tr>
    <td><b>hotel </b></td>
    <td> tipul de hotel<br><b>Obs:</b><br><i>resort<br>city</i></td>
    <td>categoric </td>
  </tr>
  <tr>
    <td><b>is_canceled </b></td>
    <td>daca rezervarea a fost sau nu anulata </td>
    <td>categoric</td>
  </tr>
  <tr>
    <td><b>is_repeated_guest </b></td>
    <td>daca rezervarea a fost facuta de un oaspete care a mai fost acolo </td>
    <td> categoric</td>
  </tr>
  <tr>
    <td><b>lead_time </b></td>
    <td>cu cate zile inainte s-a facut rezervarea</td>
    <td>integer </td>
  </tr>
  <tr>
    <td><b>market_segment </b></td>
    <td><b>Obs:</b><br><i>aviation<br>complementary<br>corporate<br>direct<br>groups<br>offline TA/TO<br>undefined</i> </td>
    <td>categoric </td>
  </tr>
  <tr>
    <td><b> meal</b></td>
    <td><b>Obs:</b><br><i>undefined/sc<br>bb - bed and breakfast<br>hb - half board<br>fb - full board</i> </td>
    <td>categoric </td>
  </tr>
  <tr>
    <td><b>previous_bookings_not_cancelled </b></td>
    <td> numarul de rezervari facute pana atunci care nu au fost anulate</td>
    <td>integer </td>
  </tr>
  <tr>
    <td><b> previous_cancellations</b></td>
    <td>numarul de rezervari facute pana atunci care au fost anulate </td>
    <td> integer</td>
  </tr>
  <tr>
    <td><b>required_car_parking_spaces </b></td>
    <td> numarul de locuri de parcare rezervate de oaspete</td>
    <td>integer </td>
  </tr>
  <tr>
    <td><b>reservation_status </b></td>
    <td><b>Obs:</b><br><i>canceled<br>check-out<br>no-show</i></td>
    <td>categoric </td>
  </tr>
  <tr>
    <td><b>reservation_status_date </b></td>
    <td>data la care statusul rezervarii a fost setat </td>
    <td>date </td>
  </tr>
  <tr>
    <td><b>reserved_room_type </b></td>
    <td>codul tipului de camera rezervat </td>
    <td> categoric</td>
  </tr>
  <tr>
    <td><b> stays_in_week_nights</b></td>
    <td> numarul de seri din timpul saptamanii din totalul de seri rezervate</td>
    <td> integer</td>
  </tr>
  <tr>
    <td><b>stays_in_weekened_nights </b></td>
    <td> numarul de seri de la sfarsitul saptamanii din totalul de seri rezervate</td>
    <td>integer </td>
  </tr>
  <tr>
    <td><b>total_of_special_requests </b></td>
    <td>numarul de cereri speciale facute de catre oaspete </td>
    <td> integer</td>
  </tr>
</table>

Întrucât setul de date are destul de multe coloane, pentru a avea o imagine de ansamblu asupra datelor am utilizat funcția <b>skim()</b>. Astfel, există 2 categorii de coloane în setul de date: numerice (18) și de tip factor (14).<br>
![image](https://user-images.githubusercontent.com/63421754/124263778-5b3a4c00-db3c-11eb-9070-3a6ecd4ce656.png)<br>
În cadrul coloanelor de tip factor (din imaginea de mai jos) se observă faptul că nu sunt date lipsă. De asemenea, pentru fiecare coloană, se dă exact numărul de valori apărute. În cazul coloanei <i>meal</i>, aceasta ia valori și pentru <i>SC</i> și pentru <i>Undefined</i> care, în esență, înseamnă același lucru. Prin urmare, acestea ar putea fi combinate. <br>
![image](https://user-images.githubusercontent.com/63421754/124264338-02b77e80-db3d-11eb-8ebf-4f3ae8e1054c.png)<br>
La o privire mai amănunțită asupra coloanelor <i>market_segment</i> și <i>distribution_channel</i> se observă faptul că există valori nedefinite, care vor putea fi șterse. <br>
![image](https://user-images.githubusercontent.com/63421754/124264401-1531b800-db3d-11eb-95ab-00373ec41d12.png)<br>
În cadrul coloanelor numerice există 4 valori lipsă pentru atributul <i>children</i>. Tot aici apar și valoarea medie, deviația standard, valorile quantile, alături de histograma fiecărei variabile. În cadrul histogramelor, se observă faptul că o mare parte dintre acestea sunt asimetrice, având o distribuție înclinată spre stânga, cu o coadă destul de lungă.<br>
![image](https://user-images.githubusercontent.com/63421754/124264499-385c6780-db3d-11eb-8535-03e61945a7bc.png)<br>

Astfel, în vederea curățării datelor am decis:<br>
<ul>
<li>Eliminarea înregistrărilor pentru care <i>market_segment</i> sau <i>distribution_channel</i> ia valori nedefinite;</li>
<li>Adunarea coloanelor <i>children</i> și <i>babies</i> astfel încât aceasta să conțănă numărul total de copii pentru fiecare rezervare</li>
<li>Schimbarea coloanei <i>is_canceled</i> în „Yes” sau „No” în funcție de valorile de 0 sau 1 pe care aceasta le ia pentru fiecare înregistare</li>
<li>În cadrul coloanei <i>meal</i>, aceasta va lua valoarea SC în cazul în care aceasta are valoarea Undefined</li>
<li>Atributul <i>company</i> va lua valoarea „No” dacă aceasta este nulă, sau „Yes” dacă nu este, semnificând faptul că rezervarea respectivă a fost făcută printr-o companie sau nu</li>
<li>Adăugarea unei coloane <i>total_nights_stays</i> ca sumă între <i>stays_in weekend_nights</i> și <i>stays_in_week_nights</i>, semnificând totalul de nopți rezervate</li>
<li>Adăugarea unei coloane noi <i>stay_total_cost</i> ca produs între coloana de mai sus, <i>total_nights_stays</i> și <i>adr</i>, semnificând costul total al rezervării</li>
<li>Eliminarea coloanelor <i> babies,stays_in_weeken_nights, stays_in_week_nights, reservation_status_date, reservation_status, arrival_date_day_of_month, arrival_date_year, arrival_date_week_number, assigned_room_type, country, total_of_special_requests, booking_changes, required_car_parking_spaces</i></li>
</ul>
La final rămân 21 de coloane.<br>
## 3.	Rezultate și discuții
Pentru început am realizat matricile de corelație atât pentru rezervările neanulate, cât și pentru cele anulate (prezentate mai jos) pentru a vedea dacă atributele sunt independente între ele. Se observă astfel că atributele sunt mai corelate în cazul rezervărilor neanulate.<br>
Există anumite corelații pozitive între :<br>
<ul>
<li><i>children</i> și <i>adr</i> - semnificând faptul că rezervările care au în componență copii sunt mai scumpe, afectând totodată și costul total al  rezervării;</li>
<li><i>previous_bookings_not_cancelled</i> și <i>is_repeated_guest</i> – arătând că oaspeții care nu și-au anulat rezervările sunt de obicei oaspeți care s-au mai cazat și în trecut;</li>
<li><i>adr</i> și <i>stay_total_cost</i> – relația este evidentă, cea de-a doua este calculată pe baza primeia, prin urmare costul total crește pe baza creșterii tarifului zilnic;</li>
<li><i>stay_total_cost</i> și <i>total_nights_stays</i> – la fel ca și mai sus, prima este calculată pe baza primeia, costul total al rezervării crește pe baza creșterii numărului total de nopți cazate;</li>

![image](https://user-images.githubusercontent.com/63421754/124272632-ad349f00-db47-11eb-85a5-e2af72964330.png)<br>

În vederea realizării modelelor de clasificare am ales utilizarea: <b>regresiei logistice, Naive Bayes,</b> arborii de clasificare (atât cei prin abordarea <b>CART</b>, cât și utilizând <b>entropia</b>) și arborii avansați de clasificare (<b>Bagging</b> și <b>Random Forest</b>). <br>
Am împărțit setul de date în set de antrenament și de test în proporții de 70% și 30% și stratificare după variabila is_canceled, întrucât aceasta este și cea care mă intereasează.<br>

### a.	Regresia Logistică
În vederea creării modelului de regresie logistică am utilizat toate cele 21 de atribute.<br>
![image](https://user-images.githubusercontent.com/63421754/124272819-ebca5980-db47-11eb-8640-d8d517df9e1f.png)<br>

Mai departe, am realizat o predicție și am realizat matricea de confuzie.
Se observă faptul că, modelul are o acuratețe de 77,94%  și un P-value destul de bun. Totodată, no information rate este 0,6296 arătând faptul că există o șansă de 62,96% să facem o clasificare corectă dacă nu am avea nicio informație.
Clasa pozitivă este NO, adică sunt mai puține cazurile de anulare a rezervărilor. <br>
![image](https://user-images.githubusercontent.com/63421754/124272856-fb49a280-db47-11eb-8eac-71dbdc2de1ec.png)<br>
### b.	Naive Bayes
În vederea realizării unui model Naive Bayes, am realizat mai întâi un set features în care am păstrat toate atributele care nu sunt is_canceled. Mai departe, am utilizat metoda de validare 10 folds cross validation și am alcătuit modelul.
Pentru a găsi modelul optim am realizat o căutare extensivă, rezultatul fiind cel de mai jos.<br>
![image](https://user-images.githubusercontent.com/63421754/124272928-14eaea00-db48-11eb-99a4-d9fa67226993.png)<br>
Se observă faptul că modelul optim are o acuratețe de 76,08%, acesta fiind cel care care utilizează kernel și adjust=1.
Mai jos este prezentată matricea de confuzie realizată în urma predicției:<br>
![image](https://user-images.githubusercontent.com/63421754/124273025-2e8c3180-db48-11eb-9f46-db8413b83b79.png)<br>
Modelul optim are o acuratețe de 76,47% asupra setului de test, mai slab decât regresia logistică.
### c.	Arbori de clasificare
### c1) Arbori utilizând abordarea CART
Am realizat arborele folosind funcția rpart, având ca formulă atributul is_canceled în funcție de restul atributelor din setul de date și metoda class, având în vedere faptul că aceasta va realiza o clasificare. Arborele rezultat este mai jos:<br>
![image](https://user-images.githubusercontent.com/63421754/124273084-41066b00-db48-11eb-9d9e-60e9f784c781.png)<br>

Se observă faptul că deposit_type joacă un rol foarte important, acesta fiind așezat în vârful arborelui, împărțind setul în două, acesta clasifică clasa majoritară (care este NO în acest caz). Pe primul nivel este plasat deposit_type (No deposit/ Refundable), iar pe următorul nivel este deposit_type (No refund). 
Următorul criteriu este lead_time, timpul de așteptare care nu depășește 11.5 zile și, respectiv, care depășește 11.5 zile. Ultimul criteriu selectat este previous_cancellations. <br>
![image](https://user-images.githubusercontent.com/63421754/124273205-62ffed80-db48-11eb-9add-11b0cfc4d895.png)<br>

Putem concluziona astfel: dacă rezervarea este de tip No deposit/Refundable și timpul de așteptare nu depășește 12 zile, atunci rezervarea nu va fi anulată, sau dacă aceasta depășește 12 zile, iar presoana care face rezervarea nu și-a mai anulat rezervări în trecut, atunci nu o va anula nici atunci, însă, dacă aceasta și-a mai anulat rezervari atunci, cel mai probabil o va face și de data aceasta. Dacă rezervarea este de tip Non Refund atunci, aceasta va fi anulată.<br>
![image](https://user-images.githubusercontent.com/63421754/124273247-70b57300-db48-11eb-9704-d9403f9c410e.png)<br>
Modelul are o acuratețe de 76,91% și un P-value bun, arătând că acesta este o metodă de clasificare destul de bună. Totuși, nu se deosebește prea mult de modelele anterioare, no information rate și P-value au aceeași valoare cu modelul Naive Bayes, iar acuratețea nu este decât cu foarte puțin (0.47) mai mare.<br>

### c2) Arbori utilizând entropia
Am creat un nou arbore de clasificare folosind entropia. Astfel, cu ajutorul comenzii tree și utilizând formula is_canceled în funcție de restul atributelor.<br>
![image](https://user-images.githubusercontent.com/63421754/124273286-7ad77180-db48-11eb-8cea-d2be5c86f86f.png)<br>
	
Arborele rezultat este puțin mai adânc de data aceasta. Similar cu cel anterior, deposit_type și lead_time sunt plasate pe primele două nivele, însă de data aceasta perioada de timp pentru lead_time este de 8.5 zile și nu de 11.5. Pe locul trei ca importanță se situează atributul market_segment și abia după aceea previous_cancellations.<br>
Astfel, dacă rezervarea este nu este de tip No Deposit/Refundable atunci, aceasta va fi anulată. În schimb, dacă aceasta este de acel tip și dacă timpul de așteptare nu depășește 9 zile, atunci nu va fi anulată. Dacă se depășesc 9 zile și segmentul de marketing este nu este unul definit, atunci, din nou, aceasta nu va fi anulată. În schimb, dacă segmentul de marketing este unul definit și persoana care face rezervarea și-a mai anulat rezervări în trecut, atunci aceasta va anula rezervarea și acum, iar dacă nu a mai anulat nimic în trecut, atunci nu va anula nici acum.<br>
![image](https://user-images.githubusercontent.com/63421754/124273370-9d698a80-db48-11eb-9f29-803519a6cbd6.png)<br>

Acuratețea modelului nu este mai mare decât cea a arborelui anterior, ba chiar, este identică cu modelul Naive Bayes. 
### d.	Arbori de clasificare avansați
### d1) Bagging
În vederea creării acestui model am utilizat formula is_canceled în funcție de restul atributelor și am setat coob=TRUE, adică va face estimarea performanțelor tuturor arborilor pe care îi va construi.<br>
![image](https://user-images.githubusercontent.com/63421754/124273434-ae1a0080-db48-11eb-947b-7fc437db63f4.png)<br>
 
Astfel, acesta realizează 25 de bag-uri, având o eroare out-of-bag de 0.1876, ceea ce înseamna o acuratețe de 82%.<br>
![image](https://user-images.githubusercontent.com/63421754/124273475-b96d2c00-db48-11eb-985b-a1cdbe37b927.png)<br>
Modelul are o acuratețe de 82.02%,  mult mai bună decât modelele anterioare. De asemenea, specificitatea este și ea mult mai bună decât cea a modelelor realizate până acum.
### d2) Random Forest
La fel ca la modelele anterioare am utilizat formula is_canceled în funcție de restul variabilelor.<br>
![image](https://user-images.githubusercontent.com/63421754/124273528-cbe76580-db48-11eb-85cc-1dc1e5c0bc8f.png)<br>

Astfel, cu ajutorul funcției randomForest au fost creați 500 de arbori, 4 variabile la fiecare nod.<br>
Eroarea out-of-bag are valoare de 18.14%, rezultând o acuratețe de 82% asupra seturilor rămase.<br>
Mai departe, pentru a găsi cel mai bun model, am utilizat comanda tuneRF luând ca parametrii setul features, utilizat și la modelul Nave Bayes, realizând 500 de arbori, care vor începe cu 5 variabile și vor crește cu un stepFactor=1.5, oprindu-se atunci când performanța scade sub 1%.<br>
![image](https://user-images.githubusercontent.com/63421754/124273769-1bc62c80-db49-11eb-9503-ef5ac2306f36.png)<br>

Se observă că modelul cu eroarea OOB cea mai mică este pentru mtry=6.<br>
![image](https://user-images.githubusercontent.com/63421754/124273805-28e31b80-db49-11eb-8fc3-19f2b5d996a0.png)<br> 
Mai departe, am construit cel mai bun model random forrest utilizând mtry=6.<br>
![image](https://user-images.githubusercontent.com/63421754/124273860-3a2c2800-db49-11eb-9557-741c46d9054d.png)<br>

Cel mai bun model random forest are o rată a erorii OOB de 17.46%. <br>
Acuratețea pe setul de test este de 82.85%, având totodată senzitivitatea și specificitatea mai bune decât modelele anterioare.<br>
![image](https://user-images.githubusercontent.com/63421754/124273929-4ca66180-db49-11eb-97ce-fb13b7007415.png)<br>
La final, am realizat un grafic cu toate curbele ROC aferente modelelor realizate:<br>
![image](https://user-images.githubusercontent.com/63421754/124273962-56c86000-db49-11eb-88a8-6205e875bf6a.png)<br>
Modelul Random Forest are ocupă cea mai multă suprafață din grafic, întrucât acesta reușește să descopere 89.5% dintre rezervările anulate, acesta fiind urmat la o diferență mică de Bagging.
## 4.	Concluzii
În urma rezultatelor obținute se poate răspunde am reușit să ating obiectivelel propuse la începutul proiectului. Astfel, se poate ajunge la concluzia că rezervările sunt în mare parte influențate de:<br>
<ul>
<li>Tipul de depozit</li>
<li>Timpul de așteptare</li>
<li>Anulările anterioare</li>
<li>Segmentul de marketing</li>
</ul>
<br>De asemenea, acestea vor pute fi prezise cu o acuratețe de 82,85% cu ajutorul modelului Random Forest.

