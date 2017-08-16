/*
			Author: Shawn "Huntah" Macgillivray
	
			Description:
			Take money bags from bank safe
*/
private ["_newVal","_copScore"];

if(player distance fed_bank > 6) exitwith {hint 'You are too far from the safe';};
if((side player) == west) exitwith {};
if(repairBank1 getVariable ["closed",false])exitwith{hint "You can only take bags of money when the doors have been blown open"};
if(DS_doingStuff)exitwith{};

if((gasMoneyArray select 14) == 0) exitwith 
	{
	_str = parseText "<t color='#FF0000' size='1.5'><br/>The safe is empty<br/></t>";
	hint _str;
	systemchat "The safe is empty";
	};
	
_infoArray = [];
_copScore = [] call DS_fnc_getCopScore;
	
if(_copScore < 25)then
	{
	_infoArray = [2,"Small bag of Cash","goldBar"];
	};
if((_copScore > 24)&&(_copScore < 50))then
	{
	_infoArray = [4,"Medium bag of Cash","goldBarMedium"];
	};
if(_copScore > 49)then
	{
	_infoArray = [8,"Large bag of Cash","goldBarLarge"];
	};
	
if(_infoArray isEqualTo [])exitwith{hint "Some counting cops score error.... ";};
	
if((DS_currentWeight + (_infoArray select 0)) > DS_maxWeight)exitwith{hint format ["You need %1 kg's of free space to carry each bag of this size",(_infoArray select 0)];};

DS_doingStuff = true;
hint 'Searching for bags of money';
player playMove "AinvPknlMstpSnonWnonDnon_medic_1";
sleep 5;
player playMove "AinvPknlMstpSnonWnonDnon_medic_1";
sleep 5;
player playMove "AinvPknlMstpSnonWnonDnon_medic_1";
sleep 5;
if((DS_currentWeight + (_infoArray select 0)) > DS_maxWeight)exitwith{hint format ["You need %1 kg's of free space to carry each bag of this size",(_infoArray select 0)];DS_doingStuff = false;};
if((gasMoneyArray select 14) == 0) exitwith 
	{
	_str = parseText "<t color='#FF0000' size='1.5'><br/>The safe is empty<br/></t>";
	hint _str;systemchat "The safe is empty";
	DS_doingStuff = false;
	};
		
[(_infoArray select 2),true,1] call DS_fnc_handleInventory;
_newVal = ((gasMoneyArray select 14) - 1);
gasMoneyArray set[14,_newVal];
publicVariable "gasMoneyArray";
_str = parseText format ["<t color='#01DF01' size='1.5'><br/>You have taken 1 %1, take it to a rebel trader for cash<br/></t>",(_infoArray select 1)];
hint _str;
systemchat format ["<t color='#01DF01' size='1.5'><br/>You have taken 1 %1, take it to a rebel trader for cash<br/></t>",(_infoArray select 1)];
[10,false] spawn DS_fnc_moralAlter;
if((DS_infoArray select 17) == 16)then
	{
	[2] spawn DS_fnc_questCompleted;
	};
DS_doingStuff = false;	
