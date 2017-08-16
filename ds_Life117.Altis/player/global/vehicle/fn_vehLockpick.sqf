/*
Darkside Life

Author: Shawn "Huntah" Macgillivray

Description:
	Lockpicks a vehicle
*/

private ["_upgraded","_vehicle","_vehicleString","_sleep","_isValid","_progress","_ui","_chance"];

if((player distance (getMarkerPos "auctionHouse") < 300)||(player distance (getMarkerPos "civ_spawn_1") < 800))exitwith{hint "You can not use this item in this area"};
closeDialog 0;
if(player != vehicle player) exitWith {};
_vehicle = DS_cursorTarget;
DS_moved = false;
_isValid = false;
DS_doingStuff = true;
_sleep = 0.12;//Alter later on for moral and mechanics
_chance = random 100;
_upgraded = _vehicle getVariable ["security",false];
if(_upgraded)then
	{
	_sleep = 0.3;
	_chance = random 60;
	};
if((DS_infoArray select 15) > 26)then{_sleep = (_sleep*0.7);};
_pods = ["Land_Pod_Heli_Transport_04_fuel_F","Land_Pod_Heli_Transport_04_box_F","Land_Pod_Heli_Transport_04_covered_F","Land_Pod_Heli_Transport_04_medevac_F","Land_Pod_Heli_Transport_04_repair_F",
				"B_Slingload_01_Cargo_F","B_Slingload_01_Medevac_F","B_Slingload_01_Repair_F","B_Slingload_01_Fuel_F"]; 
if((_vehicle isKindOf "Car")||(_vehicle isKindOf "Air")||(_vehicle isKindOf "Ship")||(_vehicle isKindOf "Tank")||(typeOf _vehicle in _pods))then
	{
	_isValid = true;
	};
if(!_isValid)exitwith{DS_doingStuff = false;hint "This is an invalid vehicle type"};
if(player distance _vehicle > 7)exitwith{DS_doingStuff = false;};
if(_vehicle in DS_keyRing)exitwith{DS_doingStuff = false;hint "You already have the key to this vehicle"};

_vehicleString = getText(configFile >> "CfgVehicles" >> (typeOf _vehicle) >> "displayName");
_upp = format["Lock picking %1",_vehicleString];
disableSerialization;
5 cutRsc ["DS_progress","PLAIN"];
_ui = uiNameSpace getVariable "DS_progress";
_progress = _ui displayCtrl 38201;
_pgText = _ui displayCtrl 38202;
_pgText ctrlSetText format["%2 (1%1)...","%",_upp];
_progress progressSetPosition 0.01;
_cP = 0.01;

[]spawn 
	{
	while{true}do
		{
		if(!DS_doingStuff)exitwith{};
		{
			if(player distance _x < 100)then
				{
				[[player,"lockpick"],"DS_fnc_playSounds"] spawn DS_fnc_MP;
				};
		}forEach playableUnits;
		sleep 2.5;
		};
	};
[[player,"AinvPknlMstpSnonWnonDnon_medicUp3"],"DS_fnc_animSync",true,false] spawn DS_fnc_MP;
player playMoveNow "AinvPknlMstpSnonWnonDnon_medicUp3";		
while{true} do
	{
	sleep _sleep;
	_cP = _cP + 0.01;
	_progress progressSetPosition _cP;
	_pgText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_upp];
	if(_cP >= 1) exitWith {};
	if(!alive player) exitWith {};
	if(player != vehicle player) exitWith {};
	if(DS_moved) exitWith {};
	};
DS_doingStuff = false;
5 cutText ["","PLAIN"];
player playActionNow "stop";
if(!alive player)exitwith{};
if(player != vehicle player) exitWith {hint "You must remain outside the vehicle to lock pick it"};
if(DS_moved) exitWith {DS_moved = false;hint "You must not move while lock picking a vehicle"};

if(_vehicle getVariable ["securityAdv",false])exitwith{hint "This vehicles security level prevents it from being lockpicked";systemchat "This vehicles security level prevents it from being lockpicked"};

if(_chance > 50)then
	{
	DS_keyRing pushBack _vehicle;
	titleText [format ["You have now got the keys to this %1",_vehicleString],"PLAIN"];
	if((DS_infoArray select 15) == 5)then
		{
		[1] call DS_fnc_questCompleted;
		};
	}
	else
	{
	titleText ["Your lock pick broke","PLAIN"];
	["lockpick",false,1] call DS_fnc_handleInventory;
	};







