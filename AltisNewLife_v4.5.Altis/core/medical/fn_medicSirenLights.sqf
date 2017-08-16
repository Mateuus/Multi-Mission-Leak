#include <macro.h>
private["_vehicle"];
_vehicle = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _vehicle) exitWith {}; //Bad entry!
if(!(typeOf _vehicle in ["C_Offroad_01_F"])) exitWith {}; //Last chance check to prevent something from defying humanity and creating a monster.
_trueorfalse = _vehicle getVariable["lights",FALSE];
if(_trueorfalse) then {
	_vehicle SVAR["lights",FALSE,TRUE];
} else {
	_vehicle SVAR["lights",TRUE,TRUE];
	[[_vehicle,0.22],"life_fnc_medicLights",true,false] call life_fnc_MP;
};