/*
    Author: Niklas "Rappelkiste" Quenter
	File: fn_fillTempestDevice.sqf
	Server: e-Monkeys.com
    
    Description: Fill a Tempest Device
*/
private ["_vehicle1","_vehicle2","_fuel1","_fuel2"];
_vehicle1 = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_vehicle2 = nearestObject [player, "O_Truck_03_device_F"];
_max_vehicle1 = getNumber(missionConfigFile >> "CfgVehicles" >> (typeOf _vehicle1) >> "fuelCapicity");
_max_vehicle2 = getNumber(missionConfigFile >> "CfgVehicles" >> (typeOf _vehicle2) >> "fuelCapicity");
_fuel1 = ((fuel _vehicle1) * _max_vehicle1);
_fuel2 = ((fuel _vehicle2) * _max_vehicle2);

if(isNull _vehicle1) exitWith {};
if(isNull _vehicle2) exitWith {};
if(_vehicle1 getVariable "fueling") exitWith {["Fahrzeug Information",["Es wird bereits ein Tempest (Gerät)","oder eine Tankstelle betankt"],"#0090ff"] call EMonkeys_fnc_specialText;};
if(_fuel1 <= 30) exitWith {["Fahrzeug Information",["Das Tankfahrzeug ist schon zu leer"],"#0090ff"] call EMonkeys_fnc_specialText;};
if(_fuel2 >= _max_vehicle2) exitWith {["Fahrzeug Information",["Das Tempest (Gerät) ist schon voll"],"#0090ff"] call EMonkeys_fnc_specialText;};

_vehicle1 setVariable ["fueling",true,true];

disableSerialization;
5 cutRsc ["EMonkeys_progress","PLAIN"];
_ui = uiNameSpace getVariable "EMonkeys_progress";
_progress = _ui displayCtrl 38201;
_pgText = _ui displayCtrl 38202;
_pgText ctrlSetText format["Tempest (Gerät) wird aufgefüllt... (1 %1)..."," Liter"];
_progress progressSetPosition 0.01;

//Auftanken
while{true} do
{
	uisleep 0.25;
	_fuel2 = _fuel2 + 1;
	_fuel1 = _fuel1 - 1;
	_progress progressSetPosition (_fuel2 / _max_vehicle2);
	_pgText ctrlSetText format["Tempest (Gerät) wird aufgefüllt... (%1 %2)...",round(_fuel2),"Liter"];
	if(_fuel1 <= 20) exitWith {["Fahrzeug Information",["Das Tankfahrzeug ist nun zu leer"],"#0090ff"] call EMonkeys_fnc_specialText;};
	if(_fuel2 >= _max_vehicle2) exitWith {_fuel2 = _max_vehicle2; ["Fahrzeug Information",["Das Tempest(Gerät) ist nun voll getankt"],"#0090ff"] call EMonkeys_fnc_specialText;};
};
5 cutText ["","PLAIN"];

_fuel1 = _fuel1 / _max_vehicle1;
_fuel2 = _fuel2 / _max_vehicle2;

[[_vehicle1,_fuel1],"EMonkeys_fnc_setFuel",true,false] spawn EMonkeys_fnc_MP;
[[_vehicle2,_fuel2],"EMonkeys_fnc_setFuel",true,false] spawn EMonkeys_fnc_MP;
_vehicle1 setVariable ["fueling",nil,true];