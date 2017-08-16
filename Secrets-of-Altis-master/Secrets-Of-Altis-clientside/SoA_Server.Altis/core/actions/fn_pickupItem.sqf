/*
	File: fn_pickupItem.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Master handling for picking up an item.
*/
private["_obj","_itemInfo","_itemName","_illegal","_diff","_diffsum"];
if((time - life_action_delay) < 2) exitWith {hint "Du kannst dich nicht so schnell bücken!"};

_obj = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;

if(isNull _obj OR isPlayer _obj) exitWith {};
if((_obj getVariable["PickedUp",false])) exitWith {deleteVehicle _obj;}; //Object was already picked up.
if(player distance _obj > 3) exitWith {};

_itemInfo = _obj getVariable "item";
_diffsum = 0;

if(playerSide == west) exitWith
{
	{
		_illegal = [_x select 0,life_illegal_items] call SOA_fnc_index;

		if(_illegal != -1) then 
		{		
			_itemName = [([_x select 0,0] call life_fnc_varHandle)] call life_fnc_varToStr;	
			titleText[format[localize "STR_NOTF_PickedEvidence",_itemName,[(life_illegal_items select _illegal) select 1] call life_fnc_numberText],"PLAIN"];
			life_beatbankgeld = life_beatbankgeld + ((life_illegal_items select _illegal) select 1);
			deleteVehicle _obj;

			life_action_delay = time;
		};
	} foreach _itemInfo;
};
life_action_delay = time;

{
_diff = [_x select 0,_x select 1,life_carryWeight,life_maxWeight] call life_fnc_calWeightDiff;
if(_diff <= 0) exitWith {hint localize "STR_NOTF_InvFull"};

_obj setVariable["PickedUp",TRUE,TRUE];

_itemName = [([_x select 0,0] call life_fnc_varHandle)] call life_fnc_varToStr;	

	if(_diff != _x select 1) then
	{
		if(([true,_x select 0,_diff] call life_fnc_handleInv)) then
		{
			player playmove "AinvPknlMstpSlayWrflDnon";
			sleep 0.5;
			_obj setVariable["item",[_x select 0,((_x select 1) - _diff)],true];
			_obj setVariable["PickedUp",false,true];
			titleText[format[localize "STR_NOTF_Picked",_diff,_itemName],"PLAIN"];
		};
	}
		else
	{
		if(([true,_x select 0,_x select 1] call life_fnc_handleInv)) then
		{
			if!(isnull _obj) then {deleteVehicle _obj};

			player playmove "AinvPknlMstpSlayWrflDnon";
			sleep 0.5;
			titleText[format[localize "STR_NOTF_Picked",_diff,_itemName],"PLAIN"];
		};
	};
} foreach _itemInfo;