#include <macro.h>
if(life_action_inUse) exitWith {hint "Une action est déjà en cours..."};
disableSerialization;
private["_nearVehicles","_control"];
_nearVehicles = nearestObjects [getMarkerPos (_this select 3),["Car","Truck","Air"],40];
life_chopShop = (_this select 3);
if(count _nearVehicles == 0) exitWith {titleText["Il n'y a pas de véhicules à proximité pour le vendre.","PLAIN"];};
if(!(createDialog "Chop_Shop")) exitWith {hint "Il y a eu un probleme avec la boutique."};
_control = CONTROL(39400,39402);
{
	if(alive _x) then {
		_className = typeOf _x;
		_displayName = getText(configFile >> "CfgVehicles" >> _className >> "displayName");
		_picture = getText(configFile >> "CfgVehicles" >> _className >> "picture");
		//_price = M_CONFIG(getNumber,CONFIG_VEHICLES,_className,"chopShop");
		_ind = [_className,GETC(ANL_vehicules)] call TON_fnc_index;
		_price = (GETC(ANL_vehicules) select _ind) select 2;
		if(_ind != -1 && count crew _x == 0) then {
			_control lbAdd _displayName;
			_control lbSetData [(lbSize _control)-1,str(_forEachIndex)];
			_control lbSetPicture [(lbSize _control)-1,_picture];
			_control lbSetValue [(lbSize _control)-1,_price];
		};
	};
} foreach _nearVehicles;