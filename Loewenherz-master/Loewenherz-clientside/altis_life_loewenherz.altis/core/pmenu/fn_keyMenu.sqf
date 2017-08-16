/*
	File: fn_keyMenu.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Initializes the key menu
	Will be revised.
*/
private["_display","_vehicles","_plist","_near_units","_pic","_name","_text","_color","_index"];
disableSerialization;

waitUntil {!isNull (findDisplay 2700)};
_display = findDisplay 2700;
_vehicles = _display displayCtrl 2701;
lbClear _vehicles;
_plist = _display displayCtrl 2702;
lbClear _plist;
_near_units = [];
_GangKeyBtn = _display displayCtrl 2704;

ctrlSetText[7858,format["%1:%2", LHM_clock select 3, LHM_clock select 4]];

{ if(player distance _x < 20) then {_near_units pushBack _x};} foreach playableUnits;

for "_i" from 0 to (count lhm_vehicles)-1 do
{
	_veh = lhm_vehicles select _i;
	if(!isNull _veh && alive _veh) then
	{
		_color = [(typeOf _veh),(_veh getVariable "lhm_VEH_color")] call lhm_fnc_vehicleColorStr;
		_text = format["(%1)",_color];
		if(_text == "()") then
		{
			_text = "";
		};

		_name = getText(configFile >> "CfgVehicles" >> (typeOf _veh) >> "displayName");
		_pic = getText(configFile >> "CfgVehicles" >> (typeOf _veh) >> "picture");
		_vehicles lbAdd format["%1: %2m %3",_name,round(player distance _veh),_text];
		if(_pic != "pictureStaticObject") then {
			_vehicles lbSetPicture [(lbSize _vehicles)-1,_pic];
		};
		_vehicles lbSetData [(lbSize _vehicles)-1,str(_i)];
	};
};

{
	if(!isNull _x && alive _x && player distance _x < 20 && _x != player) then
	{
		_plist lbAdd format["%1 - %2",_x getVariable["realname",name _x], side _x];
		_plist lbSetData [(lbSize _plist)-1,str(_x)];
	};
} foreach _near_units;

if(((lbSize _vehicles)-1) == -1) then
{
	_vehicles lbAdd "You don't own any vehicles";
	_vehicles lbSetData [(lbSize _vehicles)-1,str(ObjNull)];
};

if(side player == civilian && (!isnil {(group player) getVariable "gang_owner"})) then {
	_GangKeyBtn ctrlShow true;
	} else {
	_GangKeyBtn ctrlShow false;
	};