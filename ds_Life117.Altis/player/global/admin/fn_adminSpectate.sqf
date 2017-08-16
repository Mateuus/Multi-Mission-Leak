#define getControl(disp,ctrl) ((findDisplay ##disp) displayCtrl ##ctrl)
#define getSelData(ctrl) (lbData[##ctrl,(lbCurSel ##ctrl)])
/*
	File: fn_adminSpectate.sqf
	Author: ColinM9991
	
	Description:
	Spectate the chosen player.
*/
if(DS_adminlevel == 0) exitWith {closeDialog 0};

private["_unit","_adminLevel","_player","_action","_uid","_uid2"];

_adminLevel = (DS_adminlevel);
_unit = lbData[2902,lbCurSel (2902)];
_unit = call compile format["%1", _unit];
_player = (name player);
_uid = getPlayerUID player;
_uid2  = getPlayerUID _unit;
if(isNil "_unit") exitwith {};
if(isNull _unit) exitWith {};
if((getPlayerUID player) in DS_adminlist1)then
	{
	_action = format ["(Spectating %1)",name _unit];
	[[_player,_action],"DS_fnc_DarkSide_ShowAll"] spawn DS_fnc_MP;
	[] spawn {
	  while {dialog} do {
	   closeDialog 0;
	   sleep 0.01;
	  };
	};

	if((vehicle _unit) != _unit)then
		{
		(vehicle _unit) switchCamera "EXTERNAL";
		}
		else
		{
		_unit switchCamera "EXTERNAL";
		};
	hint format["You are now spectating %1 \n\n Press F10 to stop Spectating.",_unit getVariable["name",name _unit]];
	AM_Exit = (findDisplay 46) displayAddEventHandler ["KeyDown","if((_this select 1) == 68) then {
	(findDisplay 46) displayRemoveEventHandler ['KeyDown',AM_Exit];life_spectating = false;(vehicle player) switchCamera 'EXTERNAL';hint 'You have stopped spectating';};false"];
	};
