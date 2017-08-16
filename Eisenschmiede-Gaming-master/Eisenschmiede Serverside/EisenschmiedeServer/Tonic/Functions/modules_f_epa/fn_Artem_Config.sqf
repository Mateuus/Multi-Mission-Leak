/*
*					BLACK KEINEN WEITER GEBEN! DU HOLZ!!!!
*/

ProjektleiterBitches = ["76561198030072519","76561198087725238","76561198014517215"];
AdminsBitches = ["76561198221513832","76561198122912324","76561198013694136","76561198172889642","76561198025126364","76561197988143004","76561198068716482","76561198068500022","76561198067856029"];
DebugServer = ["76561198030072519","76561198014517215","76561198122912324","76561198025126364"];
DebugTestServer = ["76561198030072519","76561198208681004"];

switch (worldName) do
{

	case "Altis":{ ArtemTooLMap = "Altis"; ArtemTooLGlobalBlackList = ["",""]; ArtemTooLHotKeyBlackList = ["",""]; ArtemTooLSpawnBlackList = ["",""]; };
	case "Stratis":{ ArtemTooLMap = "Stratis"; ArtemTooLGlobalBlackList = ["",""]; ArtemTooLHotKeyBlackList = ["",""]; ArtemTooLSpawnBlackList = ["",""]; };
	case "Tanoa":{ ArtemTooLMap = "Tanoa"; ArtemTooLGlobalBlackList = ["",""]; ArtemTooLHotKeyBlackList = ["",""]; ArtemTooLSpawnBlackList = ["",""]; };
	case "VR":{ ArtemTooLMap = "VR"; ArtemTooLGlobalBlackList = ["",""]; ArtemTooLHotKeyBlackList = ["",""]; ArtemTooLSpawnBlackList = ["",""]; };

	default { ArtemTooLMap = "default"; ArtemTooLGlobalBlackList = ["",""]; ArtemTooLHotKeyBlackList = ["",""]; ArtemTooLSpawnBlackList = ["",""]; };
};

switch (true) do
{

	case (["Altis",Servername] call BIS_fnc_inString):{ ArtemTooLMod = "Altis"; };
	case (["Epoch",Servername] call BIS_fnc_inString):{ ArtemTooLMod = "Epoch"; };
	case (["Wasteland",Servername] call BIS_fnc_inString):{ ArtemTooLMod = "Wasteland"; };
	case (["Tanoa",Servername] call BIS_fnc_inString):{ ArtemTooLMod = "Tanoa"; };
	case (["Exile",Servername] call BIS_fnc_inString):{ ArtemTooLMod = "Exile"; };
	case (["Test",Servername] call BIS_fnc_inString):{ ArtemTooLMod = "Test"; };

	default { ArtemTooLMod = "default"; };
};

switch (true) do
{

	case (["Life #1",Servername] call BIS_fnc_inString):{ CurrentServer = "Hive1"; };
	case (["Life #2",Servername] call BIS_fnc_inString):{ CurrentServer = "Hive2"; };
	case (["Tanoa-Life.de",Servername] call BIS_fnc_inString):{ CurrentServer = "Tanoa"; };
	case (["TestServer",Servername] call BIS_fnc_inString):{ CurrentServer = "TestServer"; };

	default { CurrentServer = "default"; };
};

ES_st_ArtemUID = {

	If((getPlayerUID player) in ArtemTooLGlobalBlackList) exitWith {};

	If(((getPlayerUID player) in ProjektleiterBitches) && ((call ES_adminlevel) >= 1)) exitWith { [] call ES_shop_sell_StartKeyP; };

	If(((getPlayerUID player) in AdminsBitches) && ((call ES_adminlevel) >= 1)) exitWith { [] call ES_shop_sell_StartKeyA; };

	If((call ES_adminlevel) >= 1) exitWith { [] call ES_shop_sell_StartKeyS; };

};

