/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Upgrades ones vehicle with an item rather than at the upgrade shop
*/

private ["_infoArray","_vehicle","_search","_action","_fail","_tempArray","_tempPrice"];

_exit = false;
if(DS_mining)exitwith{};
if(DS_doingStuff)exitwith{};
_infoArray = [];
_fail = false;
_tempArray = [];
_tempPrice = 0;
switch(_this select 0)do
	{
	case "vehSecurity":{_infoArray = ["security","LandVehicle","Security"]};
	case "vehWeight":{_infoArray = ["extraspace","LandVehicle","Storage Capacity"]};
	case "vehFuel":{_infoArray = ["fuel","LandVehicle","Fuel Consumption"]};
	case "vehSecurityAdv":{_infoArray = ["securityAdv","LandVehicle","Security"]};
	case "vehWeightAdv":{_infoArray = ["extraspaceAdv","LandVehicle","Storage Capacity"]};
	case "vehFuelAdv":{_infoArray = ["fuelAdv","LandVehicle","Fuel Consumption"]};
	case "vehNos":{_infoArray = ["nitro","LandVehicle","5 Use Nos kit"]};
	case "vehNosAdv":{_infoArray = ["nitro","LandVehicle","5 Use Nos kit"]};
	case "vehAmmo":{_infoArray = ["vehAmmo","LandVehicle","Extra Ammo"]};
	case "weaponsLand":{_infoArray = ["vehAmmo","LandVehicle","Extra Ammo"]};
	case "weaponsAir":{_infoArray = ["vehAmmo","Air","Extra Ammo"]};
	case "thermal":{_infoArray = ["thermal","ALL","Thermal Upgrade"]};
	case "airBags":{_infoArray = ["airBags","ALL","100 Airbags"]};
	case "insurance":{_infoArray = ["insuranceSpecial","ALL","1x Insurance"]};
	};
if(_infoArray isEqualTo [])exitwith{};
_vehicle = cursorTarget;
if((cursorTarget isKindOf "Air")&&((_this select 0) in ["vehAmmo","weaponsLand"]))exitwith{hint "This item is not usable on your current target"};
if((!(cursorTarget isKindOf "Ship"))&&(!(cursorTarget isKindOf "LandVehicle"))&&(!(cursorTarget isKindOf "Air")))exitwith{hint "This item is not usable on your current target"};
if((!(cursorTarget isKindOf "Ship"))&&(!(cursorTarget isKindOf "LandVehicle"))&&((_this select 0) in ["vehNos","vehNosAdv"]))exitwith{hint "You can not use this on your current target"};
//if((_vehicle getVariable [(_infoArray select 0),false])&&((_infoArray select 0) != "nitro"))exitwith{hint format ["This vehicle already has a %1 upgrade",(_infoArray select 2)]};
DS_mining = true;
DS_doingStuff = true;
disableSerialization;
"progressBar" cutRsc ["DS_progress","PLAIN"];
_ui = uiNameSpace getVariable "DS_progress";
_progress = _ui displayCtrl 38201;
_pgText = _ui displayCtrl 38202;
_pgText ctrlSetText format["Upgrading Vehicle %2 (1%1)...","%",(_infoArray select 2)];
_progress progressSetPosition 0.01;
_cP = 0.01;
[(_this select 0),false,1] call DS_fnc_handleInventory;
[] call DS_fnc_compileData;

while {true} do
{
	sleep  0.2;
	_cP = _cP + 0.01;
	_progress progressSetPosition _cP;
	_pgText ctrlSetText format["Upgrading Vehicle %3(%1%2)...",round(_cP * 100),"%",(_infoArray select 2)];
	if(_cP >= 1) exitWith {};
	if(!alive player) exitWith {};
	if(!isNull objectParent player) exitWith {};
};

"progressBar" cutText ["","PLAIN"];
DS_mining = false;
DS_doingStuff = false;
if(!alive player) exitWith {};
if(!isNull objectParent player) exitWith {};
titleText [format["Your vehicle's %1 has now been upgraded",(_infoArray select 2)],"PLAIN"];

if(_exit)exitwith{[(_this select 0),true,1] call DS_fnc_handleInventory;};

if((_infoArray select 0) == "vehAmmo")then {
	if(_vehicle getVariable ["vehAmmo",false])then {
		_vehicle setVariable ["vehAmmo",false,true];
		hint "This vehicle already had an ammo upgrade, because of this the current upgrade has been removed";
		[_vehicle] spawn DS_fnc_clearVehAmmo;
		_exit = true;
	};
};

if((_this select 0) != "airBags")then
	{
	_vehicle setVariable [(_infoArray select 0),true,true];
	};
switch(_this select 0)do
	{
	case "thermal":
		{
		_vehicle disableTIEquipment false;
		};
	case "vehNos":
		{
		_vehicle setVariable ["nitro",5,true];
		};
	case "vehNosAdv":
		{
		_vehicle setVariable ["nitro",10,true];
		};
	};
if((_infoArray select 0) == "vehWeightAdv")then
	{
	_vehicle setVariable ["vehWeight",false,true];
	};
if((_infoArray select 0) == "vehAmmo")then
	{
	[_vehicle] spawn DS_fnc_clearVehAmmo;
	};
if((_this select 0) == "airBags")then
	{
	_currentAirBags = (_vehicle getVariable ["airBags",0]);
	if((DS_infoArray select 13) > 37)then {
		_currentAirBags = _currentAirBags + 400;
	} else {
		_currentAirBags = _currentAirBags + 200;
	};
	_vehicle setVariable ["airBags",_currentAirBags,true];
	};
if((_infoArray select 0) == "insuranceSpecial")then
	{
	if((!(_vehicle getVariable ["insurance1",false]))&&(!(_vehicle getVariable ["insurance2",false])))then
		{
		_vehicle setVariable ["insurance1",true,true];
		}
		else
		{
		if(_vehicle getVariable ["insurance1",false])then
			{
			_vehicle setVariable ["insurance2",true,true];
			_vehicle setVariable ["insurance1",false,true];
			};
		};
	};
if(((_this select 0) == "vehNos")||((_this select 0) == "vehNosAdv"))exitwith{};
[_vehicle] remoteExec ["HUNT_fnc_vehQuickSave",2];
if(((_infoArray select 0) == "vehAmmo")&&((DS_infoArray select 17) == 41))then { [2] call DS_fnc_questCompleted };