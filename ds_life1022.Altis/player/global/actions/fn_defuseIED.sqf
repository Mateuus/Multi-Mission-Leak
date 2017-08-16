/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Defuses a player places IED (Cops and Civs)
*/

private["_ied","_pos"];

disableSerialization;

if((player getVariable ["restrained",false])||(DS_jailed))exitWith{hint "You can not defuse an IED while restrained"};

_ied = (nearestObjects [player,["Land_JunkPile_F","Land_GarbagePallet_F","Land_JunkPile_F","Land_GarbageWashingMachine_F","Land_Tyres_F"],4] select 0);
if(isNil "_ied")exitWith{hint "You are not close enough to an IED to defuse it"};
if(!(_ied getVariable ["ied",false]))exitWith{hint "This is not an IED"};
_pos = (getPos _ied);
if(DS_doingStuff)exitWith{};
if((!(playerSide isEqualTo west))&&((DS_maxWeight - DS_currentWeight) < 20))exitWith{hint "You need 20kg's of spare weight to defuse this"};

DS_doingStuff = true;

_ied setVariable ["defusing",true,true];
_upp = "Defusing Explosive";
"progressBar" cutRsc ["DS_progress","PLAIN"];
_ui = uiNameSpace getVariable "DS_progress";
_progress = _ui displayCtrl 38201;
_pgText = _ui displayCtrl 38202;
_pgText ctrlSetText format["%2 (1%1)...","%",_upp];
_progress progressSetPosition 0.01;
_cP = 0.01;

while{true}do {
	sleep 0.1;
	_cP = _cP + 0.01;
	_progress progressSetPosition _cP;
	_pgText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_upp];
	if(_cP >= 1)exitWith{};
	if(!alive player)exitWith{};
	if(!isNull objectParent player)exitWith{};
	if(player distance _pos > 10)exitWith{};
};

"progressBar" cutText ["","PLAIN"];
player playActionNow "stop";

DS_doingStuff = false;
if(!alive player)exitWith{};
if(!isNull objectParent player)exitWith{};
if(player distance _pos > 10)exitWith{hint "You moved too far away";};
if((!(playerSide isEqualTo west))&&((DS_maxWeight - DS_currentWeight) < 20))exitWith{hint "You need 20kg's of spare weight to defuse this"};

if(playerSide isEqualTo west)then {
	hint "Great work, for defusing this IED you have been paid $10,000";
	systemChat "Great work, for defusing this IED you have been paid $10,000";
	[10000,true,true] call DS_fnc_handleMoney;
	[10000,true] remoteExec ["HUNT_fnc_policeBank",2];
	[100,true] call DS_fnc_moralAlter;
} else {
	hint "Good work, you've defused the IED and it has been added to your inventory";
	systemChat "Good work, you've defused the IED and it has been added to your inventory";
	["ied",true,1] call DS_fnc_handleInventory;
};

deleteVehicle _ied;