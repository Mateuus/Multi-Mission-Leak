/*---------------------------------------------------------------------------
	File: fn_sirenLights.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Lets play a game! Can you guess what it does? I have faith in you, if you can't
	then you have failed me and therefor I lose all faith in humanity.. No pressure.
---------------------------------------------------------------------------*/

private["_vehicle"];
_vehicle = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _vehicle) exitWith {}; //Bad entry!
if(!(typeOf _vehicle in ["C_Offroad_01_F","C_SUV_01_F","B_Truck_01_mover_F"])) exitWith {}; 

_trueorfalse = _vehicle getVariable["adaclights",FALSE];

if(_trueorfalse) then {
	_vehicle setVariable["adaclights",FALSE,TRUE];
} else {
	_vehicle setVariable["adaclights",TRUE,TRUE];
	[[_vehicle,0.22],"life_fnc_adacLights",true,false] call life_fnc_MP;
};