/*
	Shows cop arrest dlg
*/
if!(playerSide isEqualTo west) exitWith {};
_unit = param [0,ObjNull,[ObjNull]];
if(!(_unit getVariable["restrained",false])) exitWith {
		hintSilent "The civilian needs to be restrained";
};
createDialog "jail_time";
