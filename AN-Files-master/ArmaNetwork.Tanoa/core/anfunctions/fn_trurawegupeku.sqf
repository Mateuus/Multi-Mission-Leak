/*
	File: fn_impoundMenu.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Not actually a impound menu, may act as confusion to some but that is what I wanted.
	The purpose of this menu is it is now called a 'Garage' where vehicles are stored (persistent ones).
*/
disableSerialization;
private _vehicles = param [0,[],[[]]];

if(count _vehicles isEqualTo 0) exitWith
{
	["NoVehicleGarage"] call life_fnc_notificationHandler;
};

createDialog "life_impound_menu";
disableSerialization;
private _control = (findDisplay 2800) displayCtrl 2802;
lbClear _control;
{
	_vehicleInfo = [(_x select 2)] call life_fnc_dreputrasta;
	_control lbAdd (_vehicleInfo select 3);
	_tmp = [_x select 2,_x select 8];
	_tmp = str(_tmp);
	_control lbSetData [(lbSize _control)-1,_tmp];
	_control lbSetPicture [(lbSize _control)-1,_vehicleInfo select 2];
	_control lbSetValue [(lbSize _control)-1,_x select 0];
} forEach _vehicles;
