private ["_display","_btn1","_btn2"];
closeDialog 0;
disableSerialization;
createDialog "RscDisplayPassword";
ctrlSetText [1002,"Query:"];
ctrlSetText [1000,"Database Test"];
ctrlshow [1,true];
ctrlshow [2,true];

_display = findDisplay 64;
_btn1 = _display displayctrl 2;
_btn1 ctrlSetText "Close";
_btn1 buttonSetAction "closeDialog 0";

_display = findDisplay 64;
_btn2 = _display displayctrl 1;
_btn2 ctrlSetText "Query";
_btn2 buttonSetAction
"
	_display = findDisplay 64;
	_textCode = _display displayctrl 101;
	_exec = ctrlText 101;

	 [[_exec,player], ""lhm_fnc_dbtest"", false, false] call lhm_fnc_mp;
";