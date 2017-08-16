/*
	File: fn_sellGarage.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Sells a vehicle from the garage.
*/
private["_vehicle","_vid","_pid","_unit","_price","_handle"];
disableSerialization;
if(lbCurSel 2801 == -1) exitWith {hint "You did not select a vehicle..."};
_vData = call compile (lbData[2801,(lbCurSel 2801)]);
_vehicle = _vData select 0;
_vid = lbValue[2801,(lbCurSel 2801)];
_pid = getPlayerUID player;
_unit = player;
_vehicleInfo = [_vehicle] call life_fnc_fetchVehInfo;
if(isNil "_vehicle") exitWith {hint "The selection had a error..."};
_handle = [format["Are you sure you want to sell your %1? ", _vehicleInfo select 3]] spawn life_fnc_confirmMenu;
waitUntil {scriptDone _handle};
if(!life_confirm_response) exitWith {};

_index = [_vehicle,life_vehicleInfo] call life_fnc_index;
_side = switch (playerSide) do
{
	case west: { "cop" };
	case independent: { "med" };
	default { "civ" };
};
_shop = format["%1_%2", _side, life_garage_type];
{
	if (((_x select 0) == _shop) && ((_x select 1) == _vehicle || configName (inheritsFrom (configFile >> "CfgVehicles" >> _row select 2)) == _x select 1)) exitWith { _index = _forEachIndex; };
} foreach life_vehicleInfo;
if(_index == -1) then {_price = 1000;} else {_price = (life_vehicleInfo select _index) select 2;};
_price = round (_vData select 8);
[[_vid,_pid,_price,player,life_garage_type],"ASY_fnc_vehicleDelete",false,false] spawn life_fnc_MP;

closeDialog 0;