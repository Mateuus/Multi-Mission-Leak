/*
	File: fn_pickupItem.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Master handling for picking up an item.
*/
private["_obj","_itemInfo","_itemName","_illegal","_diff","_illegalItems"];
if((time - eM_action_delay) < 2) exitWith {hint "Langsam.. Langsam!"};
_obj = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_illegalItems = getArray(missionConfigFile >> "Cfgmaster" >> "illigalItems");
if(isNull _obj OR isPlayer _obj) exitWith {};
if((_obj getVariable["PickedUp",false])) exitWith {deleteVehicle _obj;}; //Object was already picked up.
if(player distance _obj > 3) exitWith {};
_itemInfo = _obj getVariable "item";
_itemName = [([_itemInfo select 0,0] call EMonkeys_fnc_varHandle)] call EMonkeys_fnc_varToStr;
_illegal = [_itemInfo select 0,_illegalItems] call TON_fnc_index;
if(playerSide == west && _illegal != -1) exitWith
{
	titleText[format["Du hast ein / eine %1 aufgehoben und dafür %2€ als Belohnung erhalten",_itemName,[(_illegalItems select _illegal) select 1] call EMonkeys_fnc_numberText],"PLAIN"];
	EMonkeys_a164 = EMonkeys_a164 + ((_illegalItems select _illegal) select 1);
	deleteVehicle _obj;
	//waitUntil {isNull _obj};
	eM_action_delay = time;
};
eM_action_delay = time;
_diff = [_itemInfo select 0,_itemInfo select 1,EMonkeys_carryWeight,EMonkeys_maxWeight] call EMonkeys_fnc_calWeightDiff;
if(_diff <= 0) exitWith {hint "Can't pick up that item, you are full."};
_obj setVariable["PickedUp",TRUE,TRUE];
if(_diff != _itemInfo select 1) then
{
	if(([true,_itemInfo select 0,_diff] call EMonkeys_fnc_handleInv)) then
	{
		player playmove "AinvPknlMstpSlayWrflDnon";
		uisleep 0.5;
		_obj setVariable["item",[_itemInfo select 0,((_itemInfo select 1) - _diff)],true];
		_obj setVariable["PickedUp",false,true];
		titleText[format["Du hast %1 %2 aufgehoben.",_diff,_itemName],"PLAIN"];
	};
}
	else
{
	if(([true,_itemInfo select 0,_itemInfo select 1] call EMonkeys_fnc_handleInv)) then
	{
		deleteVehicle _obj;
		//waitUntil{isNull _obj};
		player playmove "AinvPknlMstpSlayWrflDnon";
		uisleep 0.5;
		titleText[format["Du hast %1 %2 aufgehoben",_diff,_itemName],"PLAIN"];
	};
};