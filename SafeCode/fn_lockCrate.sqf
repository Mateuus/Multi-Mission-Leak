/*
	File: fn_lockCrate.sqf
	Author: Bryan "Tonic" Boardwine
	Modified: Michael Francis from fn_houseLock.sqf
	
	Description:
	Locks a crate so people can't just run up on it and grab. Only works for virtual items.
*/
private["_crate"];
_crate = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _crate) exitWith {};

_state = _crate getVariable["locked_crate",true];
if(_state) then
{
	_crate setVariable["locked_crate",false,true];
	titleText[localize "STR_Crate_Unlock","PLAIN"];
}
else
{
	_crate setVariable["locked_crate",true,true];
	titleText[localize "STR_Crate_Lock","PLAIN"];
};