/*
	ArmA.Network
	Rathbone
	(c) ArmA.Network 2016

	The usage of this file is restricted to ArmA.Network
	You're not allowed to modify this file!
	Licensed under the Arma EULA and Arma Tools EULA.
	For further questions contact the author!
*/
params [
  ["_data",[],[[]]]
];
if(count _data isEqualTo 0) exitWith {hintSilent "No Gang Members are Offline";};
createDialog "an_gangoffline";
ctrlEnable[2401,false];

_list = ((findDisplay 2625) displayCtrl 1500);

lbClear _list;
{
  _list lbAdd (_x select 0);
  _list lbSetData [(lbSize _list)-1,str(_x)];
} forEach _data;

ctrlEnable[2401,true];
