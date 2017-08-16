/*
	File: fn_priceASK.sqf
	Author: Sebastian Reddeck
	
	Description:
	Zeigt die aktuellen legalen Preise...
*/
sleep 1;
hintSilent parseText format["

<t size='1.50'color='#ff0000'  align='center'>Handelspreise (Legal)</t><br />
<br />
<t color='#00FF00' align='left'>Zement: </t><t 'align='left'>$%1 pro Stück</t><br />
<t color='#00FF00' align='left'>Kupfer: </t><t 'align='left'>$%2 pro Stück</t><br />
<t color='#00FF00' align='left'>Eisen: </t><t 'align='left'>$%3 pro Stück</t><br />
<t color='#00FF00' align='left'>Salz: </t><t 'align='left'>$%4 pro Stück</t><br />
<t color='#00FF00' align='left'>Glas: </t><t 'align='left'>$%5 pro Stück</t><br />
<t color='#00FF00' align='left'>Öl: </t><t 'align='left'>$%6 pro Stück</t><br />
<t color='#00FF00' align='left'>Kerosin: </t><t 'align='left'>$%7 pro Stück</t><br />
<t color='#00FF00' align='left'>Gold: </t><t 'align='left'>$%8 pro Stück</t><br />
<t color='#00FF00' align='left'>Diamanten: </t><t 'align='left'>$%9 pro Stück</t><br />
<t color='#00FF00' align='left'>Muscheln: </t><t 'align='left'>$%10 pro Stück</t><br />
<t color='#00FF00' align='left'>Schmuck: </t><t 'align='left'>$%11 pro Stück</t><br />
<t color='#00FF00' align='left'>Bier: </t><t 'align='left'>$%12 pro Stück</t><br />
<t color='#00FF00' align='left'>Silber: </t><t 'align='left'>$%13 pro Stück</t><br />
<t color='#00FF00' align='left'>Blei-Glas: </t><t 'align='left'>$%14 pro Stück</t><br />
<t color='#00FF00' align='left'>Blei-Legierung: </t><t 'align='left'>$%15 pro Stück</t><br />
<t color='#00FF00' align='left'>Radioaktive Elemente: </t><t 'align='left'>$%16 pro Stück</t><br />

", SCEMENT, SCOPPER, SIRON, SSALT, SGLAS, SOIL, SKEROSIN, SGOLD, SDIA, SMUSCHEL, SSCHMUCK, SBIER, SSILBER, SBLEIGLAS, SLEGIERUNG, SRadioaktiv];