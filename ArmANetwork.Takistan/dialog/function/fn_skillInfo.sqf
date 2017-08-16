#include <macro.h>
/*
Arma.Network
*/
disableSerialization;
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

if(count _skill < 1) exitWith {_info ctrlSetText "No Talent Info found!"};

_displayName = M_CONFIG(getText,"Skills",_skillConf,"displayName");
_dependence = M_CONFIG(getText,"Skills",_skillConf,"dependence");
_level = M_CONFIG(getNumber,"Skills",_skillConf,"level");
_skillpoint = M_CONFIG(getNumber,"Skills",_skillConf,"skillpoint");

_label = format["<t font='puristaMedium' shadow='1' size='2'>%1</t><br/>",localize _displayName];

_dep = "";
_hasDep = false;
if(!(EQUAL(_dependence,""))) then
{
	_varNameDe = M_CONFIG(getText,"Skills",_dependence,"variable");
	_dep = M_CONFIG(getText,"Skills",_dependence,"displayName");
	_sideFlageDe = M_CONFIG(getText,"Skills",_dependence,"side");
	_hasDep = SKILL_VALUE(_dependence,_sideFlageDe);
	_label = format["%1<t shadow='1' size='1.4'>Requirements:</t><br/><t shadow='1'>Talent: %2 || Level: %3 || Skillpoints: %4</t><br/><br/>", _label,localize _dep,_level,_skillpoint];
}else{
	if(!(EQUAL(_level,0))) then
	{
		_label = format["%1<t shadow='1' size='1.4'>Requirements:</t><br/><t shadow='1'>Talent: None || Level: %2 || Skillpoints: %3.</t><br/><br/>", _label,_level,_skillpoint];
	}else{
		_label = format["%1<t shadow='1'>Talent requirement not needed.<br/> Skillpoints: %2</t><br/><br/>", _label,_skillpoint];
	};
};

_hasSkillName = M_CONFIG(getText,"Skills",_skillConf,"variable");
_sideFlage = M_CONFIG(getText,"Skills",_skillConf,"side");
_hasSkill = SKILL_VALUE(_skillConf,_sideFlage);

if(_hasSkill) then {
	_label = format["%1<t color='#00FF00'>You've already learnt this talent!</t><br/><br/>", _label];
}else{
	if(count _dep > 0) then
	{
		if(!((_hasDep) && (LEVEL >= _level))) then {
			_label = format["%1<t color='#FF0000'>You need to first learn %2 and reach Level %3 to learn the selected talent!</t><br/><br/>", _label, localize _dep,_level];
		}else{
			_label = format["%1You haven't learnt this talent yet, however you meet the requirements needed to do so!<br/><br/>",_label];
		};
	}else{
		_label = format["%1You haven't learnt this Talent yet!<br/><br/>",_label];
	};
};

_infoText = M_CONFIG(getText,"Skills",_skillConf,"info");
_label = format["%1%2",_label,localize _infoText];
_info ctrlSetStructuredText parseText _label;

_lern ctrlShow true;
if(!_hasSkill) then {_lern ctrlSetText "Learn"}
else {_lern ctrlSetText "Forget"};

_learn ctrlEnable (((SKILLPOINT > 0)|| EQUAL(SKILLPOINT,0)) && ((EQUAL(_dependence,"")) || _hasSkill || _hasDep || (_level >= LEVEL)));
