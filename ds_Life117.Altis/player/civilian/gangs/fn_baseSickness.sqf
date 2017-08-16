/*
Darkside Life

Author: Shawn "Huntah" Macgillivray

Description:
	Updates the gang members list
*/

private["_clan","_infoArray","_action"];

_clan = (_this select 0);

if(!(_clan getVariable ["baseSickness",false]))exitwith{hint "You do not have this upgrade"};
if(DS_doingStuff)exitwith{};
DS_doingStuff = true;
hint "The doctor is taking a look over you, please wait.......";
systemchat "The doctor is taking a look over you, please wait.......";
sleep 5;
player setDamage 0;
DS_doingStuff = false;
hint "You are now fully healed";
if(!(player getVariable ["DS_sick_infection",false]))exitwith{};
player setVariable ["DS_sick_infection",false,true];
[12] call DS_fnc_alterStats;
[] call DS_fnc_compileData;
player enableFatigue false;
