private ["_display","_btn1","_btn2"];
closeDialog 0;
disableSerialization;
createDialog "RscDisplayPassword";
ctrlSetText [1002,"amount:"];
ctrlSetText [1000,"Add Money to your Player"];
ctrlshow [1,true];
ctrlshow [2,true];

_display = findDisplay 64;
_btn1 = _display displayctrl 2;
_btn1 ctrlSetText "Close";
_btn1 buttonSetAction "closeDialog 0";

_display = findDisplay 64;
_btn2 = _display displayctrl 1;
_btn2 ctrlSetText "Accept";
_btn2 buttonSetAction
"
	_display = findDisplay 64;
	_textCode = _display displayctrl 101;
	_exec = ctrlText 101;
	_name = name player;
	_number = parseNumber _exec;
	if (_number > 0) then
	{
	lhm_cash = lhm_cash + _number;
	[] call lhm_fnc_p_updateMenu;
	Hint format [""You added %1 $"",_exec];
	};

	[[""admin"",(format[""%1 with UID %2 spawns Money with a value of %3$"",name player,getPlayerUID player,_number])],""TON_fnc_externLog"",false,false] call lhm_fnc_mp;

";