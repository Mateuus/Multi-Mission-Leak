/*
	File: fn_priceASK1.sqf
	Author: Sebastian Reddeck
	
	Description:
	Zeigt die aktuellen illegalen Preise...
*/
if (license_civ_rebel) then {
hint "Die Abfrage kostet $ 50.000 dieses wird von deinem Konto abgebucht. Preis Übersicht wird geladen...";
life_atm5cash = life_atm5cash - 50000;
sleep 5;
hintSilent parseText format["

<t size='1.50'color='#ff0000'  align='center'>Handelspreise (Illegal)</t><br />
<br />
<t color='#00FF00' align='left'>Gras: </t><t 'align='left'>$%1 pro Stück</t><br />
<t color='#00FF00' align='left'>Kokain: </t><t 'align='left'>$%2 pro Stück</t><br />
<t color='#00FF00' align='left'>Krokodile: </t><t 'align='left'>$%3 pro Stück</t><br />
<t color='#00FF00' align='left'>LSD: </t><t 'align='left'>$%4 pro Stück</t><br />
<t color='#00FF00' align='left'>Heroin: </t><t 'align='left'>$%5 pro Stück</t><br />
<t color='#00FF00' align='left'>Uran: </t><t 'align='left'>$%6 pro Stück</t><br />
<t color='#00FF00' align='left'>Meth: </t><t 'align='left'>$%7 pro Stück</t><br />
<t color='#00FF00' align='left'>Uran Munition: </t><t 'align='left'>$%8 pro Stück</t><br />
<t color='#00FF00' align='left'>gestr. Kokain: </t><t 'align='left'>$%9 pro Stück</t><br />
<t color='#00FF00' align='left'>Schildkröten: </t><t 'align='left'>$%10 pro Stück</t><br />
<t color='#00FF00' align='left'>Moonshine: </t><t 'align='left'>$%11 pro Stück</t><br />

", SGRAS, SCOCAIN, SKROKS, SLSD, SHEROIN, SURAN, SMETH, SURANM, SBADCOCAIN, STURTLE, SSCHNAPS];
}
else 
{ 
hint "Du hast keine Rebellenlizenz!";
};