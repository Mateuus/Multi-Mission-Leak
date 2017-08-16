/*
	Author: ArmA.Network
	The usage of this file is restricted to ArmA.Network
	You're not allowed to modify this file!
	Licensed under the Arma EULA and Arma Tools EULA.
	For further questions contact the author!
*/
disableSerialization;

if((lbCurSel 1500) isEqualTo -1) exitWith {hintSilent "You need to select a player to promote to leader.";};

private _unit = call compile (lbData [1500,(lbCurSel 1500)]);
if (isNull _unit) exitWith {};
if (_unit isEqualTo player) exitWith {hintSilent "You are already the gang leader.";};

private _action = [
	format["Are you sure you would like to transfer leadership to %1?",_unit getVariable ["realname",name _unit]],
	localize "STR_Gang_Transfer",
	localize "STR_Global_Yes",
	localize "STR_Global_No"
] call BIS_fnc_guiMessage;

if (_action) then 
{
	private _group = group player;
	[_unit,_group,player] remoteExecCall ["life_fnc_gangNewLeaderRequest",2];
	life_gangData set [1,5];
};

closeDialog 0;