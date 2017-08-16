/*
	File: fn_jerryRefuel.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Refuels the vehicle if the player has a fuel can.
*/
private["_vehicle","_displayName","_upp","_ui","_progress","_pgText","_cP","_previousState","_refill","_fuelCan","_fuel"];
_vehicle = cursorTarget;
_fuelCan = _this select 0;
eM_interrupted = false;
if(isNull _vehicle) exitWith {};
if(!(_vehicle isKindOF "LandVehicle") && !(_vehicle isKindOf "Air") && !(_vehicle isKindOf "Ship")) exitWith {};
if(player distance _vehicle > 7.5) exitWith {hint "Du musst näher an das Fahrzeug!"};

eM_action_inUse = true;
_displayName = getText(configFile >> "CfgVehicles" >> (typeOf _vehicle) >> "displayName");
if(currentWeapon player != "") then
{
	EMonkeys_curWep_h = currentWeapon player;
	player action ["SwitchWeapon", player, player, 100];
};

_upp = format["Betanke %1",_displayName];
//Setup our progress bar.
disableSerialization;
5 cutRsc ["EMonkeys_progress","PLAIN"];
_ui = uiNameSpace getVariable "EMonkeys_progress";
_progress = _ui displayCtrl 38201;
_pgText = _ui displayCtrl 38202;
_pgText ctrlSetText format["%2 (1%1)...","%",_upp];
_progress progressSetPosition 0.01;
_cP = 0.01;

["AinvPknlMstpsnonWnonDnon_medic_1",0.4] execFSM "core\fsm\moveLoop.fsm";
while{true} do
{
	if(animationState player == "AinvPknlMstpsnonWnonDnon_medic_1") then
	{
		_cP = _cP + 0.01;
		_progress progressSetPosition _cP;
		_pgText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_upp];
	};
	if(_cP >= 1) exitWith {};
	if(((!alive player) || (player getVariable["onkill",FALSE]))) exitWith {};
	if(eM_interrupted) exitWith {};
	uisleep 0.2;
};
eM_action_inUse = false;
EMonkeys_ExitMoveLoop = true;
player playMoveNow "AmovPercMstpSrasWrflDnon_AmovPercMstpSlowWrflDnon";
5 cutText ["","PLAIN"];
if(!isNil "EMonkeys_curWep_h" && {(EMonkeys_curWep_h != "")}) then
{
	if(EMonkeys_curWep_h in [primaryWeapon player,secondaryWeapon player,handgunWeapon player]) then
	{
		player selectWeapon EMonkeys_curWep_h;
	};
};
if(((!alive player) || (player getVariable["onkill",FALSE]))) exitWith {};
if(eM_interrupted) exitWith {eM_interrupted = false;
titleText["Auffüllen abgebrochen","PLAIN"];};

_fuelCap = getNumber(missionConfigFile >> "CfgVehicles" >> (typeOf _Vehicle) >> "fuelCapicity");
_refill = (((fuel _vehicle) * _fuelCap) + 10) / (_fuelCap);
switch (_fuelCan) do
{
	case "fuelcan_super": {_fuel = "super";};
	case "fuelcan_superplus": {_fuel= "superplus";};
	case "fuelcan_diesel": {_fuel = "diesel";};
	case "fuelcan_biodiesel": {_fuel = "biodiesel";};
	case "fuelcan_kerosin": {_fuel = "kerosin";};
};

switch (true) do
{
	case (_vehicle isKindOF "LandVehicle"):
	{
		if(!local _vehicle) then
		{
			[[_vehicle,_refill],"EMonkeys_fnc_setFuel",_vehicle,false] call EMonkeys_fnc_mp;
			_vehicle setVariable ["vehicle_fuellocation",_fuel,true];
		}
			else
		{
			_vehicle setFuel _refill;
			_vehicle setVariable ["vehicle_fuellocation",_fuel,true];
		};
	};
	
	case (_vehicle isKindOf "Air"):
	{
		if(!local _vehicle) then
		{
			[[_vehicle,_refill],"EMonkeys_fnc_setFuel",_vehicle,false] call EMonkeys_fnc_mp;
			_vehicle setVariable ["vehicle_fuellocation",_fuel,true];
		}
			else
		{
			_vehicle setFuel ((Fuel _vehicle) + 0.2);
			_vehicle setVariable ["vehicle_fuellocation",_fuel,true];
		};
	};
	
	case (_vehicle isKindOf "Ship"):
	{
		if(!local _vehicle) then
		{
			[[_vehicle,_refill],"EMonkeys_fnc_setFuel",_vehicle,false] call EMonkeys_fnc_mp;
			_vehicle setVariable ["vehicle_fuellocation",_fuel,true];
		}
			else
		{
			_vehicle setFuel _refill;
			_vehicle setVariable ["vehicle_fuellocation",_fuel,true];
		};
	};
};

[false,_fuelCan,1] call EMonkeys_fnc_handleInv;
[true,"fuelE",1] call EMonkeys_fnc_handleInv;
titleText[format["Du hast Benzin/Diesel in deinem %1 nachgefüllt.",_displayName],"PLAIN"];