/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	For mechanics to make repair kits on the move
*/

private ["_tempNum","_price"];

_price = 200;
if((DS_infoArray select 23) > 2)then{_price = _price*0.75};
if((DS_infoArray select 23) > 11)then{_price = 100};
if(DS_doingStuff) exitwith {};
if(!isNull objectParent player) exitwith {hint "You can't do this in a vehicle"};
if((DS_currentWeight + 1) > DS_maxWeight)exitwith{hint "You don't have enough space to make this"};
if([_price,true] call DS_fnc_checkMoney)exitwith {hint format ["You need atleast $%1 in your bank to make one of these",_price]};
[_price,true,false] call DS_fnc_handleMoney;
DS_doingStuff = true;
hint "Creating Repair Kit";
systemchat "Creating Repair Kit";
if((DS_infoArray select 23) < 12)then
	{
	player playMove "AinvPknlMstpSnonWnonDnon_medic_1";
	sleep 4;
	};
DS_doingStuff = false;
if(!isNull objectParent player) exitwith {hint "You can't do this in a vehicle"};
if((DS_currentWeight + 1) > DS_maxWeight)exitwith{hint "You don't have enough space to make this"};
["repairKit",true,1] call DS_fnc_handleInventory;
hint "You have made your Repair Kit";
systemchat "You have made your Repair Kit";

if((DS_infoArray select 23) == 2)then {
	_tempNum = (DS_infoArray select 24) + 1;
	if(_tempNum > 9)then {
		[3] call DS_fnc_questCompleted;
	} else {
		DS_infoArray set [24,_tempNum];
	};
};

if((DS_infoArray select 23) == 11)then {
	_tempNum = (DS_infoArray select 24) + 1;
	if(_tempNum > 9)then {
		[3] call DS_fnc_questCompleted;
	} else {
		DS_infoArray set [24,_tempNum];
	};
};