/*
* Author: Crunch
* Description: New Message System for Altis Life with Emojis --> Basiert natürlich null auf das von D100 #kappaKlaus
*/
params[
 "_text",
 ["_speed","",[""]],
 ["_color","default",["default"]]
];
//if (isServer || !hasInterface) exitWith {};
disableSerialization;
_display = finddisplay 46;
playSound "HintExpand";
_config = missionConfigFile >> "cfgMsg";
_cfgColor = getArray(_config >> "msgColors" >> _color >> "rgbt");
_cfgSleep = getNumber(_config >> "msgTime" >> _speed >> "time");
_emo_list = getArray(_config >> "msgSmiley" >> "smileys");
_emo_enabled = getNumber(_config >> "msgSmiley" >> "senabled");
if (_text isEqualType "") then {
 if(_emo_enabled isEqualTo 1) then {
 {
 _emo = [_x select 0,_text] call BIS_fnc_inString;
 if (_emo) then {
 _text=[_text,_x select 0,_x select 1] call KRON_Replace;
 };
 }forEach _emo_list;
 };
 _text = parseText _text;
};
private _Header = _display ctrlCreate ["RscText", -1];
_Header ctrlSetPosition [0 * safezoneW + safezoneX, 0.21 * safezoneH + safezoneY, 0.005 * safezoneW, 0.011 * safezoneH];
_Header ctrlSetBackgroundColor _cfgColor;
_Header ctrlSetFade 1;
_Header ctrlCommit 0;
_Header ctrlSetFade 0;
_Header ctrlCommit 0.4;
private _TextField = _display ctrlCreate ["RscStructuredText", -1];
_TextField ctrlSetStructuredText _text;
_TextField ctrlSetPosition [0.005 * safezoneW + safezoneX, 0.021 * safezoneH + safezoneY,0.2 * safezoneW, 0.5]; 
_TextField ctrlCommit 0;
_TextField ctrlSetPosition [0.005 * safezoneW + safezoneX, 0.2 * safezoneH + safezoneY,0.2 * safezoneW, ((ctrlTextHeight _TextField)+ (0.005 * safezoneH))];
_TextField ctrlSetBackgroundColor [0,0,0,0.75];
_TextField ctrlSetFade 1;
_TextField ctrlCommit 0;
_TextField ctrlSetFade 0;
_TextField ctrlCommit 0.4;
_Header ctrlSetPosition [0 * safezoneW + safezoneX, 0.2 * safezoneH + safezoneY,0.005 * safezoneW, ((ctrlTextHeight _TextField)+ (0.005 * safezoneH))];
_Header ctrlCommit 0;
[_TextField,_Header,_speed,_cfgSleep] spawn {
 disableSerialization;
 uisleep (_this select 3);
 private _TextField = _this select 0;
 private _Header = _this select 1;
 _TextField ctrlSetFade 1;
 _TextField ctrlCommit 0.3;
 _Header ctrlSetFade 1;
 _Header ctrlCommit 0.3;
 uiSleep 0.3;
 ctrlDelete _Header;
 ctrlDelete _TextField;
};
private _posText = (ctrlPosition (_TextField)) select 1;
private _posHeader = (ctrlPosition (_Header)) select 1;
private _textHigh = (ctrlPosition (_TextField)) select 3;
if (count life_hints > 0) then {
 private _activeNotifications = 0;
 {
 private _ctrlHeader = _x select 0;
 private _ctrlText = _x select 1;
 if (!isNull _ctrlHeader && !isNull _ctrlText) then {
 _ctrlHeader ctrlSetPosition [0 * safezoneW + safezoneX, (_posHeader + _textHigh + 1.5*(0.011 * safezoneH))];
 _ctrlText ctrlSetPosition [0.005 * safezoneW + safezoneX, (_posText + _textHigh + 1.5*(0.011 * safezoneH))];
 _ctrlHeader ctrlCommit 0.25;
 _ctrlText ctrlCommit 0.25;
 _posText = (_posText + _textHigh + 1.5*(0.011 * safezoneH));
 _posHeader = (_posHeader + _textHigh + 1.5*(0.011 * safezoneH));
 _textHigh = (ctrlPosition (_ctrlText)) select 3;
 if (_activeNotifications > 3) then {
 _ctrlText ctrlSetFade 1;
 _ctrlHeader ctrlSetFade 1;
 _ctrlText ctrlCommit 0.2;
 _ctrlHeader ctrlCommit 0.2;
 };
 _activeNotifications = _activeNotifications + 1;
 };
 } forEach life_hints;
};
life_hints = ([[_Header,_TextField]] + life_hints) select {!isNull (_x select 0) && !isNull (_x select 1)};