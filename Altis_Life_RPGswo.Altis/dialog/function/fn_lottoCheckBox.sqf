/*
	Autor: Taranis (Chris)
	Script: fn_openLotto.sqf

	Parameter:
		keine
*/
private["_nums","_name","_idc"];
disableSerialization;

_display = findDisplay 52500;
_array = [52560,52561,52562];

_checked = [];

_idc = ctrlIDC (_this select 0);
_state = _this select 1;
if (_idc in _array) then
{
	if (_state isEqualTo 1) then
	{
		_falseCheck = _array - [_idc];
		{
			(_display displayCtrl _x) cbSetChecked false;
		} forEach _falseCheck;
	} else {
		(_display displayCtrl 52560) cbSetChecked true;
	};
} else {
	if (_state isEqualTo 1) then
	{
		_falseCheck = [52563,52564] - [_idc];
		{
			(_display displayCtrl _x) cbSetChecked false;
		} forEach _falseCheck;
	} else {
		(_display displayCtrl 52563) cbSetChecked true;
	};
};

[] call DWEV_fnc_lottoBill;
