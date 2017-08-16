/*
	File: fn_startMartial.sqf
	Author: John "Paratus" VanderZwet
	
	Description:
	Begin martial law status at given town!
*/
private["_locName","_locId","_status"];
_locId = [_this,0,0,[0]] call BIS_fnc_param;
_locName = [_this,1,"",[""]] call BIS_fnc_param;
_status = [_this,2,false,[false]] call BIS_fnc_param;
if(_locName == "" OR _locId == 0) exitWith {};
if(_locId in life_martial) exitWith {};

if (_status) then {
	[[_locId,_locName],"ASY_fnc_martialAlarm",false,false] spawn life_fnc_MP;
	//[[21, player, format["Started martial law for %1", _locName]],"ASY_fnc_logIt",false,false] spawn life_fnc_MP;
}
else {
	[[_locId,_locName],"ASY_fnc_martialStop",false,false] spawn life_fnc_MP;
	//[[22, player, format["Stopped martial law for %1", _locName]],"ASY_fnc_logIt",false,false] spawn life_fnc_MP;
};