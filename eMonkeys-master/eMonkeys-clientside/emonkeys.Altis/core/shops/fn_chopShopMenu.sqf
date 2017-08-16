/*
	File: fn_chopShopMenu.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Opens & initializes the chop shop menu.
*/
if(eM_action_inUse) exitWith {hint "Momentan beschaeftigt."};
disableSerialization;
private["_nearVehicles","_control"];
_nearVehicles = nearestObjects [getMarkerPos (_this select 3),["B_Quadbike_01_F","C_SUV_01_F","C_Offroad_01_F","C_Hatchback_01_F","C_Hatchback_01_sport_F","C_Van_01_transport_F","B_Heli_Light_01_F""C_Heli_light_01_blue_F","C_Heli_Light_01_civil_F","O_Heli_Light_02_unarmed_F","O_MRAP_02_F","I_MRAP_03_F","B_MRAP_01_hmg_F","B_MRAP_01_F","B_G_Offroad_01_F"],12];

if(side player in [west,independent]) exitWith { hint "Du bist ein Beamter!" };
EMonkeys_chopShop = (_this select 3);
//Error check
_bay = _nearVehicles select 0;


if(count _nearVehicles == 0) exitWith {titleText["Es sind keine Fahrzeuge in der Nähe.","PLAIN"];};
if(!(createDialog "Chop_Shop")) exitWith {hint "Es gab ein Problem beim öffnen des Menüs"};

_control = ((findDisplay 39400) displayCtrl 39402);
{
	if(_x getVariable "bay") exitWith {hint "Das Fahrzeug ist beladen oder aufgeladen";};
	if(alive _x) then {

		_className = typeOf _x;
		_displayName = getText(configFile >> "CfgVehicles" >> _className >> "displayName");
		_picture = getText(configFile >> "CfgVehicles" >> _className >> "picture");
		_sell = getArray(missionConfigFile >> "CfgVehicles" >> _className >> "sellprice");
		_color = _x getVariable "EMonkeys_VEH_color";
		_color = getText(missionConfigFile >> "CfgVehicleColor" >> _className >> _color >> "name");
		_sell = _sell select 0;
		
		if(_sell != -1 && count crew _x == 0) then {
			_control lbAdd format["%1 [%2]",_displayName,_color];
			_control lbSetData [(lbSize _control)-1,str(_forEachIndex)];
			_control lbSetPicture [(lbSize _control)-1,_picture];
			_control lbSetValue [(lbSize _control)-1,_sell];
		};
	};

} foreach _nearVehicles;