/*
	File: fn_lockpick.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Main functionality for lock-picking.
*/
private["_curTarget","_distance","_isVehicle","_title","_progressBar","_cP","_titleText","_dice","_badDistance","_active","_sleep"];
_curTarget = cursorObject;
_active = false;
_sleep = 0.2;
life_interrupted = false;
if(life_action_inUse) exitWith {};
if(isNull _curTarget) exitWith {}; //Bad type
if(life_level < 2) exitWith {hint "Du musst erst Level 2 erreicht haben, um den Dietrich benutzen zu können!"};
if(playerside == civilian) then {

	_safezones = [
		"safezone_kavala1",
		"safezone_kavala4",
		"safezone_kavala5",
		"safezone_athira2",
		"safezone_athira3",
		"safezone_pyrgos2",
		"safezone_pyrgos3",
		"safezone_sofia2",
		"safezone_sofia3",
		"safezone_kupfer1",
		"safezone_kupfer2",
		"safezone_kupfer3",
		"safezone_airport",
		"safezone_mine",
		"safezone_donator",
		"safezone_agios"
	];
	
	{if(player inArea _x) exitWith {_active = true}} foreach _safezones;
};

if(_active) exitWith {hint "Überwachungskameras könnten dich erfassen, Aufbrechen abgebrochen."};
_distance = ((boundingBox _curTarget select 1) select 0) + 2;
if(player distance _curTarget > _distance) exitWith {}; //Too far
_isVehicle = if((_curTarget isKindOf "LandVehicle") OR (_curTarget isKindOf "Ship") OR (_curTarget isKindOf "Air")) then {true} else {false};
if(_isVehicle && _curTarget in life_vehicles) exitWith {hint localize "STR_ISTR_Lock_AlreadyHave"};

//More error checks
if(!_isVehicle && !isPlayer _curTarget) exitWith {};
if(!_isVehicle && !(_curTarget getVariable["restrained",false])) exitWith {};

life_action_inUse = true; //Lock out other actions
if(_isVehicle) then {[_curTarget,"alarmanlage"] remoteExecCall ["say3D",0]};

if(playerside == independent) then {_sleep = 0.05} else {_sleep = 0.2};
_cP = 0.01;
_upp = format["%1 aufbrechen...",if(!_isVehicle) then {"Handschellen"} else {getText(configFile >> "CfgVehicles" >> (typeOf _curTarget) >> "displayName")}];

_handle = [_upp,_sleep,_cP,"Acts_carFixingWheel",_curTarget,12] spawn life_fnc_processBar;
WaitUntil{scriptDone _handle};
if(life_process_distance) exitWith {hint "Du bist zu weit entfernt!"; life_process_distance = false; life_action_inUse = false;};
if(life_process_bad) exitWith {life_process_bad = false; life_action_inUse = false; life_interrupted = false;};

if(!alive player OR life_istazed) exitWith {life_action_inUse = false;};
if((player getVariable["restrained",false])) exitWith {life_action_inUse = false;};
if(!isNil "_badDistance") exitWith {titleText[localize "STR_ISTR_Lock_TooFar","PLAIN"]; life_action_inUse = false;};
if(life_interrupted) exitWith {life_interrupted = false; titleText[localize "STR_NOTF_ActionCancel","PLAIN"]; life_action_inUse = false;};
if(!([false,"lockpick",1] call life_fnc_handleInv)) exitWith {life_action_inUse = false;};

life_action_inUse = false;

if(!_isVehicle) then {
	_curTarget setVariable["restrained",false,true];
	_curTarget setVariable["Escorting",false,true];
	_curTarget setVariable["transporting",false,true];
} else {
	if(playerside == independent) then {
		titleText[localize "STR_ISTR_Lock_Success","PLAIN"];
		life_vehicles pushBack _curTarget;
	} else {
		_dice = random(100);
		if(_dice < 30) then {
			titleText[localize "STR_ISTR_Lock_Success","PLAIN"];
			life_vehicles pushBack _curTarget;
			[getPlayerUID player,profileName,"487"] remoteExecCall ["SOA_fnc_wantedAdd",2];
			[profileName,typeOf _curTarget,"",3] remoteExecCall ["life_fnc_logDat",2];
		} else {
			[getPlayerUID player,profileName,"215"] remoteExecCall ["SOA_fnc_wantedAdd",2];
			[0,"STR_ISTR_Lock_FailedNOTF",true,[profileName]] remoteExecCall ["life_fnc_broadcast",west],
			titleText[localize "STR_ISTR_Lock_Failed","PLAIN"];
		};
	};
};