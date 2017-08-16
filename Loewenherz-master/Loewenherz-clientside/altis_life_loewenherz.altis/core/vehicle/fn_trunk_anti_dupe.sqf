/*
	File: fn_trunk_anti_dupe.sqf
	Author Barney

	Description:
	blah



	You're not allowed to modify this file!
    	Licensed under the Arma EULA and Arma Tools EULA.
	Usage of this file is restricted to permitted servers e.g. Loewenherz.
	Ask us for permission to use this file: www.lhzp.de
*/




private ["_netidVehicle"];
_netidVehicle = param[0,"",[""]];

if(_netidVehicle == "") exitWith {};
if(!isnil "LHM_Trunk_Anti_Dupe") then   {
	if(LHM_Trunk_Anti_Dupe == _netidVehicle) then {
		closeDialog 0;
		titletext["ANTI DUPE, netter Versuch ;D","PLAIN"];

	};
};