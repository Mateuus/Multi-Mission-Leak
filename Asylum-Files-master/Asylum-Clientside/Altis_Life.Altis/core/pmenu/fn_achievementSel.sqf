/*
	File: fn_achievementSel.sqf
	Author: John "Paratus" VanderZwet
	
	Description:
	Selected achievement for information
*/
private["_display","_list","_text","_data"];

disableSerialization;
_display = findDisplay 3100;
_text = _display displayCtrl 3105;
_list = _display displayCtrl 3110;
_data = lbData[3110,lbCurSel (3110)];

_achievement = life_achievementInfo select (parseNumber _data);
_color = "FF0000";
if ((parseNumber _data) in life_achievements) then { _color = "00FF00" };
_text ctrlSetStructuredText parseText format["<t size='1.1' color='#%4'>%1</t><br/><t size='0.6' color='#%4'>%2</t><br/><t size='0.8'>%3</t>", _achievement select 1, _achievement select 3, _achievement select 4];