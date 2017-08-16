#include "..\..\..\script_macros.hpp"
if (!alive player) exitWith {};
if(player getVariable "esg_bewusstlos")exitWith {};
if((call life_coplevel) < 2)exitWith {hint "Du hast den falschen Rang!"};
if(isNull (findDisplay 5523))then {
	createDialog "esg_fuelKiller";
};
disableSerialization;
_list = ((findDisplay 5523) displayCtrl 1500);
lbClear _list;
esg_fuelkillveh = [];
{
	if ((isNull _x) || !(alive _x))exitWith {};
	if(vehicle player != _x)then {
		_color = ((M_CONFIG(getArray,"LifeCfgVehicles",(typeOf _x),"textures") select (_x getVariable "Life_VEH_color")) select 0);
		if (isNil "_color") then {_color = ""};
		_name = getText(configFile >> "CfgVehicles" >> (typeOf _x) >> "displayName");
		_pic = getText(configFile >> "CfgVehicles" >> (typeOf _x) >> "picture");
		_driver = if((driver _x) isEqualTo ObjNull)then {"Kein Fahrer"}else{(driver _x) getVariable ["realname",name (driver _x)]};
		_list lbAdd format ["[%1] %2 - %3 - %4m",_driver,_name,_color,round(player distance _x)];
		if (_pic != "pictureStaticObject") then {
			_list lbSetPicture [(lbSize _list)-1,_pic];
		};
		esg_fuelkillveh pushback _x;
	};
}foreach (nearestObjects [player, ["Air","Car","Ship","Truck"], 150]);