/*
	
	
	Description:
	Lights up the house.
*/

params [["_house", objNull, [objNull]]];

if(isNull _house) exitWith {};
if(!(_house isKindOf "House_F")) exitWith {};

if(isNull (_house getVariable ["lightSource",ObjNull])) then {
	[_house,true] remoteExec ["life_fnc_lightHouse",-2];
} else {
	[_house,false] remoteExec ["life_fnc_lightHouse",-2];
};