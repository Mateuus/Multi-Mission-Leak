/*
	File: fn_actionUpdate.sqf
	Author: John "Paratus" VanderZwet
	
	Description:
	Updates the HUD with action menu options.
*/
private["_ui","_text","_field","_i","_action"];
disableSerialization;

_ui = uiNameSpace getVariable ["playerHUD",displayNull];
if(isNull _ui) then {[] call life_fnc_hudSetup;};
_field = _ui displayCtrl 23525;

//Update Action menu
_text = "";
life_action_keys = [];
if (life_show_actions) then
{
	_i = 1;
	{
		_action = _x select 1;
		if (call compile _action) then
		{
			_text = _text + format["%1 - %2<br/>", _i, _x select 0];
			life_action_keys = _x;
			_i = _i + 1;
		};
	} foreach life_action_index;
	if (_text != "") then { _text = "No actions available"; };
	_text = "<t color='#FF0000' size='0.06' shadow='2'>Asylum Actions</t><br/><br/><t size='0.05'>" + _text + "</t>";
}
else
{
	_text = "";
};

_field ctrlSetPosition [safeZoneX, safeZoneY+(safeZoneH/4)];
_field ctrlSetStructuredText parseText _text;
_field ctrlCommit 0;