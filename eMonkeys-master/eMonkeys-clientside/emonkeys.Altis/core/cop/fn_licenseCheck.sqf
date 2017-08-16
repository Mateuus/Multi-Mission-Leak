/*
	File: fn_licenseCheck.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Returns the licenses to the cop.
*/
private["_cop"];
_cop = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _cop) exitWith {}; //Bad entry
_ok = ["license_civ_dive","license_civ_truck","license_civ_driver","license_civ_air","license_civ_gun","license_civ_log","license_civ_jet"];
_licenses = "";
//Licenses
{ if (_x select 0 in _ok) then {
	if(missionNamespace getVariable (_x select 0) && _x select 1 == "civ") then
	{
		_licenses = _licenses + ([_x select 0] call EMonkeys_fnc_varToStr) + "<br/>";
	};
};
} foreach EMonkeys_licenses;

if(_licenses == "") then {_licenses = "Keine Lizenzen<br/>";};

[[profileName,_licenses],"EMonkeys_fnc_licensesRead",_cop,FALSE] call EMonkeys_fnc_mp;