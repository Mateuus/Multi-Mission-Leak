/*
	Author: Christian "Cifon" Runggas
*/

if (_this == 1) then {
60 setwaves 0.00;
60 setfog 0.00;
60 setRain 0.00;
60 setOvercast 0.00;
60 setRainbow 0.00;
60 setWaves 0.00;
60 setLightnings 0.00;
forceWeatherChange;

};
if (_this == 2) then {
hintsilent parsetext"<t size='1.5'>Fertig machen für den Start von</t><br/><br/><t size='2'>FAST ON ALTIS</t>";uisleep 20; hintsilent parsetext"<t size='1.5'>FAST ON ALITS </br><t size='1.5'> startet in</t><br/><br/><t size='2'>10</t>"; uisleep 1; hintsilent parsetext"<t size='1.5'>FAST ON ALITS </br><t size='1.5'> startet in</t><br/><br/><t size='2'>9</t>"; uisleep 1; hintsilent parsetext"<t size='1.5'>FAST ON ALITS </br><t size='1.5'> startet in</t><br/><br/><t size='2'>8</t>"; uisleep 1; hintsilent parsetext"<t size='1.5'>FAST ON ALITS </br><t size='1.5'> startet in</t><br/><br/><t size='2'>7</t>"; uisleep 1; hintsilent parsetext"<t size='1.5'>FAST ON ALITS </br><t size='1.5'> startet in</t><br/><br/><t size='2'>6</t>"; uisleep 1; hintsilent parsetext"<t size='1.5'>FAST ON ALITS </br><t size='1.5'> startet in</t><br/><br/><t size='2'>5</t>"; playsound "alarm"; uisleep 1; hintsilent parsetext"<t size='1.5'>FAST ON ALITS </br><t size='1.5'> startet in</t><br/><br/><t size='2'>4</t>"; playsound "alarm"; uisleep 1; hintsilent parsetext"<t size='1.5'>FAST ON ALITS </br><t size='1.5'> startet in</t><br/><br/><t size='2'>3</t>"; playsound "alarm"; uisleep 1; hintsilent parsetext"<t size='1.5'>FAST ON ALITS </br><t size='1.5'> startet in</t><br/><br/><t size='2'>2</t>"; playsound "alarm"; uisleep 1; hintsilent parsetext"<t size='1.5'>FAST ON ALITS </br><t size='1.5'> startet in</t><br/><br/><t size='2'>1</t>"; playsound "alarm"; uisleep 1; hintsilent parsetext"<t size='3'>#START#</t>";
};
if (_this == 3) then {
hintsilent parsetext"<t size='1.6'><t color='#0000FF'>ALTIS ZIVILSCHUTZ</t><br/><br/><t size='1.5'><t color='#FF0000'>! W A R N U N G !</t><t size='1.2'><br/><br/>Werte Bewohner von Altis!</t><br/><br/><t size='1'>Es werden uns seismische Aktivität im Bereich Altis, Stratis und Umgebung gemeldet! Einschätzungen über Stärke und Dauer des Bebens sind noch nicht möglich.<br/><br/>Unsere Empfehlung:</t><br/><br/><t size='1'><t color='#FF0000'>Stellen sie ihre Fahrzeuge sicher ab. Begeben sie sich ins Freie und warten sie auf weitere Anweisungen!</t>"; uisleep 20; hintsilent parsetext""; uisleep 30; [] spawn BIS_fnc_earthquake; uisleep 30; [] spawn { playsound "earthquake_04"; uisleep 5; playsound "earthquake_04"; uisleep 5; playsound "earthquake_04"; uisleep 5; playsound "earthquake_04"; uisleep 5; playsound "earthquake_04"; uisleep 5; playsound "earthquake_04"; uisleep 5;}; player spawn { uisleep 1; enablecamshake true; addcamshake [10, 70, 25]; uisleep 90; enablecamshake false; }; uisleep 90; hintsilent parsetext"<t size='1.6'><t color='#0000FF'>ALTIS ZIVILSCHUTZ</t><br/><br/><t size='1.3'><t color='#00FF00'>E N T W A R N U N G</t><t size='1'><br/><br/>Keine weiteren seismischen Aktivitäten im Bereich Altis, Stratis und Umgebung zu erwarten.";
};
