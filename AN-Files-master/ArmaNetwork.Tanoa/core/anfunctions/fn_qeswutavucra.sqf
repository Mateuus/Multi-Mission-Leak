/*
	ArmA.Network
	Rathbone
	Unrestrains Player according to Playerside
	(c) ArmA.Network 2016

	The usage of this file is restricted to ArmA.Network
	You're not allowed to modify this file!
	Licensed under the Arma EULA and Arma Tools EULA.
	For further questions contact the author!
*/
params [
	["_unit",objNull,[objNull]]
];
if(isNull _unit OR !(_unit getVariable["restrained",false])) exitWith {};
switch(playerSide) do {
	case independent:
	{

	};
	case civilian:
	{
		if((_unit getVariable "restrainedtype") isEqualTo "civ") then {
			_unit setVariable["restrained",false,true];
			_unit setVariable["Escorting",false,true];
			_unit setVariable["transporting",false,true];
			[0,format[localize "STR_NOTF_Unrestrain",_unit getVariable["realname",name _unit], profileName]] remoteExecCall ["life_fnc_brusathusek",west];
		} else {
			hintSilent format[localize "STR_NOTF_CantUnrestrain","Zip Tied"]
		};
	};
	case west:
	{
		_unit setVariable["restrained",false,true];
		_unit setVariable["Escorting",false,true];
		_unit setVariable["transporting",false,true];
		[0,format[localize "STR_NOTF_Unrestrain",_unit getVariable["realname",name _unit], profileName]] remoteExecCall ["life_fnc_brusathusek",west];
	};
};
