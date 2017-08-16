/*
	File: fn_animSync.sqf
*/
private["_unit","_anim","_type"];
_unit = [_this,0,ObjNull,[Objnull]] call BIS_fnc_param;
_anim = [_this,1,"",[""]] call BIS_fnc_param;
_type = [_this,2,"switch",["switch"]] call BIS_fnc_param;
_repeat = [_this,3,0,[0]] call BIS_fnc_param;

if(isNull _unit) exitWith {};
if (_anim == "" && _type != "mimic") then { _type = "stop"; };

if (_repeat > 0) then
{
	_unit setVariable ["animLoop", _anim];
	while {!isNull _unit && alive _unit && _unit getVariable ["animLoop", ""] != ""} do
	{
		_unit playMoveNow _anim;
		sleep _repeat;
	};
}
else
{
	switch (_type) do
	{
		case "switch": { _unit switchMove _anim };
		case "playMove": {_unit playMove _anim};
		case "playNow": { _unit playMoveNow _anim };
		case "mimic": { _unit setMimic _anim };
		case "stop": { _unit setVariable ["animLoop", nil]; _unit switchMove _anim };
	};
};