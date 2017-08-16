#include "..\macros.hpp"
/*
	File: fn_welcomeNotification.sqf
	
	Description:
	Called upon first spawn selection and welcomes our player.
*/

if (dwf_atmcash < 500000) then
{
//	format["Wilkommen %1, bitte Lesen. WICHTIG!!!!",getMyName] hintC
	format["Wilkommen %1, bitte Lesen. WICHTIG!!!!",getMyName] hintC
	[
		"Wilkommen auf dem Server von Division Wolf!",
		"Regeln und Änderungen könnt ihr unter 'M' finden. Mit Z öffnet ihr euer Spielermenü und könnt z.B. die Polizei rufen oder anderen Items und Geld geben.",
		"KAVALA MARKTPLATZ UND UMGEBUNG -MAKIERUNG- IST ABSOLUTE SAFEZONE! WER HIER LEUTE TÖTET ODER RUMSCHIEßT WIRD SOFORT GEBANNT!",
		"Ihr seid frisch auf Altis eingetroffen? Dann empfehlen wir euch, ein Quad sowie einen Rucksack zu besorgen und einige Früchte von naheliegenen Feldern zu verkaufen",
		"Nach und nach könnt ihr auf größere Fahrzeuge und Ausrüstung zugreifen. Aber haltet euch von der Bank oder den Drogenfeldern fern oder ihr bekommt Ärger mit der Polizei!",
		"Lest alle Regeln!!! auch die der Polizei, denn dort sind WICHTIGE Regeln, die man als Zivilist/Rebell wissen muss.",
		"Unseren Teamspeak findet ihr unter der IP: ts.division-wolf.de. Dort gibt es auch Informationen zur Polizeibewerbung"
	];
};