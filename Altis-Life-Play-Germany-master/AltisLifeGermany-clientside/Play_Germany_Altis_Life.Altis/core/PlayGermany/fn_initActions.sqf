#include <macro.h>
/*
	File : fn_initActions.sqf
	Author: RafiQuak for PlayGermany

	Description:
	Inits the actions for the NPCs

	Params = [Object,Side,Art,[ActionParams],[ActionProperties],ActionTitel]


	unit addAction [title, script, arguments, priority, showWindow, hideOnUse, shortcut, condition]
	[""Lieferung abgeben"",life_fnc_dpFinish,""dp_1"",0,false,false,"""",'!isNil ""life_dp_point"" && life_delivery_in_progress && life_dp_point == _target '];
	stopped at 3086
*/
private["_args","_side","_target","_unit"];

if (isDedicated) exitWith {};

//wait till functions module has initialised
waitUntil {!(isNil "bis_fnc_init")};
waitUntil {!(isNil "life_session_completed")};
waitUntil {life_session_completed};
waitUntil {!(isNull player)};

switch (playerSide) do {
	case civilian: {_side = "civ"};
	case east: {_side = "asf"};
	case west: {_side = "cop"};
	case independent: {_side = "med"};
	default {sleep 5; switch (playerSide) do {
			case civilian: {_side = "civ"};
			case east: {_side = "asf"};
			case west: {_side = "cop"};
			case independent: {_side = "med"};
		};
	};
};
if (isNil "_side") then {diag_log "INITACTIONS Side is nil";};

