/*
			Author: Shawn "Huntah" Macgillivray
			
	
			Description:
			Sends target to jail (By Admins)
*/
private ["_unit","_action","_value","_note"];
_unit = lbData[2902,lbCurSel (2902)];
_unit = call compile format["%1", _unit];
_value = ctrltext 2462;
if(_value != "")then
	{
	_note = format ["%1",_value];
	[[(getPlayerUID _unit),"1",_note,(getPlayerUID player)],"HUNT_fnc_adminNotes",false,false] spawn BIS_fnc_MP;
	hint format ["You have added a note to this players profile\n\n\n%1",_value];
	}
	else
	{
	[[],"DS_fnc_unlockBuggedPlayer",_unit,false] spawn BIS_fnc_MP;
	hint "Unlocked players keys";
	};