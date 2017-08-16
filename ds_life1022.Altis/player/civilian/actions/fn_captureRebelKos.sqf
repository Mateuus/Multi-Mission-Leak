/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Used by rebels to capture the rebel KOS zone
*/

private ["_group","_gangName","_sleep"];

_group = shawn1 getVariable ["gangOwner",grpNull];
_gangName = (group player) getVariable ["gangName",""];

if(_gangName isEqualTo "")exitwith{hint "You must be in a gang to capture this hideout";};
if(_group isEqualTo (group player))exitWith{hint "Your gang already owns this area";};
if(shawn1 getVariable ["inCapture",false])exitWith{hint "This is already being captured";};
if(DS_doingStuff)exitwith{};
DS_doingStuff = true;
[] spawn {
	sleep 10;
	DS_doingStuff = false;
};

_sleep = if((DS_infoArray select 15) > 35)then{1200}else{1800};

if(DS_item_quickCap > 0)then {
	["quickCap",false,1] call DS_fnc_handleInventory;
	_sleep = 900;
	hint "Quick KOS Capper used";
	sleep 2;
};

if(isServer)then{_sleep = 10};

[_sleep,player] remoteExec ["HUNT_fnc_rebelKos",2];

_group = shawn1 getVariable ["gangOwner",grpNull];
if(!isNull _group)then {
	[] remoteExec ["DS_fnc_kosAlert",_group];
};