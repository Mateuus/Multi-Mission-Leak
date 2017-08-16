/*################################
#	(c) 2016 gamer-nation.eu #
#			         #
#	Author: PierreAmyf   	 #
################################*/
disableSerialization;
if (isNull (uiNamespace getVariable ["playerHUD",displayNull])) then {[] call life_fnc_hudSetup;};
_polizeionline = 0;
_einwohneronline = 0;
_mediconline = 0;
{
	if(isPlayer _x) then
	{	
		_si = side _x;
		if(_si == civilian) then {_einwohneronline = _einwohneronline + 1};
		if(_si == west) then {_polizeionline = _polizeionline + 1};
		if(_si == independent) then {_mediconline = _mediconline + 1};
	};
} forEach(playableUnits);
//Text
((uiNamespace getVariable ["playerHUD",displayNull]) displayCtrl 2403) ctrlSetText format["%1 %",round ((1 - (damage player)) * 100)];
((uiNamespace getVariable ["playerHUD",displayNull]) displayCtrl 2400) ctrlSetText format["%1 %",life_hunger];
((uiNamespace getVariable ["playerHUD",displayNull]) displayCtrl 2402) ctrlSetText format["%1 %",life_thirst];
((uiNamespace getVariable ["playerHUD",displayNull]) displayCtrl 2407) ctrlSetText format["%1€",[life_atmbank] call life_fnc_numberText];
((uiNamespace getVariable ["playerHUD",displayNull]) displayCtrl 2408) ctrlSetText format["%1€",[life_cash] call life_fnc_numberText];
((uiNamespace getVariable ["playerHUD",displayNull]) displayCtrl 2405) ctrlSetText format["%1",_polizeionline];
((uiNamespace getVariable ["playerHUD",displayNull]) displayCtrl 2406) ctrlSetText format["%1",_mediconline];
((uiNamespace getVariable ["playerHUD",displayNull]) displayCtrl 2404) ctrlSetText format["%1",_einwohneronline];