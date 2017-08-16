closeDialog 0;
disableSerialization;
createDialog "RscDisplayPassword";
ctrlSetText [1002,"Message:"];
ctrlSetText [1000,"Global Message (no special characters)"];
ctrlshow [1,true];
ctrlshow [2,true];

_display = findDisplay 64;
_btn1 = _display displayctrl 2;
_btn1 ctrlSetText "Close";
_btn1 buttonSetAction "closeDialog 0";

_display = findDisplay 64;
_btn2 = _display displayctrl 1;
_btn2 ctrlSetText "Send";
_btn2 buttonSetAction 
"
	_display = findDisplay 64;
	_textCode = _display displayctrl 101;
	_exec = ctrlText 101;
	_name = name player;
	if (_exec != '') then 
	{
	[[""Admin: ""+_exec],""BIS_fnc_guiMessage"",nil,false] call lhm_fnc_mp;
	};
";