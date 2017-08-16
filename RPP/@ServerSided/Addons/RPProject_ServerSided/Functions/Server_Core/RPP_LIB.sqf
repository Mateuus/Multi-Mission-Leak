RPP_ArrToSQL = {
	private["_array"];
  _array = param [0,[],[[]]];
  _array = str(str(_array));
  _array = toArray(_array);

  for "_i" from 0 to (count _array)-1 do
  {
  	_sel = _array select _i;
  	if((_i != 0 && _i != ((count _array)-1))) then
  	{
  		if(_sel == 34) then
  		{
  			_array set[_i,96];
  		};
  	};
  };

  toString(_array);
};
publicVariable "RPP_ArrToSQL";

RPP_SQLToArr = {
	params[["_array","",[""]]];
if (_array isEqualTo "") exitWith {[]};
_array = toArray(_array);

private _indexes = [];
private _p = 0;

for "_i" from 0 to (count _array)-1 do {
    _sel = _array select _i;
    if (_sel isEqualTo 96) then {
        _array set[_i,39];
        if (!(_p isEqualTo 2) && {_array select (_i - 1) isEqualTo 39}) then {
            _indexes pushBack _i;
            _p = _p + 1;
        } else {
            if (_p isEqualTo 2) then {_p = 0;};
        };
    } else {_p = 0;};
};

if !(_indexes isEqualTo []) then {
    private _y = 0;
    {
        _array deleteAt (_x - _y);
        _y = _y + 1;
        false
    } count _indexes;
};

_array = toString(_array);
_array = call compile format["%1", _array];
_array;
};
publicVariable "RPP_SQLToArr";

RPP_CheckWords = {
    _bannedWords = RPP_BannedWords;
    _sentance = toLower(_this select 0);

    _result = [false,""];
    _sentArr = _sentance splitString " ";
    {
        if(_x in _bannedWords)then{
            _result = [true,_x];
        };
    }forEach _sentArr;
    _result;
};
publicVariable "RPP_CheckWords";

RPP_AllowedWords = {
    _bannedWords = RPP_Login_allowedChar;
    _sentance = toUpper(_this select 0);

    _result = [false,""];
    {
        if(!(_x in RPP_Login_allowedChar))then{
            _result = [true,_x];
        };
    }forEach _sentance;
    _result;
};
publicVariable "RPP_CheckWords";

/*
RPP_Lib_FormatArray = {
	#define DEBUG_MODE_FULL
	#include "\x\cba\addons\main\script_macros.hpp"

	PARAMS_1(_array);

	TRACE_1("Input parameter: ",_array);

	_strTwo = "";

	//http://forums.bistudio.com/showthread.php?134321-Best-way-to-check-if-a-parameter-is-a-variable-or-an-array&p=2149309&viewfull=1#post2149309
	if (typeName _array == "ARRAY") then
	{
		for "_i" from 0 to (count _array) -1 do
		{
			if (_i == ((count _array) -1)) then
			{
				_strOne = format ["%1", _array select _i];
				_strTwo = _strTwo + _strOne;
			}else 
			{
				_strOne = format ["%1`", _array select _i];
				_strTwo = _strTwo + _strOne;
			};
		};
	} else {
		_strTwo = _array;
	};

	TRACE_1("Returning: ",_strTwo);

	//return result
	_strTwo
};
publicVariable "RPP_Lib_FormatArray";
*/

RPP_safeNumber = {
  private ["_number","_mod","_digots","_digitsCount","_modBase","_numberText"];

  _number = [_this,0,0,[0]] call bis_fnc_param;
  _mod = [_this,1,3,[0]] call bis_fnc_param;

  _digits = _number call bis_fnc_numberDigits;
  _digitsCount = count _digits - 1;

  _modBase = _digitsCount % _mod;
  _numberText = "";
  {
  	_numberText = _numberText + str _x;
  	if ((_foreachindex - _modBase) % (_mod) == 0 && _foreachindex != _digitsCount) then {_numberText = _numberText + "";};
  } forEach _digits;
  _numberText;
};
publicVariable "RPP_safeNumber";

RPP_safeString = {
  private["_string","_filter"];
  _string = [_this,0,"",[""]] call BIS_fnc_param;
  _filter = "'/\`:|;,{}-""<>";

  _string = toArray _string; //Blow it up to an array
  _filter = toArray _filter; //Blow it up to an array

  {
  	if(_x in _filter) then {
  		_string set[_forEachIndex,-1];
  	};
  } forEach _string;

  _string = _string - [-1];
  toString _string;
};
publicVariable "RPP_safeString";

RPP_bool = {
  private["_bool","_mode"];
  _bool = [_this,0,0,[false,0]] call BIS_fnc_param;
  _mode = [_this,1,0,[0]] call BIS_fnc_param;

  switch (_mode) do {
  	case 0: {
  		if(_bool isEqualType 0) exitWith {0};
  		if(_bool) then {1} else {0};
  	};

  	case 1: {
  		if(!(_bool isEqualType 0)) exitWith {false};
  		switch (_bool) do {
  			case 0: {false};
  			case 1: {true};
  		};
  	};
  };

};
publicVariable "RPP_bool";

RPP_Lib_ToNumber = {
	private ["_input"];

	_input = _this select 0;

	if(typeName _input == "STRING") then {
		_input = parseNumber _input;
	};

	_input;
};
publicVariable "RPP_Lib_ToNumber";

