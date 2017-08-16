#include "..\..\macros.hpp"
/*
	File: fn_pickupItem.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Master handling for picking up an item.
*/
private["_obj","_itemInfo","_itemName","_illegal","_diff","_index","_price"];
if ((time - DWEV_action_delay) < 2) exitWith {hint "Du kannst diese Taste nicht Spammen."};
_obj = param [0,ObjNull,[ObjNull]];
if(isNull _obj OR isPlayer _obj) exitWith {};
if((_obj getVariable["PickedUp",false])) exitWith {deleteVehicle _obj;}; //Object was already picked up.
if(player distance _obj > 3) exitWith {};

_itemInfo = _obj getVariable "item";
if (count _itemInfo isEqualTo 0) exitWith {deleteVehicle _obj;};
_illegal = ITEM_ILLEGAL(_itemInfo select 0);
_itemName = ITEM_NAME(_itemInfo select 0);

if((side player) == west && _illegal isEqualTo 1) exitWith
{
	_index = [(_itemInfo select 0),sell_array] call DWF_fnc_index;
	_price = ((sell_array) select _index) select 1;
	titleText[format["%1 wurde als Beweismittel beschlagnahmt, du hast dafür %2 € als Belohnung erhalten.",_itemName,[_price] call DWEV_fnc_numberText],"PLAIN"];
	player say3D "bag";
	dwf_cash = dwf_cash + _price;
	deleteVehicle _obj;
	DWEV_action_delay = time;
};
DWEV_action_delay = time;
_diff = [_itemInfo select 0,_itemInfo select 1,DWEV_carryWeight,DWEV_maxWeight] call DWEV_fnc_calWeightDiff;
if(_diff <= 0) exitWith {hint "Deine Taschen sind voll."};
_obj setVariable["PickedUp",TRUE,TRUE];
if(_diff != _itemInfo select 1) then
{
	if(([true,_itemInfo select 0,_diff] call DWEV_fnc_handlelnv)) then
	{
		player playmove "AinvPknlMstpSlayWrflDnon";
		sleep 0.5;
		_obj setVariable["item",[_itemInfo select 0,((_itemInfo select 1) - _diff)],true];
		_obj setVariable["PickedUp",false,true];
		player say3D "bag";
		titleText[format["Du hast %1 %2 aufgesammelt.",_diff,_itemName],"PLAIN"];
	};
}
	else
{
	if(([true,_itemInfo select 0,_itemInfo select 1] call DWEV_fnc_handlelnv)) then
	{
		deleteVehicle _obj;
		player playmove "AinvPknlMstpSlayWrflDnon";
		sleep 0.5;
		player say3D "bag";
		titleText[format["Du hast %1 %2 aufgesammelt.",_diff,_itemName],"PLAIN"];
	};
};