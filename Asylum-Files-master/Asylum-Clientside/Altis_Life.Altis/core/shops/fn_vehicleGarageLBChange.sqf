/*
	File: fn_vehicleGarageLBChange.sqf
	Author: John "Paratus" VanderZwet

	Description:
	Called when a new selection is made in the list box and
	displays various bits of information about the vehicle.
*/
disableSerialization;
private["_control","_index","_className","_basePrice","_vehicleInfo","_colorArray","_ctrl","_vData","_price"];
_control = _this select 0;
_index = _this select 1;

_vData = call compile (_control lbData _index);
_className = _vData select 0;
_vehicleList = [life_veh_shop] call life_fnc_vehicleListCfg;
_vehicleInfo = [_className] call life_fnc_fetchVehInfo;
_trunkSpace = [_className] call life_fnc_vehicleWeightCfg;

_price = [_className,life_garage_prices] call life_fnc_index;
if(_price == -1) then {_price = 100;} else {_price = (life_garage_prices select _price) select 1;};
if(playerSide == independent) then {_price = round(_price * 0.5);};
_color = [_className,call compile (_vData select 2)] call life_fnc_vehicleColorStr;
_ctrl = (findDisplay 2800) displayCtrl 2803;
ctrlShow [2830,true];
_ctrl ctrlSetStructuredText parseText format["<t size='1.5'><img image='%9' size='1.5'/> %10</t><br/><br/>Class: %11 (license plate %16)<br/>Garage Fee: <t color='#8cff9b'>$%1</t><br/>Sale Price: <t color='#8cff9b'>$%12</t><br/>Max Speed: %3 km/h<br/>Horse Power: %4<br/>Passenger Seats: %5<br/>Trunk Capacity: %6<br/>Fuel Capacity: %7 (%13%15 full)<br/>Armor Rating: %8 (%14%15 damage)<br/>%17",
	[_vData select 6] call life_fnc_numberText,
	[(_vData select 6) + (_vData select 7)] call life_fnc_numberText,
	_vehicleInfo select 8,
	_vehicleInfo select 11,
	_vehicleInfo select 10,
	if((_vData select 9) < 1) then {"None"} else {(_vData select 9)},
	_vehicleInfo select 12,
	_vehicleInfo select 9,
	_vehicleInfo select 2,
	_vehicleInfo select 3,
	_vehicleInfo select 4,
	[(_vData select 8)] call life_fnc_numberText,
	_vData select 3,
	_vData select 4,
	"%",
	_vData select 1,
	if(_color != "") then {format["Color: %1",_color]} else {""}
];

ctrlEnable[2808,!(playerSide == west && _className == "B_G_Offroad_01_armed_F")];
ctrlShow[2803,true];

true;
