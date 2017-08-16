/*

Author: Don Richter
Desciption: Let it blow - bloaw

*/


//if(playersNumber west < 4) exitWith { hint "Verdammt, der Computer ist mit einem Passwort geschützt...."};
if(player distance securitypc > 5) exitWith {hint "Du bist nicht in der Nähe des Sicherheitssytems! Geh und finde den Kontrollraum."};
[false,"usb",1] call life_fnc_handleInv;

titleText["USB-Stick in den PC eingesteckt... Sicherheitssystem wird gehackt!","PLAIN"];
[[2,"DAS SICHERHEITSSYSTEM DES GEFÄNGNIS WIRD GEHACKT!!!"],"life_fnc_broadcast",nil,false] spawn life_fnc_MP;
sleep 1;
hint "\n Status: 0% \n Verbleibende Zeit ca. 6 Minuten";
sleep 60;
hint "\n Status: 20% \n Verbleibende Zeit ca. 5 Minuten";
sleep 60;
hint "\n Status: 40% \n Verbleibende Zeit ca. 4 Minuten";
sleep 60;
hint "\n Status: 60% \n Verbleibende Zeit ca. 3 Minuten";
sleep 60;
hint "\n Status: 80% \n Verbleibende Zeit ca. 2 Minuten.";
sleep 60;
hint "\n Status: 86% \n Verbleibende Zeit ca. 1 Minute.";
sleep 30;
hint "\n Status: 92% \n Verbleibende Zeit ca. 30 Sekunden.";
sleep 20;
hint "\n Status: 98% \n Verbleibende Zeit ca. 10 Sekunden.";
sleep 10;
hint "Sicherheitssystem Erfolgreich gehackt, nichts wie raus hier! \n ACHTUNG: Da Tor ist nur für kurze Zeit geöffnet!";
[[0,format["ALARM! DIE STRAFTÄTER KONNTEN AUS DEM GEFÄNGNIS AUSBRECHEN!"]],"life_fnc_broadcast",west,false] spawn life_fnc_MP;
[[0,format["News: Soeben sind mehrere Schwerverbrecher aus dem Altis State Prison geflohen, bitte seien sie vorsichtig bei unbekannten Personen!"]],"life_fnc_broadcast",civilian,false] spawn life_fnc_MP;


life_erfahrung = life_erfahrung + 25;
systemChat "+25 EXP";
[] call life_fnc_hudUpdate;
knasttor animate ["Door_1_rot",1];
knasttor animate ["Door_2_rot",1];
sleep 10;
knasttor animate ["Door_1_rot",0];
knasttor animate ["Door_2_rot",0];
