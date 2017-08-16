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
if(isNil {DS_bailValue}) then {DS_bailValue = 666;};
if(!(DS_jail_info select 5)) exitWith {hint "You must serve at least half of your sentence before paying a bail.";
systemchat "You must serve at least half of your sentence before paying a bail.";
};
if([DS_bailValue,true] call DS_fnc_checkMoney) exitWith {systemchat "You do not have enough money in your bank to pay this bail.";};
DS_doingStuff = true;
[DS_bailValue,true,false] spawn DS_fnc_handleMoney;

_civ = player;

[[DS_bailValue,true],"HUNT_fnc_policeBank",false,false] spawn DS_fnc_MP;
[[DS_bailValue,_civ],"DS_fnc_bailPaid",true,false] spawn DS_fnc_MP;

DS_bailValue = 0;
if((DS_infoArray select 15) == 11)then
	{
	[1] call DS_fnc_questCompleted;
	};
	
	sleep 3;
	DS_doingStuff = false;