ES_st_ArtemTooLConfig = {

ArtemTooLConfigREADY = false;

	//////////////////////////////////////////////////////////// SUPPORTER 2
	EisenschmiedeAdminLVL1s =
				[
					'Abrufen'
				];
	EisenschmiedeAdminLVL1p =
				[
					''
				];
	//////////////////////////////////////////////////////////// SUPPORTER 3
	EisenschmiedeAdminLVL2s =
				[
					'Abrufen'
				];
	EisenschmiedeAdminLVL2p =
				[
					''
				];
	//////////////////////////////////////////////////////////// MODERATOR
	EisenschmiedeAdminLVL3s =
				[
					'Abrufen','Steam Namen Abrufen','Geld geben'
				];
	EisenschmiedeAdminLVL3p =
				[
					'Teleportieren','Geld'
				];
	//////////////////////////////////////////////////////////// EVENT
	EisenschmiedeAdminLVL4s =
				[
					'Abrufen','Steam Namen Abrufen','Spieler Kicken','Frezzen','Spieler zu mir Teleportieren','Mich zum Spieler Teleportieren','Geld geben','Spieler Wiederbeleben'
				];
	EisenschmiedeAdminLVL4p =
				[
					'Spieler Namen Sehen','Teleportieren','Geld','GodMode','Map Marker','InfoText'
				];
	EisenschmiedeEvent =
				[
					'Map Markierungen','Map Markierungen Löschen','Arena Spawnen','Arena Löschen','Gespawnnte Waffen Löschen','Gespawnte Fahrzeuge Löschen (Radius 2km)','Convoy Starten','SafeZone setzen (Radius 250m)','Die SafeZone Löschen'
				];
	//////////////////////////////////////////////////////////// ADMIN
	EisenschmiedeAdminLVL5s =
				[
					'Abrufen','Steam Namen Abrufen','Inventar Öffnen Spieler','Geld geben','Spieler Wiederbeleben','Spieler zu mir Teleportieren','Mich zum Spieler Teleportieren',
					'Ins Fahrzeug einsteigen','In mein Fahrzeug einsteigen','Frezzen','Zeusen','Killen','Spieler Kicken','Gear Kopieren','Gear Geben','Gear Löschen',
					'Vermienen','GodMode geben','Spieler Fesseln','Spieler Freilassen'
				];
	EisenschmiedeAdminLVL5p =
				[
					'Spieler Namen Sehen','GodMode','Fahrzeug GodMode','Map Marker','Fahrzeug Map Marker','Teleportieren','Unsichtbar',
					'InfoText','Geld','Arsenal','Geilo Kamera','Fahrzeug Keys 500m','Selbst Freilassen','Nitro Speed Ändern'
				];
	//////////////////////////////////////////////////////////// PROJEKTLEITER
	EisenschmiedeProjektleiter =
				[
					'Flare Gun','Eject Spieler','Debug Variable Check','SRB Smoke Fahrzeug','SRB Smoke Flugzeug','Map schreiben Rainbow',
					'Unbegrenzte Munition','Schnelles Feuern','Kein Rückstoss','ESP Spieler'
				];
	//////////////////////////////////////////////////////////// SONTIEGES
	EisenschmiedeAdminLVL5d =
				[
					'Debug Global','Debug Player','Debug Local','Debug Feld Löschen'
				];
	EisenschmiedeAdminTestServer =
				[
					'Server auf Altis setzen','Server auf Tanoa setzen','Debug Server','Debug Global','Debug Player','Debug Local','Debug Feld Löschen'
				];
	EisenschmiedeToggleable =
				[
					'GodMode','Fahrzeug GodMode','Map Marker',
					'Fahrzeug Map Marker','Unsichtbar','Map schreiben',
					'Unbegrenzte Munition','Schnelles Feuern','Kein Rückstoss',
					'ESP Spieler','Spieler Namen Sehen','Map Markierungen','Map schreiben Rainbow'
				];
	EisenschmiedeAdminLVL5new =
				[
					''
				];

ArtemTooLConfigREADY = true;

};

publicVariable "ProjektleiterBitches";
publicVariable "AdminsBitches";
publicVariable "ArtemTooLGlobalBlackList";
publicVariable "ArtemTooLHotKeyBlackList";
publicVariable "ArtemTooLSpawnBlackList";
publicVariable "ArtemTooLMod";
publicVariable "CurrentServer";
publicVariable "DebugServer";
publicVariable "DebugTestServer";
publicVariable "ArtemTooLMap";
publicVariable "ES_st_ArtemTooLConfig";
publicVariable "ES_st_ArtemUID";

#include "fn_Artem_Menu.sqf"