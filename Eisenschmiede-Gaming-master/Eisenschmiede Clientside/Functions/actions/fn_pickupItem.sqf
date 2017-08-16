#include "..\script_macros.hpp"
#define INUSE(ENTITY) ENTITY setVariable ["inUse",false,true]
/*
	File: fn_pickupItem.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Master handling for picking up an item.
*/
private ["_itemInfo","_itemName","_illegal","_diff"];
if((time - ES_action_delay) < 2) exitWith {hint localize "STR_NOTF_ActionDelay"; INUSE(_this);};
if(isNull _this OR {player distance _this > 3}) exitWith {INUSE(_this);};

_itemInfo = _this getVariable ["item",[]]; if(EQUAL(count _itemInfo,0)) exitWith {deleteVehicle _this;};
_itemName = ITEM_NAME(SEL(_itemInfo,0));
_illegal = ITEM_ILLEGAL(SEL(_itemInfo,0));

if(playerSide == west && (EQUAL(_illegal,1))) exitWith {
	titleText[format[localize "STR_NOTF_PickedEvidence",_itemName,[round(ITEM_SELLPRICE(SEL(_itemInfo,0)) / 2)] call ES_fnc_numberText],"PLAIN"];
	ES_atmbank = ES_atmbank + round(ITEM_SELLPRICE(SEL(_itemInfo,0)) / 2);

	deleteVehicle _this;
	ES_action_delay = time;
};

ES_action_delay = time;
_diff = [SEL(_itemInfo,0),SEL(_itemInfo,1),ES_carryWeight,ES_maxWeight] call ES_fnc_calWeightDiff;
if(_diff <= 0) exitWith {hint localize "STR_NOTF_InvFull"; INUSE(_this);};

if(!(EQUAL(_diff,SEL(_itemInfo,1)))) then {
	if(([true,SEL(_itemInfo,0),_diff] call ES_fnc_handleInv)) then {
		player playMove "AinvPknlMstpSlayWrflDnon";
		
		_this setVariable ["item",[SEL(_itemInfo,0),(SEL(_itemInfo,1)) - _diff],true];
		titleText[format[localize "STR_NOTF_Picked",_diff,localize _itemName],"PLAIN"];
		INUSE(_this);
	} else {
		INUSE(_this);
	};
} else {
	if(([true,SEL(_itemInfo,0),SEL(_itemInfo,1)] call ES_fnc_handleInv)) then {
		deleteVehicle _this;
		//waitUntil{isNull _this};
		player playMove "AinvPknlMstpSlayWrflDnon";
		
		titleText[format[localize "STR_NOTF_Picked",_diff,localize _itemName],"PLAIN"];
	} else {
		INUSE(_this);
	};
};