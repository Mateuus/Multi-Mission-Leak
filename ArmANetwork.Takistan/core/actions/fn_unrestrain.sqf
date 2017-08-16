/*
	File: fn_unrestrain.sqf
*/
private["_unit"];
_unit = param [0,ObjNull,[ObjNull]];
if(isNull _unit OR !(_unit getVariable["restrained",FALSE])) exitWith {}; //Error check?

switch(playerSide) do {
	case independent:
	{

	};
	case civilian:
	{
		if((_unit getVariable "restrainedtype") == "civ") then {
			_unit setVariable["restrained",FALSE,TRUE];
			_unit setVariable["Escorting",FALSE,TRUE];
			_unit setVariable["transporting",FALSE,TRUE];
			detach _unit;
			[0,format[localize "STR_NOTF_Unrestrain",_unit getVariable["realname",name _unit], profileName]] remoteExecCall ["life_fnc_broadcast",west];
		} else {
			hint format[localize "STR_NOTF_CantUnrestrain", "Zip Tied"]
		};
	};
	case west:
	{
		if((_unit getVariable "restrainedtype") == "cop") then {
			_unit setVariable["restrained",FALSE,TRUE];
			_unit setVariable["Escorting",FALSE,TRUE];
			_unit setVariable["transporting",FALSE,TRUE];
			detach _unit;
			[0,format[localize "STR_NOTF_Unrestrain",_unit getVariable["realname",name _unit], profileName]] remoteExecCall ["life_fnc_broadcast",west];
		} else {
			if((_unit getVariable "restrainedtype") == "civ") then {
				_unit setVariable["restrained",FALSE,TRUE];
				_unit setVariable["Escorting",FALSE,TRUE];
				_unit setVariable["transporting",FALSE,TRUE];
				detach _unit;
				[0,format["%2 has cut the zip ties from %1",_unit getVariable["realname",name _unit], profileName]] remoteExecCall ["life_fnc_broadcast",west];
			} else {
				hint format[localize "STR_NOTF_CantUnrestrain", "Hand Cuffed"]
			};
		};
	};
};
