#include <macro.h>
private["_vehicles","_control"];
disableSerialization;
_vehicles = [_this,0,[],[[]]] call BIS_fnc_param;
ctrlShow[2803,false];
ctrlShow[2830,false];
waitUntil {!isNull (findDisplay 2800)};
if(count _vehicles == 0) exitWith
{
	ctrlSetText[2811,localize "STR_Garage_NoVehicles"];
};
_control = ((findDisplay 2800) displayCtrl 2802);
lbClear _control;
{
	_vehicleInfo = [_x select 2] call life_fnc_fetchVehInfo;
	_control lbAdd (_vehicleInfo select 3);
	//_tmp = [_x select 2,_x select 8];
	_tmp = [_x select 2,_x select 8,_x select 9];
	_tmp = str(_tmp);
	_control lbSetData [(lbSize _control)-1,_tmp];
	_control lbSetPicture [(lbSize _control)-1,_vehicleInfo select 2];
	_control lbSetValue [(lbSize _control)-1,_x select 0];
} foreach _vehicles;
ctrlShow[2810,false];
ctrlShow[2811,false];