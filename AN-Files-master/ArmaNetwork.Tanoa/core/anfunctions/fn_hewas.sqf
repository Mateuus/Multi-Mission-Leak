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
waitUntil {!isNull findDisplay 170000};
_skillList = CONTROL(170000,1500);
_level = CONTROL(170000,1002);
_skillPoint = CONTROL(170000,1003);
_nextExp = CONTROL(170000,1004);
_learnBtn = CONTROL(170000,2402);
_level ctrlSetText format["Level: %1",LEVEL];
call life_fnc_bruda;
_skillPoint ctrlSetText format["Available Skillpoints: %1",SKILLPOINT];
_nextExp ctrlSetText format["Exp Points Till Next Level: %1",(life_nextExp - life_exp)];
_learnBtn ctrlEnable false;

lbClear _skillList;
if (life_skillLegal) then
{
	ctrlShow[2403,false];
	ctrlShow[2401,true];
}
else
{
	ctrlShow[2401,false];
	ctrlShow[2403,true];
};

{
	private _skillConf = configName _x;
	private _legal = getNumber (missionConfigFile >> "Skills" >> _skillConf >> "illegal");
	private _dependence = getText (missionConfigFile >> "Skills" >> _skillConf >> "dependence");
	private _hasSkill = _skillConf in AN_Skills;
	private _label = format["%1",localize (getText(_x >> "displayName"))];
	if(life_skillLegal) then
	{
		if(_legal isEqualTo 0) then {
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
		if (_legal isEqualTo 1) then {
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
