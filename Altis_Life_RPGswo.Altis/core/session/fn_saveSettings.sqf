/*
	File: fn_saveSettings.sqf
	Author: MarkusSR1984
	
	Description:
	Sendet die Spielereinstellungen zum Server um sie dort in der Datenbank zu Speichern
*/
private["_uid","_sender"];

// Sichtweiteneinstellung wiederherstellen
 profileNamespace setVariable["tawvd_foot",tawvd_foot];
 profileNamespace setVariable["tawvd_car",tawvd_car];
 profileNamespace setVariable["tawvd_air",tawvd_air];
[] spawn DWEV_fnc_updateViewDistance;

profileNamespace setVariable["DWEV_sidechat",DWEV_sidechat];
profileNamespace setVariable["DWEV_revealObjects",DWEV_revealObjects];
profileNamespace setVariable["DWEV_tagson",DWEV_tagson];