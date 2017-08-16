/*
	File: fn_fuelDart.sqf
	Author: Shawn "Huntah" Macgillivray
	
	Description:
	Fires at a chopper to reduce its fuel (So cops can catch crim's in the sky)
*/
private["_vehicle","_rand","_className","_maxRand","_driver","_miss","_reload","_fireTime","_distance"];
if(DS_dartFired) exitwith {hint 'Still reloading launcher';};
if(DS_moral < 500)then{_reload = 10;_fireTime = 6}else{_reload = 5;_fireTime = 3};
//if(currentWeapon player == "launch_B_Titan_short_F") then {_reload = 7;_fireTime = 3};

_miss = false;
_vehicle = cursorTarget;
if(isNull _vehicle) then {_miss = true;};
if((!(_vehicle isKindOf "Air"))&&(!(_vehicle isKindOf "Car"))) then {_miss = true;};
//if(((getPos (_vehicle) select 2) < 6)&&(!_miss)) exitwith {hint 'Too low to shot!';};
if(_vehicle isKindOf "Air")then{_distance = 600;}else{_distance = 100;};
if((DS_infoArray select 21) > 11)then{_distance = _distance + 200};
if(player distance _vehicle > _distance) then {_miss = true;};
if(DS_item_fuelDart < 1) exitwith {hint 'You have no fuel darts in your inventory';};
DS_dartFired = true;
["fuelDart",false,1] call DS_fnc_handleInventory;

_driver = (crew _vehicle);
if(count(_driver) > 0)then
	{
	_driver = (_driver select 0);
	}
	else
	{
	_miss = true;
	};

if(_miss) exitwith
	{
	[[player,"fuelDart"],"DS_fnc_playSounds"] spawn DS_fnc_MP;
	sleep _fireTime;
	hint "Your shot missed";
	sleep _reload;
	hint 'Launcher cleared to re-fire';
	DS_dartFired = false;
	};

[[player,"fuelDart"],"DS_fnc_playSounds"] spawn DS_fnc_MP;
sleep _fireTime;
if(cursorTarget != _vehicle) exitwith {hint "Your shot missed";DS_dartFired = false;};
if(player distance _vehicle > _distance) exitwith {hint "Your shot missed";DS_dartFired = false;};
[[false],"DS_fnc_fuelDartPlayer",_driver,false] spawn BIS_fnc_MP;
hint "Direct Hit";
/*
if(_vehicle isKindOf "Car")then
	{
	if(_vehicle getVariable ["fuelAdv",false])then
		{
		[[[_vehicle],{(_this select 0) setFuel ((Fuel (_this select 0)) - 0.2);}],"BIS_fnc_spawn",_vehicle,false] spawn BIS_fnc_MP;
		}
		else
		{
		[[[_vehicle],{(_this select 0) setFuel ((Fuel (_this select 0)) - 0.5);}],"BIS_fnc_spawn",_vehicle,false] spawn BIS_fnc_MP;
		};
	}
	else
	{
	if(_vehicle getVariable ["fuelAdv",false])then
		{
		[[[_vehicle],{(_this select 0) setFuel ((Fuel (_this select 0)) - 0.3);}],"BIS_fnc_spawn",_vehicle,false] spawn BIS_fnc_MP;
		}
		else
		{
		[[[_vehicle],{(_this select 0) setFuel 0.02;}],"BIS_fnc_spawn",_vehicle,false] spawn BIS_fnc_MP;
		};
	};
*/
sleep _reload;
hint 'Launcher cleared to re-fire';
DS_dartFired = false;
