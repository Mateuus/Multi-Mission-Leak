/*
 *
 *	@File:		holy_script.sqf
 *	@Autor: 	AustrianNoob
 *	@Date:		02.11.2016
 *
 *	You are not allowed to use this script or remove the credits of the script without the permission of the author.
 */
private ["_display","_auswahl","_uid","_dialogID","_desctext","_posDG"];
disableSerialization;
_auswahl = (_this select 0);
_uid = getPlayerUID player;
_dialogID = 1337; //IDD
_dialog = (findDisplay _dialogID);
_textbox = _dialog displayCtrl 1338;
_posDG = ctrlPosition _textbox;


if(!dialog) then {createDialog "holy_help"}; //Thefuck?
waitUntil {!isNull (_dialog)};

switch(_auswahl) do {
	default {hint "Da ist wohl ein Fehler untergekommen...#Default"};
	case 0: {hint "Da ist wohl ein Fehler untergekommen...#case0"};
	//Auswahl
	case 1: {
		_desctext = "<t size=2.0><t color='#ff0000'><t underline='true'><t align='center'>Die Übersicht</t></t></t><t size=1.0><t<br /> <br /><br />Dies ist die Übersicht vom Hilfe Menü.<br /><br /> TeamSpeak IP: ts.Nextgeneration-life.de<br /> </t>";
	};
	case 2: {
		_desctext = "<t size=2.0><t color='#ff0000'><t underline='true'><t align='center'>Die Lizenspreise</t></t></t><t size=1.0><t<br /><br />--Allgemeines--<br />Führerschein: 500<br />Boot Führerschein: 1.000<br />Flugschein: 25.000<br />LKW Führerschein: 75.000<br />Waffenschein: 10.000<br />Tauchlizens: 2.000<br />Eigentumsurkunde: 1.000.000<br />Neureich: 15.000.000<br />--Verarbeitung--<br />Öl: 280.000<br />Diamant: 560.000<br />Salz: 94.000<br />Sand: 86.000<br />Eisen: 35.750<br />Kupfer: 12.000<br />Zement: 65.000<br />Silber: 330.000<br />Aluminium: 300.000<br />Iridium: 275.000<br />Bier: 73.000<br />--Illegale Verarbeiter--<br />Kokain: 520.000<br />Heroin: 465.000<br />Marihuana: 390.000<br />LSD: 367.500<br />Uran: 1.785.000<br />--Illegale Lizenzen--<br />Rebellenlizenz: 2.500.000<br />Schwarzmarktlizenzs: 25.000.000<br /></t></t></t>";
	};
	case 3: {
		_desctext = "<t size=2.0><t color='#ff0000'><t underline='true'><t align='center'>Die Polizei</t></t></t><t size=1.0><t<br /><br />Polizeileitung: Ryan Clayton<br />Für weitere Informationen oder falls Sie sich bewerben wollen.<br />Besuchen Sie bitte unser Forum.<br />Sperrzone: Die Polizei Kann Sperrzonen Ausrufen. Es ist nicht erlaubt diese zu betreten oder zu überfliegen!</t></t></t>";
	};
	case 4: {
		_desctext = "<t size=2.0><t color='#ff0000'><t underline='true'><t align='center'>Die Medics</t></t></t><t size=1.0><t<br /<br />>Medicleitung: Rick James<br />Für weitere Informationen oder falls Sie sich bewerben wollen.<br />Besuchen Sie bitte unser Forum</t></t></t>";
	};
	case 5: {
		_desctext = "<t size=2.0><t color='#ff0000'><t underline='true'><t align='center'>Welche illegalen Güter gibt es</t></t></t><t size=1.0<t<br /><br />Kokain<br />Heroin<br />Marihuana<br />LSD<br />Uran </t></t></t>";
	};
	case 6: {
		_desctext = "<t size=2.0><t color='#ff0000'><t underline='true'><t align='center'>Welche Legalen Güter gibt es</t></t></t><t size=1.0><t<br /><br />Öl<br />Diamanten<br />Salz<br />Glas<br />Eisen<br />Kupfer<br />Zement<br />Silber<br />Aluminium<br />Iridium<br />Bier";
	};
	case 7: {
		_desctext = "<t size=2.0><t color='#ff0000'><t underline='true'><t align='center'>Wie führe ich einen Bankraub durch ?</t></t></t><t size=1.0><br /><br />Sie benötigen für einen Bankraub einen Bolzenschneider und einen Sprengsatz.<br />Mit dem Bolzenschneider schneiden Sie die Schlösser der Türen auf.<br />Und mit der Sprengladung sprengen Sie den Tresor auf.<br />Die Polizei wird versuchen Sie aufzuhalten, also seien Sie gefasst und bewahren Sie einen kühlen Kopf.";
	};
	case 8: {
		_desctext = "<t size=2.0><t color='#ff0000'><t underline='true'><t align='center'>Was ist die Stadt der Neureichen?</t></t></t><t size=1.0><br /><br />In der Stadt der Neureichen bekommt man eine Neureichen Lizenz.<br />Mit dieser Lizenz kann man am Neureichenshop viele Hochwertig Fahrzeuge Erhalten.";
	};
	case 9: {
		_desctext = "<t size=2.0><t color='#ff0000'><t underline='true'><t align='center'>Wie starte ich eien Gangkrieg</t></t></t><t size=1.0><t<br /><br />Ein Gangkrieg muss im Forum mit Roleplay Hintergrund angekündigt werden.<br />Der Gangkrieg muss von den jeweiligen Clan Leadern und einem Teammitglied bestätigt werden.<br />Erst dann ist der Gangkrieg genehmigt.";
	};
	case 10: {
		_desctext = "<t size=2.0><t color='#ff0000'><t underline='true'><t align='center'>Das Team</t></t></t><t size=1.0><t<br /><br />Projektleitung: Ryan Clayton, Jodie Holmes<br />Projektmanagent: Heideltraut Geyer, Max Brems<br />Admins: Jay Veljeta, Peter Quill<br />Eventleitung: Alle Projektmanager<br />Scripter: Max Brems <br />Designer: Ryan Clayton<br />Mapper: Ryan Clayton, Max Brems";
	};
	case 11: {
		_desctext = "<t size=2.0><t color='#ff0000'><t underline='true'><t align='center'>Credits</t></t></t><t size=1.0><br /><br />Diese Hilfe Menü wurde von holy_f0rest (aka. AustrianNoob) gescriptet und in Zusammenarbeit mit Joshisohn und Hans Dieter mit Texten bestückt.";
	};
};
_textbox ctrlSetStructuredText parseText format["%1",_desctext];
_textbox ctrlSetPosition [0,0,0.425 * safezoneW,ctrlTextHeight _textbox];
_textbox ctrlCommit 0;