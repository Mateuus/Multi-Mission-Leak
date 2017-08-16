scriptName "fn_purchaseSelectedModification";
/*--------------------------------------------------------------------
	Author: Maverick (ofpectag: MAV)
    File: fn_purchaseSelectedModification.sqf

	<Maverick Applications>
    Written by Maverick Applications (www.maverick-apps.de)
    You're not allowed to use this file without permission from the author!
--------------------------------------------------------------------*/
#define __filename "fn_purchaseSelectedModification.sqf"

disableSerialization;

// Vars
_ctrl = (findDisplay 5100) displayCtrl 0;
_index = lbCurSel _ctrl;
if (_index == -1) exitWith {
	["<t size='1' align='center' shadow='2' font='PuristaMedium' color='#ff0000'>Please select a modification first</t>"] spawn mav_tuning_fnc_displayText;
};
_class = _ctrl lbData _index;
_poolIndex = _ctrl lbValue _index;

// Not a valid selection?
if (_class == "") exitWith {};

// More stuff
_veh = vehicle player;
_masterConfig = [typeof _veh] call mav_tuning_fnc_getMasterConfig;
_subConfig = getArray(missionConfigFile >> "Maverick_Tuning" >> "Vehicles" >> _masterConfig >> _class >> "pool");
_subConfig = _subConfig select _poolIndex;

// Get cash needed
_price = getNumber(missionConfigFile >> "Maverick_Tuning" >> "Vehicles" >> _masterConfig >> _class >> _subConfig >> "price");
if (life_cash < _price) exitWith {
	["<t size='1' align='center' shadow='2' font='PuristaMedium' color='#ff0000'>You do not have enough money to purchase this modification</t>"] spawn mav_tuning_fnc_displayText;
};

// RGB COLOR
if (_subConfig == "RGB" AND _class == "Colors") exitWith {
	createDialog "mav_tuning_dialog_rgbcolor";
	// Money duh
 	life_cash = life_cash - _price;
 	mav_tuning_rgbprice = _price;
	[format["<t size='1' align='center' shadow='2' font='PuristaMedium'>You have purchased a modification for <t color='#12FE00'>$%1</t><br/>You have <t color='#12FE00'>$%2</t> left</t>",[mav_tuning_rgbprice] call BIS_fnc_numberText,[life_cash] call BIS_fnc_numberText]] spawn mav_tuning_fnc_displayText;

	[] spawn mav_tuning_fnc_rgbColorSelection;
};
// UNDERGLOW
if (_subConfig == "UnderglowRGB" AND _class == "Underglow") exitWith {
	createDialog "mav_tuning_dialog_rgbcolor";
	// Money duh
 	life_cash = life_cash - _price;
 	mav_tuning_rgbprice = _price;
	[format["<t size='1' align='center' shadow='2' font='PuristaMedium'>You have purchased a modification for <t color='#12FE00'>$%1</t><br/>You have <t color='#12FE00'>$%2</t> left</t>",[mav_tuning_rgbprice] call BIS_fnc_numberText,[life_cash] call BIS_fnc_numberText]] spawn mav_tuning_fnc_displayText;

	[] spawn mav_tuning_fnc_rgbColorSelectionLight;
};

// EVERYTHING ELSE
if (true) then {
	_originalData = (vehicle player) getVariable ["mav_tuning",[]];

	if (isNil "mav_tuning_previewData") exitWith {};
	if ((str _originalData) == (str mav_tuning_previewData)) exitWith {
		["<t size='1' align='center' shadow='2' font='PuristaMedium' color='#ff0000'>You already own this modification</t>"] spawn mav_tuning_fnc_displayText;
	};

	_newArray = mav_tuning_previewData;
	[_newArray,vehicle player] spawn mav_tuning_fnc_loadVehicleModification;
 	_veh setVariable ["mav_tuning",_newArray,true];

 	// Money duh
 	life_cash = life_cash - _price;
	[format["<t size='1' align='center' shadow='2' font='PuristaMedium'>You have purchased a modification for <t color='#12FE00'>$%1</t><br/>You have <t color='#12FE00'>$%2</t> left</t>",[_price] call BIS_fnc_numberText,[life_cash] call BIS_fnc_numberText]] spawn mav_tuning_fnc_displayText;

	// Select nothing
	_ctrl lbSetCurSel -1;
};