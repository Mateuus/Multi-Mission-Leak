#include "..\..\script_macros.hpp"
/*
	File: fn_medicshoot.sqf
	Author: RPGforYOU
	Website: www.outlawed-veterans.com
 
	Description: Discourages to kill medics
*/
private ["_time"];
if(playerSide in [independent,west]) exitWith {}; 
//Check the variable blacklist and if nil it will give it 0 otherwise increase (per kill)
if (isNil "life_medickil") then {life_medickil = 0;} else {life_medickil = life_medickil + 1;};
_time = 3;

// 1 st warning
if (life_medickil isEqualTo 0) then {
titleText [localize "STR_medic_Kill","PLAIN"];
hint parseText format["<t color='#FFFFFF'><t align='center'><t size='1'><t color='#FF0000'><t size ='2.5'<t align='center'>Watch your fire!<br/><t color='#FFFFFF'><t align='center'><t size='1.5'>Shooting<br/><t color='#FFFFFF'><t align='center'><t size='1.5'>medics<br/><t color='#FFFFFF'><t align='center'><t size='1.5'>cost you money:<br/><t color='#FFFFFF'><t align='center'><t size='1.5'>$ 100,000<br/>"];
if(BANK < 100000) then {
//Jail
titleText [localize "STR_medic_jail","PLAIN"];
uiSleep 2;
[0,"STR_medic_jail",true,[profileName]] remoteExecCall ["life_fnc_broadcast"];
[player,false] remoteExecCall ["life_fnc_jail",player];
} else {
BANK = BANK - 100000;
[1] call SOCK_fnc_updatePartial;
};
};

// 2 nd warning
if (life_medickil isEqualTo 1) then {
titleText [localize "STR_medic_Kill2","PLAIN"];
hint parseText format["<t color='#FFFFFF'><t align='center'><t size='1'><t color='#FF0000'><t size ='2.5'<t align='center'>Watch your fire!<br/><t color='#FFFFFF'><t align='center'><t size='1.5'>Shooting<br/><t color='#FFFFFF'><t align='center'><t size='1.5'>medics<br/><t color='#FFFFFF'><t align='center'><t size='1.5'>cost you money:<br/><t color='#FFFFFF'><t align='center'><t size='1.5'>$ 175,000<br/>"];
if(BANK < 175000) then {
//Jail
titleText [localize "STR_medic_jail","PLAIN"];
uiSleep 2;
[0,"STR_medic_jail",true,[profileName]] remoteExecCall ["life_fnc_broadcast"];
[player,false] remoteExecCall ["life_fnc_jail",player];
} else {
BANK = BANK - 175000;
[1] call SOCK_fnc_updatePartial;
};
};

// 3 rd warning
if (life_medickil isEqualTo 2) then {
titleText [localize "STR_medic_Kill3","PLAIN"];
hint parseText format["<t color='#FFFFFF'><t align='center'><t size='1'><t color='#FF0000'><t size ='2.5'<t align='center'>Watch your fire!<br/><t color='#FFFFFF'><t align='center'><t size='1.5'>Shooting<br/><t color='#FFFFFF'><t align='center'><t size='1.5'>medics<br/><t color='#FFFFFF'><t align='center'><t size='1.5'>cost you money:<br/><t color='#FFFFFF'><t align='center'><t size='1.5'>$ 250,000<br/>"];
if(BANK < 250000) then {
//Jail
titleText [localize "STR_medic_jail","PLAIN"];
uiSleep 2;
[0,"STR_medic_jail",true,[profileName]] remoteExecCall ["life_fnc_broadcast"];
[player,false] remoteExecCall ["life_fnc_jail",player];
} else {
BANK = BANK - 250000;
[1] call SOCK_fnc_updatePartial;
};
};

// 4 th warning
if (life_medickil isEqualTo 3) then {
titleText [localize "STR_medic_Kill4","PLAIN"];
hint parseText format["<t color='#FFFFFF'><t align='center'><t size='1'><t color='#FF0000'><t size ='2.5'<t align='center'>Watch your fire!<br/><t color='#FFFFFF'><t align='center'><t size='1.5'>Shooting<br/><t color='#FFFFFF'><t align='center'><t size='1.5'>medics<br/><t color='#FFFFFF'><t align='center'><t size='1.5'>cost you money:<br/><t color='#FFFFFF'><t align='center'><t size='1.5'>$ 500,000<br/>"];
if(BANK < 500000) then {
//Jail
titleText [localize "STR_medic_jail","PLAIN"];
uiSleep 2;
[0,"STR_medic_jail",true,[profileName]] remoteExecCall ["life_fnc_broadcast"];
[player,false] remoteExecCall ["life_fnc_jail",player];
} else {
BANK = BANK - 500000;
[1] call SOCK_fnc_updatePartial;
};
};

// 5 th warning
if (life_medickil isEqualTo 4) then {
titleText [localize "STR_medic_Kill5","PLAIN"];
hint parseText format["<t color='#FFFFFF'><t align='center'><t size='1'><t color='#FF0000'><t size ='2.5'<t align='center'>Watch your fire!<br/><t color='#FFFFFF'><t align='center'><t size='1.5'>Shooting<br/><t color='#FFFFFF'><t align='center'><t size='1.5'>medics<br/><t color='#FFFFFF'><t align='center'><t size='1.5'>cost you money:<br/><t color='#FFFFFF'><t align='center'><t size='1.5'>$ 1,000,000<br/>"];
if(BANK < 1000000) then {
//Jail
titleText [localize "STR_medic_jail","PLAIN"];
uiSleep 2;
[0,"STR_medic_jail",true,[profileName]] remoteExecCall ["life_fnc_broadcast"];
[player,false] remoteExecCall ["life_fnc_jail",player];
} else {
BANK = BANK - 1000000;
[1] call SOCK_fnc_updatePartial;
};
};

// more then >5 kills = 500,000 discouragement fee
if (life_medickil > 4) then {
titleText [localize "STR_medic_Kill999","PLAIN"];
hint parseText format["<t color='#FFFFFF'><t align='center'><t size='1'><t color='#FF0000'><t size ='2.5'<t align='center'>Watch your fire!<br/><t color='#FFFFFF'><t align='center'><t size='1.5'>Shooting<br/><t color='#FFFFFF'><t align='center'><t size='1.5'>medics<br/><t color='#FFFFFF'><t align='center'><t size='1.5'>cost you money:<br/><t color='#FFFFFF'><t align='center'><t size='1.5'>$ 2,000,000<br/>"];
if(BANK < 2000000) then {
//Jail
titleText [localize "STR_medic_jail","PLAIN"];
uiSleep 2;
[0,"STR_medic_jail",true,[profileName]] remoteExecCall ["life_fnc_broadcast"];
[player,false] remoteExecCall ["life_fnc_jail",player];
} else {
BANK = BANK - 2000000;
[1] call SOCK_fnc_updatePartial;
};
};