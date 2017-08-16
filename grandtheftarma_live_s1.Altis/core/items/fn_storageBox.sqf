private ["_boxType", "_house", "_containers", "_houseCfg", "_positions", "_pos", "_container"];
_boxType = _this select 0;
_house = [ASLtoAGL getPosASL player] call GTA_fnc_nearestBuilding;

if !(_house in life_vehicles) exitWith {hint localize "STR_ISTR_Box_NotinHouse"};
_containers = _house getVariable ["containers", []];
_houseCfg = [typeOf _house] call life_fnc_houseConfig;
if (count _houseCfg == 0) exitWith {};
if (count _containers >= _houseCfg select 1) exitWith {hint localize "STR_ISTR_Box_HouseFull"};

//--- Get storage positions
_positions = [_house] call life_fnc_getBuildingPositions;

//--- Check slots
_slots = _house getVariable ["slots", []];
{
  if !(_forEachIndex in _slots) exitWith {
    _slots pushBack _forEachIndex;
    _house setVariable ["slots", _slots, true];
    _pos = _x;
  };
} forEach _positions;

//--- No slots available
if (isNil "_pos") exitWith {hint localize "STR_ISTR_Box_HouseFull_2"};

if !([false, _boxType, 1] call life_fnc_handleInv) exitWith {};

//--- Determine box type
_boxType = switch _boxType do {
  case "storagesmall": {"Box_IND_Grenades_F"};
  case "storagebig": {"B_supplyCrate_F"};
  default {};
};

//--- Create and sync the box
if (!isNil "_boxType") then {
  _container = createVehicle [_boxType, _pos, [], 0, "CAN_COLLIDE"];
  _container allowDamage false;

  //--- Clear crate cargo
  clearWeaponCargoGlobal _container;
  clearMagazineCargoGlobal _container;
  clearItemCargoGlobal _container;
  clearBackpackCargoGlobal _container;

  //--- Set position
  _container setPosASL AGLtoASL _pos;

  //--- Store house
  _container setVariable ["house", _house, true];

  //--- Update containers array
  _containers pushBack _container;
  _house setVariable ["containers", _containers, true];

  //--- Sync
  [[_house], "TON_fnc_updateHouseContainers", false] call GTA_fnc_remoteExec;
};
