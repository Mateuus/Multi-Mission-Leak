/*
	IF U WANT TO USE THE SCRIPT, ASK FOR PERMISSION! info@minefactory.eu
*/
0 cutText["","BLACK OUT"];

_text2 = parseText format ["<t><t size='1.35'>Hallo und herzlich willkommen auf dem 
MineFactory Altis Life Server<br/><br/></t><t size='1.15'>%1,<br/></t><t><t size='1'>Du bist neu hier,  wir hoffen du hast hier Spaß :)  <br />
Schau doch auch mal auf unserem Teamspeak-Server vorbei:<br />
Teamspeak 3: <t color='#EE9A00'> <a href='http://www.teamspeak.com/invite/altis.minefactory.eu/'>altis.minefactory.eu (klick)</a> </t> <br />
Unsere Homepage findest du unter folgender Adresse: <t color='#EE9A00'> <a href='http://minefactory.eu/'>minefactory.eu (klick)</a> </t> <br />
<br />
Der Server existiert nun schon seit einem Jahr!  Seit dem 19.06.2014, und wir hoffen wir können mit dir als Spieler noch länger den Server Betreiben. Wenn du ein Anliegen hast kannst du dich gerne im TeamSpeak im Hilfe Channel melden. Die Datenbank wurde 2016 neu aufgesetzt<br />
<br />
<t align='center' size='1.1'> Vielen dank für deine Aufmerksamkeit.<br />
Wir wünschen dir eine tolle Zeit und viel Spaß auf unserem Server.</t><br/><br/></t>",name player];
_result2 = [_text2, false,"Weiter", false] call BIS_fnc_guiMessage;	
sleep 1;
_text2 = parseText format ["<t><t size='1.35'>Du bist ein Flüchtling<br/><br/></t><t size='1.15'>%1,<br/></t><t><t size='1'>In deinem Land geht es dir schlecht, daher hast du entschlossen nach Altis zu reisen. Du nutzt ein Boot um nach Altis zu gelangen.<br/><br/></t>",name player];
_result2 = [_text2, false,"Weiter", false] call BIS_fnc_guiMessage;	
sleep 1;
[] spawn life_fnc_ASAR_Rettung;
0 cutText ["","BLACK IN"];
