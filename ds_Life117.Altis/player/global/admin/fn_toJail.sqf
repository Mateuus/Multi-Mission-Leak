/*
			Author: Shawn "Huntah" Macgillivray
			
	
			Description:
			Sends target to jail (By Admins)
*/
private ["_unit","_action","_value"];
_unit = lbData[2902,lbCurSel (2902)];
_unit = call compile format["%1", _unit];
if(isNil "_unit")exitwith{hint "You did not select a player"};
_value = ctrltext 2462;
_action = [
	format ["Are you sure you want to send this player to jail?",_value],
	"Send to Jail",
	"Yes",
	"No"
] call BIS_fnc_guiMessage;
if(!_action)exitwith{};
[[_value],"DS_fnc_toJailPlayer",_unit,false] spawn BIS_fnc_MP;