#include <macro.h>
private["_type","_varName","_displayName","_sideFlag","_price"];
_type = _this select 3;
if(!isClass (missionConfigFile >> "Licenses" >> _type)) exitWith {}; //Bad entry?
_varName = M_CONFIG(getText,"Licenses",_type,"variable");
_displayName = M_CONFIG(getText,"Licenses",_type,"displayName");
_price = M_CONFIG(getNumber,"Licenses",_type,"price");
_sideFlag = M_CONFIG(getText,"Licenses",_type,"side");
_varName = LICENSE_VARNAME(_varName,_sideFlag);
if(argent_liquide < _price) exitWith {hint format[localize "STR_NOTF_NE_1",[_price] call life_fnc_numberText,localize _displayName];};
argent_liquide = argent_liquide - _price;
titleText[format[localize "STR_NOTF_B_1", localize _displayName,[_price] call life_fnc_numberText],"PLAIN"];
SVAR_MNS [_varName,true];