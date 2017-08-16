/*
	File: fn_licenseCheck.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Returns the licenses to the cop.
*/
private["_cop"];
_cop = param [0,ObjNull,[ObjNull]];
if(isNull _cop) exitWith {}; //Bad entry

_licenses = "";
//Licenses
{
	if(missionNamespace getVariable (_x select 0) && _x select 1 == "civ") then
	{
		_licenses = _licenses + ([_x select 0] call lhm_fnc_varToStr) + "<br/>";
	};
} foreach lhm_licenses;

if(_licenses == "") then {_licenses = (localize "STR_Cop_NoLicensesFound");};

[[profileName,_licenses],"lhm_fnc_licensesRead",_cop,FALSE] call lhm_fnc_mp;