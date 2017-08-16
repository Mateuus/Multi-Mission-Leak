/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Gathers fruit
*/

private ["_tempNum","_infoArray","_appleFields","_peachFields","_apples","_peach","_rand"];
_appleFields = ["apple1","apple2","apple3","apple4"];
_peachFields = ["peach1","peach2","peach3","peach4"];
_apples = false;
_peach = false;
if(!isNull objectParent player)exitwith{hint "You can not do this while inside a vehicle"};
if((DS_maxWeight - DS_currentWeight) == 0)exitwith{hint "You do not have enough space to do this"};
if(DS_doingStuff)exitwith{};
{
	if(player distance (getMarkerPos _x) < 40)then
		{
		_apples = true;
		};
}forEach _appleFields;
{
	if(player distance (getMarkerPos _x) < 40)then
		{
		_peach = true;
		};
}forEach _peachFields;
_rand = 1 + (round random 8);
_infoArray = [];
if(_apples)then{_infoArray = ["Apples","apple"]};
if(_peach)then{_infoArray = ["Peaches","peach"]};
if(_infoArray isEqualTo [])exitwith{};

titleText[format["Gathering %1...",_infoArray select 0],"PLAIN"];
DS_doingStuff = true;
player playMove "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon";
sleep 3;
titleText[format["You have picked %1 %2...",_rand,_infoArray select 0],"PLAIN"];
[(_infoArray select 1),true,_rand] call DS_fnc_handleInventory;
DS_doingStuff = false;

if(((DS_infoArray select 13) == 0)&&(_apples))then {
	_tempNum = (DS_infoArray select 14) + _rand;
	if(_tempNum > 249)then {
		[0] call DS_fnc_questCompleted;
	} else {
		DS_infoArray set [14,_tempNum];
	};
};
