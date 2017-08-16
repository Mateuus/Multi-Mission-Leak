/*
	File: fn_pickupItem.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Master handling for picking up an item.
*/
private["_obj","_itemInfo","_itemName","_illegal","_diff"];
if((time - lhm_action_delay) < 2) exitWith {hint "Du kannst nicht durchgehend den Action Key verwenden!"};
_obj = param [0,ObjNull,[ObjNull]];
if(isNull _obj OR isPlayer _obj) exitWith {};
if((_obj getVariable["PickedUp",false])) exitWith {deleteVehicle _obj;}; //Object was already picked up.
if(player distance _obj > 3) exitWith {};
_itemInfo = _obj getVariable "item";
_itemName = [([_itemInfo select 0,0] call lhm_fnc_varHandle)] call lhm_fnc_varToStr;
_illegal = [_itemInfo select 0,lhm_illegal_items] call TON_fnc_index;
if(playerSide == west && _illegal != -1) exitWith
{
	titleText[format[localize "STR_NOTF_PickedEvidence",_itemName,[(lhm_illegal_items select _illegal) select 1] call lhm_fnc_numberText],"PLAIN"];
	lhm_atmcash = lhm_atmcash + ((lhm_illegal_items select _illegal) select 1);
	deleteVehicle _obj;
	//waitUntil {isNull _obj};
	lhm_action_delay = time;
};
lhm_action_delay = time;
_diff = [_itemInfo select 0,_itemInfo select 1,lhm_carryWeight,lhm_maxWeight] call lhm_fnc_calWeightDiff;
if(_diff <= 0) exitWith {hint localize "STR_NOTF_InvFull"};
_obj setVariable["PickedUp",TRUE,TRUE];
if(_diff != _itemInfo select 1) then
{
	if(([true,_itemInfo select 0,_diff] call lhm_fnc_handleInv)) then
	{
		player playmove "AinvPknlMstpSlayWrflDnon";
		sleep 0.5;
		_obj setVariable["item",[_itemInfo select 0,((_itemInfo select 1) - _diff)],true];
		_obj setVariable["PickedUp",false,true];
		titleText[format[localize "STR_NOTF_Picked",_diff,_itemName],"PLAIN"];
	};
}
	else
{
	if(([true,_itemInfo select 0,_itemInfo select 1] call lhm_fnc_handleInv)) then
	{
		deleteVehicle _obj;
		//waitUntil{isNull _obj};
		player playmove "AinvPknlMstpSlayWrflDnon";
		sleep 0.5;
		titleText[format[localize "STR_NOTF_Picked",_diff,_itemName],"PLAIN"];
	};
};