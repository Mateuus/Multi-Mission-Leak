#include "..\..\macros.hpp"
/*
	Author: Bryan "Tonic" Boardwine
	Modified by: Sink(Al Morise) & Division Wolf e.V. - Sandmann
	
	Description:
	Breaks the lock on a single door (Closet door to the player).
*/
private["_building","_door","_doors","_cpRate","_title","_progressBar","_titleText","_cp","_ui","_securityLvl","_blocked","_uid","_houseOK","_fail","_dice","_person","_sleep","_distance","_coponline"];
closeDialog 0;
_building = param [0,ObjNull,[ObjNull]];
_blocked = false;
_houseOK = false;
_person = ObjNull;
_coponline = false;
_doors = getNumber(configFile >> "CfgVehicles" >> (typeOf _building) >> "NumberOfDoors");
_door = 0;
if(isNull _building) exitWith {};
if(!(_building isKindOf "House_F")) exitWith {hint "Du schaust nicht auf eine Tuer."};

if(isNil "DWEV_boltcutter_uses") then {DWEV_boltcutter_uses = 0;};

if((nearestObject [[16019.5,16952.9,0],"Land_Dome_Big_F"]) == _building OR (nearestObject [[16019.5,16952.9,0],"Land_Research_house_V1_F"]) == _building) then 
{
if ({(_x getVariable["coplevel",0]) > 1} count playableUnits < 8 ) exitWith {hint "Es muessen min. 8 Wachmeister oder h�her online sein."; _coponline = true; };
if ({(_x getVariable["coplevel",0]) > 5} count playableUnits < 3 ) exitWith {hint "Es muessen min. 3 Kommissar oder h�her online sein."; _coponline = true; };
_distance = 5;
}
else
{
if ({(_x getVariable["coplevel",0]) > 1} count playableUnits < 3 ) exitWith {hint "Es muessen min. 3 Wachmeister oder hoeher online sein."; _coponline = true;};
_distance = 2;
};

if (_coponline) exitwith {};

//Die die nächste Tür finden
for "_i" from 1 to _doors do
{
	_selPos = _building selectionPosition format["Door_%1_trigger",_i];
	_worldSpace = _building modelToWorld _selPos;
	if(player distance _worldSpace < _distance) exitWith {_door = _i;};
};

if(_door == 0) exitWith {hint "Du bist nicht in der naehe einer Tuer!"};
if((_building getVariable[format["bis_disabled_Door_%1",_door],0]) == 0) exitWith {hint "Die Tuer ist bereits geoeffnet!"};

if((nearestObject [[16019.5,16952.9,0],"Land_Dome_Big_F"]) == _building OR (nearestObject [[16019.5,16952.9,0],"Land_Research_house_V1_F"]) == _building) then 
{
	_houseOK = true;
	[[1,2],"!!!!! Jemand bricht in die Bundesbank ein !!!!!!"] remoteExec ["DWEV_fnc_broadcast",-2];
} 
else 
{
	if(isNil {(_building getVariable "house_owner")}) exitWith {hint "Dieses Haus gehoert niemandem."; _blocked = true;};
	_uid = (_building getVariable "house_owner") select 0;
	if ((getPlayerUID player) == _uid) exitwith {hint "In das eigene Haus, kann man nicht einbrechen."; _blocked = true;};
	_securityLvl = _building getVariable "house_security";
	
	if(!([_uid] call DWEV_fnc_isUIDActive) && _securityLvl >= 6) exitWith {hint "Der Hausbesitzer ist nicht da, daher kannst du das Haus nicht Pluendern!"; _blocked = true;};
	
	_houseOK = true;

	{
		if(getPlayerUid _x == _uid) exitWith {_person = _x;};
	}forEach playableUnits;
	
	if(_securityLvl in [4,5,6,7,8,9,10]) then
	{
		[[1,2],format["!! Das Haus Sicherheitssystem hat das eindringen von %1 in dein Haus registriert. !!", getMyDName]] remoteExec ["DWEV_fnc_broadcast",_person];
	};
	if(_securityLvl in [9,10]) then
	{
		[player] remoteExec ["DWEV_fnc_HouseMarker",_person];
	};
};