if(_this select 1 == _side || _this select 1 == "") then {
	_unit = _this select 0;
	//_args = _this select 3;
	_args = [_this,3,"",["",[]]] call BIS_fnc_param;
	switch (_this select 2) do {
		/* Civilian */
		case "gen": {_unit addAction["Gebrauchsgegenstände",life_fnc_weaponShopMenu,"genstore"];};
		case "market": {_unit addAction["Markt",life_fnc_weaponShopMenu,"market"];};
		case "market_reb": {
			_unit addAction["Markt",life_fnc_virt_menu,"rebel"];
			_unit addAction[format["%1 ($%2)",localize (getText(missionConfigFile >> "Licenses" >> "rebel" >> "displayName")), [(getNumber(missionConfigFile >> "Licenses" >> "rebel" >> "price"))] call life_fnc_numberText],life_fnc_buyLicense,"rebel",0,false,false,"",' !license_civ_rebel'];
		};
		case "house": {_unit addAction["Hauszubehör",life_fnc_weaponShopMenu,"house"];};
		case "radio": {_unit addAction["Mobicom Debiltel",life_fnc_weaponShopMenu,"radio"];};
		case "dp": {
			_unit addAction["Lieferung abgeben",life_fnc_dpFinish,"",0,false,false,"",'!isNil "life_dp_point" && life_delivery_in_progress && life_dp_point == _target '];
			_unit addAction["Lieferauftrag annehmen",life_fnc_getDPMission,"",0,false,false,"",' isNil "life_dp_point" && !life_delivery_in_progress '];
		};
		case "fish": {_unit addAction["Fisch Markt",life_fnc_virt_menu,"fishmarket"];};
		case "boat": {
			_unit addAction ["Stan's previously owned vessels",life_fnc_vehicleShopMenu,["civ_ship",civilian,_args,"civ","Billy's Boat Rentals & Ownership"]];

			_garageActionCode = compile format["[[getPlayerUID player,playerSide,""Ship"",player],""TON_fnc_getVehicles"",false,false] call life_fnc_MP;   createDialog ""Life_impound_menu"";   disableSerialization;   ctrlSetText[2802,""Suche Boote....""];   life_garage_sp = ""%1""; life_garage_type = ""Ship"";", _args];
			_unit addAction ["Bootsgarage", _garageActionCode];

			_unit addAction["Boot einlagern",life_fnc_storeVehicle,"",0,false,false,"",'!life_garage_store'];
		};
		case "gun_legal": {
			_unit addAction["Waffenladen",life_fnc_weaponShopMenu,"gun"];
			_unit addAction[format["%1 ($%2)",localize (getText(missionConfigFile >> "Licenses" >> "gun" >> "displayName")), [(getNumber(missionConfigFile >> "Licenses" >> "gun" >> "price"))] call life_fnc_numberText],life_fnc_buyLicense,"gun",0,false,false,"",' !license_civ_gun'];
			};
		case "gun_rebel": { _unit addAction["Rebellenwaffen",life_fnc_weaponShopMenu,"rebel"]; _unit addAction["Waffenzubehör",life_fnc_weaponShopMenu,"rebel_scopes"];};
		case "gun_gang": { _unit addAction["Waffenladen",life_fnc_weaponShopMenu,"gang"]; _unit addAction["Waffenzubehör",life_fnc_weaponShopMenu,"rebel_scopes"];};
		case "gun_bm": { _unit addAction["Schwarzmarktwaffen",life_fnc_weaponShopMenu,"bm"];  _unit addAction["Waffenzubehör",life_fnc_weaponShopMenu,"rebel_scopes"];};
		case "gun_outlet": {
			_unit addAction["Legale Waffen",life_fnc_weaponShopMenu,"donator_legal",0,FALSE,FALSE,"",'license_civ_donator'];
			_unit addAction["Rebellenwaffen",life_fnc_weaponShopMenu,"donator_illegal",0,FALSE,FALSE,"",'license_civ_donator'];
			_unit addAction["Schwarzmarktwaffen",life_fnc_weaponShopMenu,"donator_bm",0,FALSE,FALSE,"",'license_civ_donator'];
			_unit addAction["Waffenzubehör",life_fnc_weaponShopMenu,"donator_scopes",0,FALSE,FALSE,"",'license_civ_donator'];
		};
		/* Cop */
		case "fedcam": {
			_unit addAction["Zentralbank - Frontzufahrt",life_fnc_fedCamDisplay,"front"];
			_unit addAction["Zentralbank - Fronteingang",life_fnc_fedCamDisplay,"side"];
			_unit addAction["Zentralbank - Hintereingang",life_fnc_fedCamDisplay,"back"];
			_unit addAction["Zentralbank - Tresor",life_fnc_fedCamDisplay,"vault"];
			_unit addAction["Gefängnis - Hof",life_fnc_fedCamDisplay,"jail"];
			_unit addAction["Gefängnis - Areal",life_fnc_fedCamDisplay,"jail_hack"];
			_unit addAction["Bildschirm Ausschalten",life_fnc_fedCamDisplay,"off"];
		};
		/* Cop/ASF/Medic */
		case "equip": {
			switch (playerSide) do {
				case west: {
					_unit addAction["Polizei Markt",life_fnc_virt_menu,"cop"];
					_unit addAction["Gebrauchsgegenstände",life_fnc_weaponShopMenu,"cop_general"];
					_unit addAction["Dienstkleidung",life_fnc_clothingMenu,"cop"];
					//Weapons
					_unit addAction["Dienstwaffen",life_fnc_weaponShopMenu,""];
					// license not available:
					_unit addAction["SEK-Waffen",life_fnc_weaponShopMenu,"cop_sek"];
					_unit addAction["Kripo-Waffen",life_fnc_weaponShopMenu,"cop_kripo"];
					//Licenses
					_unit addAction[format["%1 (%2€)",localize (getText(missionConfigFile >> "Licenses" >> "cAir" >> "displayName")), [(getNumber(missionConfigFile >> "Licenses" >> "cAir" >> "price"))] call life_fnc_numberText],life_fnc_buyLicense,"cAir",0,false,false,"",' !license_cop_cAir'];
					//_unit addAction[format["%1 (%2€)",localize (getText(missionConfigFile >> "Licenses" >> "coastguard" >> "displayName")), [(getNumber(missionConfigFile >> "Licenses" >> "coastguard" >> "price"))] call life_fnc_numberText],life_fnc_buyLicense,"coastguard",0,false,false,"",' !license_cop_cg'];
				};
				case east: {
					_unit addAction["<t color='#ADFF2F'>Geldautomat</t>",life_fnc_atmMenu,"",0,FALSE,FALSE,"",' vehicle player == player && player distance _target < 4 '];
					_unit addAction["Markt",life_fnc_virt_menu,"asf"];
					_unit addAction["Gebrauchsgegenstände",life_fnc_weaponShopMenu,"asf_basic"];
					_unit addAction["Dienstkleidung",life_fnc_clothingMenu,"asf"];
					//Weapons
					_unit addAction["Dienstwaffen",life_fnc_weaponShopMenu,""];
					_unit addAction["Medizinische Hilfe",life_fnc_healHospital];
				};
				//ARGS: [spawn Car, Spawh Heli]
				case independent: {
					_unit addAction["Dienstkleidung",life_fnc_clothingMenu,"med"];
					waitUntil {!(isNil "life_hsd")};
					waitUntil {(life_hsd != "")};
					switch (life_hsd) do {
						case "med": {
							_unit addAction["Markt",life_fnc_virt_menu,"medic"];
							_unit addAction["Gebrauchsgegenstände",life_fnc_weaponShopMenu,"med_basic"];
							_unit setVariable["realname","Ausrüstung und Fahrzeuge"];
							_unit addAction[format["%1 ($%2)",localize (getText(missionConfigFile >> "Licenses" >> "mAir" >> "displayName")), [(getNumber(missionConfigFile >> "Licenses" >> "mAir" >> "price"))] call life_fnc_numberText],life_fnc_buyLicense,"mAir",0,false,false,"",' !license_med_mAir'];
							_unit addAction ["Einsatzwagen",life_fnc_vehicleShopMenu,[format["%1_shop",life_hsd],independent,(_args select 0),life_hsd,format["%1 Einsatzwagen",toUpper life_hsd]]];
							_unit addAction ["Helikopter",life_fnc_vehicleShopMenu,[format["%1_air_hs",life_hsd],independent,(_args select 1),life_hsd,format["%1 Helikopter",toUpper life_hsd]]];
							_garageActionCode = compile format["[[getPlayerUID player,playerSide,""Car"",player],""TON_fnc_getVehicles"",false,false] call life_fnc_MP;   createDialog ""Life_impound_menu"";   disableSerialization;   ctrlSetText[2802,""Suche Fahrzeuge....""];   life_garage_sp = ""%1""; life_garage_type = ""Car"";", (_args select 0)];
							_unit addAction ["Fahrzeug Garage", _garageActionCode];
							_garageActionCode = compile format["[[getPlayerUID player,playerSide,""Air"",player],""TON_fnc_getVehicles"",false,false] call life_fnc_MP;   createDialog ""Life_impound_menu"";   disableSerialization;   ctrlSetText[2802,""Suche Fahrzeuge....""];   life_garage_sp = ""%1""; life_garage_type = ""Air"";", (_args select 1)];
							_unit addAction ["Helikopter Garage", _garageActionCode];
							_unit addAction["Fahrzeug einparken",life_fnc_storeVehicle,"",0,false,false,"",'!life_garage_store'];
						};
						case "alac": {
							_unit addAction["Markt",life_fnc_virt_menu,"medic"];
							_unit addAction["Gebrauchsgegenstände",life_fnc_weaponShopMenu,"med_basic"];
							_unit setVariable["realname","Ausrüstung und Fahrzeuge"];
							_unit addAction[format["%1 ($%2)",localize (getText(missionConfigFile >> "Licenses" >> "mAir" >> "displayName")), [(getNumber(missionConfigFile >> "Licenses" >> "mAir" >> "price"))] call life_fnc_numberText],life_fnc_buyLicense,"mAir",0,false,false,"",' !license_med_mAir'];
							_unit addAction ["Einsatzwagen",life_fnc_vehicleShopMenu,[format["%1_shop",life_hsd],independent,(_args select 0),life_hsd,format["%1 Einsatzwagen",toUpper life_hsd]]];
							_unit addAction ["Helikopter",life_fnc_vehicleShopMenu,[format["%1_air_hs",life_hsd],independent,(_args select 1),life_hsd,format["%1 Helikopter",toUpper life_hsd]]];
							_garageActionCode = compile format["[[getPlayerUID player,playerSide,""Car"",player],""TON_fnc_getVehicles"",false,false] call life_fnc_MP;   createDialog ""Life_impound_menu"";   disableSerialization;   ctrlSetText[2802,""Suche Fahrzeuge....""];   life_garage_sp = ""%1""; life_garage_type = ""Car"";", (_args select 0)];
							_unit addAction ["Fahrzeug Garage", _garageActionCode];
							_garageActionCode = compile format["[[getPlayerUID player,playerSide,""Air"",player],""TON_fnc_getVehicles"",false,false] call life_fnc_MP;   createDialog ""Life_impound_menu"";   disableSerialization;   ctrlSetText[2802,""Suche Fahrzeuge....""];   life_garage_sp = ""%1""; life_garage_type = ""Air"";", (_args select 1)];
							_unit addAction ["Helikopter Garage", _garageActionCode];
							_unit addAction["Fahrzeug einparken",life_fnc_storeVehicle,"",0,false,false,"",'!life_garage_store'];
						};
						case "thw": {
							_unit addAction["Markt",life_fnc_virt_menu,"medic"];
							_unit addAction["Gebrauchsgegenstände",life_fnc_weaponShopMenu,"med_basic"];
							_unit setVariable["realname","Ausrüstung und Fahrzeuge"];
							_unit addAction[format["%1 ($%2)",localize (getText(missionConfigFile >> "Licenses" >> "mAir" >> "displayName")), [(getNumber(missionConfigFile >> "Licenses" >> "mAir" >> "price"))] call life_fnc_numberText],life_fnc_buyLicense,"mAir",0,false,false,"",' !license_med_mAir'];
							_unit addAction ["Einsatzwagen",life_fnc_vehicleShopMenu,[format["%1_shop",life_hsd],independent,(_args select 0),life_hsd,format["%1 Einsatzwagen",toUpper life_hsd]]];
							_unit addAction ["Helikopter",life_fnc_vehicleShopMenu,[format["%1_air_hs",life_hsd],independent,(_args select 1),life_hsd,format["%1 Helikopter",toUpper life_hsd]]];
							_garageActionCode = compile format["[[getPlayerUID player,playerSide,""Car"",player],""TON_fnc_getVehicles"",false,false] call life_fnc_MP;   createDialog ""Life_impound_menu"";   disableSerialization;   ctrlSetText[2802,""Suche Fahrzeuge....""];   life_garage_sp = ""%1""; life_garage_type = ""Car"";", (_args select 0)];
							_unit addAction ["Fahrzeug Garage", _garageActionCode];
							_garageActionCode = compile format["[[getPlayerUID player,playerSide,""Air"",player],""TON_fnc_getVehicles"",false,false] call life_fnc_MP;   createDialog ""Life_impound_menu"";   disableSerialization;   ctrlSetText[2802,""Suche Fahrzeuge....""];   life_garage_sp = ""%1""; life_garage_type = ""Air"";", (_args select 1)];
							_unit addAction ["Helikopter Garage", _garageActionCode];
							_unit addAction["Fahrzeug einparken",life_fnc_storeVehicle,"",0,false,false,"",'!life_garage_store'];
						};
						case "event": {
							_unit addAction["Markt",life_fnc_virt_menu,"asf"];
							_unit addAction["Gebrauchsgegenstände",life_fnc_weaponShopMenu,"event_basic"];
							_unit addAction["Waffen",life_fnc_weaponShopMenu,"event_weapon"]; 
							_unit setVariable["realname","Ausrüstung und Fahrzeuge"];
							_unit addAction ["Autos",life_fnc_vehicleShopMenu,[format["%1_shop",life_hsd],independent,(_args select 0),life_hsd,format["%1 Einsatzwagen",toUpper life_hsd]]];
							_unit addAction ["Helikopter",life_fnc_vehicleShopMenu,[format["%1_air_hs",life_hsd],independent,(_args select 1),life_hsd,format["%1 Helikopter",toUpper life_hsd]]];
							_garageActionCode = compile format["[[getPlayerUID player,playerSide,""Car"",player],""TON_fnc_getVehicles"",false,false] call life_fnc_MP;   createDialog ""Life_impound_menu"";   disableSerialization;   ctrlSetText[2802,""Suche Fahrzeuge....""];   life_garage_sp = ""%1""; life_garage_type = ""Car"";", (_args select 0)];
							_unit addAction ["Fahrzeug Garage", _garageActionCode];
							_garageActionCode = compile format["[[getPlayerUID player,playerSide,""Air"",player],""TON_fnc_getVehicles"",false,false] call life_fnc_MP;   createDialog ""Life_impound_menu"";   disableSerialization;   ctrlSetText[2802,""Suche Fahrzeuge....""];   life_garage_sp = ""%1""; life_garage_type = ""Air"";", (_args select 1)];
							_unit addAction ["Helikopter Garage", _garageActionCode];
							_unit addAction["Fahrzeug einparken",life_fnc_storeVehicle,"",0,false,false,"",'!life_garage_store'];
						};
					};
				};
				default {diag_log "INITACTIONS can't get playerSide";};
			};
		};
		case "garage": {
			switch (playerSide) do {
				case west: {
					_unit addAction["Asservartenkammer",life_fnc_virt_menu,"evidence",0,false,false,"",'playerSide == west'];
					_unit addAction["Schrotthändler",life_fnc_chopShopMenu,_args];
					_unit addAction["Kripo Fahrzeuge",life_fnc_vehicleShopMenu,["kripo_car",west,_args,"cop","APD - Kavala District"],0,false,false,"""",'license_cop_kripo && playerSide == west'];

					_unit addAction ["<t color='#0084ff'>Einsatzfahrzeuge",life_fnc_vehicleShopMenu,["cop_car",west,_args,"cop","APD - Kavala District"]];

					_garageActionCode = compile format["[[getPlayerUID player,playerSide,""Car"",player],""TON_fnc_getVehicles"",false,false] call life_fnc_MP;   createDialog ""Life_impound_menu"";   disableSerialization;   ctrlSetText[2802,""Suche Fahrzeuge....""];   life_garage_sp = ""%1""; life_garage_type = ""Car"";", _args];
					_unit addAction ["Fahrzeug Garage", _garageActionCode];

					_unit addAction["Fahrzeug einparken",life_fnc_storeVehicle,"",0,false,false,"",'!life_garage_store'];
					_unit setVariable["realname","Einsatzfahrzeuge"];
				};
				case east: {
					_unit setVariable["realname","ASF Dienstfahrzeuge"];
					_unit addAction["ASF Heli Shop",life_fnc_vehicleShopMenu,["ASF_air_hs",east,_args,"asf","Heli Shop"]];
					_unit addAction["ASF Dienstfahrzeuge",life_fnc_vehicleShopMenu,["ASF_shop",east,_args,"asf","ASF Dienstfahrzeuge"]];
					_garageActionCode = compile format["[[getPlayerUID player,playerSide,""Car"",player],""TON_fnc_getVehicles"",false,false] call life_fnc_MP;   createDialog ""Life_impound_menu"";   disableSerialization;   ctrlSetText[2802,""Suche Fahrzeuge....""];   life_garage_sp = ""%1""; life_garage_type = ""Car"";", _args];
					_unit addAction ["Fahrzeuggarage", _garageActionCode];
					_garageActionCode = compile format["[[getPlayerUID player,playerSide,""Air"",player],""TON_fnc_getVehicles"",false,false] call life_fnc_MP;   createDialog ""Life_impound_menu"";   disableSerialization;   ctrlSetText[2802,""Suche Fahrzeuge....""];   life_garage_sp = ""%1""; life_garage_type = ""Air"";", _args];
					_unit addAction ["Helikoptergarage", _garageActionCode];
					_unit addAction["Fahrzeug Einparken",life_fnc_storeVehicle,"",0,false,false,"",'!life_garage_store'];
				};
				case civilian: {
					_garageActionCode = compile format["[[getPlayerUID player,playerSide,""Car"",player],""TON_fnc_getVehicles"",false,false] call life_fnc_MP; life_garage_type = ""Car"";   createDialog ""Life_impound_menu"";   disableSerialization;   ctrlSetText[2802,""Suche Fahrzeuge....""]; life_garage_sp = ""%1"";", _args];
					_unit addAction ["Fahrzeug Garage", _garageActionCode];
					_unit addAction["Fahrzeug einparken",life_fnc_storeVehicle,"",0,false,false,"",'!life_garage_store'];
				};
				default {diag_log "INITACTIONS can't get playerSide";};
			};
		};
		case "garage_air": {
			switch (playerSide) do {
				case west: {
					_unit addAction["Asservartenkammer",life_fnc_virt_menu,"evidence",0,false,false,"",'playerSide == west'];
					_unit addAction ["<t color='#0084ff'>Einsatzhelikopter",life_fnc_vehicleShopMenu,["cop_air",west,_args,"cop","APD - Kavala District"]];
					_unit addAction["Kripo Helikopter",life_fnc_vehicleShopMenu,["kripo_air",west,_args,"cop","APD - Kavala District"],0,false,false,"""",'license_cop_kripo && playerSide == west'];

					_garageActionCode = compile format["[[getPlayerUID player,playerSide,""Air"",player],""TON_fnc_getVehicles"",false,false] call life_fnc_MP;   createDialog ""Life_impound_menu"";   disableSerialization;   ctrlSetText[2802,""Suche Fahrzeuge....""];   life_garage_sp = ""%1""; life_garage_type = ""Air"";", _args];
					_unit addAction ["Helikopter Garage", _garageActionCode];

					_unit addAction["Fahrzeug einparken",life_fnc_storeVehicle,"",0,false,false,"",'!life_garage_store'];
					_unit setVariable["realname","Einsatzhelikopter"];
				};
				case civilian: {
					_garageActionCode = compile format["[[getPlayerUID player,playerSide,""Air"",player],""TON_fnc_getVehicles"",false,false] call life_fnc_MP; life_garage_type = ""Air"";   createDialog ""Life_impound_menu"";   disableSerialization;   ctrlSetText[2802,""Suche Fahrzeuge....""]; life_garage_sp = ""%1"";", _args];
					_unit addAction ["Helikopter Garage", _garageActionCode];
					_unit addAction["Fahrzeug einparken",life_fnc_storeVehicle,"",0,false,false,"",'!life_garage_store'];
				};
				default {diag_log "INITACTIONS can't get playerSide";};
			};
		};
		case "helipad": {
			_garageActionCode = compile format["[[getPlayerUID player,playerSide,""Car"",player],""TON_fnc_getVehicles"",false,false] call life_fnc_MP; life_garage_type = ""Car"";   createDialog ""Life_impound_menu"";   disableSerialization;   ctrlSetText[2802,""Suche Fahrzeuge....""]; life_garage_sp = ""%1"";", _args];
			_unit addAction ["Fahrzeug Garage", _garageActionCode];

			_garageActionCode = compile format["[[getPlayerUID player,playerSide,""Air"",player],""TON_fnc_getVehicles"",false,false] call life_fnc_MP; life_garage_type = ""Air"";   createDialog ""Life_impound_menu"";   disableSerialization;   ctrlSetText[2802,""Suche Fahrzeuge....""]; life_garage_sp = ""%1"";", _args];
			_unit addAction ["Helikopter Garage", _garageActionCode];

			_unit addAction["Fahrzeug einparken",life_fnc_storeVehicle,"",0,false,false,"",'!life_garage_store'];
		};
		case "helipad_cop": {
			_unit addAction["Asservatenkammer",life_fnc_virt_menu,"evidence"];
			_unit addAction ["<t color='#0084ff'>Einsatzfahrzeuge",life_fnc_vehicleShopMenu,["cop_car",west,_args,"cop","APD - Kavala District"]];

			_garageActionCode = compile format["[[getPlayerUID player,playerSide,""Car"",player],""TON_fnc_getVehicles"",false,false] call life_fnc_MP;   createDialog ""Life_impound_menu"";   disableSerialization;   ctrlSetText[2802,""Suche Fahrzeuge....""];   life_garage_sp = ""%1""; life_garage_type = ""Car"";", _args];
			_unit addAction ["Fahrzeug Garage", _garageActionCode];

			_unit addAction ["<t color='#0084ff'>Einsatzhelikopter",life_fnc_vehicleShopMenu,["cop_air",west,_args,"cop","APD - Kavala District"]];

			_garageActionCode = compile format["[[getPlayerUID player,playerSide,""Air"",player],""TON_fnc_getVehicles"",false,false] call life_fnc_MP;   createDialog ""Life_impound_menu"";   disableSerialization;   ctrlSetText[2802,""Suche Fahrzeuge....""];   life_garage_sp = ""%1""; life_garage_type = ""Air"";", _args];
			_unit addAction ["Helikopter Garage", _garageActionCode];

			_unit addAction["Fahrzeug einparken",life_fnc_storeVehicle,"",0,false,false,"",'!life_garage_store'];
			_unit setVariable["realname","Einsatzfahrzeuge"];
		};
		case "process_oil": {
			if (playerSide == civilian) then {
				_unit addAction ["Öl reinigen", {[[["oil_unprocessed", 1]], "process_oil", [["oil_processed", 1]]] spawn life_fnc_dynprocess;}];
			};
		};
		case "process_salt": {
			if (playerSide == civilian) then {
				_unit addAction ["Salz raffinieren", {[[["salt", 1]], "process_salt", [["salt_refined", 1]]] spawn life_fnc_dynprocess;}];
			};
		};
		case "process_stones": {
			if (playerSide == civilian) then {
				_unit addAction ["Zement herstellen", {[[["rock", 1]], "process_cement", [["cement", 1]]] spawn life_fnc_dynprocess;}];
			};
		};
		case "process_sand": {
			if (playerSide == civilian) then {
				_unit addAction ["Glas herstellen", {[[["sand", 1]], "process_sand", [["glass", 1]]] spawn life_fnc_dynprocess;}];
			};
		};
		case "process_heroin": {
			if (playerSide == civilian) then {
				_unit addAction ["Heroin herstellen", {[[["heroin_unprocessed", 1]], "process_heroin", [["heroin_processed", 1]]] spawn life_fnc_dynprocess;}];
			};
		};
		case "process_heroin_hideout": {
			if (playerSide == civilian) then {
				_unit addAction ["Heroin herstellen", {[[["heroin_unprocessed", 1]], "process_heroin", [["heroin_processed", 1]]] spawn life_fnc_dynprocess;},"",0,false,false,"",'_b = (nearestObjects[getPosATL player,["Land_u_Barracks_V2_F","Land_i_Barracks_V2_F"],25]) select 0; !life_is_processing && !isNil {_b getVariable "gangOwner"} && {(_b getVariable "gangOwner") == (group player)}']; _unit setVariable["realname","Heroinverarbeitung"];
			};
		};
		case "process_marijuana": {
			if (playerSide == civilian) then {
				_unit addAction ["Marihuana herstellen", {[[["cannabis", 1]], "process_marijuana", [["marijuana", 1]]] spawn life_fnc_dynprocess;}];
			};
		};
		case "process_marijuana_hideout": {
			if (playerSide == civilian) then {
				_unit addAction ["Marihuana herstellen", {[[["cannabis", 1]], "process_marijuana", [["marijuana", 1]]] spawn life_fnc_dynprocess;},"",0,false,false,"",'_b = (nearestObjects[getPosATL player,["Land_u_Barracks_V2_F","Land_i_Barracks_V2_F"],25]) select 0; !life_is_processing && !isNil {_b getVariable "gangOwner"} && {(_b getVariable "gangOwner") == (group player)}']; _unit setVariable["realname","Marijuanaverarbeitung"];
			};
		};
		case "process_medmarijuana": {
			if (playerSide == civilian) then {
				_unit addAction ["Med. Marihuana herstellen", {[[["cannabis", 1]], "process_medmarijuana", [["marijuana", 1]]] spawn life_fnc_dynprocess;}];
			};
		};
		case "process_cocaine": {
			if (playerSide == civilian) then {
				_unit addAction ["Kokain herstellen", {[[["cocaine_unprocessed", 1]], "process_cocaine", [["cocaine_processed", 1]]] spawn life_fnc_dynprocess;}];
			};
		};
		case "process_cocaine_hideout": {
			if (playerSide == civilian) then {
				_unit addAction ["Kokain herstellen", {[[["cocaine_unprocessed", 1]], "process_cocaine", [["cocaine_processed", 1]]] spawn life_fnc_dynprocess;},"",0,false,false,"",'_b = (nearestObjects[getPosATL player,["Land_u_Barracks_V2_F","Land_i_Barracks_V2_F"],25]) select 0; !life_is_processing && !isNil {_b getVariable "gangOwner"} && {(_b getVariable "gangOwner") == (group player)}']; _unit setVariable["realname","Kokainverarbeitung"];
			};
		};
		case "process_metals": {
			if (playerSide == civilian) then {
				_unit addAction ["Kupfer herstellen", {[[["copper_ore", 1]], "process_copper", [["copper_ingot", 1]]] spawn life_fnc_dynprocess;}];
				_unit addAction ["Eisen herstellen", {[[["iron_ore", 1]], "process_iron", [["iron_ingot", 1]]] spawn life_fnc_dynprocess;}];

				_unit addAction ["Zinn herstellen", {[[["tin_ore", 1]], "process_tin", [["tin_ingot", 1]]] spawn life_fnc_dynprocess;}];
				_unit addAction ["Aluminium herstellen", {[[["aluminium_ore", 1]], "process_aluminium", [["aluminium_ingot", 1]]] spawn life_fnc_dynprocess;}];
				_unit addAction ["Blei herstellen", {[[["lead_ore", 1]], "process_lead", [["lead_ingot", 1]]] spawn life_fnc_dynprocess;}];
				_unit addAction ["Silber herstellen", {[[["silver_ore", 1]], "process_silver", [["silver_ingot", 1]]] spawn life_fnc_dynprocess;}];
				_unit addAction ["Platin herstellen", {[[["platinum_ore", 1]], "process_platinum", [["platinum_ingot", 1]]] spawn life_fnc_dynprocess;}];
				_unit addAction ["Titanium herstellen", {[[["titanium_ore", 1]], "process_titanium", [["titanium_ingot", 1]]] spawn life_fnc_dynprocess;}];
				_unit addAction ["Molybdän herstellen", {[[["molybdenum_ore", 1]], "process_molybdenum", [["molybdenum_ingot", 1]]] spawn life_fnc_dynprocess;}];
				_unit addAction ["Zink herstellen", {[[["zinc_ore", 1]], "process_zinc", [["zinc_ingot", 1]]] spawn life_fnc_dynprocess;}];
				_unit addAction ["Iridium herstellen", {[[["iridium_ore", 1]], "process_iridium", [["iridium", 1]]] spawn life_fnc_dynprocess;}];
			};
		};
		case "process_chem": {
			if (playerSide == civilian) then {
				_unit addAction ["Quecksilber herstellen", {[[["mercury_ore", 1]], "process_mercury", [["mercury", 1]]] spawn life_fnc_dynprocess;}];
				_unit addAction ["Salpeter verarbeiten", {[[["saltpetre", 1]], "process_salpetre", [["saltpetre_acid", 1]]] spawn life_fnc_dynprocess;}];
				_unit addAction ["Schwefel verarbeiten", {[[["sulfur", 1]], "process_sulfur", [["sulfur_acid", 1]]] spawn life_fnc_dynprocess;}];
				_unit addAction ["Neodym herstellen", {[[["didymium", 1]], "process_neodymium", [["neodymium", 1]]] spawn life_fnc_dynprocess;}];
				_unit addAction ["Schwarzpulver herstellen", {[[["coal", 1],["sulfur", 1],["saltpetre", 1]], "process_blackpowder", [["blackpowder", 1]]] spawn life_fnc_dynprocess;}];
			};
		};
		case "process_gems": {
			if (playerSide == civilian) then {
				_unit addAction ["Topaz schleifen", {[[["topaz_uncut", 1]], "process_topaz", [["topaz_cut", 1]]] spawn life_fnc_dynprocess;}];
				_unit addAction ["Rubin schleifen", {[[["ruby_uncut", 1]], "process_ruby", [["ruby_cut", 1]]] spawn life_fnc_dynprocess;}];
				_unit addAction ["Saphir schleifen", {[[["sapphire_uncut", 1]], "process_sapphire", [["sapphire_cut", 1]]] spawn life_fnc_dynprocess;}];
				_unit addAction ["Diamant schleifen", {[[["diamond_uncut", 1]], "process_diamond", [["diamond_cut", 1]]] spawn life_fnc_dynprocess;}];
				_unit addAction ["Emerald schleifen", {[[["emerald_uncut", 1]], "process_emerald", [["emerald_cut", 1]]] spawn life_fnc_dynprocess;}];
				_unit addAction ["Quartz schleifen", {[[["quartz_uncut", 1]], "process_quartz", [["quartz_cut", 1]]] spawn life_fnc_dynprocess;}];
				_unit addAction ["Granat schleifen", {[[["garnet_uncut", 1]], "process_garnet", [["garnet_cut", 1]]] spawn life_fnc_dynprocess;}];
			};
		};
		case "process_alloy": {
			if (playerSide == civilian) then {
				// Multijobs (2 resources)
				_unit addAction ["Titangold erzeugen", {[[["titanium_ingot", 1], ["goldnugget", 3]], "process_titaniumgold", [["titaniumgold", 1]]] spawn life_fnc_dynprocess;}];
				_unit addAction ["Bronze erzeugen", {[[["copper_ingot", 1], ["tin_ingot", 1]], "process_bronze", [["bronze", 1]]] spawn life_fnc_dynprocess;}];
				_unit addAction ["Aluminiumbronze erzeugen", {[[["copper_ingot", 1], ["aluminium_ingot", 1]], "process_aluminiumbronze", [["aluminiumbronze", 1]]] spawn life_fnc_dynprocess;}];
				_unit addAction ["Messing erzeugen", {[[["copper_ingot", 1], ["zinc_ingot", 1]], "process_brass", [["brass", 1]]] spawn life_fnc_dynprocess;}];
				_unit addAction ["Goldamalgam erzeugen", {[[["mercury", 1], ["goldnugget", 3]], "process_goldamalgam", [["goldamalgam", 1]]] spawn life_fnc_dynprocess;}];
				_unit addAction ["Schmuckverzierung erzeugen", {[[["iridium", 1], ["goldnugget", 3]], "process_ornament", [["ornament", 1]]] spawn life_fnc_dynprocess;}];
				_unit addAction ["Magnet erzeugen", {[[["neodymium", 1], ["iron_ingot", 1]], "process_magnet", [["magnet", 1]]] spawn life_fnc_dynprocess;}];

				// Multijobs (3 resources)
				_unit addAction ["Bleibronze erzeugen", {[[["copper_ingot", 1], ["tin_ingot", 1], ["lead_ingot", 1]], "process_leadbronze", [["leadbronze", 1]]] spawn life_fnc_dynprocess;}];
				_unit addAction ["Weißgold erzeugen", {[[["goldbar", 1], ["silver_ingot", 1], ["platinum_ingot", 1]], "process_whitegold", [["whitegold", 1]]] spawn life_fnc_dynprocess;}];
				_unit addAction ["Rotguss erzeugen", {[[["copper_ingot", 1], ["tin_ingot", 1], ["zinc_ingot", 1]], "process_redbrass", [["redbrass", 1]]] spawn life_fnc_dynprocess;}];
			};
		};



		case "processing": {
			if (playerSide == civilian) then {
			//_unit addAction [ "Process XXX", { [[["YOURITEMNAMEHERE",AMOUNTNEEDED]],"license_civ_LICENSENAME",[["YOURPRODUCTNAMEHERE",AMOUNTGIVEN]]] spawn life_fnc_dynprocess; } ];
				// Metals
				_unit addAction ["Kupfer herstellen", {[[["copper_ore", 1]], "process_copper", [["copper_ingot", 1]]] spawn life_fnc_dynprocess;}];
				_unit addAction ["Eisen herstellen", {[[["iron_ore", 1]], "process_iron", [["iron_ingot", 1]]] spawn life_fnc_dynprocess;}];

				// Drugs
				_unit addAction ["Heroin herstellen", {[[["heroin_unprocessed", 1]], "process_heroin", [["heroin_processed", 1]]] spawn life_fnc_dynprocess;}];
				_unit addAction ["Marihuana herstellen", {[[["cannabis", 1]], "process_marijuana", [["marijuana", 1]]] spawn life_fnc_dynprocess;}];
				_unit addAction ["Med. Marihuana herstellen", {[[["cannabis", 1]], "process_medmarijuana", [["marijuana", 1]]] spawn life_fnc_dynprocess;}];
				_unit addAction ["Kokain herstellen", {[[["cocaine_unprocessed", 1]], "process_cocaine", [["cocaine_processed", 1]]] spawn life_fnc_dynprocess;}];

				// Sonstiges
				_unit addAction ["Öl reinigen", {[[["oil_unprocessed", 1]], "process_oil", [["oil_processed", 1]]] spawn life_fnc_dynprocess;}];
				_unit addAction ["Salz raffinieren", {[[["salt", 1]], "process_salt", [["salt_refined", 1]]] spawn life_fnc_dynprocess;}];
				_unit addAction ["Glas herstellen", {[[["sand", 1]], "process_sand", [["glass", 1]]] spawn life_fnc_dynprocess;}];
				_unit addAction ["Zement herstellen", {[[["rock", 1]], "process_cement", [["cement", 1]]] spawn life_fnc_dynprocess;}];

				_unit addAction ["Zinn herstellen", {[[["tin_ore", 1]], "process_tin", [["tin_ingot", 1]]] spawn life_fnc_dynprocess;}];
				_unit addAction ["Aluminium herstellen", {[[["aluminium_ore", 1]], "process_aluminium", [["aluminium_ingot", 1]]] spawn life_fnc_dynprocess;}];
				_unit addAction ["Blei herstellen", {[[["lead_ore", 1]], "process_lead", [["lead_ingot", 1]]] spawn life_fnc_dynprocess;}];
				_unit addAction ["Silber herstellen", {[[["silver_ore", 1]], "process_silver", [["silver_ingot", 1]]] spawn life_fnc_dynprocess;}];
				_unit addAction ["Platinium herstellen", {[[["platinium_ore", 1]], "process_platinum", [["platinium_ingot", 1]]] spawn life_fnc_dynprocess;}];
				_unit addAction ["Titanium herstellen", {[[["titanium_ore", 1]], "process_titanium", [["titanium_ingot", 1]]] spawn life_fnc_dynprocess;}];
				_unit addAction ["Molybdän herstellen", {[[["molybdenum_ore", 1]], "process_molybdenum", [["molybdenum_ingot", 1]]] spawn life_fnc_dynprocess;}];
				_unit addAction ["Zink herstellen", {[[["zinc_ore", 1]], "process_zinc", [["zinc_ingot", 1]]] spawn life_fnc_dynprocess;}];
				_unit addAction ["Quecksilber herstellen", {[[["mercury_ore", 1]], "process_mercury", [["mercury", 1]]] spawn life_fnc_dynprocess;}];
				_unit addAction ["Iridium herstellen", {[[["iridium_ore", 1]], "process_iridium", [["iridium", 1]]] spawn life_fnc_dynprocess;}];

				// Edelsteine
				_unit addAction ["Topaz schleifen", {[[["topaz_uncut", 1]], "process_topaz", [["topaz_cut", 1]]] spawn life_fnc_dynprocess;}];
				_unit addAction ["Rubin schleifen", {[[["ruby_uncut", 1]], "process_ruby", [["ruby_cut", 1]]] spawn life_fnc_dynprocess;}];
				_unit addAction ["Saphir schleifen", {[[["sapphire_uncut", 1]], "process_sapphire", [["sapphire_cut", 1]]] spawn life_fnc_dynprocess;}];
				_unit addAction ["Diamant schleifen", {[[["diamond_uncut", 1]], "process_diamond", [["diamond_cut", 1]]] spawn life_fnc_dynprocess;}];
				_unit addAction ["Emerald schleifen", {[[["emerald_uncut", 1]], "process_emerald", [["emerald_cut", 1]]] spawn life_fnc_dynprocess;}];
				_unit addAction ["Quartz schleifen", {[[["quartz_uncut", 1]], "process_quartz", [["quartz_cut", 1]]] spawn life_fnc_dynprocess;}];
				_unit addAction ["Granat schleifen", {[[["garnet_uncut", 1]], "process_garnet", [["garnet_cut", 1]]] spawn life_fnc_dynprocess;}];

				// Sonstiges
				_unit addAction ["Neodym herstellen", {[[["didymium", 1]], "process_neodymium", [["neodymium", 1]]] spawn life_fnc_dynprocess;}];

				// Uranium
				_unit addAction ["Uran reinigen", {[[["uranium_ore", 1]], "process_uranium_cleaned", [["uranium_cleaned", 1]]] spawn life_fnc_dynprocess;}];
				_unit addAction ["Uran verarbeiten", {[[["uranium_cleaned", 1]], "process_uranium_processed", [["uranium_processed", 1]]] spawn life_fnc_dynprocess;}];
				_unit addAction ["Uran anreichern", {[[["uranium_processed", 1]], "process_uranium_enriched", [["uranium_enriched", 1]]] spawn life_fnc_dynprocess;}];
				_unit addAction ["Brennstäbe herstellen", {[[["uranium_enriched", 1]], "process_uranium_fuelrod", [["uranium_fuelrod", 1]]] spawn life_fnc_dynprocess;}];
				_unit addAction ["Uran strecken", {[[["uranium_cleaned", 1]], "process_uranium_dirty", [["uranium_dirty", 1]]] spawn life_fnc_dynprocess;}];

				// Multijobs (2 resources)
				_unit addAction ["Titangold erzeugen", {[[["titanium_ore", 1], ["goldbar", 1]], "process_titaniumgold", [["titaniumgold", 1]]] spawn life_fnc_dynprocess;}];
				_unit addAction ["Bronze erzeugen", {[[["copper_ore", 1], ["tin_ore", 1]], "process_bronze", [["bronze", 1]]] spawn life_fnc_dynprocess;}];
				_unit addAction ["Aluminiumbronze erzeugen", {[[["copper_ore", 1], ["aluminium_ore", 1]], "process_aluminiumbronze", [["aluminiumbronze", 1]]] spawn life_fnc_dynprocess;}];
				_unit addAction ["Messing erzeugen", {[[["copper_ore", 1], ["zinc_ore", 1]], "process_brass", [["brass", 1]]] spawn life_fnc_dynprocess;}];
				_unit addAction ["Goldamalgam erzeugen", {[[["mercury_ore", 1], ["goldbar", 1]], "process_goldamalgam", [["goldamalgam", 1]]] spawn life_fnc_dynprocess;}];
				_unit addAction ["Schmuckverzierung erzeugen", {[[["iridium_ore", 1], ["goldbar", 1]], "process_ornament", [["ornament", 1]]] spawn life_fnc_dynprocess;}];
				_unit addAction ["Magnet erzeugen", {[[["neodymium", 1], ["iron_ore", 1]], "process_magnet", [["magnet", 1]]] spawn life_fnc_dynprocess;}];

				// Multijobs (3 resources)
				_unit addAction ["Bleibronze erzeugen", {[[["copper_ore", 1], ["tin_ore", 1], ["lead_ore", 1]], "process_leadbronze", [["leadbronze", 1]]] spawn life_fnc_dynprocess;}];
				_unit addAction ["Weißgold erzeugen", {[[["goldbar", 1], ["silver_ore", 1], ["platinium_ore", 1]], "process_whitegold", [["whitegold", 1]]] spawn life_fnc_dynprocess;}];
				_unit addAction ["Rotguss erzeugen", {[[["copper_ore", 1], ["tin_ore", 1], ["zinc_ore", 1]], "process_redbrass", [["redbrass", 1]]] spawn life_fnc_dynprocess;}];
			};
		};
		
		case "grill": {
			if (playerSide == civilian) then {
				_unit addAction ["Hasen grillen", {[[["rabbit_raw", 1]], "", [["rabbit_grilled", 1]]] spawn life_fnc_dynprocess;}];
				_unit addAction ["Huhn grillen", {[[["hen_raw", 1]], "", [["hen_fried", 1]]] spawn life_fnc_dynprocess;}];
				_unit addAction ["Hahn grillen", {[[["rooster_raw", 1]], "", [["rooster_grilled", 1]]] spawn life_fnc_dynprocess;}];
				_unit addAction ["Schaaf grillen", {[[["sheep_raw", 1]], "", [["sheep_grilled", 1]]] spawn life_fnc_dynprocess;}];
				_unit addAction ["Ziege grillen", {[[["goat_raw", 1]], "", [["goat_grilled", 1]]] spawn life_fnc_dynprocess;}];
				_unit addAction ["Goldstrieme grillen", {[[["salema_raw", 1]], "", [["salema_grilled", 1]]] spawn life_fnc_dynprocess;}];
				_unit addAction ["Falterfisch grillen", {[[["ornate_raw", 1]], "", [["ornate_grilled", 1]]] spawn life_fnc_dynprocess;}];
				_unit addAction ["Makrele grillen", {[[["mackerel_raw", 1]], "", [["mackerel_grilled", 1]]] spawn life_fnc_dynprocess;}];
				_unit addAction ["Tunfisch grillen", {[[["tuna_raw", 1]], "", [["tuna_grilled", 1]]] spawn life_fnc_dynprocess;}];
				_unit addAction ["Meeräsche grillen", {[[["mullet_raw", 1]], "", [["mullet_fried", 1]]] spawn life_fnc_dynprocess;}];
				_unit addAction ["Katzenhai grillen", {[[["catshark_raw", 1]], "", [["catshark_fried", 1]]] spawn life_fnc_dynprocess;}];
			};
		};
		default {
			diag_log format["INITACTIONS: Script = %1", _this select 1];
			(_this select 0) addAction [_this select 5,_this select 2,_args,0,false,false,"",_this select 4];
		};
	};
};