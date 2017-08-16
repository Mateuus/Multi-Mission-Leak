/*
	File: fn_seizeWeapons.sqf
	Author: Ciaran Langton,Blackd0g

	Description:
	Sends the request to seize weapons to player.
*/
private["_unit"];
//_unit = param [0,objNull,[objNull]];
_unit = cursorTarget;
if(isNull _unit) exitWith {};
if(playerSide != west) exitWith {};

lhm_action_inUse = true;

// [] spawn {
	// sleep 60;
	// lhm_action_inUse = false;
// };

_action = [
	"Möchten sie die Primär- oder Sekundärwaffe entfernen",
	"Primär oder Sekundär?",
	"Primär",
	"Sekundär"
] call BIS_fnc_guiMessage;

player playMove "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon";
sleep 2;

lhm_action_inUse = false;

_msg = format["%1 hat %2's Waffen entfernt.",profileName,(_unit getVariable["realname",name _unit])];
[[0,_msg],"lhm_fnc_broadcast",true,false] call lhm_fnc_mp;
[[player,_action],"lhm_fnc_seizeWeaponsClient",_unit,false] call lhm_fnc_mp;