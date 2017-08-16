#include "..\..\script_macros.hpp"
/*
	File: fn_blacklistShootCop.sqf
	Author: RPGforYOU
	Website: www.outlawed-veterans.com
 
	Description: Auto Blacklists excessive cop killers.
*/
//Check the variable blacklist and if nil it will give it 0 otherwise increase (per kill)
if (isNil "life_blacklist") then {life_blacklist = 0;} else {life_blacklist = life_blacklist + 1;};
if(playerSide in [independent,civilian]) exitWith {}; 

// 1 st warning
if (life_blacklist isequalto 0) then {
if(FETCH_CONST(life_adminlevel) isequalto 5) exitWith {};
titleText [localize "STR_Cop_Kill","PLAIN"];
hint parseText format["<t color='#FFFFFF'><t align='center'><t size='1'><t color='#FF0000'><t size ='2.5'<t align='center'>STOP<br/><t color='#FFFFFF'><t align='center'><t size='1.5'>COPS<br/><t color='#FFFFFF'><t align='center'><t size='1.5'>DO NOT<br/><t color='#FFFFFF'><t align='center'><t size='1.5'>KILL<br/><t color='#FFFFFF'><t align='center'><t size='1.5'>COPS<br/>"];
};

// 2 nd warning
if (life_blacklist isequalto 1) then {

if(FETCH_CONST(life_adminlevel) isequalto 5) exitWith {};
titleText [localize "STR_Cop_Kill2","PLAIN"];
hint parseText format["<t color='#FFFFFF'><t align='center'><t size='1'><t color='#FF0000'><t size ='2.5'<t align='center'>STOP<br/><t color='#FFFFFF'><t align='center'><t size='1.5'>COPS<br/><t color='#FFFFFF'><t align='center'><t size='1.5'>DO NOT<br/><t color='#FFFFFF'><t align='center'><t size='1.5'>KILL<br/><t color='#FFFFFF'><t align='center'><t size='1.5'>COPS<br/>"];
};

// 3 kills = blacklisted
if (life_blacklist >= 2) then {
if(FETCH_CONST(life_adminlevel) isequalto 5) exitWith {};
titleText [localize "STR_Cop_Kill3","PLAIN"];
hint parseText format["<t color='#FFFFFF'><t align='center'><t size='1'><t color='#FF0000'><t size ='2.5'<t align='center'>ATTENTION<br/><t color='#FFFFFF'><t align='center'><t size='1.5'>YOU<br/><t color='#FFFFFF'><t align='center'><t size='1.5'>ARE<br/><t color='#FFFFFF'><t align='center'><t size='1.5'>BLACKLISTED<br/>"];
[8] call SOCK_fnc_updatePartial;
UiSleep 1;
["Blacklisted",false,true] call BIS_fnc_endMission;
};
