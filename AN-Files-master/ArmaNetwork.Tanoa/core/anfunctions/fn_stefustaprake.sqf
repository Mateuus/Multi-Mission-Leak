/*
	ArmA.Network
	Rathbone
	(c) ArmA.Network 2016

	The usage of this file is restricted to ArmA.Network
	You're not allowed to modify this file!
	Licensed under the Arma EULA and Arma Tools EULA.
	For further questions contact the author!
*/
createDialog "an_gangzones";
_list = ((findDisplay 2623) displayCtrl 1500);
lbClear _list;
{
  _list lbAdd format ["%1 - %2",_x select 1,_x select 0];
} forEach life_capture_list;
