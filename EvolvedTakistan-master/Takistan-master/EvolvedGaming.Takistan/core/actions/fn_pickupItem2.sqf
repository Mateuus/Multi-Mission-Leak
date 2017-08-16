/*
	File: fn_pickupItem.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Master handling for picking up an item.
*/
private["_obj","_itemInfo","_itemName","_illegal","_diff","_duped"];

if((time - life_action_delay) < 1) exitWith {["You can't rapidly use action keys!", false] spawn doquickmsg;};

if (isNull (findDisplay 1520)) then { 
	_obj = life_cursorTarget; 
}
else
{
	_obj = objNull;
	if ((lbCurSel 1521) > -1) then
	{
		_obj = life_pickup_item_array select (lbCurSel 1521);
	};
};

if(isNil "_obj" OR isNull _obj OR isPlayer _obj) exitWith {};
_itemInfo = _obj getVariable "item";

if((_itemInfo select 0) == "money") exitWith { 
	[_obj] call life_fnc_pickupMoney; 
};

_lockedGold = false;
if((_itemInfo select 0) == "goldbar") then
{
	_safe = nearestObject [_obj, "Land_Research_house_V1_F"];
	if(isNull _safe) then { 
		_safe = nearestObject [_obj, "Land_Research_HQ_F"]; 
	};
	if(!isNull _safe) then
	{
		if((_obj distance _safe) < 15 && (_safe getVariable["life_locked",1]) == 1) then { 
			_lockedGold = true; 
		};
	};
};
if (_lockedGold) exitWith {
	["This gold bar belongs to a safe which is still locked!", false] spawn domsg; 
};

_itemName = [([_itemInfo select 0,0] call life_fnc_varHandle)] call life_fnc_varToStr;
_illegal = [_itemInfo select 0,life_illegal_items] call life_fnc_index;

if(playerSide == west && _illegal != -1) exitWith
{
	[format["%1 has been placed in evidence, you have received $%2 as a reward.",_itemName,[(life_illegal_items select _illegal) select 1] call life_fnc_numberText], false] spawn domsg;
	["bank","take",((life_illegal_items select _illegal) select 1)] call life_fnc_handleCash;
	deleteVehicle _obj;
	life_action_delay = time;
};
life_action_delay = time;
_diff = [_itemInfo select 0,_itemInfo select 1,life_carryWeight,life_maxWeight] call life_fnc_calWeightDiff;
if(_diff <= 0) exitWith {
	["Can't pick up that item, you are full.", false] spawn domsg;
};
if(_diff != _itemInfo select 1) then
{
	if(([true,_itemInfo select 0,_diff] call life_fnc_handleInv)) then
	{
		player playmove "AinvPknlMstpSlayWrflDnon";
		uiSleep 0.5;
		_obj setVariable["item",[_itemInfo select 0,((_itemInfo select 1) - _diff)],true];
		[format["You picked up %1 %2",_diff,_itemName], false] spawn domsg;
	};
}
else
{
	if(([true,_itemInfo select 0,_itemInfo select 1] call life_fnc_handleInv)) then
	{
		deleteVehicle _obj;
		player playmove "AinvPknlMstpSlayWrflDnon";
		[format["You picked up %1 %2",_diff,_itemName], false] spawn domsg;
	};
};