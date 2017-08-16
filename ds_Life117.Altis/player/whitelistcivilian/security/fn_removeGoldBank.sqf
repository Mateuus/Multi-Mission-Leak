/*
			Author: Shawn "Huntah" Macgillivray
	
			Description:
			Take money bags from bank safe (Security Guards)
*/
private ["_newVal"];

if(player distance fed_bank > 6) exitwith {hint 'You are too far from the safe';};
if((side player) == west) exitwith {};
//if(repairBank1 getVariable ["closed",false])exitwith{hint "You can only remove bags of money when the doors are open"};
if(DS_doingStuff)exitwith{};
if([getPos player,45,civilian] call DS_fnc_nearbyPlayers) exitWith {titleText["You can not remove money when a civilian is so nearby","PLAIN"];};
if((gasMoneyArray select 14) < 3) exitwith 
	{
	_str = parseText "<t color='#FF0000' size='1.5'><br/>The safe is empty<br/></t>";
	hint _str;
	systemchat "The safe is empty";
	};

		
DS_doingStuff = true;
hint 'Collecting bags of money';
player playMove "AinvPknlMstpSnonWnonDnon_medic_1";
sleep 5;
player playMove "AinvPknlMstpSnonWnonDnon_medic_1";
sleep 5;
player playMove "AinvPknlMstpSnonWnonDnon_medic_1";
sleep 5;
player playMove "AinvPknlMstpSnonWnonDnon_medic_1";
sleep 5;
player playMove "AinvPknlMstpSnonWnonDnon_medic_1";
sleep 5;
if((gasMoneyArray select 14) == 0) exitwith 
	{
	_str = parseText "<t color='#FF0000' size='1.5'><br/>The safe is empty<br/></t>";
	hint _str;systemchat "The safe is empty";
	DS_doingStuff = false;
	};
		
[10000,false,true] call DS_fnc_handleMoney;
hint "You have been paid $10k for removing a bag of cash";
systemChat "You have been paid $10k for removing a bag of cash";
_newVal = ((gasMoneyArray select 14) - 1);
gasMoneyArray set[14,_newVal];
publicVariable "gasMoneyArray";
[10,true] spawn DS_fnc_moralAlter;
DS_doingStuff = false;	

if((DS_infoArray select 19) == 4)then
	{
	[3] call DS_fnc_questCompleted;
	};
if((DS_infoArray select 19) == 14)then
	{
	_tempNum = DS_infoArray select 20;
	_tempNum = _tempNum + 1;
	DS_infoArray set [20,_tempNum];
	if((DS_infoArray select 20) > 4)then
		{
		[3] call DS_fnc_questCompleted;
		};
	};
if((DS_infoArray select 19) == 23)then
	{
	_tempNum = DS_infoArray select 20;
	_tempNum = _tempNum + 1;
	DS_infoArray set [20,_tempNum];
	if((DS_infoArray select 20) > 9)then
		{
		[3] call DS_fnc_questCompleted;
		};
	};
if((DS_infoArray select 19) == 30)then
	{
	_tempNum = DS_infoArray select 20;
	_tempNum = _tempNum + 1;
	DS_infoArray set [20,_tempNum];
	if((DS_infoArray select 20) > 29)then
		{
		[3] call DS_fnc_questCompleted;
		};
	};