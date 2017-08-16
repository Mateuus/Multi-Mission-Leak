/*
    Darkside Life

    Author: Shawn "Huntah" Macgillivray

    Description:
	Treats the players sickness
*/

private ["_clan","_infoArray","_action"];

_clan = (_this select 0);

if(!(_clan getVariable ["baseSickness",false]))exitWith{hint "You do not have this upgrade"};
if(DS_doingStuff)exitWith{};
if(_clan getVariable ["baseClosed",false])exitWith{hint "This base has been shut down by the police. Bases remain closed for 1 hour"};

DS_doingStuff = true;
hint "The doctor is taking a look over you, please wait...";
systemChat "The doctor is taking a look over you, please wait...";
sleep 5;
player setDamage 0;
DS_doingStuff = false;
hint "You are now fully healed";
if(!(player getVariable ["DS_sick_infection",false]))exitWith{};
player setVariable ["DS_sick_infection",false,true];
[12] call DS_fnc_alterStats;
[] call DS_fnc_compileData;
player enableFatigue false;