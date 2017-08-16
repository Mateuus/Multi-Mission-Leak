scriptName "fn_rgbColorSelectionLight";
/*--------------------------------------------------------------------
	Author: Maverick (ofpectag: MAV)
    File: fn_rgbColorSelectionLight.sqf

	<Maverick Applications>
    Written by Maverick Applications (www.maverick-apps.de)
    You're not allowed to use this file without permission from the author!
--------------------------------------------------------------------*/
#define __filename "fn_rgbColorSelectionLight.sqf"

mav_tuning_colors = [0,0,0];

_vehicle = vehicle player;

// Temp preview light
mav_tuning_light_preview = "#lightpoint" createVehicle [1,1,1];
mav_tuning_light_preview setLightColor mav_tuning_colors;
//mav_tuning_light_preview setLightAmbient mav_tuning_colors;
mav_tuning_light_preview setLightIntensity 30;
mav_tuning_light_preview setLightFlareSize 0.38;
mav_tuning_light_preview setLightFlareMaxDistance 150;
mav_tuning_light_preview setLightUseFlare false;
mav_tuning_light_preview setLightDayLight true;
mav_tuning_light_preview lightAttachObject [(vehicle player), [0,0,-1.5]];
mav_tuning_light_preview setLightAmbient mav_tuning_colors;

// Button actions
((findDisplay 5200) displayCtrl 3) ctrlAddEventHandler ["ButtonClick",{
	deleteVehicle mav_tuning_light_preview;
	_values = (+((vehicle player) getVariable "mav_tuning"));

	// Debugging measures
	diag_log format ["Maverick Debug: Typename (2) was %1", typeName _values];
	if (typeName _values != "ARRAY") then {
		_temp = ((vehicle player) getVariable "mav_tuning");
		_values = +_temp;
	};

	_values set [4, mav_tuning_colors];
	(vehicle player) setVariable ["mav_tuning",_values,true];

	closeDialog 0;
	[format["<t size='1' align='center' shadow='2' font='PuristaMedium'>Underglow successfully added, press SHIFT-L to activate<br/><t color='#12FE00'>$%1</t> left</t>",[life_cash] call BIS_fnc_numberText]] spawn mav_tuning_fnc_displayText;
}];

((findDisplay 5200) displayCtrl 4) ctrlAddEventHandler ["ButtonClick",{
	deleteVehicle mav_tuning_light_preview;
	closeDialog 0;
	[(vehicle player) getVariable "mav_tuning",vehicle player] spawn mav_tuning_fnc_loadVehicleModification;

	// Refund money
	life_cash = life_cash + mav_tuning_rgbprice;
	[format["<t size='1' align='center' shadow='2' font='PuristaMedium'><t color='#12FE00'>$%1</t> have been refunded to your account<br/><t color='#12FE00'>$%2</t> left</t>",[mav_tuning_rgbprice] call BIS_fnc_numberText,[life_cash] call BIS_fnc_numberText]] spawn mav_tuning_fnc_displayText;
}];

// Sliders
((findDisplay 5200) displayCtrl 0) ctrlAddEventHandler ["SliderPosChanged",{
	mav_tuning_colors set [0, (_this select 1) / 10];
	mav_tuning_light_preview setLightColor mav_tuning_colors;
	mav_tuning_light_preview setLightAmbient mav_tuning_colors;
	if (dayTime < 19.16 AND dayTime > 5.12) then {
		mav_tuning_light_preview setLightBrightness 6;
	} else {
		mav_tuning_light_preview setLightBrightness 0.3;
	};
}];

((findDisplay 5200) displayCtrl 1) ctrlAddEventHandler ["SliderPosChanged",{
	mav_tuning_colors set [1, (_this select 1) / 10];
	mav_tuning_light_preview setLightColor mav_tuning_colors;
	mav_tuning_light_preview setLightAmbient mav_tuning_colors;
	if (dayTime < 19.16 AND dayTime > 5.12) then {
		mav_tuning_light_preview setLightBrightness 6;
	} else {
		mav_tuning_light_preview setLightBrightness 0.3;
	};
}];

((findDisplay 5200) displayCtrl 2) ctrlAddEventHandler ["SliderPosChanged",{
	mav_tuning_colors set [2, (_this select 1) / 10];
	mav_tuning_light_preview setLightColor mav_tuning_colors;
	mav_tuning_light_preview setLightAmbient mav_tuning_colors;
	if (dayTime < 19.16 AND dayTime > 5.12) then {
		mav_tuning_light_preview setLightBrightness 6;
	} else {
		mav_tuning_light_preview setLightBrightness 0.3;
	};
}];