if(_blocked) exitWith {};
if(_houseOK && !((nearestObject [[16019.5,16952.9,0],"Land_Dome_Big_F"]) == _building OR (nearestObject [[16019.5,16952.9,0],"Land_Research_house_V1_F"]) == _building)) then
{ 
	switch (_securityLvl) do
	{
		case 0: {_fail = -1; _sleep = 1.8;}; // 0% Fail, Dauer 3 Minuten, keine meldung
		case 1: {_fail = 10; _sleep = 2.1;}; // 10% Fail, Dauer 3,5 Minuten, keine meldung
		case 2: {_fail = 20; _sleep = 2.4;}; // 20% Fail, Dauer 4 Minuten, keine meldung
		case 3: {_fail = 30; _sleep = 2.7;}; // 30% Fail, Dauer 4,5 Minuten, Meldung bei Fehlschlag
		case 4: {_fail = 40; _sleep = 3.0;}; // 40% Fail, Dauer 5 Minuten, meldung sobald jemand bolzenschneider anlegt.
		case 5: {_fail = 50; _sleep = 3.3;}; // 50% Fail, Dauer 5,5 Minuten, 30 Sekunden Alarm, wenn einbruch fehlgeschlagen, meldung sobald jemand bolzenschneider anlegt.
		case 6: {_fail = 55; _sleep = 3.6;}; // 55% Fail, Dauer 6 Minuten, Offline schutz, 30 Sekunden Alarm, wenn einbruch fehlgeschlagen, meldung sobald jemand bolzenschneider anlegt.
		case 7: {_fail = 60; _sleep = 3.9;}; // 60% Fail, Dauer 6,5 Minuten, Video, Offline schutz, 30 Sekunden Alarm, wenn einbruch fehlgeschlagen, meldung sobald jemand bolzenschneider anlegt.
		case 8: {_fail = 65; _sleep = 4.2;}; // 65% Fail, Dauer 7 Minuten, Video, Offline schutz, 30 Sekunden Alarm, wenn einbruch fehlgeschlagen, meldung sobald jemand bolzenschneider anlegt.
		case 9: {_fail = 75; _sleep = 4.8;}; // 75% Fail, Dauer 8 Minuten, Video, Offline schutz, 30 Sekunden Alarm, wenn einbruch fehlgeschlagen, meldung sobald jemand bolzenschneider anlegt.
		case 10: {_fail = 101; _sleep = 4.8;}; // 100% Fail, Dauer 8 Minuten, Video, Offline schutz, 30 Sekunden Alarm, wenn einbruch fehlgeschlagen, meldung sobald jemand bolzenschneider anlegt.
	};
};

if ((nearestObject [[16019.5,16952.9,0],"Land_Dome_Big_F"]) == _building OR (nearestObject [[16019.5,16952.9,0],"Land_Research_house_V1_F"]) == _building) then 
{
	format["%1 wurde gesehen wie er in die Bundesbank einbrechen moechte.",getMyDName] remoteExec ["systemChat",-2];
}
else
{
	format["%1 wurde gesehen wie er in ein Haus einbrechen moechte.",getMyDName] remoteExec ["systemChat",-2];
};

DWEV_action_inUse = true;

//Setup the progress bar
disableSerialization;
_title = "Breche die Tuer auf.";
5 cutRsc ["DWEV_progress","PLAIN"];
_ui = uiNamespace getVariable "DWEV_progress";
_progressBar = _ui displayCtrl 38201;
_titleText = _ui displayCtrl 38202;
_titleText ctrlSetText format["%2 (1%1)...","%",_title];
_progressBar progressSetPosition 0.01;
_cP = 0.01;

switch (typeOf _building) do
{
	case "Land_Dome_Big_F": {_sleep = 0.3; _fail = 20;};// 30 sekunden + fehlschlag vom bolzenschneider von 20%
	case "Land_Research_house_V1_F": {_sleep = 0.6; _fail = 20;}; // 60 sekunden + fehlschlag vom bolzenschneider von 20%
	default {};
};

while {true} do
{
	if(animationState player != "AinvPknlMstpsnonWnonDnon_medic_1" ) then
	{
				player action ["SwitchWeapon", player, player, 100];
				player playMove "AinvPknlMstpsnonWnonDnon_medic_1";
				player playActionNow "stop";
				player playMove "AinvPknlMstpsnonWnonDnon_medic_1";
				player playActionNow "stop";
				player playMove "AinvPknlMstpsnonWnonDnon_medic_1";
	};
	
	sleep _sleep;
	
	if(isNull _ui) then
	{
		5 cutRsc ["DWEV_progress","PLAIN"];
		_ui = uiNamespace getVariable "DWEV_progress";
		_progressBar = _ui displayCtrl 38201;
		_titleText = _ui displayCtrl 38202;
	};
	
	_cP = _cP + 0.01;
	_progressBar progressSetPosition _cP;
	_titleText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_title];
	if(_cP >= 1 OR !alive player) exitWith {};
	if(DWEV_istazed) exitWith {};
	if(DWEV_isdowned) exitWith {};
	if(DWEV_interrupted) exitWith {};
};

