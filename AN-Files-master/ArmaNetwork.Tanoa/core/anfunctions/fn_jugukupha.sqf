/*
	Author: Bryan "Tonic" Boardwine
	Description:
	Initiates the wire-transfer
*/
params [
	["_value",0,[0]],
	["_from","",[""]]
];

if((_value isEqualTo 0) OR (_from isEqualTo "") OR (_from isEqualTo profileName)) exitWith {};
[_value,1,0] call life_fnc_sewawruk;
["ReceiveTransfer"] call life_fnc_notificationHandler;
