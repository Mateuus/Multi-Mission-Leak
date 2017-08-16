private ["_isVehicle","_isBuilding","_isAmmoBox","_isCargoHolder","_isMan","_object","_objectid","_gangid","_text","_txtTmp","_result"];
_object = _this select 0;
if (isNil "_object") exitWith {Hint "Error getting Cursor Object\n Try Again!"};

_isVehicle = _object isKindOf "AllVehicles";
_isBuilding = _object isKindOf "Building";
_isAmmoBox = _object isKindOf "Reammobox_F";
_isCargoHolder = _object isKindOf "GroundWeaponHolder";
_isMan = _object isKindOf "Man";

sleep 0.1;
if((_isVehicle or _isBuilding or _isAmmoBox or _isCargoHolder) and !_isMan) then {
	if !(_object isKindOf "All") exitWith {
		cutText [format["Error - Invalid or No Target!"], "PLAIN DOWN"];
		hint "Error - Invalid or No Target\n Try again";
	};

	_objectid = _object getVariable ["ObjectID",0];
	_gangid = _object getVariable ["gangarea_id",-1];

	_text = getText (configFile >> "CfgVehicles" >> (typeOf _object) >> "displayName");

	// If Object is a Vehicle do this
	If (_object isKindOf "AllVehicles") then {
	[[_object,true,player],"TON_fnc_vehicleStore",false,false] call lhm_fnc_mp; // lhm Delete or Store Vehicle
	} else {
		// if is not vehicle is it a persistant building
		If (_objectid != 0 || _gangid != -1) then {

		_result = [format["%1 is a persistant Object. Are you sure ?",_text], "Confirm Remove", true, true] call BIS_fnc_guiMessage;
		waituntil{ str _result == "true" or  str _result == "false"};
		if (_result) then {
			[[_objectid,_gangid,_object],"build_fnc_deleteObject",false,false] call lhm_fnc_mp;
		};
		} else {
		// if nothing else then just delete it
		 sleep 0.2;
		deleteVehicle _object;
		};
	};

	sleep 0.5;

	if(isNull _object) then {
		_txtTmp = format ["You removed a %1 successfully!",_text];
		[_txtTmp, -1, 1.2, 5, 0, 0, 11123] spawn BIS_fnc_dynamicText;
		[["admin",(format["%1 with UID %2 removed an Object %3",name player,getPlayerUID player,typeOf _object])],"TON_fnc_externLog",false,false] call lhm_fnc_mp;
	} else {
			["Remove aborted", -1, 1.2, 5, 0, 0, 11123] spawn BIS_fnc_dynamicText;
	};

};