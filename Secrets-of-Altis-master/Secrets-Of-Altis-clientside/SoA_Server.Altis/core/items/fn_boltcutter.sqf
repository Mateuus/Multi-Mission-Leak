/*
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Breaks the lock on a single door (Closet door to the player).
*/
private["_building","_door","_doors","_cpRate","_title","_progressBar","_titleText","_cp","_ui","_unit","_exit"];
_building = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_exit = false;
if(isNull _building) exitWith {};
if(!(_building isKindOf "House_F")) exitWith {hint "Du schaust nicht auf eine Haustür."};
if(isNil "life_boltcutter_uses") then {life_boltcutter_uses = 0;};
if((west countside playableUnits) < 5 && (nearestObject [[16019.5,16952.9,0],"Land_Dome_Big_F"] == _building OR nearestObject [[18983.6,8341.3,0],"Land_MilOffices_V1_F"] == _building)) exitWith {hint localize "STR_Civ_NotEnoughCops"};
if((nearestObject [[16019.5,16952.9,0],"Land_Dome_Big_F"] == _building && life_galerieraub) OR nearestObject [[18983.6,8341.3,0],"Land_MilOffices_V1_F"] == _building && life_bankraub) exitWith {hint "Die Polizei ist bereits in Alarmbereitschaft, du solltest es zu einem späteren Zeitpunkt versuchen!"};

if((nearestObject [[16019.5,16952.9,0],"Land_Dome_Big_F"]) == _building OR (nearestObject [[18983.6,8341.3,0],"Land_MilOffices_V1_F"]) == _building) then {
	switch(typeOf _building) do {
	
		case "Land_Dome_Big_F": {
			_doors = getNumber(configFile >> "CfgVehicles" >> (typeOf _building) >> "numberOfDoors");
			for "_i" from 1 to _doors do {
				if((_building getVariable[format["bis_disabled_Door_%1",_i],0]) == 0) exitWith {hint "Die Zentralverriegelung wurde bereits geknackt."};
			};

			[lautsprecher_bank,"bankalarm"] remoteExecCall ["say3D",0];
			[2,">> In die Zentralbank wird eingebrochen! <<"] remoteExecCall ["life_fnc_broadcast",0];
			["bank"] remoteExec ["SOA_fnc_grosseinsatz",2];
		};
		
		case "Land_MilOffices_V1_F": {
			_doors = getNumber(configFile >> "CfgVehicles" >> (typeOf _building) >> "numberOfDoors");
			for "_i" from 1 to _doors do {
				if((_building getVariable[format["bis_disabled_Door_%1",_i],0]) == 0) exitWith {hint "Die Zentralverriegelung wurde bereits geknackt."};
			};

			[lautsprecher_galerie,"bankalarm"] remoteExecCall ["say3D",0];
			[2,">> In die Kunstgalerie wird eingebrochen! <<"] remoteExecCall ["life_fnc_broadcast",0];
			["galerie"] remoteExec ["SOA_fnc_grosseinsatz",2];
		};
	};
} else {
	
	if(true) exitWith {hint "Häuser können zur Zeit nicht aufgebrochen werden!"; _exit = true;};

	[0,"STR_ISTR_Bolt_AlertHouse",true,[profileName]] remoteExecCall ["life_fnc_broadcast",0];

	{
		if((_building getVariable "house_owner" select 0) == getplayerUID _x) exitWith {_unit = _x};
	} foreach playableUnits;

	[2,"In dein Haus wird eingebrochen!"] remoteExecCall ["life_fnc_broadcast",_unit];

	_door = [_building] call life_fnc_nearestDoor;
	if(_door == 0) exitWith {hint localize "STR_Cop_NotaDoor"};
	if((_building getVariable[format["bis_disabled_Door_%1",_door],0]) == 0) exitWith {hint localize "STR_House_Raid_DoorUnlocked"};
};

if(_exit) exitWith {};

life_action_inUse = true;

switch (typeOf _building) do {
	case "Land_Dome_Big_F": {_cpRate = 0.002;};
	case "Land_MilOffices_V1_F": {_cpRate = 0.004;};
	default {_cpRate = 0.003;}
};

_sleep = 0.195;
_cP = _cpRate;
_upp = localize "STR_ISTR_Bolt_Process";

_handle = [_upp,_sleep,_cP,"Acts_carFixingWheel",nil] spawn life_fnc_processBar;
WaitUntil{scriptDone _handle};
if(life_process_distance) exitWith {hint "Du bist zu weit entfernt!"; life_process_distance = false; life_action_inUse = false;};
if(life_process_bad) exitWith {life_process_bad = false; life_action_inUse = false; life_interrupted = false;};

if(!alive player OR life_istazed) exitWith {life_action_inUse = false;};
if((player getVariable["restrained",false])) exitWith {life_action_inUse = false;};
if(life_interrupted) exitWith {life_interrupted = false; titleText[localize "STR_NOTF_ActionCancel","PLAIN"]; life_action_inUse = false;};
life_boltcutter_uses = life_boltcutter_uses + 1;
life_action_inUse = false;
if(life_boltcutter_uses >= 4) then {
	[false,"boltcutter",1] call life_fnc_handleInv;
	life_boltcutter_uses = 0;
	hint "Der Bolzenschneider ist verschlissen.";
};

switch(typeOf _building) do {
	
		case "Land_Dome_Big_F": {
			for "_i" from 1 to _doors do {_building setVariable[format["bis_disabled_Door_%1",_i],0,true]};
			if((_building getVariable["locked",false])) then {_building setVariable["locked",false,true]};
		};
		
		case "Land_MilOffices_V1_F": {
			for "_i" from 1 to _doors do {_building setVariable[format["bis_disabled_Door_%1",_i],0,true]};
			if((_building getVariable["locked",false])) then {_building setVariable["locked",false,true]};
		};

	default {
		_building setVariable[format["bis_disabled_Door_%1",_door],0,true];
		if((_building getVariable["locked",false])) then {_building setVariable["locked",false,true]};
	};
};

[getPlayerUID player,profileName,"459"] remoteExecCall ["SOA_fnc_wantedAdd",2];