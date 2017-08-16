#define getControl(disp,ctrl) ((findDisplay ##disp) displayCtrl ##ctrl)
#define getSelData(ctrl) (lbData[##ctrl,(lbCurSel ##ctrl)])
/*
	File: fn_tempBan.sqf
	Author: Shawn "Huntah" Macgillivray
	
	Description:
	Temp bans a player (Until Server Restart)
*/
private["_value","_display","_text","_units","_charge","_chargeStr","_copName","_note"];

_unit = lbData[2902,lbCurSel (2902)];
_unit = call compile format["%1", _unit];
_copName = (name player);
_value = ctrltext 2462;

if(_value == "0")exitwith{hint "Enter a reason lazy ass"};

_action = [
	"Are you sure you want to ban this player until the next server restart?",
	"Temp Ban",
	"Yes",
	"No"
] call BIS_fnc_guiMessage;

if(!_action)exitwith{};

//systemchat format ["Details, Your name: %1 || Fired Cops unit: %2 || Fired cops name: %3",(name player),(_unit),(name _unit)];
if(isNil {_unit})exitwith{hint "Error 666: Report to Huntah if you see this error"};
if(isNull _unit) exitWith {hint "Error 667: Report to Huntah if you see this error"};
if(isNil "_unit") exitWith {hint "Error 668: Report to Huntah if you see this error"};
if((name _unit) == ("Error: No vehicle")) exitWith {hint "Error 669: Report to Huntah if you see this error"};
if(isNil{name _unit}) exitWith {hint "Error 700: Report to Huntah if you see this error"};

if(_value == "")then{_value = "No reason added"};

_note = format ["Temp Banned for (%1)",_value];

[[_copName,_value],"DS_fnc_tempBanPlayer",_unit,false] spawn BIS_fnc_MP;
[[(getPlayerUID _unit),"5",_note,(getPlayerUID player)],"HUNT_fnc_adminNotes",false,false] spawn BIS_fnc_MP;