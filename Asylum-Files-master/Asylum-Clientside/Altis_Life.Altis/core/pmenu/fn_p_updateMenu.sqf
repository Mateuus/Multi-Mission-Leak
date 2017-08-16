/*
	File: fn_p_updateMenu.sqf
	Author: John "Paratus" VanderZwet
	
	Description:
	Updates the player menu (Virtual Interaction Menu)
*/
private["_dialog","_time","_left","_right","_inv","_lic","_licenses","_near","_near_units","_mstatus","_shrt","_side","_talents"];
disableSerialization;

_dialog = findDisplay 3000; // Messaging
if (isNull _dialog) then { _dialog = findDisplay 2001; }; // Inventory / Money / Licenses
if (isNull _dialog) then { _dialog = findDisplay 2700; }; // Key chain
if (isNull _dialog) then { _dialog = findDisplay 2900; }; // Settings
if (isNull _dialog) then { _dialog = findDisplay 90000; }; // Home screen
_time = _dialog displayCtrl 90035;
_left = _dialog displayCtrl 90036;
_right = _dialog displayCtrl 90037;

// Talent info
_next = 0;
_max = [] call life_fnc_calTalents;
_base = [_max] call ASY_fnc_experienceReq;
_percent = 0;
if (_max >= life_maxTalents) then { _next = _base; }
else { _next = [_max+1] call ASY_fnc_experienceReq; };
if ((_next - _base) == 0) then { _percent = 0; }
else { _percent = floor((100 * (life_experience - _base)) / (_next - _base)); };
_free = _max - (count life_talents);

// Statusbar text
_hour = date select 3;
_min = date select 4;
if (_hour < 10) then { _hour = format["0%1", _hour]; };
if (_min < 10) then { _min = format["0%1", _min]; };
_talentAlert = "";
if (_free > 0) then { _talentAlert = " <t color='#FF0000'>TALENT</t>"; };
_ttr = (life_restart_delay - time) / 60;
_ttrHours = floor (_ttr / 60);
_ttrMins = floor (_ttr - (_ttrHours * 60));

_time ctrlSetStructuredText parseText format["<t align='center' shadow='0' size='0.65'>%1:%2 [%3:%4]</t>", _hour, _min, _ttrHours, _ttrMins];
_left ctrlSetStructuredText parseText format["<t shadow='0' size='0.65'>$%1%2</t>", [life_money] call life_fnc_numberText, _talentAlert];
_right ctrlSetStructuredText parseText format["<t shadow='0' size='0.65'>%1/%2</t>", life_carryWeight, life_maxWeight];
/*
if (_free > 0) then
{
	_talents ctrlSetStructuredText parseText format["<t size='0.8px' color='#FF0000'>Talents: %1/%2 (upgrade)<br/>%4%5 to next</t>", count life_talents, life_maxTalents, _free, _percent, "%"];
}
else
{
	_talents ctrlSetStructuredText parseText format["<t size='0.8px'>Talents: %1/%2<br/>%3%4 to next</t>", count life_talents, life_maxTalents, _percent, "%"];
};
*/