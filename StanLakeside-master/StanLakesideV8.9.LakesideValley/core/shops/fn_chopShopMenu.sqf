/*
	File: fn_chopShopMenu.sqf
	
	
	Description:
	Opens & initializes the chop shop menu.
*/
if(life_action_inUse) exitWith {[localize "STR_NOTF_ActionInProc", false] spawn domsg;};
disableSerialization;
private["_nearVehicles","_control"];
_nearVehicles = nearestObjects [getMarkerPos (_this select 3),["Car","Motorbike","Motorcycle","Truck"],25];

life_chopShop = (_this select 3);
//Error check
if(count _nearVehicles == 0) exitWith {[localize "STR_Shop_NoVehNear", false] spawn domsg;};
if(!(createDialog "Chop_Shop")) exitWith {[localize "STR_Shop_ChopShopError", false] spawn domsg;};

_control = ((findDisplay 39400) displayCtrl 39402);
{
	if(!(_x getVariable["dead",FALSE])) then {
		_className = typeOf _x;
		_displayName = getText(configFile >> "CfgVehicles" >> _className >> "displayName");
		_picture = getText(configFile >> "CfgVehicles" >> _className >> "picture");
		_ind = [_className,(call life_garage_sell)] call fnc_index;
		
		if(_ind != -1 && count crew _x == 0) then {
			_price = ((call life_garage_sell) select _ind) select 1;
			_control lbAdd _displayName;
			_control lbSetData [(lbSize _control)-1,str(_forEachIndex)];
			_control lbSetPicture [(lbSize _control)-1,_picture];
			_control lbSetValue [(lbSize _control)-1,_price];
		};
	};
} foreach _nearVehicles;