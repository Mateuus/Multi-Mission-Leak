if (dialog) exitWith {};
disableSerialization;
private ["_vehicle", "_trunkUser", "_veh_data"];
_vehicle = [_this, 0, objNull, [objNull]] call GTA_fnc_param;

//--- Check is valid type
if (isNull _vehicle OR !([_vehicle, ["Car", "Air", "Ship", "House_F", "Slingload_01_Base_F"]] call GTA_fnc_isKindOf)) exitWith {};

//--- Cargo Container rope check
if (!isNull ropeAttachedTo _vehicle) exitWith {
  hint "A container cannot be accessed while sling loaded by a helicopter.";
};

//--- User check
_trunkUser = _vehicle getVariable ["trunk_user", objNull];
if (!isNull _trunkUser && {_trunkUser != player} && {alive _trunkUser}) exitWith {hint localize "STR_MISC_VehInvUse"};
_vehicle setVariable ["trunk_user", player, true];

//--- Dialog error?
if (!createDialog "TrunkMenu") exitWith {hint localize "STR_MISC_DialogError";};

//--- Check for multiple trunk users
_vehicle spawn {
  private "_trunkUser";

  waitUntil {
    //--- Get current trunk user
    _trunkUser = _this getVariable ["trunk_user", objNull];

    if (
      //--- User check
      (!isNull _trunkUser && {_trunkUser != player} && {alive _trunkUser})

      //--- Rope check
      || {!isNull ropeAttachedTo _this}
    ) exitWith {
      closeDialog 2;
    };

    isNull findDisplay 3500
  };
};

//--- Trunk title
ctrlSetText [3501, format [localize (["STR_MISC_VehStorage", "STR_MISC_HouseStorage"] select (_vehicle isKindOf "House_F")), getText (configFile >> "CfgVehicles" >> (typeOf _vehicle) >> "displayName")]];

//--- Get storage load and capacity
if (_vehicle isKindOf "House_F") then {
	private "_mWeight";
	_mWeight = 0;

	{
    _mWeight = _mWeight + ([typeOf _x] call life_fnc_vehicleWeightCfg);
  } forEach (_vehicle getVariable ["containers", []]);

	_veh_data = [_mWeight, (_vehicle getVariable ["trunk", [[],0]]) select 1];
} else {
	_veh_data = [_vehicle] call life_fnc_vehicleWeight;
};

//--- House has no storage containers
if (_vehicle isKindOf "House_F" && {count (_vehicle getVariable ["containers", []]) == 0}) exitWith {
  hint localize "STR_MISC_NoStorageWarn";
  closeDialog 0;
  _vehicle setVariable ["trunk_user", nil, true];
};

//--- Vehicle has no storage capacity
if (
  (_vehicle isKindOf "House_F" && {count (_vehicle getVariable ["containers", []]) == 0})
  || {_veh_data select 0 == -1 && {!(_vehicle isKindOf "House_F")}}
) exitWith {
  closeDialog 0;
  _vehicle setVariable ["trunk_user", nil, true];
  hint localize (["STR_MISC_NoStorageVeh", "STR_MISC_NoStorageWarn"] select (_vehicle isKindOf "House_F"));
};

//--- Declare vehicle in global namespace
life_trunk_vehicle = _vehicle;

//--- Display load and capacity
ctrlSetText [3504, format [localize "STR_MISC_Weight", _veh_data select 1, _veh_data select 0]];

//--- Populate inventory lists
[_vehicle] call life_fnc_vehInventory;

//--- OnUnload
_vehicle spawn {
  //--- Wait for close
	waitUntil {isNull findDisplay 3500};

  //--- trunk Nil user
	_this setVariable ["trunk_user", nil, true];

  //--- Sync house trunk
	if(_this isKindOf "House_F") then {
		[[_this], "TON_fnc_updateHouseTrunk", false] call GTA_fnc_remoteExec;
	};
};