RPP_Lib_RandomNumber = {
	private ["_max"];

	_max = _this select 0;
	_random = round(random(2));

	if (_random <= 2) then {
		_max = floor(random(_max));
	}
	else
	{
		_max = floor(random(_max + 1));
	};

	_max;
};
publicVariable "RPP_Lib_RandomNumber";

RPP_Lib_ToArray = {
	private ["_input"];

	_input = _this select 0;

	if(typeName _input == "STRING") then {
		_input = call compile _input;
	};

	_input;
};
publicVariable "RPP_Lib_ToArray";
RPP_Lib_FindPlayer = {
	private ["_how", "_data", "_return"];

	_return = false;

	_how = _this select 0;
	_data = _this select 1;

	{
		if(_how == "UID") then {
			if(_data == getPlayerUID _x) then {
				_return = _x;
			};
		};

		if(_how == "Name") then {
			if(_data == name _x) then {
				_return = _x;
			};
			
		};
	} forEach ([] call RPP_Lib_GetPlayers);

	_return;
};
publicVariable "RPP_Lib_FindPlayer";
RPP_Lib_GetPlayers = {
	private ["_players"];

	_players = [];

	{
		_compiled = compile _x;
		if(!isNil{call _compiled}) then {
			if(str(call _compiled) != "<NULL-object>") then {
				_players = _players + [call _compiled];
			};
		};
	} forEach Config_Players;

	_players;
};
publicVariable "RPP_Lib_GetPlayers";
RPP_Lib_FormatNumber = {
	private ["_number","_mod","_digots","_digitsCount","_modBase","_numberText"];

	_number = _this select 0;
	_mod = 3;

	if(typeName _number == "STRING") then { _number = parseNumber _number; };

	_digits = _number call bis_fnc_numberDigits;
	_digitsCount = count _digits - 1;

	_modBase = _digitsCount % _mod;
	_numberText = "";
	
	{
		_numberText = _numberText + str _x;
		if ((_foreachindex - _modBase) % (_mod) == 0 && _foreachindex != _digitsCount) then {_numberText = _numberText + "";};
	} foreach _digits;

	if(count _this > 1) then {
		_numberText = [_numberText] call RPP_Lib_FormatMoney;
	};

	_numberText;
};
publicVariable "RPP_Lib_FormatNumber";

RPP_Lib_FormatNumber_Bank = {
	private ["_number","_mod","_digots","_digitsCount","_modBase","_numberText"];

	_number = RPP_Bank;
	_mod = 3;

	if(typeName _number == "STRING") then { _number = parseNumber _number; };

	_digits = _number call bis_fnc_numberDigits;
	_digitsCount = count _digits - 1;

	_modBase = _digitsCount % _mod;
	_numberText = "";
	
	{
		_numberText = _numberText + str _x;
		if ((_foreachindex - _modBase) % (_mod) == 0 && _foreachindex != _digitsCount) then {_numberText = _numberText + "";};
	} foreach _digits;

	if(count _this > 1) then {
		_numberText = [_numberText] call RPP_Lib_FormatMoney;
	};

	RPP_Bank_Str = _numberText;

	_numberText;
};
publicVariable "RPP_Lib_FormatNumber_Bank";

RPP_Lib_FormatNumber_Cash = {
	private ["_number","_mod","_digots","_digitsCount","_modBase","_numberText"];

	_number = RPP_Cash;
	_mod = 3;

	if(typeName _number == "STRING") then { _number = parseNumber _number; };

	_digits = _number call bis_fnc_numberDigits;
	_digitsCount = count _digits - 1;

	_modBase = _digitsCount % _mod;
	_numberText = "";
	
	{
		_numberText = _numberText + str _x;
		if ((_foreachindex - _modBase) % (_mod) == 0 && _foreachindex != _digitsCount) then {_numberText = _numberText + "";};
	} foreach _digits;

	if(count _this > 1) then {
		_numberText = [_numberText] call RPP_Lib_FormatMoney;
	};

	RPP_Cash_Str = _numberText;

	_numberText;
};
publicVariable "RPP_Lib_FormatNumber_Cash";


RPP_Lib_PlayerList = {
	private ["_idc", "_lbIndex", "_count"];

	_idc = _this select 0;
	_selectSelf = _this select 1;
	_count = 0;

	while {dialog} do {
		lbClear _idc;

		{
			_lbIndex = lbAdd [_idc, format ["%1 (%2)", name _x, str(_x)]];
			lbSetData [_idc, _lbIndex, getPlayerUID _x];

			if(_selectSelf and getPlayerUID _x == getPlayerUID player) then {
				lbSetCurSel [_idc, _lbIndex];
			};
		} forEach ([] call RPP_Lib_GetPlayers);

		waitUntil{count([] call RPP_Lib_GetPlayers) != _count};

		_count = count([] call RPP_Lib_GetPlayers);
	};
};
publicVariable "RPP_Lib_PlayerList";
RPP_Lib_FormatMoney = {
	private ["_input", "_output", "_t", "_i"];

    _input = toArray(_this select 0);
    _i = count(_input)-1;
    _output = "";
    _t = 0;

    while{_i > -1} do {
        if(_t == 3) then {
            _output = format [",%1", _output];
            _t = 0;
        };

        _output = format ["%1%2", toString([_input select _i]), _output];

        _i = _i - 1;
        _t = _t + 1;
    };

    _output;	
};
publicVariable "RPP_Lib_FormatMoney";