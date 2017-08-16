/*
	Author: Shawn "Huntah" Macgillivray
	
	Description:
	Starts the jail release process
*/
_unit = lbData [2902,lbCurSel 2902];
_unit = call compile format["%1",_unit];

if(isNil "_unit")exitwith{hint "You did not select a player"};
if(isNull _unit)exitwith{hint "Error 999 Report to Huntah"};

[[_unit,false],"DS_civ_releaseme",_unit,false] spawn BIS_fnc_MP;

