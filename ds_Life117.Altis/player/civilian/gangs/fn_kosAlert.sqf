/*
Darkside Life

Author: Shawn "Huntah" Macgillivray

Description:
	Alerts people of someone sneaking into KOS zone while they own it
*/

private ["_group","_gangName"];

if(playerside != civilian)exitwith{};

_group = shawn1 getVariable ["gangOwner",grpNull];
if(_group != (group player)) exitWith {};

if((getPlayerUID player in DS_clanBase1)&&(!(baseClan1 getVariable ["baseKos",false])))exitwith{};
if((getPlayerUID player in DS_clanBase2)&&(!(baseClan2 getVariable ["baseKos",false])))exitwith{};
if((getPlayerUID player in DS_clanBase3)&&(!(baseClan3 getVariable ["baseKos",false])))exitwith{};
if((getPlayerUID player in DS_clanBase4)&&(!(baseClan4 getVariable ["baseKos",false])))exitwith{};
if((getPlayerUID player in DS_clanBase5)&&(!(baseClan5 getVariable ["baseKos",false])))exitwith{};
if((getPlayerUID player in DS_clanBase6)&&(!(baseClan6 getVariable ["baseKos",false])))exitwith{};

if((!(getPlayerUID player in DS_clanBase1))&&(!(getPlayerUID player in DS_clanBase2))&&(!(getPlayerUID player in DS_clanBase3))&&(!(getPlayerUID player in DS_clanBase4))&&(!(getPlayerUID player in DS_clanBase5))&&(!(getPlayerUID player in DS_clanBase6)))exitWith
	{};

hint "A Rebel is attempting to capture the KOS capture point";
systemchat "A Rebel is attempting to capture the KOS capture point"; 
titleText ["A Rebel is attempting to capture the KOS capture point","PLAIN"];
player say3D "fail";

