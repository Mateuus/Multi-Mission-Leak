/*
	Author: ArmA.Network
	The usage of this file is restricted to ArmA.Network
	You're not allowed to modify this file!
	Licensed under the Arma EULA and Arma Tools EULA.
	For further questions contact the author!
*/
private ["_vehicle","_display","_deadornah"];
_vehicle = param [0,ObjNull,[ObjNull]];
disableSerialization;
createDialog "JawsOfLife";
_display = findDisplay 54321;
_deadornah = _display displayCtrl 1500;
lbClear _deadornah;
{
	if(_x getVariable["name",name _x] == "Error: No unit") then {
		_deadornah lbAdd "Unreviveable";
		_deadornah lbSetData [-1];
	} else {
		if!(alive _x) then {
			_deadornah lbAdd format["%1",_x getVariable["name",name _x]];
			_deadornah lbSetData [(lbSize _deadornah)-1,str(_x)];
		};
	};
} forEach (crew _vehicle);
