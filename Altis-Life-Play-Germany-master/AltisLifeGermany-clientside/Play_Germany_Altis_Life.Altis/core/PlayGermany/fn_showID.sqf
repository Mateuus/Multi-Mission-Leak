#include <macro.h>
/*
	File : fn_showID.sqf
	Author: RafiQuak for PlayGermany
	Based on too much other stuff to list that here

	Description:
	Sends the player info and an image to create an "ID"
*/
private["_target", "_message","_level","_rang"];
_target = cursorTarget;

//Anti spam
if (life_idTarget == _target && life_idTime > time + 5) exitWith {};
life_idTarget = _target;
life_idTime = time;

//Fuck errors
if( isNull _target) exitWith {hint "Es ist niemand in der Nähe."};
if( !(_target isKindOf "Man")) exitWith {hint "Es ist niemand in der Nähe."};
if( !(alive _target)) exitWith {hint "Es ist niemand in der Nähe."};

//Civ police "fake" ID
if([_this,0,false,[false]] call BIS_fnc_param) exitWith {
	_message = format["<img size='10' color='#FFFFFF' image='textures\civ\marke.paa'/><br/><br/><t size='2.5'>%1</t><br/><br/><t color='#f6f9fc' size='1.6'>Zivilausweis der Insel Altis</t>", name player];
	[[_message,player,true],"PG_fnc_IDshown",_target,false] spawn life_fnc_MP;
	hint "Du hast deinen zivilen Ausweis gezeigt.";
};

switch (playerSide) do {
	case civilian: {
		_message = format["<img size='10' color='#FFFFFF' image='textures\civ\marke.paa'/><br/><br/><t size='2.5'>%1</t><br/><br/><t color='#f6f9fc' size='1.6'>Zivilausweis der Insel Altis</t>", name player];
	};
	case west: {
		switch (FETCH_CONST(life_coplevel)) do {
			case 1: { _rang = "Anwärter"; };
			case 2: { _rang = "Wachtmeister"; };
			case 3: { _rang = "Kommissar"; };
			case 4: { _rang = "Oberkommissar"; };
			case 5: { _rang = "Hauptkommissar"; };
			case 6: { _rang = "Bundespolizei"; };
			case 7: { _rang = "Polizeichef"; };
			case 8: { _rang = "Polizeirat"; };
			default { _rang =  "Error";};
		};
		_message = format["<img size='10' color='#FFFFFF' image='textures\cop\marke.paa'/><br/><br/><t size='2.5'>%1</t><br/><t size='1.8'>%2</t><br/><br/><t color='#336699' size='1.6'>Polizei Altis</t>", name player, _rang];
	};
	case east: {
		switch (FETCH_CONST(life_ASFlevel)) do {
			case 1: { _rang = "Private"; };
			case 2: { _rang = "Corporal"; };
			case 3: { _rang = "Sergeant"; };
			case 4: { _rang = "Lieutenant"; };
			case 5: { _rang = "Captain"; };
			case 6: { _rang = "Major"; };
			default { _rang = "Error";};
		};
		_message = format["<img size='10' color='#FFFFFF' image='textures\ASF\rank.paa'/><br/><br/><t size='2.5'>%1</t><br/><t size='1.8'>%2</t><br/><br/><t color='#FF8800' size='1.6'>Altis Security Force</t>", name player, _rang];
	};
	case independent: {
		switch (life_hsd) do {
			case "med": {
				switch (FETCH_CONST(life_medicLevel)) do {
					case 1: { _rang = "Praktikant"; };
					case 2: { _rang = "Azubi"; };
					case 3: { _rang = "Sanitäter"; };
					case 4: { _rang = "Notarzt"; };
					case 5: { _rang = "Facharzt"; };
					case 6: { _rang = "Rettungspilot"; };
					case 7: { _rang = "Oberarzt"; };
					default { _rang =  "Error";};
				};
				_message = format["<img size='10' color='#FFFFFF' image='textures\medic\medic_id.paa'/><br/><br/><t size='2.5'>%1</t><br/><t size='1.8'>%2</t><br/><br/><t color='#d41515' size='1.6'>Sanitaetsdienst Altis</t>", name player, _rang];
			};
			case "alac": {
				switch (FETCH_CONST(life_alacLevel)) do {
					case 1: { _rang = "Praktikant"; };
					case 2: { _rang = "Azubi"; };
					case 3: { _rang = "Geselle"; };
					case 4: { _rang = "Meister"; };
					case 5: { _rang = "Abteilungsleiter"; };
					case 6: { _rang = "Ausbilder"; };
					case 7: { _rang = "Chef"; };
					default { _rang =  "Error";};
				};
				_message = format["<img size='10' color='#FFFFFF' image='textures\medic\alac_id.paa'/><br/><br/><t size='2.5'>%1</t><br/><t size='1.8'>%2</t><br/><br/><t color='#FFFF00' size='1.6'>ALAC Pannendienst</t>", name player, _rang];
			};
			case "thw": {
				switch (FETCH_CONST(life_thwLevel)) do {
					case 1: { _rang = "Auszubildender/in"; };
                    case 2: { _rang = "Truppführer"; };
                    case 3: { _rang = "Gruppenführer"; };
                    case 4: { _rang = "Zugtruppenführer"; };
                    case 5: { _rang = "Einheitsführer"; };
                    case 6: { _rang = "Ausbilder"; };
                    case 7: { _rang = "Präsidentschaft"; };
                    default { _rang =  "Error";};
				};
				_message = format["<img size='10' color='#FFFFFF' image='textures\medic\thw_id.paa'/><br/><br/><t size='2.5'>%1</t><br/><t size='1.8'>%2</t><br/><br/><t color='#336699' size='1.6'>Technisches Hilfswerk</t>", name player, _rang];
			};
			case "event": {
				switch (FETCH_CONST(life_eventLevel)) do {
					case 1: { _rang = "Event Team"; };
					case 2: { _rang = "Event Leiter"; };
					default { _rang =  "Event Team";};
				};
				_message = format["<img size='10' color='#FFFFFF' image='textures\event_id.paa'/><br/><br/><t size='2.5'>%1</t><br/><t size='1.8'>%2</t><br/><br/><t color='#33FF00' size='1.6'>Event Team</t>", name player, _rang];
			};
		};
	};
};

[[_message,player],"PG_fnc_IDshown",_target,false] spawn life_fnc_MP;
hint "Du hast deinen Ausweis gezeigt.";
