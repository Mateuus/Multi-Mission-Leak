/*
	File: fn_sirenLights.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Lets play a game! Can you guess what it does? I have faith in you, if you can't
	then you have failed me and therefor I lose all faith in humanity.. No pressure.
*/
private["_vehicle"];
_vehicle = param [0,ObjNull,[ObjNull]];
if(isNull _vehicle) exitWith {};
if(!(typeOf _vehicle in ["C_Offroad_01_F","B_MRAP_01_F","C_SUV_01_F"])) exitWith {};
_trueorfalse = _vehicle getVariable ["lights",FALSE];
if(_trueorfalse) then {
	_vehicle setVariable ["lights",FALSE,TRUE];
} else {
	_vehicle setVariable ["lights",TRUE,TRUE];
	[_vehicle,0.22] remoteExec ["life_fnc_jeqewesutafr",-2];
};
