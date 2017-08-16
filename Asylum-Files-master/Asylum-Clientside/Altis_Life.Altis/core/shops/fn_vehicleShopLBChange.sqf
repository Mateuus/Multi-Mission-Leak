/*
	File: fn_vehicleShopLBChange.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Called when a new selection is made in the list box and
	displays various bits of information about the vehicle.
*/
disableSerialization;
private["_control","_index","_className","_basePrice","_vehicleInfo","_colorArray","_ctrl","_data"];
_control = _this select 0;
_index = _this select 1;

_data = call compile (_control lbData _index);
_className = _data select 0;
_vIndex = _control lbValue _index;
_vehicleList = [life_veh_shop] call life_fnc_vehicleListCfg;
_basePrice = (_vehicleList select _vIndex) select 1;
if ((life_configuration select 3) > 0) then
{
_basePrice = round (_basePrice + (_basePrice * ((life_configuration select 3) / 100)));
};
_vehicleInfo = [_className] call life_fnc_fetchVehInfo;
_trunkSpace = (_vehicleList select _vIndex) select 2;

_qty = _className call life_fnc_getQuantity;
if (playerSide in [west,independent]) then { _qty = -1; };
_basePrice = [_className,_basePrice,_qty] call life_fnc_calcPrice;

//_basePrice = round (_basePrice - (((life_donator * 4) / 100) * _basePrice));
if (_qty == 0) then { _basePrice = _basePrice * 1.25 };

_ctrl = (findDisplay 2300) displayCtrl 2303;
ctrlShow [2330,true];

_available = switch (_qty) do
{
	case -1: { "<t color='#00ff00'>Unlimited</t>" };
	case 0: { "<t color='#ff0000'>HIGH DEMAND</t>" };
	default { format["<t color='#00ff00'>%1</t>",_qty] };
};

_ctrl ctrlSetStructuredText parseText format["<t size='1.5'><img image='%9' size='1.5'/> %10</t><br/><br/>Class: %11<br/>Purchase Price: <t color='#8cff9b'>$%1</t><br/>Quantity Available: <t color='#8cff9b'>%2</t><br/>Max Speed: %3 km/h<br/>Horse Power: %4<br/>Passenger Seats: %5<br/>Trunk Capacity: %6<br/>Fuel Capacity: %7<br/>Armor Rating: %8",
[_basePrice] call life_fnc_numberText,
_available,
_vehicleInfo select 8,
_vehicleInfo select 11,
_vehicleInfo select 10,
if(_trunkSpace < 1) then {"None"} else {_trunkSpace},
_vehicleInfo select 12,
_vehicleInfo select 9,
_vehicleInfo select 2,
_vehicleInfo select 3,
_vehicleInfo select 4
];

ctrlShow[2303,true];
ctrlShow[2355,true];
ctrlEnable[2308,!(playerSide == west && _className == "B_G_Offroad_01_armed_F")];

[] call life_fnc_vehicleColorList;

true;