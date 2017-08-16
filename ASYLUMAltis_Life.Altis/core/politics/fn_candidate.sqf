/*
	File: fn_candidate.sqf
	Author: John "Paratus" VanderZwet
	
	Description:
	Received data for a political candidate.
*/

private ["_data"];

_data = [_this,0,[],[[]]] call BIS_fnc_param;

if(!isNull (findDisplay 6900)) then
{
	disableSerialization;
	_data = _data select 0;
	_display = findDisplay 6900;
	_text = _display displayCtrl 6903;
	_data set [2, [_data select 2, "|", ","] call KRON_Replace];
	_text ctrlSetStructuredText parseText format["<t color='#FF0000'><t size='2'>%1</t></t><br/><br/><t size='0.75'>%2</t>", _data select 0, _data select 2];
	ctrlEnable [6905, true];
}
else
{
	if (!isNil "life_run_dialog") exitWith
	{
		if (!isNil "(_data select 0)") then { _data = _data select 0; };
		life_run_data = _data;
	};
};