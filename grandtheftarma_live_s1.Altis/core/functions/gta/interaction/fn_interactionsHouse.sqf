/**
* Copyright © 2015 DnA, Grand Theft ArmA.
* All Rights Reserved.
*/

private ["_object", "_interactions", "_isOwner"];
_object = [_this, 0, objNull, [objNull]] call GTA_fnc_param;
_interactions = [];

//--- Error checks
if !([player, _object, 2] call GTA_fnc_boundingCollision) exitWith {[]};
if (
  typeOf _object in ["Land_i_House_Big_01_V1_F", "Land_i_House_Big_01_V2_F", "Land_i_House_Big_01_V3_F", "Land_i_House_Big_02_V1_F", "Land_i_House_Big_02_V2_F", "Land_i_House_Big_02_V3_F"]
  && {_object in allMissionObjects "House_F"}
) exitWith {[]};

//--- Side
switch playerSide do {
  case west: {
    //--- Bank
    if (!isNil {_object getVariable "bank"}) exitWith {
      private ["_bank", "_vault", "_doors", "_door"];
      _bank = _object getVariable "bank";
      _vault = _object getVariable "bankVault";
      _doors = getArray (missionConfigFile >> "GTA_CfgBanks" >> _bank >> "Vaults" >> _vault >> "doors");
      _door = [_object] call GTA_fnc_nearestDoor;

      //--- Check nearest door
      if (_door in _doors) then {
        //--- Lock or unlock
        if (_object getVariable [format ["BIS_disabled_door_%1", _door], 0] == 0) then {
          //--- Lock vault door
          _interactions pushBack ["Lock Vault", {[_this, true] call GTA_fnc_bankLockVault}];
        } else {
          if (["GTA_milRank"] call GTA_fnc_const >= 2 || {["GTA_copRank"] call GTA_fnc_const >= 6}) then {
            //--- Unlock vault door
            _interactions pushBack ["Unlock Vault", {[_this, false] call GTA_fnc_bankLockVault}];
          };
        };
      };
    };

    //--- Property
    if (!isNil {_object getVariable "house_owner"}) exitWith {
      //--- Owner
      if ([] call GTA_fnc_isMilitary || {["GTA_copRank"] call GTA_fnc_const >= 6}) then {
        _interactions pushBack ["Owner", life_fnc_copHouseOwner];
      };

      //--- Raid
      _interactions pushBack ["Break Lock", GTA_fnc_itemBoltcutter, 0, life_inv_boltcutter > 0, "Requires a bolt cutter"];

      //--- Search
      /*if (player distance _object <= 4) then {
        _interactions pushBack ["Search", GTA_fnc_searchHouse];
      };*/

      //--- Lock
      _interactions pushBack ["Lock", life_fnc_lockupHouse];
    };
  };

  case civilian: {
    //--- Bank
    if (!isNil {_object getVariable "bank"}) exitWith {
      private ["_bank", "_vault", "_doors", "_door"];
      _bank = _object getVariable "bank";
      _vault = _object getVariable "bankVault";
      _doors = getArray (missionConfigFile >> "GTA_CfgBanks" >> _bank >> "Vaults" >> _vault >> "doors");
      _door = [_object] call GTA_fnc_nearestDoor;

      //--- Check nearest door
      if (_door in _doors) then {
        //--- Check if doors is locked
        if (_object getVariable [format ["BIS_disabled_door_%1", _door], 0] == 1) then {
          //--- Drill vault door
          _interactions pushBack ["Drill Vault Door", GTA_fnc_itemDrill, 0, life_inv_drill > 0, "Requires a drill"];
        };
      };
    };

    //--- Check house config
    if (([typeOf _object] call life_fnc_houseConfig) isEqualTo []) exitWith {};
    if (isNil {_object getVariable "house_owner"}) then {
      _interactions pushBack ["Buy House", life_fnc_buyHouse];
    } else {
      //--- Is owner
      _isOwner = ((_object getVariable "house_owner") select 0) == getPlayerUID player;

      //--- Has keys
      if (_object in life_vehicles) then {
        //--- Garage or house
        if (typeOf _object in ["Land_i_Garage_V1_F", "Land_i_Garage_V2_F"]) then {
          //--- Sell garage
          if (_isOwner) then {
            _interactions pushBack ["Sell Garage", life_fnc_sellHouse];
          };

          //--- Access garage
          _interactions pushBack ["Garage", {[_this, "Car"] call life_fnc_vehicleGarage}];

          //--- Store vehicle
          _interactions pushBack ["Store Vehicle", {[_this, player, nil, ["Car", "Tank"]] call life_fnc_storeVehicle}];
        } else {
          if (_isOwner) then {
            //--- Sell house
            _interactions pushBack ["Sell House", life_fnc_sellHouse];
          };

          //--- Unlock / lock storage
          if (_object getVariable ["locked", false]) then {
            _interactions pushBack ["Unlock Storage", life_fnc_lockHouse];
          } else {
            _interactions pushBack ["Lock Storage", life_fnc_lockHouse];
          };

          //--- Lights on / off
          if (isNull (_object getVariable ["lightSource", objNull])) then {
            _interactions pushBack ["Lights On", life_fnc_lightHouseAction];
          } else {
            _interactions pushBack ["Lights Off", life_fnc_lightHouseAction];
          };

          //--- Upgrade locks
          if (_isOwner) then {
            _interactions pushBack ["Upgrade Locks", GTA_fnc_upgradeHouseLocks];
          };
        };
      };
    };
  };
};

_interactions
