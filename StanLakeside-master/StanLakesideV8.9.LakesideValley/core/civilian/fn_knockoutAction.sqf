/*
	File: fn_knockoutAction.sqf
	
	
	Description:
	Knocks out the target.
*/

params [["_target", objNull, [objNull]]];

_cops = (west countSide playableUnits);

if(_cops < 2) exitWith { hint "Nie moge tego robic poki nie ma odpowiedniej ilosci policjantow! (2+)"; }; 

life_antispamactive = true;
//Temp fail safe.
[] spawn {
	uiSleep 0.5;
	life_antispamactive = false;
};
_pos = (getPosASL player);

_degrees = getDir player; 
_degreesu = getDir _target;
_totald = _degrees - _degreesu;

if(_totald >= -90 && _totald < 1 || _totald <= 90 && _totald > -1 || _totald >= 270 || _totald <= -270) then {


	if(surfaceIsWater _pos) exitwith {};
	if(isNull _target) exitWith {};
	if(!isPlayer _target) exitWith {};
	if(player distance _target > 4) exitWith {};
	life_knockout = true;
	[player,"AwopPercMstpSgthWrflDnon_End2"] remoteExecCall ["life_fnc_animSync"];
	uiSleep 0.08;
	[player,"punch2"] spawn life_fnc_nearestSound;	
	[_target,profileName] remoteExecCall ["life_fnc_knockedOut",_target];

	uiSleep 3;
	life_knockout = false;

} else {
	["Musisz byc za Twoim celem aby go powalic!", false] spawn domsg;
};

