#include <macro.h>
/*
    ArmA.Network
    Author: Rathbone
    Copyright (c) ArmA.Network 2015 - 2016

    The usage of this file is restricted to ArmA.Network
    You're not allowed to modify this file!
    Licensed under the Arma EULA and Arma Tools EULA.
    For further questions contact the author!
*/
disableSerialization;
_skillList = CONTROL(170000,1500);
_index = CONTROL_DATA(1500);
_lern = CONTROL(170000,2402);

if ((lbCurSel 1500) isEqualTo -1) exitWith {hintSilent "You must select a Skill to learn";};
if (_index isEqualTo "") exitWith {};

private _skillName = getText (missionConfigFile >> "Skills" >> _index >> "displayName");
private _kindOfSkill = getText (missionConfigFile >> "Skills" >> _index >> "kindOf");
private _dependence = getText (missionConfigFile >> "Skills" >> _index >> "dependence");
private _level = getNumber (missionConfigFile >> "Skills" >> _index >> "level");
private _skillpoint = getNumber (missionConfigFile >> "Skills" >> _index >> "skillpoint");
private _hasSkill = _index in AN_Skills;

private _hasDependence = false;
if !(_dependence isEqualTo "") then
{
	_hasDependence = _dependence in AN_Skills;
};

private _hasKindOf = false;
private _kindOfName = "";

if !(_kindOfSkill isEqualTo "") then
{
	_kindOfName = getText (missionConfigFile >> "Skills" >> _kindOfSkill >> "displayName");
	_hasKindOf = _kindOfSkill in AN_Skills;
};

if(_hasSkill) then
{
	if (_hasKindOf) exitWith
	{
		hintSilent format["You cannot forget this talent, it is need to learn %1. Forget this Talent to continue!",localize _kindOfName];
	};

	private _action = [
		format["Are you sure you want to forget %1",localize _skillName],
		"Forget Talent?",
		"Yes",
		"No"
	] call BIS_fnc_guiMessage;

	if(_action) then
	{
		closeDialog 0;
		[_index] call life_fnc_skillsRemove;
		ADD(SKILLPOINT,_skillpoint);
		hintSilent format["You have forgotten: %1",localize _skillName];
		[9] call life_fnc_maphuwres;
	};
}
else
{
	if (!(LEVEL >= _level)) exitWith
	{
		hintSilent "You don't have the required Level!";
	};
	if (!(SKILLPOINT >= _skillpoint)) exitWith
	{
		hintSilent "You don't have the required Skillpoints!";
	};
	if (!(_dependence isEqualTo "") && {!_hasDependence}) exitWith
	{
		hintSilent "To learn this Talent, you must have learned other Talents";
	};

	private _action = [
		format["Are you sure you want learn: %1 and use up %2 of your Skillpoints?",localize _skillName,_skillpoint],
		"Learn Skill?",
		"Yes",
		"No"
	] call BIS_fnc_guiMessage;

	if (_action) then
	{
		closeDialog 0;
		[_index] call life_fnc_skillsAdd;
		SUB(SKILLPOINT,_skillpoint);
		hintSilent format["You have learned: %1!",localize _skillName];
		[9] call life_fnc_maphuwres;
	};
};
