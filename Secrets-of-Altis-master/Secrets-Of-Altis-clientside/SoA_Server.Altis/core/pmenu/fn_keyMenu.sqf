/*
	File: fn_keyMenu.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Initializes the key menu
	Will be revised.
*/
private["_display","_vehicles","_plist","_near_units","_pic","_name","_text","_color","_index","_flag"];
disableSerialization;

waitUntil {!isNull (findDisplay 2700)};
_display = findDisplay 2700;
_vehicles = _display displayCtrl 2701;
_plist = _display displayCtrl 2702;
_vehbutton = _display displayCtrl 2703;
_immobutton = _display displayCtrl 2704;
_immo = _display displayCtrl 2705;

_near_units = [];

lbClear _vehicles;
lbClear _plist;
lbClear _immo;

{ 
	if(player distance _x < 10) then {_near_units pushBack _x};
} foreach playableUnits;

//vehicles
for "_i" from 0 to (count life_vehicles)-1 do
{
	_veh = life_vehicles select _i;
	if(!isNull _veh && alive _veh && !(_veh iskindof "House_F")) then
	{
		_color = [(typeOf _veh),(_veh getVariable "Life_VEH_color")] call life_fnc_vehicleColorStr;
		_text = format["(%1)",_color];
		if(_text == "()") then {_text = ""};
		
		_name = getText(configFile >> "CfgVehicles" >> (typeOf _veh) >> "displayName");
		_pic = getText(configFile >> "CfgVehicles" >> (typeOf _veh) >> "picture");
		_vehicles lbAdd format["%1 %2",_name,_text];
		if(_pic != "pictureStaticObject") then {
			_vehicles lbSetPicture [(lbSize _vehicles)-1,_pic];
		};
		_vehicles lbSetData [(lbSize _vehicles)-1,str(_i)];
		_vehicles lbSetValue [(lbSize _vehicles)-1,round(player distance _veh)];
	};
};

//immobilien
for "_i" from 0 to (count life_vehicles)-1 do
{
	_veh = life_vehicles select _i;
	if(!isNull _veh && alive _veh && (_veh iskindof "House_F")) then
	{
		
		_name = getText(configFile >> "CfgVehicles" >> (typeOf _veh) >> "displayName");
		_immo lbAdd format["%1",_name];
		_immo lbSetPicture [(lbSize _immo)-1,"icons\house.paa"];
		_immo lbSetData [(lbSize _immo)-1,str(_i)];
	};
};

{
	_flag = switch(side _x) do {
		case civilian: {"Zivilist"};
		case west: {"Polizist"};
		case independent: {"AHW"};
	};

	if(!isNull _x && alive _x && player distance _x < 10 && _x != player) then
	{
		if(_x getVariable["nameanzeigen",false]) then {
			_plist lbAdd format["%1",_x getVariable["realname",name _x]];
			_plist lbSetData [(lbSize _plist)-1,str(_x)];
			} else {
			_plist lbAdd format["%1: %2m entfernt",_flag,round(player distance _x)];
			_plist lbSetData [(lbSize _plist)-1,str(_x)];
		};
	};
} foreach _near_units;


if(((lbSize _vehicles)-1) == -1) exitWith
{
	_vehicles lbAdd "Es wurden keine Fahrzeuge ausgeparkt.";
	_vehicles lbSetData [(lbSize _vehicles)-1,str(ObjNull)];
	_vehbutton ctrlEnable false;
};

if(((lbSize _immo)-1) == -1) exitWith
{
	_immo lbAdd "Du besitzt keine Immobilien.";
	_immo lbSetData [(lbSize _immo)-1,str(ObjNull)];
	_immobutton ctrlEnable false;
};