#include <macro.h>
/*
	Author: Tertius
	Modified by Rathbone
	The usage of this file is restricted to ArmA.Network
	You're not allowed to modify this file!
	Licensed under the Arma EULA and Arma Tools EULA.
	For further questions contact the author!
*/
disableSerialization;
_info = CONTROL(170000,1100);
_index = CONTROL_DATA(1500);
_lern = CONTROL(170000,2402);
if((lbCurSel 1500) isEqualTo -1) exitWith {hintSilent "You must select a Skill"};
_lern ctrlEnable true;
_skillConf = _index;
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
	_hasDep = SKILL_VALUE(_dependence);
	_label = format["%1<t shadow='1' size='1.4'>Prerequisite:</t><br/><t shadow='1'>Talent: %2 - Level: %3 - Skillpoints: %4</t><br/><br/>", _label,localize _dep,_level,_skillpoint];
}else{
	if(!(EQUAL(_level,0))) then
	{
		_label = format["%1<t shadow='1' size='1.4'>Prerequisite:</t><br/><t shadow='1'>Talent: N/A - Level: %2 - Skillpoints: %3.</t><br/><br/>", _label,_level,_skillpoint];
	}else{
		_label = format["%1<t shadow='1'>No Talent prerequisite needed.<br/> Skillpoints: %2</t><br/><br/>", _label,_skillpoint];
	};
};

_hasSkillName = M_CONFIG(getText,"Skills",_skillConf,"variable");
_hasSkill = SKILL_VALUE(_skillConf);

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
if(!_hasSkill) then {_lern ctrlSetText "Learn Talent"}
else {_lern ctrlSetText "Forget Talent"};
_learn ctrlEnable (((SKILLPOINT > 0)|| EQUAL(SKILLPOINT,0)) && ((EQUAL(_dependence,"")) || _hasSkill || _hasDep || (_level >= LEVEL)));