//Kill the UI display and check for various states
5 cutText ["","PLAIN"];
player playActionNow "stop";
if(!alive player OR DWEV_istazed OR DWEV_isdowned) exitWith {DWEV_action_inUse = false;};
if((player getVariable["restrained",false])) exitWith {DWEV_action_inUse = false;};
if(DWEV_interrupted) exitWith
{
	DWEV_interrupted = false;
	titleText["Aktion abgebrochen","PLAIN"];
	DWEV_action_inUse = false;
};

DWEV_boltcutter_uses = DWEV_boltcutter_uses + 1;
DWEV_action_inUse = false;
if(DWEV_boltcutter_uses >= 1) then
{
	[false,"boltcutter",1] call DWEV_fnc_handlelnv;
	DWEV_boltcutter_uses = 0;
};

if(_houseOK) then
{
	_dice = floor (random 100);
	if(_dice >= _fail) exitWith {_houseOK = false;};
};

if(!_houseOK) then
{
	_building setVariable[format["bis_disabled_Door_%1",_door],0,true]; //Unlock the door.
	if((_building getVariable["locked",false])) then
	{
		_building setVariable["locked",false,true];
	};
	
	if ((nearestObject [[16019.5,16952.9,0],"Land_Dome_Big_F"]) == _building OR (nearestObject [[16019.5,16952.9,0],"Land_Research_house_V1_F"]) == _building) then 
	{
		hint "Dein Einbruch in die Bank war erfolgreich, Beeilung!";
		[getPlayerUID player,getMyName,"461"] remoteExec ["DWEV_fnc_wantedAdd",2];
	}
	else
	{
		hint "Dein Einbruch in das Haus war erfolgreich, komm rein!";
		[getPlayerUID player,getMyName,"459"] remoteExec ["DWEV_fnc_wantedAdd",2];
		if(_securityLvl in [9,10]) then
		{
			deleteMarker "MarkerRobHaus";
		};
	};
	
}
else
{
	if ((nearestObject [[16019.5,16952.9,0],"Land_Dome_Big_F"]) == _building OR (nearestObject [[16019.5,16952.9,0],"Land_Research_house_V1_F"]) == _building) then 
	{
		hint "Dein Einbruch in die Bank ist Fehlgeschlafen, versuch es erneut!";
		
		if (!(_building getVariable["alarm_in_use",false])) then
					{ 		
						[cursortarget] spawn
						{ 
							_building = _this select 0;			
							_building setVariable["alarm_in_use",true,true];
							[_building] remoteExec ["DWEV_fnc_HouseAlarm",-2];
							sleep 30;
							_building setVariable["alarm_in_use",false,true];	
						};
					};
	}
	else
	{
		hint "Das Haus Sicherheitssystem hat dein eindringen blockiert.";
		[getPlayerUID player,getMyName,"460"] remoteExec ["DWEV_fnc_wantedAdd",2];

		if(_securityLvl in [3,5,6,7,8,9,10]) then
		{
			if(!isNull _person) then
			{
				if(_securityLvl == 3) then
				{
					[[1,2],format["!! Das Haus Sicherheitssystem hat das eindringen von %1 in dein Haus registriert. !!", getMyDName]] remoteExec ["DWEV_fnc_broadcast",_person];
				};
				
				if(_securityLvl >= 5) then
				{
					if (!(_building getVariable["alarm_in_use",false])) then
					{ 		
						[cursortarget] spawn
						{ 
							_building = _this select 0;			
							_building setVariable["alarm_in_use",true,true];
							[_building] remoteExec ["DWEV_fnc_HouseAlarm",-2];
							sleep 30;
							_building setVariable["alarm_in_use",false,true];	
						};
					};
					
					if(_securityLvl >= 7) then
					{
						"Du bekommst ein Live-Video von deinem Haus Sicherheitssystem. Warten bitte..." remoteExec ["hint",_person];
						sleep 8;
						[_building,player,cursorTarget] remoteExec ["DWEV_fnc_webcamHouse",_person];
					};
					
					if(_securityLvl in [9,10]) then
					{
						deleteMarker "MarkerRobHaus";
					};
				};
			};
		};
	};
};