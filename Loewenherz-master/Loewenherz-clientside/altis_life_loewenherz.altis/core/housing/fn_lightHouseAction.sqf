/*
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Lights up the house.
*/
private["_house"];
_house = param [0,ObjNull,[ObjNull]];
if(isNull _house) exitWith {};
if(!(_house isKindOf "House_F")) exitWith {};

if(isNull (_house getVariable ["lightSource",ObjNull])) then {
	[[_house,true],"lhm_fnc_lightHouse",true,false] call lhm_fnc_mp;
} else {
	[[_house,false],"lhm_fnc_lightHouse",true,false] call lhm_fnc_mp;
};