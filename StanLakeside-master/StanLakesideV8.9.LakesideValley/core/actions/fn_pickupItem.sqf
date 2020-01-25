/*
	File: fn_pickupItem.sqf
	
	
	Description:
	Master handling for picking up an item.
*/
private["_obj","_itemInfo","_itemName","_illegal","_diff"];
if((time - life_action_delay) < 1) exitWith {["Nie mozesz spamowac klawiszem akcji!", false] spawn doquickmsg;};
_obj = param [0,ObjNull,[ObjNull]];
if(isNull _obj OR isPlayer _obj) exitWith {};
if((_obj getVariable["PickedUp",false])) exitWith {deleteVehicle _obj;}; //Object was already picked up.
if(player distance _obj > 3) exitWith {};
_itemInfo = _obj getVariable "item";
_itemName = [([_itemInfo select 0,0] call life_fnc_varHandle)] call life_fnc_varToStr;
_illegal = [_itemInfo select 0,life_illegal_items] call fnc_index;
if(playerSide == west && _illegal != -1) exitWith
{
	[format[localize "STR_NOTF_PickedEvidence",_itemName,[(life_illegal_items select _illegal) select 1] call life_fnc_numberText], false] spawn domsg;
	["bank","add", ((life_illegal_items select _illegal) select 1)] call life_fnc_handleCash; 
	deleteVehicle _obj;
	//waitUntil {isNull _obj};
	life_action_delay = time;
};
life_action_delay = time;
_diff = [_itemInfo select 0,_itemInfo select 1,life_carryWeight,life_maxWeight] call life_fnc_calWeightDiff;
if(_diff <= 0) exitWith {[localize "STR_NOTF_InvFull", false] spawn domsg;};
_obj setVariable["PickedUp",TRUE,TRUE];
if(_diff != _itemInfo select 1) then
{
	if(([true,_itemInfo select 0,_diff] call life_fnc_handleInv)) then
	{
		player playmove "AinvPknlMstpSlayWrflDnon";
		uiSleep 0.35;
		_obj setVariable["item",[_itemInfo select 0,((_itemInfo select 1) - _diff)],true];
		_obj setVariable["PickedUp",false,true];
		[format[localize "STR_NOTF_Picked",_diff,_itemName], false] spawn domsg;
	};
}
	else
{
	if(([true,_itemInfo select 0,_itemInfo select 1] call life_fnc_handleInv)) then
	{
		deleteVehicle _obj;
		//waitUntil{isNull _obj};
		player playmove "AinvPknlMstpSlayWrflDnon";
		uiSleep 0.35;
		[format[localize "STR_NOTF_Picked",_diff,_itemName], false] spawn domsg;
	};
};