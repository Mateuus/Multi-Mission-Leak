/*
file: captureArea.sqf
Author: Hammerite
*/
private["_gangName","_cops","_exit","_timeCapture","_timeCapture"];
if(playerSide == west) exitWith {hint "Vous ne pouvez pas capturer cette zone !"};
flagObj = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
flagName = flagObj;
timeCapture = 150;
_firstHint = 1;
_active = 0;
_group = flagObj getVariable ["gangOwner",grpNull];
gangName = (group player) getVariable "gang_name";
_playerName = name player;
_funds = 2000;
_maxPaychecks = 20;
_pos = getpos flagObj;
_markerAreaName = (str flagName) + "AreaMarker";
_markerTextName = (str flagName) + "TextMarker";
_timeText = format ["Vous etes en train de capturer cette zone. Tenez bon encore %1 secondes.", timeCapture];
_textMarkerText = format ["%1 a capturé cette zone !",(group player) getVariable "gang_name"];
_liberateArea = format ["Liberer cette zone"];
_cops = 0;
{if(alive _x && side _x == west)then{_cops = _cops + 1 };}forEach playableUnits; 
if(_cops < 4)exitWith {hint "Pas assez de gendarme pour capturer cet endroit (4 minimum) !"};
if (currentWeapon player == "")exitWith{hint"Vous devez etre armé avant de capturer cette zone... Rigolo !";};
if(isNil {(group player) getVariable "gang_name"}) exitWith {titleText[localize "STR_GNOTF_CreateGang","PLAIN"];};
// if you arent a civilian, you should not missuse your power to supress and dictate an area
if(side player != civilian) exitWith { hint "Vous ne pouvez pas capturer cette zone !" };
if(((group player) getVariable "gang_name") == "")exitWith{hint "Vous devez d'abord etre dans un gang !";};
if(_group == group player) exitWith {titleText[localize "STR_GNOTF_Controlled","PLAIN"]};
if(cooldown == 1)then{	
	hint "Un gang a deja pris cette zone, merci d'attendre un peu avant une nouvelle capture !";
};
While{timeCapture > 0} do {
		timeCapture = timeCapture - 1;
		_timeText = format ["Vous etes en train de capturer la zone. Tenez bon encore %1 secondes.",timeCapture];
		hint str _timeText;
		publicVariable "cooldown";
		cooldown = 1;
		uiSleep 1;
		if (_firstHint == 1) then { _firstHint = 0; [] call life_fnc_captureBroadcast;};
		if !(alive player) exitWith {_exit = true; cooldown = 0;};
		if(player distance flagObj > 50) exitWith {
			hint "Vous devez rester a proximite du drapeau pour capturer cette zone !";
	        _exit = true;
	        publicVariable "cooldown";
			cooldown = 0;
		};
		_exit = false;
};
hint "";
if (!_exit) then {
publicVariable "cooldown";
cooldown = 1;
deleteMarker _markerAreaName;
deleteMarker _markerTextName;
_markerArea = createMarker [_markerAreaName, _pos];
_markerAreaName setMarkerColor "ColorRed";
_markerAreaName setMarkerShape "ELLIPSE";
_markerAreaName setMarkerSize [400, 400];
_markerText = createMarker [_markerTextName, _pos];
_markerTextName setMarkerType "mil_warning";
_markerTextName setMarkerColor "ColorBlack";
_markerTextName setMarkerText (str _textMarkerText);
_active = 1;
[gangName, flagName] call life_fnc_captureBroadcast2;
};
while {_active < _maxPaychecks} do {
  _active = _active + 1;
  argent_liquide = argent_liquide + _funds;
  uiSleep 1200;
};
uiSleep 2700;
publicVariable "cooldown";
cooldown = 0;