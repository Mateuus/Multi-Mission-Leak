/**
 * Copyright © 2015 DnA, Grand Theft ArmA.
 * All Rights Reserved.
 */

params ["_init"];

if (_init == "postInit") then {
  if (isServer) then {
    //--- Hide terrain objects
    {
      private _cfg = _x;

      //--- Read position
      private _pos = getArray (_cfg >> "position");

      //--- Check for map type
      private _mapType = _cfg >> "mapType";
      _mapType = switch true do {
        case (isText _mapType): {[getText _mapType]};
        case (isArray _mapType): {getArray _mapType};
        default {[]};
      };

      //--- Read radius
      private _radius = getNumber (_cfg >> "radius");
      _radius = 4 max _radius;

      //--- Get nearest objects matching the criteria
      private _objects = nearestTerrainObjects [_pos, _mapType, _radius];

      if !(_objects isEqualTo []) then {
        {
          scopeName "loop";
          private _object = _x;

          //--- Read object type
          private _type = _cfg >> "type";
          _type = switch true do {
            case (isText _type): {[getText _type]};
            case (isArray _type): {getArray _type};
            default {};
          };

          //--- Check object type and model type (if given)
          if (
            !isObjectHidden _object
            && {isNil "_type"
              || {{_x == typeOf _object} count _type > 0}
              || {{str _object find ": " + _x != -1} count _type > 0}
            }
          ) then {
            //--- Hide object
            if (getNumber (_cfg >> "hide") > 0 || {isArray (_cfg >> "replacement")}) then {
              if (isMultiplayer) then {
                _object hideObjectGlobal true;
              } else {
                _object hideObject true;
              };

              //--- Disable simulation and damage
              _object enableSimulation false;
              _object allowDamage false;

              //--- Replacement object
              private _replacement = _cfg >> "replacement";
              _replacement = switch true do {
                case (isText _replacement): {[getText _replacement]};
                case (isArray _replacement): {getArray _replacement};
                default {};
              };
              if (!isNil "_replacement") then {
                _replacement = createVehicle [_replacement call BIS_fnc_selectRandom, getPosATL _object, [], 0, "CAN_COLLIDE"];
                _replacement setVectorDirAndUp [vectorDir _object, vectorUp _object];
                _replacement setPosASL getPosASL _object;

                //--- Disable simulation and damage of replacement
                _replacement enableSimulation false;
                _replacement allowDamage false;

                //--- Assign replacement as object
                _object = _replacement;
              };
            };

            //--- Lock doors
            private _lockDoors = _cfg >> "lockDoors";
            if (isNumber _lockDoors && {getNumber _lockDoors > 0} || {isArray _lockDoors}) then {
              if (isArray _lockDoors) then {
                //--- Lock specific doors
                {
                  _object setVariable [format ["BIS_disabled_door_%1", _x], 1, true];
                } forEach getArray _lockDoors;
              } else {
                //--- Lock all doors
                for "_i" from 1 to (getNumber (configFile >> "CfgVehicles" >> typeOf _object >> "numberOfDoors")) do {
                  _object setVariable [format ["BIS_disabled_door_%1", _i], 1, true];
                };
              };
            };

            //--- Recursive?
            if (getNumber (_cfg >> "recursive") <= 0) then {
              breakOut "loop";
            };
          };
        } forEach _objects;
      };
    } forEach ("true" configClasses (missionConfigFile >> "GTA_CfgWorlds" >> worldName >> "TerrainObjects"));

    //--- Hide all terrain ATMs
    {
      {
        if (str _x find ": atm_" != -1) then {
          if (alive _x) then {
            if (isMultiplayer) then {
              _x hideObjectGlobal true;
            } else {
              _x hideObject true;
            };
          };
        };
      } forEach nearestTerrainObjects [_x, [], 5];
    } forEach ([] call GTA_fnc_atmPositions);
  };
};
