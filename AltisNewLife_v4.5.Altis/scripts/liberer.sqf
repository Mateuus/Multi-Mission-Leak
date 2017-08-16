/*
file: fn_liberateArea.sqf
Author: Hammerite
Description:Allows players to liberate areas using addAction on a object. 
*/
if(playerSide != west && playerSide != east) exitWith {hint "Vous n'etes pas autorise a liberer cette zone !"};
_flag = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_flagName = _flag;
_group = groupId (group player);
_pos = getpos _flag;
_markerAreaName = (str _flagName) + "AreaMarker";
_markerTextName = (str _flagName) + "TextMarker";
_time = 120;
_funds = 2000;
_timeText = format ["Vous etes en train de liberer %1. Tenez bon encore %2 secondes.",_flagName, _time];
_markerText = format ["%1 et son gang ont capturé %2.",_group, _flagName];
_CaptureArea = format ["Capture %1", _flagName];
_message = format["Les forces de l'ordre ont reussi a liberer la zone %1 ! Vous pouvez a nouveau circuler librement dans ce secteur.", _flagName];
private["_exit"];
_exit = false;
if (getMarkerColor _markerAreaName == "") then {
	hint "Cette zone n'a pas encore été capturé";
	_exit = true;
};
if (_exit) exitWith{};
while {_time > 0} do {
	_time = _time - 1;
	_timeText = format ["Vous etes en train de liberer %1. Tenez bon encore %2 secondes.",_flagName, _time];
	hint str _timeText;
	uiSleep 1;	
	if !(alive player) exitWith {};
	if(player distance _flag > 20) exitWith { 
		hint "Vous devez rester a proximité du drapeau pour liberer cette zone !";
		uiSleep 1;
        _exit = true;
	};
};
if (!_exit) then {
deleteMarker _markerAreaName;
deleteMarker _markerTextName;
[[3,_message],"life_fnc_broadcast",true,false] spawn life_fnc_MP;
argent_liquide = argent_liquide + _funds;
hint "Vous avez recu 2000€ de recompense pour votre courage";
};