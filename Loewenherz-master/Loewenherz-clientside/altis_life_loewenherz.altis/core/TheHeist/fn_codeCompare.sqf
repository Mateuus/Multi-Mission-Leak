//Parameters
private ["_code", "_inputCode"];
_code      = param [ 0, [], [[]]];
_inputCode = param [ 1, [], [[]]];

//compare codes
private "_compare";
//_compare = [_code, _inputCode] call BIS_fnc_areEqual;

switch (playerSide) do
{
	case west:
	{
		_compare = [fed_bank getvariable["code",[]], _inputCode] call BIS_fnc_areEqual;
		if (_compare) then {
			hint parseText format ["<t size='1.5' font='puristaLight' align='center' color='#ff0000'>Bombe entschaerft!</t><br/>"];
			playSound "button_close";
			fed_bank setVariable["chargeplaced",false,true]; // disable and remove bomb
			[[0,"STR_ISTR_Defuse_Success"],"lhm_fnc_broadcast",west,false] call lhm_fnc_mp;
		} else {
			hint parseText format ["<t size='1.5' font='puristaLight' align='center' color='#ff0000'>Falscher Code!</t><br/>"];
			fed_bank setVariable["chargecodewrong",true,true];
			playSound "button_wrong";
		};
		CODEINPUT = [];
		ctrlSetText [1099, ""];
	};

	case civilian:
	{
			if(count (_inputCode) != 10) exitWith {hint "Der Code muss 10 Zahlen beinhalten";CODEINPUT = []; ctrlSetText [1099,""]};
			hint parseText format ["<t size='1.5' font='puristaLight' align='center' color='#ff0000'>Sprengladung scharf!</t><br/>"];
			fed_bank setvariable["code",_inputCode,true];
			fed_bank setVariable["chargeplaced",true,true];
			_wire = ["BLUE", "WHITE", "YELLOW", "GREEN"] call bis_fnc_selectRandom;
			fed_bank setvariable["wire",_wire,true];
			playSound "button_close";

			closeDialog 0;
	};

};
CODEINPUT = [];



//Return Value
_code