/*
	File: fn_chopShopMenu.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Opens & initializes the chop shop menu.
*/
if (playerside == west) exitWith {hint "Cops cannot use the chop shop. Damn crooked cops!";};
if(life_action_in_use) exitWith {hint "An action is already being processed..."};
disableSerialization;
private["_nearVehicles","_control"];
_nearVehicles = nearestObjects [getMarkerPos (_this select 3),["Car","Air","Truck","Land_CargoBox_V1_F","Land_Cargo20_red_F","Ship"],25];

life_chopShop = (_this select 3);
//Error check
if(count _nearVehicles == 0) exitWith {titleText["There are no vehicles near to sell.","PLAIN"];};
if(!(createDialog "Chop_Shop")) exitWith {hint "There was a problem opening the chop shop menu."};

_control = ((findDisplay 39400) displayCtrl 39402);
while { !isNull (findDisplay 39400) } do
{
	lbClear _control;
	{
		_className = typeOf _x;
		_dbInfo = _x getVariable["dbInfo",[]];
		if(count _dbInfo > 0) then 
		{
			if (!isNil {_dbInfo select 4}) then
			{
				if((alive _x && !(_x getVariable ["vLoaded", false])) || _className in ["Land_CargoBox_V1_F","Land_Cargo20_red_F"]) then {
					_displayName = getText(configFile >> "CfgVehicles" >> _className >> "displayName");
					_picture = getText(configFile >> "CfgVehicles" >> _className >> "picture");
					_ind = -1;
					_side = switch (_dbInfo select 4) do
					{
						case "cop": { west };
						case "med": { independent };
						default { civilian };
					};
					{ if ((_x select 8) == _side && (_className == (_x select 1) || configName (inheritsFrom (configFile >> "CfgVehicles" >> _className)) == _x select 1)) then { _ind = _forEachIndex } } forEach life_vehicleInfo;
					
					if(_ind != -1) then {
						_price = (life_vehicleInfo select _ind) select 2;
						_price = if ((life_turf_list select 1) select 1 == life_gang) then { ceil(_price * 0.6) } else { ceil(_price * 0.5) };
						
						_control lbAdd _displayName;
						_control lbSetData [(lbSize _control)-1,str(_forEachIndex)];
						if (!(_className in ["Land_CargoBox_V1_F","Land_Cargo20_red_F"])) then { _control lbSetPicture [(lbSize _control)-1,_picture]; };
						_control lbSetValue [(lbSize _control)-1,_price];
					};
				};
			};
		};
	} foreach _nearVehicles;
	sleep 2;
};