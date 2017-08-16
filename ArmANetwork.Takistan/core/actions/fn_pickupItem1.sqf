#include <macro.h>
/*
	File: fn_pickupItem.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Master handling for picking up an item.
*/
private["_obj","_itemInfo","_itemName","_illegal","_diff"];

if((time - life_action_delay) < 1) exitWith {hint "You can't rapidly use action keys!";life_pickingUp = false;};

if (isNull (findDisplay 1520)) then { _obj = cursorTarget; }
else
{
	_obj = objNull;
	if ((lbCurSel 1521) > -1) then
	{
		_obj = life_itemPickUpArray select (lbCurSel 1521);
	};
};

if(isNil "_obj" OR isNull _obj OR isPlayer _obj) exitWith {life_pickingUp = false;};
_itemInfo = _obj getVariable "item";

if ((_itemInfo select 0) == "money") exitWith { [_obj] call life_fnc_pickupMoney;life_pickingUp = false;};

_ItemName = localize getText(missionConfigFile >> "VirtualItems" >> _ItemInfo select 0 >> "displayName");
_illegal = [_itemInfo select 0,life_illegal_items] call life_fnc_index;

if(playerSide == west && _illegal != -1) exitWith
{
	titleText[format["%1 has been placed in evidence, you have received $%2 as a reward.",_itemName,[(life_illegal_items select _illegal) select 1] call life_fnc_numberText],"PLAIN"];
	ADD(BANK,((life_illegal_items select _illegal) select 1));
	deleteVehicle _obj;
	life_action_delay = time;
	life_pickingUp = false;
};
life_action_delay = time;
_diff = [_itemInfo select 0,_itemInfo select 1,life_carryWeight,life_maxWeight] call life_fnc_calWeightDiff;
if(_diff <= 0) exitWith {hint "Can't pick up that item, you are full.";life_pickingUp = false;};
if(_diff != _itemInfo select 1) then
{
	if(([true,_itemInfo select 0,_diff] call life_fnc_handleInv)) then
	{
		player playmove "AinvPknlMstpSlayWrflDnon";
		_obj setVariable["item",[_itemInfo select 0,((_itemInfo select 1) - _diff)],true];
		titleText[format["You picked up %1 %2",_diff,_itemName],"PLAIN"];
	};
}
	else
{
	if(([true,_itemInfo select 0,_itemInfo select 1] call life_fnc_handleInv)) then
	{
		deleteVehicle _obj;
		player playmove "AinvPknlMstpSlayWrflDnon";
		titleText[format["You picked up %1 %2",_diff,_itemName],"PLAIN"];

	};
};
life_pickingUp = false;
