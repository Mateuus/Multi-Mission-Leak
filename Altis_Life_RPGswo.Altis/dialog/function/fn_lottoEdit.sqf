/*
	Autor: Taranis (Chris)
	Script: fn_openLotto.sqf

	Parameter:
		keine
*/
private["_nums","_name","_idc"];
disableSerialization;
_value = 0;
_display = findDisplay 52500;

_text = ctrlText 52533;

if ((parseNumber _text) < 2) then
{
	(_display displayCtrl 52534) ctrlSetText "Tag";
} else {
	(_display displayCtrl 52534) ctrlSetText "Tage";
};

if ((_this select 1) isEqualTo 14) then
{
	_value = parseNumber (_text select [0,(count _text) - 1]);
} else {
	_value = parseNumber _text;
	if (_value > 99) then
	{
		_value = 99;
		(_display displayCtrl 52533) ctrlSetText str _value;
	};
};

lottoEdit = _value;

[] call DWEV_fnc_lottoBill;
