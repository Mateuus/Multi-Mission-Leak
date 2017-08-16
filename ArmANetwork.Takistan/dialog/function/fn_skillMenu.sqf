#include <macro.h>
/*
Arma.Network
*/

disableSerialization;
if(isNull (findDisplay 170000)) exitWith {};
_skillList = CONTROL(170000,170002);
_level = CONTROL(170000,170001);
_skillPoint = CONTROL(170000,170007);

_level ctrlSetText format["Level: %1",LEVEL];
_skillPoint ctrlSetText format["Skillpoints: %1/%2",SKILLPOINT,(((count("true" configClasses (missionConfigFile >> "Skills")))*2)-4)];

lbClear _skillList;
if(life_skillLegal) then
{
	ctrlShow[170005,false];
	ctrlShow[170006,true];
}else{
	ctrlShow[170005,true];
	ctrlShow[170006,false];
};

{
	_skill = _x;
	_skillConf = configName _skill;
	_legal = M_CONFIG(getNumber,"Skills",_skillConf,"illegal");
	_sideFlage = M_CONFIG(getText,"Skills",_skillConf,"side");
	_dependence = M_CONFIG(getText,"Skills",_skillConf,"dependence");
	_hasSkill = SKILL_VALUE(_skillConf,_sideFlage);
	hasSkill = _hasSkill;
	_label = format["%1",localize (getText(_skill >> "displayName"))];
	if(life_skillLegal) then
	{
		if(EQUAL(_legal,0)) then {
			if(!(EQUAL(_dependence,""))) then
			{
				_label = "- " + _label;
			};
			_skillList lbAdd _label;
			_skillList lbSetData [(lbSize _skillList)-1,_skillConf];
			if(!_hasSkill) then {
				_skillList lbSetColor [(lbSize _skillList)-1,[1,0,0,0.9]];
			}else{
				_skillList lbSetColor [(lbSize _skillList)-1,[1,1,1,0.5]];
			};
		};
	}else{
		if(EQUAL(_legal,1)) then {
			if(!(EQUAL(_dependence,""))) then
			{
				_label = "- " + _label;
			};
			_skillList lbAdd _label;
			_skillList lbSetData [(lbSize _skillList)-1,_skillConf];
			if(!_hasSkill) then {
				_skillList lbSetColor [(lbSize _skillList)-1,[1,0,0,0.9]];
			}else{
				_skillList lbSetColor [(lbSize _skillList)-1,[1,1,1,0.5]];
			};
		};
	};
} forEach ("true" configClasses (missionConfigFile >> "Skills"));
