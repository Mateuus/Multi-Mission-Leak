#include <macro.h>
/*
Arma.Network
*/
disableSerialization;
_skillList = CONTROL(170000,170002);
_info = CONTROL(170000,170003);
_index = CONTROL_DATA(170002);
_lern = CONTROL(170000,170004);

if(isNil "_index") exitWith {_info ctrlSetText "You haven't selected a Talent!"};

_skill = "";
{
	_varName = M_CONFIG(getText,"Skills",configName _x,"variable");
	if(EQUAL(_varName,_index)) exitWith {_skill = _x};
} forEach ("true" configClasses (missionConfigFile >> "Skills"));

_skillConf = configName _skill;
_skillName = M_CONFIG(getText,"Skills",_skillConf,"displayName");
_sideFlage = M_CONFIG(getText,"Skills",_skillConf,"side");
_kindOfSkill = M_CONFIG(getText,"Skills",_skillConf,"kindOf");
_dependence = M_CONFIG(getText,"Skills",_skillConf,"dependence");
_price = M_CONFIG(getNumber,"Skills",_skillConf,"price");
_level = M_CONFIG(getNumber,"Skills",_skillConf,"level");
_skillpoint = M_CONFIG(getNumber,"Skills",_skillConf,"skillpoint");
_hasSkill = SKILL_VALUE(_skillConf,_sideFlage);
_newSkill = SKILL_VARNAME(_skillConf,_sideFlage);

_hasDependence = false;
if(!(EQUAL(_dependence,""))) then
{
	_sideDependence = M_CONFIG(getText,"Skills",_dependence,"side");
	_hasDependence = SKILL_VALUE(_dependence,_sideDependence);
};

_kindOf = "";
_hasKindOf = false;
_kindOfName = "";
if(!(EQUAL(_kindOfSkill,""))) then
{
	{
		if((EQUAL(_kindOfSkill,configName _x))) exitWith {_kindOf = configName _x};
	} forEach ("true" configClasses (missionConfigFile >> "Skills"));

	_kindOfVarName = M_CONFIG(getText,"Skills",_kindOf,"variable");
	_kindOfName = M_CONFIG(getText,"Skills",_kindOf,"displayName");
	_sideKindOf = M_CONFIG(getText,"Skills",_kindOf,"side");
	_kindOfPrice = M_CONFIG(getNumber,"Skills",_kindOf,"price");
	_hasKindOf = SKILL_VALUE(_kindOf,_sideKindOf);
};

if(_hasSkill) then
{
	if(_hasKindOf) exitWith {hint format["You cannot forget this talent, it is need to learn %1. Forget this Talent to continue!",localize _kindOfName]};

	_action = [
		format["Are you sure you want to forget %1 for the price of %2?",localize _skillName,[_price] call life_fnc_numberText],
		"Forget Talent?",
		"Yes",
		"No"
	] call BIS_fnc_guiMessage;

	if(_action) then
	{
		SVAR_MNS [_newSkill,false];
		SUB(BANK,_price);
		ADD(SKILLPOINT,_skillpoint);
		hint format["You have forgotten: %1!",localize _skillName];
		uiSleep 1;
		[] spawn life_fnc_skillMenu;
	};
}else{
	if(!(LEVEL >= _level)) exitWith {hintSilent "You don't have the required Level!"};
	if(!(SKILLPOINT >= _skillpoint)) exitWith {hintSilent "You don't have the required Skillpoints!";};
	if((!(EQUAL(_dependence,""))) && !_hasDependence) exitWith {hintSilent "To learn this Talent, you must have learned other Talents";};
	_action = [
		format["Are you sure you want learn: %1 and use up %2 of your Skillpoints?",localize _skillName,_skillpoint],
		"Learn Talent?",
		"Yes",
		"No"
	]call BIS_fnc_guiMessage;

	if(_action) then
	{
		SVAR_MNS [_newSkill,true];
		SUB(SKILLPOINT,_skillpoint);
		hint format["You have learned: %1!",localize _skillName];

		uiSleep 1;
		[] spawn life_fnc_skillMenu;
	};
};
