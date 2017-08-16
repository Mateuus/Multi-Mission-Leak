/*
	Author: Shawn "Huntah" Macgillivray
	
	Description:
	Defuses a player places IED (Cops and Civs)
*/

private["_obj","_val","_pos","_ied"];

_ied = (nearestobjects [getpos player, ["Land_JunkPile_F","Land_GarbagePallet_F","Land_JunkPile_F","Land_GarbageWashingMachine_F","Land_Tyres_F"],  4] select 0);
if(isNil "_ied")exitwith{hint "You are not close enough to an IED to defuse it"};
if(!(_ied getVariable ["ied",false]))exitwith{hint "This is not an IED"};
_pos = (position _ied);
if(DS_doingStuff) exitWith {};

if((playerside != west)&&((DS_maxWeight - DS_currentWeight) < 20))exitwith{hint "You need 20kg's of spare weight to defuse this"};

DS_doingStuff = true;

	_ied setVariable ["defusing",true,true];
	_upp = "Defusing Explosive";
	disableSerialization;
	5 cutRsc ["DS_progress","PLAIN"];
	_ui = uiNameSpace getVariable "DS_progress";
	_progress = _ui displayCtrl 38201;
	_pgText = _ui displayCtrl 38202;
	_pgText ctrlSetText format["%2 (1%1)...","%",_upp];
	_progress progressSetPosition 0.01;
	_cP = 0.01;
			
	while{true} do
		{
		sleep 0.1;
		_cP = _cP + 0.01;
		_progress progressSetPosition _cP;
		_pgText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_upp];
		if(_cP >= 1) exitWith {};
		if(!alive player) exitWith {};
		if(player != vehicle player) exitWith {};
		if(player distance _pos > 10)exitwith {};
		};
		
		5 cutText ["","PLAIN"];
		player playActionNow "stop";
	
	DS_doingStuff = false;
	if(!alive player)exitwith{};
	if(player != vehicle player) exitWith {};	
	if(player distance _pos > 10)exitwith {hint "You moved too far away";};
	
if((playerside != west)&&((DS_maxWeight - DS_currentWeight) < 20))exitwith{hint "You need 20kg's of spare weight to defuse this"};

if(playerside == west)then
	{
	hint "Great work, for defusing this IED you have been paid $10,000";
	systemChat "Great work, for defusing this IED you have been paid $10,000";
	[10000,true,true] call DS_fnc_handleMoney;
	[[10000,true],"HUNT_fnc_policeBank",false,false] spawn DS_fnc_MP;
	[100,true] call DS_fnc_moralAlter;
	}
	else
	{
	hint "Good work, you've defused the IED and it has been added to your inventory";
	systemChat "Good work, you've defused the IED and it has been added to your inventory";
	["ied",true,1] call DS_fnc_handleInventory;
	};

deleteVehicle _ied;

