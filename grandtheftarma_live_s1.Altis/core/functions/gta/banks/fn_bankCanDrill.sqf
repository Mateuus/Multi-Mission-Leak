/**
 * Copyright © 2015 DnA, Grand Theft ArmA.
 * All Rights Reserved.
 */

private ["_bank", "_cfg", "_requiredWest"];
_bank = [_this, 0, "", [""]] call GTA_fnc_param;
_cfg = missionConfigFile >> "GTA_CfgBanks" >> _bank;

//--- Bank config
_requiredWest = _cfg >> "requiredWest";
_requiredPolice = _cfg >> "requiredPolice";
_requiredNATO = _cfg >> "requiredNATO";

//--- Condition
if (isNumber _requiredWest && {west countSide allPlayers < getNumber _requiredWest}) exitWith {[1, ["STR_GTA_BANKS_WESTLIMIT", _requiredWest], ["Warning", "#ff8800"]] call GTA_fnc_broadcast; false};
if (isNumber _requiredPolice && {{[_x] call GTA_fnc_isCop} count allPlayers < getNumber _requiredPolice}) exitWith {[1, ["STR_GTA_BANKS_POLICELIMIT", _requiredWest], ["Warning", "#ff8800"]] call GTA_fnc_broadcast; false};
if (isNumber _requiredNATO && {{[_x] call GTA_fnc_isMilitary} count allPlayers < getNumber _requiredNATO}) exitWith {[1, ["STR_GTA_BANKS_NATOLIMIT", _requiredWest], ["Warning", "#ff8800"]] call GTA_fnc_broadcast; false};

true
