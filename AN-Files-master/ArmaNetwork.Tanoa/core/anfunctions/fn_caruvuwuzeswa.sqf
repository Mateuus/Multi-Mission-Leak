/*
	ArmA.Network
	Rathbone
	(c) ArmA.Network 2016

	The usage of this file is restricted to ArmA.Network
	You're not allowed to modify this file!
	Licensed under the Arma EULA and Arma Tools EULA.
	For further questions contact the author!
*/
if(lbCurSel 1500 isEqualTo -1) exitWith {hintSilent "You must select a member!";};
_data = lbData[1500,(lbCurSel 1500)];
_data = call compile format["%1",_data];
_memberName = _data select 0;
_memberID = _data select 1;
closeDialog 0;
[_memberID] remoteExecCall ["life_fnc_removeOfflineRequest",2];
hintSilent format ["You removed %1 from the Gang",_memberName];
