/*
	File: fn_inputMenu.sqf
	Author: John "Paratus" VanderZwet
	
	Description:
	Call to request user input.
	
	Parameter(s):
	0 - Message: STRING or STRUCTURED TEXT
	1 - Title: STRING
	2 - Submit Button Label: STRING
*/
private["_msg","_title","_submit","_display","_titleBox","_submitButton","_label"];
disableSerialization;

_msg = [_this,0,"",[""]] call BIS_fnc_param;
_title = [_this,1,"Input",[""]] call BIS_fnc_param;
_submit = [_this,2,"OK",[""]] call BIS_fnc_param;

life_input_response = "";
createDialog "life_input_dialog";

waitUntil {!isNull (findDisplay 3650)};

_display = findDisplay 3650;
_titleBox = _display displayCtrl 3651;
_submitButton = _display displayCtrl 3653;
_label = _display displayCtrl 3654;

_label ctrlSetStructuredText (parseText _msg);
_submitButton ctrlSetText _submit;
_titleBox ctrlSetText _title;

waitUntil {isNull (findDisplay 3650)};