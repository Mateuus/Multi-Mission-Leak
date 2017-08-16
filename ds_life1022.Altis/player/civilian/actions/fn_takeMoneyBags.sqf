/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Take money bags from bank safe
*/

private ["_str","_infoArray","_copScore","_infoArray","_newVal"];

if(DS_securityOpenedDoors)exitWith{hint "Because the doors were not blown open the computer that locks this safe is still intact and you can not open it"};
if(player distance fed_bank > 6)exitWith{hint 'You are too far from the safe';};
if(playerSide isEqualTo west)exitWith{};
if(repairBank1 getVariable ["closed",false])exitWith{hint "You can only take bags of money when the doors have been blown open"};
if(DS_doingStuff)exitWith{};

if((gasMoneyArray select 14) == 0) exitWith {
	_str = parseText "<t color='#FF0000' size='1.5'><br/>The safe is empty<br/><br/></t>";
	hint _str;
	systemChat "The safe is empty";
};

_infoArray = [];
_copScore = [] call DS_fnc_getCopScore;
if(miscInfoArray select 8)then{_copScore = 500};

if(_copScore < 25)then{_infoArray = [2,"Small bag of Cash","goldBar"];};
if((_copScore > 24)&&(_copScore < 50))then{_infoArray = [4,"Medium bag of Cash","goldBarMedium"];};
if(_copScore > 49)then{_infoArray = [8,"Large bag of Cash","goldBarLarge"];};

if(_infoArray isEqualTo [])exitWith{hint "Some counting cops score error...";};

if((DS_currentWeight + (_infoArray select 0)) > DS_maxWeight)exitWith{hint format ["You need %1 kg's of free space to carry each bag of this size",(_infoArray select 0)];};

DS_doingStuff = true;

hint "Searching for bags of money";
player playMove "AinvPknlMstpSnonWnonDnon_medic_1";
sleep 5;
if((DS_infoArray select 17) < 38)then {
	player playMove "AinvPknlMstpSnonWnonDnon_medic_1";
	sleep 5;
	player playMove "AinvPknlMstpSnonWnonDnon_medic_1";
	sleep 5;
};

if(!alive player)exitWith{};

if((DS_currentWeight + (_infoArray select 0)) > DS_maxWeight)exitWith{hint format ["You need %1 kg's of free space to carry each bag of this size",(_infoArray select 0)];DS_doingStuff = false;};
if((gasMoneyArray select 14) == 0)exitWith {
	_str = parseText "<t color='#FF0000' size='1.5'><br/>The safe is empty<br/></t>";
	hint _str;
	systemChat "The safe is empty";
	DS_doingStuff = false;
};

[(_infoArray select 2),true,1] call DS_fnc_handleInventory;

_newVal = ((gasMoneyArray select 14) - 1);
gasMoneyArray set [14,_newVal];
publicVariable "gasMoneyArray";

_str = parseText format ["<t color='#01DF01' size='1.5'><br/>You have taken 1 %1, take it to a rebel trader for cash<br/></t>",(_infoArray select 1)];
hint _str;
systemChat format ["You have taken 1 %1, take it to a rebel trader for cash",(_infoArray select 1)];

[10,false] spawn DS_fnc_moralAlter;

DS_doingStuff = false;

if(DS_tokenMission == 1)then {
	DS_tokenMission = -1;
	[150,name player,false] spawn DS_civ_payTokens;
	DS_rebelMissionToken = false;
};

if((DS_infoArray select 17) == 16)then{[2] call DS_fnc_questCompleted};
if((DS_infoArray select 17) == 37)then {
	_tempNum = (DS_infoArray select 18) + 1;
	if(_tempNum > 9)then {
		[2] call DS_fnc_questCompleted;
	} else {
		DS_infoArray set [18,_tempNum];
	};
};