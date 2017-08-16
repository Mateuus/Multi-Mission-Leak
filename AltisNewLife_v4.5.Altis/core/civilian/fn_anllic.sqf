#include <macro.h>
private["_target", "_message","_licenses","_licensesConfigs"];
_target = cursorTarget;
if(playerSide != civilian) exitWith {};
if( isNull _target) then {_target = player;};
if( !(_target isKindOf "Man") ) then {_target = player;};
if( !(alive _target) ) then {_target = player;};

_licenses = "";
_licensesConfigs = "getText(_x >> 'side') isEqualTo 'civ'" configClasses (missionConfigFile >> "Licenses");
{
	if(LICENSE_VALUE(configName _x,"civ")) then {
		ADD(_licenses,localize getText(_x >> "displayName") + "<br/>");
	};
} foreach _licensesConfigs;
if(_licenses == "") then {_licenses = (localize "STR_Cop_NoLicensesFound");};

_message = format["<t size='2.2'>%1</t><br/><t size='1.3'>%2</t>", player GVAR ["realname",name player], _licenses];
[[player, _message],"life_fnc_anllicshow",_target,false] spawn life_fnc_MP;
