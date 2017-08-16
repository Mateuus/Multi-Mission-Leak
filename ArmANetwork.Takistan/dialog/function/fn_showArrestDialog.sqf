/*

	Shows cop arrest dlg

*/

if(playerSide != west) exitWith {};
_unit = param [0,ObjNull,[ObjNull]];
if(!(_unit getVariable["restrained",FALSE])) exitWith {
		hint "The Civilian needs to be restrained";
		sleep 3;
		hint "Use Shift + R to do so";
}; //Error check?
createDialog "jail_time";
