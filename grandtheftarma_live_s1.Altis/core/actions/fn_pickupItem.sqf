/**
 * Copyright © 2015 DnA, Grand Theft ArmA.
 * All Rights Reserved.
 */

#define MAX_DISTANCE 2

params [
  ["_object", objNull, [objNull]]
];

//--- Error checks
if (isNull _object || {player distance _object > MAX_DISTANCE}) exitWith {};

//--- Item info
private _item = _object getVariable "item";
if (isNil "_item") exitWith {};
private _itemType = _item select 0;
private _itemCount = _item select 1;
private _itemName = [[_itemType, 0] call life_fnc_varHandle] call life_fnc_varToStr;
private _legal = [_itemType] call GTA_fnc_isVirtualItemLegal;

//--- No space
if ([_itemType, _itemCount, life_carryWeight, life_maxWeight] call life_fnc_calWeightDiff <= 0) exitWith {
  titleText ["Not enough space in inventory", "PLAIN"]
};

//--- Action
if ([2 + random 3, "Picking up Item", nil, {!isNull _this && {player distance _this <= MAX_DISTANCE}}, _object] call GTA_fnc_action) then {
  if (!_legal && {playerSide == west}) then {
    //--- Evidence
    deleteVehicle _object;

    //--- Reward
    private _reward = 5000 * _itemCount;
    GTA_money_bank = GTA_money_bank + _reward;
    [1] call GTA_fnc_updatePlayerPartial;

    //--- Notify
    titleText [format [localize "STR_NOTF_PickedEvidence", _itemName, [_reward] call life_fnc_numberText], "PLAIN"];
  } else {
    //--- Add item(s) to inventory
    if ([true, _itemType, _itemCount] call life_fnc_handleInv) then {
      deleteVehicle _object;
      titleText [format [localize "STR_NOTF_Picked", _itemCount, _itemName], "PLAIN"];
    };
  };
};
