/*
	File: fn_spec.sqf
	Author: ColinM9991
	Modified for Asylum by Alan
	Description:
	Spectate the chosen player.
*/
if(life_adminlevel < 1) exitWith {closeDialog 0;};

private["_unit","_scrubMarker"];
_unit = lbData[2902,lbCurSel (2902)];
_unit = call compile format["%1", _unit];
if(_unit == player) exitWith {};
if(isNil "_unit") exitWith {};
if(isNull _unit) exitWith {};

[] spawn {
  while {dialog} do {
   closeDialog 0;
   sleep 0.05;
  };
};

im_spectating = (vehicle _unit);;
im_spectating switchCamera "EXTERNAL";

hint format["You are now spectating %1 \n\n Press F8 to stop spectating \n Press F9 for First Person \n Press F10 for 3rd Person \n Press F11 for Alt View",name im_spectating];
AM_Exit = (findDisplay 46) displayAddEventHandler ["KeyDown",
	"
		switch(_this select 1) do
		{
			case 66: {(findDisplay 46) displayRemoveEventHandler ['KeyDown',AM_Exit];im_spectating = ObjNull; player switchCamera 'INTERNAL'; hint 'You have stopped spectating';};
			case 67: {im_spectating switchCamera 'INTERNAL';};
			case 68: {im_spectating switchCamera 'EXTERNAL';};
			case 87: {im_spectating switchCamera 'VIEW';};
		};
	"
];
