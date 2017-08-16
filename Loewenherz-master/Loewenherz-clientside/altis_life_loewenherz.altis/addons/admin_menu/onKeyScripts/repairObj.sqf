private ["_vehicle","_newFuel","_type","_nameType","_selection","_isVehicle","_isBuilding","_isAmmoBox","_object","_txtTmp"];
_vehicle = _this select 0;
if (isNil "_vehicle") exitWith {Hint "Error getting Cursor Object\n Try Again!"};

_isVehicle = _vehicle isKindOf "AllVehicles";
_isBuilding = _vehicle isKindOf "Building";
_isAmmoBox = _vehicle isKindOf "Reammobox_F";
sleep 0.1;
if(_isVehicle or _isAmmoBox or _isBuilding) then {
	if(Damage _vehicle > 0 ) then {
			_nameType = getText(configFile >> "cfgVehicles" >> (typeOf _vehicle) >> "displayName");

			// Exit if no Object is on target
			if !(_vehicle isKindOf "All") exitWith {
				cutText [format["Error - Invalid or No Target!"], "PLAIN DOWN"];
				hint "Error - Invalid or No Target\n Try again";
			};

			_vehicle setVectorUp [0,0,1];
			_vehicle setvelocity [0,0,1];
			_vehicle setDamage 0;
			_vehicle setFuel 1;
			_vehicle setVehicleAmmo 1;

			_txtTmp = format ["%1 was repaired",_nameType];
			[_txtTmp, -1, 1.2, 5, 0, 0, 11123] spawn BIS_fnc_dynamicText;


			[["admin",(format["%1 with UID %2 repairs a Object/Vehicle - Type: %3",name player,getPlayerUID player,typeOf _vehicle])],"TON_fnc_externLog",false,false] call lhm_fnc_mp;
		} else {
			["Nothing to repair", -1, 1.2, 5, 0, 0, 11123] spawn BIS_fnc_dynamicText;
		};
};