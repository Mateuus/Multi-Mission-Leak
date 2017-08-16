/*
    Author: Niklas "Rappelkiste" Quenter
	File: fn_impoundVehicle.sqf
	Server: e-Monkeys.com
    
    Description: New Vehicle impound
*/
private["_boxType","_mode","_veh","_exit","_vehSide","_vehicleData","_vehicleName","_vehicleType","_impoundMoney","_cPName","_ui","_progress","_pgText","_cP","_modeName1","_modeName2","_modeName3"];
_boxType = ["Box_IND_AmmoVeh_F","Land_Cargo20_blue_F"];

_veh = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_mode = [_this,1,-1,[0]] call BIS_fnc_param;
_exit = false;
if(_veh == ObjNull OR _mode == -1) exitWith {};
if(!(_veh isKindOf "Car") && !(_veh isKindOf "Air") && !(_veh isKindOf "Ship") && !(typeOf _veh in _boxType)) exitWith {};
if(player distance _veh > 10) exitWith {};
switch(_mode) do
{
	case 0:
	{
		_modeName1 = "Schleppe ab";
		_modeName2 = "Abschleppen";
		_modeName3 = "abgeschleppt";
	};
	case 1:
	{
		_modeName1 = "Beschlagnahme";
		_modeName2 = "Beschlagnahmen";
		_modeName3 = "beschlagnahmt";
	};
	case 2:
	{
		_modeName1 = "Beschlagnahme";
		_modeName2 = "Beschlagnahmen";
		_modeName3 = "beschlagnahmt";
	};
};
switch(playerSide) do
{
	case west:
	{
		_vehSide = _veh getVariable "copcar";
		//if(_vehSide) then {_exit = true};
	};
	case independent:
	{
		_vehSide = _veh getVariable "medcar";
		//if(_vehSide) then {_exit = true};
	};
};
//if(_exit) exitWith {["Information",[format["Du kannst keine Fahrzeuge deiner Kollegen %1",_modeName2]],"#0090ff"] call EMonkeys_fnc_specialText;};

_vehicleData = _veh getVariable["vehicle_info_owners",[]];
_vehicleName = getText(configFile >> "CfgVehicles" >> (typeOf _veh) >> "displayName");
_vehicleType = getText(missionConfigFile >> "CfgVehicles" >> (typeOf _veh) >> "type");
_impoundMoney = getNumber(missionConfigFile >> "CfgVehicleGarage" >> "vehicleTypes" >> _vehicleType >> "impoundmoney");
if(count _vehicleData == 0) exitWith {deleteVehicle _vehicle};
[[0,format["Information an %1: Achtung! Dein(e) %2 wird %3.",(_vehicleData select 0) select 1,_vehicleName,_modeName3]],"EMonkeys_fnc_broadcast",true,false] call EMonkeys_fnc_mp;

eM_action_inUse = true;
disableSerialization;
_cPName = format["%1 %2",_modeName1,_vehicleName];
5 cutRsc ["EMonkeys_progress","PLAIN"];
_ui = uiNameSpace getVariable "EMonkeys_progress";
_progress = _ui displayCtrl 38201;
_pgText = _ui displayCtrl 38202;
_pgText ctrlSetText format["%2 (1%1)...","%",_cPName];
_progress progressSetPosition 0.01;
_cP = 0.01;

while{true} do
{
	_cP = _cP + 0.01;
	_progress progressSetPosition _cP;
	_pgText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_cPName];
	if(_cP >= 1) exitWith {};
	if((!alive player) || (player getVariable["onkill",FALSE])) exitWith {_exit = true};
	if(player distance _veh >= 10) exitWith {_exit = true};
	if(player != vehicle player) exitWith {_exit = true};
	uisleep 0.09;
};
5 cutText ["","PLAIN"];
eM_action_inUse = false;
if(_exit || (count crew _veh) > 0) exitWith
{
	titleText[format["%1 wurde abgebrochen",_modeName2],"PLAIN"];
};

eM_impound_inuse = true;
[[_veh,true,player,(fuel _veh),_mode],"TON_fnc_vehicleStore",false,false] call EMonkeys_fnc_mp;
waitUntil {!eM_impound_inuse};
EMonkeys_a164 = EMonkeys_a164 + _impoundMoney;
["Information",[format["Du hast für das %1 %2€ erhalten",_modeName2,_impoundMoney]],"#0090ff"] call EMonkeys_fnc_specialText;
[[0,format["%1 hat %2's %3 %4.",profileName,(_vehicleData select 0) select 1,_vehicleName,_modeName3]],"EMonkeys_fnc_broadcast",true,false] call EMonkeys_fnc_mp;