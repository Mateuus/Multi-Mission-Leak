/*
	File: fn_impoundMenu.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Not actually a impound menu, may act as confusion to some but that is what I wanted.
	The purpose of this menu is it is now called a 'Garage' where vehicles are stored (persistent ones).
*/
private["_vehicles","_control","_basePrice","_price","_sPrice","_row","_vData"];
disableSerialization;
_vehicles = [_this,0,[],[[]]] call BIS_fnc_param;

waitUntil {!isNull (findDisplay 2800)};

if(count _vehicles == 0) exitWith
{
	ctrlSetText[2802,"No vehicles found."];
};

ctrlSetText[2802,"Connection Good"];
_control = (findDisplay 2800) displayCtrl 2801;
lbClear _control;

{
	_price = 1000;
	_sPrice = 1500;
	_displayName = getText(configFile >> "CfgVehicles" >> (_x select 2) >> "displayName");
	_picture = getText(configFile >> "CfgVehicles" >> (_x select 2) >> "picture");

	_vData = [];
	_row = _x;
	{
		if (playerSide == _x select 8 && (_row select 2 == _x select 1 || configName (inheritsFrom (configFile >> "CfgVehicles" >> _row select 2)) == _x select 1)) exitWith { _vData = _x };
	} forEach life_vehicleInfo;
	if (count _vData > 0) then
	{
		_basePrice = _vData select 2;
		//_basePrice = round (_basePrice - (((life_donator * 4) / 100) * _basePrice));
		_storage = _vData select 3;
		_price = [(_x select 2),life_garage_prices] call life_fnc_index;
		if(_price == -1) then {_price = 100;} else {_price = (life_garage_prices select _price) select 1;};
		if(playerSide == independent) then {_price = round(_price * 0.5);};
		_sPrice = ceil(_basePrice * 0.5);
		_iPrice = round(_basePrice * 0.3);
		if ((_x select 2) in ["O_Heli_Transport_04_F","O_Heli_Transport_04_bench_F","B_Heli_Light_01_F","C_Heli_Light_01_civil_F","O_Heli_Light_02_unarmed_F","I_Heli_Transport_02_F","I_Heli_light_03_unarmed_F","B_Heli_Transport_03_unarmed_F","B_Heli_Transport_01_F"]) then { _iPrice = round(_basePrice * 0.08); };

		_control lbAdd format["%1", _displayName];
		_control lbSetData [(lbSize _control)-1,format["[""%1"",""%2"",""%3"",""%4"",""%5"",%6,%7,%8,%9,%10]", _x select 2,_x select 7,_x select 8,_x select 10,_x select 11,_x select 12,_price,_iPrice,_sPrice,_storage]]; // Class, plate, color, fuel, damage, alarm, garage fee, insurance, sell value, storage
		_control lbSetValue [(lbSize _control)-1,(call compile format["%1", _x select 0])];
		_control lbSetPicture [(lbSize _control)-1,_picture];
	};
} foreach _vehicles;
