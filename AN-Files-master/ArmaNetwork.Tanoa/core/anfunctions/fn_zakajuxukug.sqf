/*
	ArmA.Network
	Rathbone
	Formats Licenses & Skills for Database ease
	(c) ArmA.Network 2016

	The usage of this file is restricted to ArmA.Network
	You're not allowed to modify this file!
	Licensed under the Arma EULA and Arma Tools EULA.
	For further questions contact the author!
*/
params [
  ["_type","",[""]],
  ["_number",true,[false]],
  ["_form","",[""]]
];
if((_type isEqualTo "") OR (_form isEqualTo "")) exitWith {};
_return = "";
switch(_type)do{
  case "license": {
    if(_number) then {
      _return = getText(missionConfigFile >> "CfgLicenseNumbers" >> format["license_%1",_form] >> "name");
    } else {
      _return = format["%1",getNumber (missionConfigFile >> "Licenses" >> _form >> "number")];
    };
  };
  case "skill": {
    if(_number) then {
      _return = getText(missionConfigFile >> "CfgSkillNumbers" >> format["skill_%1",_form] >> "name");
    } else {
      _return = format["%1",getNumber (missionConfigFile >> "Skills" >> _form >> "number")];
    };
  };
};
if(_return isEqualTo "") exitWith {};
_return
