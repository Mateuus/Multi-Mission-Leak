/**
 * Copyright © 2015 DnA, Grand Theft ArmA.
 * All Rights Reserved.
 */

params [
	["_unit", objNull, [objNull]]
];

//--- Error checks
if (isNull _unit) exitWith {};
if !(_unit getVariable ["incapacitated", false]) exitWith {};

//--- Store helper on unit
_unit setVariable ["GTA_revive_helper", player, true];

//--- Action revive
if ([30 + (random 5), "Reviving", nil, {!isNull _this && {[_this] call GTA_fnc_reviveStatus == "INCAPACITATED"}}, _unit] call GTA_fnc_action) then {
	//--- Revive
	_unit setVariable ["incapacitated", false, true];

	if ([] call GTA_fnc_isMedic) then {
		//--- Fee
		_fee = getNumber (missionConfigFile >> "GTA_CfgRevive" >> "reviveFee");
		GTA_money_bank = GTA_money_bank + _fee;
		[0, ["STR_GTA_REVIVE_FEE", [_fee] call life_fnc_numberText]] call GTA_fnc_broadcast;
	} else {
		//--- Remove First Aid Kit
		player removeItem "FirstAidKit";
	};

	//--- Add experience
	["revive", "Revived player"] call GTA_fnc_addExp;
} else {
	titleText ["Revive interrupted", "PLAIN"];
};

//--- Remove helper from unit
_unit setVariable ["GTA_revive_helper", nil, true];
