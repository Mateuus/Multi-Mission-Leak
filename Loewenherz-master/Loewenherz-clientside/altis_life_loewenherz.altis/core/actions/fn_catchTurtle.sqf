/*
	File: fn_catchTurtle.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Catches a dead turtle?
*/
private["_obj","_data","_addExpAmount"];
_obj = cursorTarget;
if(isNull _obj) exitWith {}; //Not valid
if(alive _obj) exitWith {}; //It's alive, don't take it charlie!

if(([true,"turtle",1] call lhm_fnc_handleInv)) then
{
	deleteVehicle _obj;
	titleText[localize "STR_NOTF_CaughtTurtle","PLAIN"];
	//SkillSystem
	_data = missionNamespace getVariable ("Fishing_Prof");
    _addExpAmount = 10;
    _addExpAmount = _addExpAmount + (5 * (_data select 0));
    ["Fishing_Prof",_AddExpAmount] call lhm_fnc_addExp;
	//SkillSystem
};