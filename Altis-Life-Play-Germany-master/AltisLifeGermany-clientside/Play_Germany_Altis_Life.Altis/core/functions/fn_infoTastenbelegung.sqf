private["_text"];

if(playerSide == civilian) then {
	_text = 
		"<t size='2'>
		Extratasten</t><br/>
		<br/>
		<t size='1'>Windowstaste: <br/>
		Hauptinteraktionstaste (auch zum Sammeln)<br/>
		<br/>
		F1-F4<br/> 
		Hilfetasten<br/>
		<br/>
		Z/Y<br/>
		Öffnen des Spielermenüs<br/>
		<br/>
		T <br/>
		Fahrzeugkofferraum<br/>
		<br/>
		U<br/>
		Öffnen/Abschliessen von Fahrzeugen<br/>
		<br/>
		Links Shift + Ö<br/>
		Ergeben<br/>
		<br/>
		Links Shift + R <br/>
		Niederschlagen<br/>
		dann Festnehmen<br/>
		<br/>
		Ü<br/>
		Ausweis  zeigen<br/>
		(Wird benötigt um im Spielermenü des Gegenüber auf zu tauchen)<br/>
		<br/>
		Shift + Ü<br/>
		Lizenzen zeigen<br/>
		</t>";
 } else {
	_text = 
		"<t size='2'>
		Extratasten</t><br/>
		<br/>
		<t size='1'>Windowstaste: <br/>
		Hauptinteraktionstaste<br/>
		<br/>
		F1-F4<br/> 
		Hilfetasten<br/>
		<br/>
		Z/Y<br/>
		Öffnen des Spielermenüs<br/>
		<br/>
		T <br/>
		Fahrzeugkofferraum<br/>
		<br/>
		U<br/>
		Öffnen/Abschliessen von Fahrzeugen<br/>
		<br/>
		Links Shift + Ö<br/>
		Ergeben<br/>
		<br/>
		Links Shift + R <br/>
		Festnehmen<br/>
		<br/>
		Links Shift + L<br/>
		Einsatzlicht<br/>
		<br/>
		Links Shift + F / F <br/>
		Sirene/Yelp<br/>
		<br/>
		O<br/>
		Schranke Öffnen<br/>
		<br/>
		(ALT) + Ü<br/>
		Ausweis (oder mit ALT Fake-/Kripo-Ausweis) zeigen<br/>
		<br/>
		shift+Ä<br/>
		Mobile Banking<br/>
		<br/>
		Shift + K<br/>
		Gegenüber diese Hilfe anzeigen lassen<br/>
		</t>"; 
 };

hint parseText _text;




