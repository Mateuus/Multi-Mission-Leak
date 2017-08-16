/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	When player pays bail while in jail
*/

private["_civ"];
_civ = _this select 1;

if(DS_doingStuff)exitwith{};
if(!DS_jailed) exitwith {};
if(isNil "DS_bailValue") then {DS_bailValue = 666;};
if(!(DS_jail_info select 5)) exitWith {hint "You must serve at least half of your sentence before paying a bail.";
systemchat "You must serve at least half of your sentence before paying a bail.";
};
if([DS_bailValue,true] call DS_fnc_checkMoney) exitWith {systemchat "You do not have enough money in your bank to pay this bail.";};
DS_doingStuff = true;
[DS_bailValue,true,false] spawn DS_fnc_handleMoney;

_civ = name player;

[DS_bailValue,true] remoteExec ["HUNT_fnc_policeBank",2];
[DS_bailValue,_civ] remoteExecCall ["DS_fnc_bailPaid",west];

DS_bailValue = 0;
sleep 5;
DS_doingStuff = false;

if((DS_infoArray select 15) == 11)then { [1] call DS_fnc_questCompleted };