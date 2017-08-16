/*
	Autor: Taranis (Chris)
	Script: fn_openLotto.sqf

	Parameter:
		keine
*/
private["_nums","_name","_idc"];
disableSerialization;
params [["_num",-1,[0]]];

_price = 1000;
_display = findDisplay 52500;
_nums = lottoDialog select 0;
_multiT = 1;
_multiZ = [0,0];

if !(_num isEqualTo -1) then
{
	if(_num < 10) then
	{
		_name = format["0%1",_num];
	} 
	else 
	{
		_name = format["%1",_num];
	};

	_idc = parseNumber format["525%1",_name];

	if (3 > count _nums) then
	{
		(_display displayCtrl 52532) ctrlSetText format["Noch %1 Zahlen",(5 - count _nums - 1)];
		ctrlShow[(_idc * 10),false];
		_display displayCtrl (_idc *100) ctrlSetText "textures\lotto\lottoKreuz.paa";
	} 
	else 
	{
		if (4 > count _nums) then
		{
			(_display displayCtrl 52532) ctrlSetText "Noch 1 Zahl";
			ctrlShow[(_idc * 10),false];
			_display displayCtrl (_idc *100) ctrlSetText "textures\lotto\lottoKreuz.paa";
		} 
		else 
		{
			if (5 > count _nums) then
			{

				ctrlShow [(_idc * 10),false];
				_display displayCtrl (_idc *100) ctrlSetText "textures\lotto\lottoKreuz.paa";
				[] spawn DWEV_fnc_lottoBill;
			} 
			else 
			{
				_delete = _nums select 0;
				_deletename = "";

				if(_delete < 10) then
				{
					_deletename = format["0%1",_delete];
				} else {
					_deletename = format["%1",_delete];
				};
				_deleteidc = parseNumber format["525%1",_deletename];

				ctrlShow[(_deleteidc * 10),true];
				_display displayCtrl (_deleteidc *100) ctrlSetText "";
				ctrlShow[(_idc * 10),false];
				_display displayCtrl (_idc *100) ctrlSetText "textures\lotto\lottoKreuz.paa";
			};
		};
	};
} 
else 
{
	{
		_checked = (cbChecked (_display displayCtrl _x));
		if (_checked) then
		{
			if (_x in [52560,52561]) then
			{
				_multiT = 1 + (parseNumber ((str _x) select [4,1]));
			} 
			else 
			{
				if (_x isEqualTo 52562) then
				{
					if (isNil "lottoEdit") then
					{
						_multiT = parseNumber ctrlText 52533;
					} 
					else 
					{
						_multiT = lottoEdit;
					};
				};
				if (_x isEqualTo 52563) then
				{
					_multiZ set [0,1];
				};
				if (_x isEqualTo 52564) then
				{
					_multiZ set [1,1];
				};
			};
		};
		false;
	} count [52560,52561,52562,52563,52564];
	lottoDialog set [2,_multiT];
	lottoDialog set [3,_multiZ];
};

if (4 < count _nums) then
{
	if (3 > count lottoDialog) then
	{
		(_display displayCtrl 52532) ctrlSetText format["%1€",_price];
	} 
	else 
	{
		_multiT = lottoDialog select 2;
		_multiZ = lottoDialog select 3;

		_zahl = 0;
		{
			if (_x isEqualTo 1) then
			{
				_zahl = _forEachIndex + 1;
			};
		} forEach _multiZ;
		
		_price = _price * _multiT * _zahl;
		(_display displayCtrl 52532) ctrlSetText format["%1€",_price];
	};
};