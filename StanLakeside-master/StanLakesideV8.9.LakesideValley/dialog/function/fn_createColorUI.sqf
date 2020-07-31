/*
	fn_createColorUI.sqf
	Pennyworth
*/

private ["_CT_XSLIDER1", "_CT_XSLIDER2", "_CT_XSLIDER3", "_red", "_green", "_blue", "_control"];
if(player getVariable ["restrained", false]) exitWith {["Skute osoby nie moge patrzec na autka.", false] spawn domsg};
createDialog "ColorSelectorUI";

disableSerialization;

life_showRoomVehicle = _this;

_CT_XSLIDER1 = (findDisplay 17500) displayctrl 17501;
_CT_XSLIDER2 = (findDisplay 17500) displayctrl 17502;
_CT_XSLIDER3 = (findDisplay 17500) displayctrl 17503;

_red = parseNumber (life_showRoomVehicle getVariable "Red");
_green = parseNumber (life_showRoomVehicle getVariable "Green");
_blue = parseNumber (life_showRoomVehicle getVariable "Blue");

_CT_XSLIDER1 sliderSetPosition (_red * 10);
_CT_XSLIDER2 sliderSetPosition (_green * 10);
_CT_XSLIDER3 sliderSetPosition (_blue * 10);
call compile format ["ctrlSetText [17521, ""%1%2""]", floor(_red * 100),"%"];
call compile format ["ctrlSetText [17522, ""%1%2""]", floor(_green * 100),"%"];
call compile format ["ctrlSetText [17523, ""%1%2""]", floor(_blue * 100),"%"];
_control = (findDisplay 17500) displayCtrl 17504;
_control ctrlSetBackgroundColor [(sliderPosition 17501)/10, (sliderPosition 17502)/10, (sliderPosition 17503)/10, 1];

_className = typeOf life_showRoomVehicle;

_list = ["showroom_car"] call life_fnc_vehicleListCfg;
_price = -1;

{
	if((_x select 0) find _className != -1) exitWith {
		_price = _x select 1
	};
} count _list;

if(_price isEqualTo -1) exitWith {};


_vehicleInfo = [_className] call life_fnc_fetchVehInfo;
_trunkSpace = [_className] call life_fnc_vehicleWeightCfg;

((findDisplay 17500) displayCtrl 17508) ctrlSetStructuredText parseText format[
(localize "STR_Shop_Veh_UI_Ownership")+ " <t color='#8cff9b'>$%1</t><br/>" +(localize "STR_Shop_Veh_UI_MaxSpeed")+ " %2 km/h<br/>" +(localize "STR_Shop_Veh_UI_HPower")+ " %3<br/>" +(localize "STR_Shop_Veh_UI_PSeats")+ " %4<br/>" +(localize "STR_Shop_Veh_UI_Trunk")+ " %5<br/>" +(localize "STR_Shop_Veh_UI_Fuel")+ " %6<br/>" +(localize "STR_Shop_Veh_UI_Armor")+ " %7",
[_price] call life_fnc_numberText,
_vehicleInfo select 8,
_vehicleInfo select 11,
_vehicleInfo select 10,
if(_trunkSpace == -1) then {"None"} else {_trunkSpace},
_vehicleInfo select 12,
_vehicleInfo select 9
];
