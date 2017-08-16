/**
 * Copyright © 2015 DnA, Grand Theft ArmA.
 * All Rights Reserved.
 *
 * 3D Name-tags.
 * @param {Boolean} start - Initialise.
 */

params [["_start", true, [true]]];

//--- Deinitialize and dispose
if (!isNil "GTA_fnc_nameTags_draw3dHndl") then {removeMissionEventHandler ["Draw3D", GTA_fnc_nameTags_draw3dHndl]};
if (!isNil "GTA_fnc_nameTags_loopHndl") then {terminate GTA_fnc_nameTags_loopHndl};

GTA_fnc_nameTags_loopHndl = nil;
GTA_fnc_nameTags_draw3dHndl = nil;
GTA_fnc_nameTags_drawObjects = nil;

//--- Exit if required
if (!_start) exitWith {};

//--- Create draw objects array
GTA_fnc_nameTags_drawObjects = [];

//--- Draw3D event handler
GTA_fnc_nameTags_draw3dHndl = addMissionEventHandler ["Draw3D", {
  //--- Loop through draw objects
  {
    _x params ["_object", "_title", "_titleColor", "_subtitle", "_subtitleColor", "_icon", "_iconColor"];
    private	["_distance", "_pos", "_alpha"];
    _distance = cameraOn distance _object;

    //--- Z axis
    switch true do {
      case (_object isKindOf "Man"): {
        _pos = _object modelToWorldVisual [0, 0, ((_object selectionPosition "head") select 2) + 0.6  + (_distance / 15) / 1.5];
      };

      case (typeOf _object in ["Land_Device_assembled_F", "Land_Sink_F", "Land_Pallet_MilBoxes_F"]): {
        _pos = _object modelToWorldVisual [0, 0, 1.8];
      };

      case (typeOf _object == "Land_Laptop_unfolded_F"): {
        _pos = _object modelToWorldVisual [0, 0, 0.8];
      };

      case (typeOf _object == "Land_InfoStand_V2_F"): {
        _pos = _object modelToWorldVisual [0, 0, 1];
      };

      default {
        _pos = boundingBoxReal _object;
        _pos = _object modelToWorldVisual [0, 0, (_pos select 1 select 2) * 1.5];
      };
    };

    //--- Speaking
    if (_object getVariable ["speaking", false]) then {
      _icon = (parsingNamespace getVariable "MISSION_ROOT") + format ["textures\icons\speaking%1.paa", floor (diag_tickTime * 10) % 4];
      _iconColor = [1, 1, 1, 1];
    };

    //--- Calculate alpha and apply
    _alpha = linearConversion [11, 15, _distance, 1, 0, true];
    _iconColor set [3, _alpha];
    _titleColor set [3, _alpha];
    _subtitleColor set [3, _alpha];

    //--- Draw icon, title and subtitle in 3D space
    drawIcon3D ["\a3\Data_f\clear_empty.paa", _titleColor, _pos, 0, 1.3, 0, _title, 0, 0.035, "PuristaMedium", "center", false];
    if (_subtitle != "") then {drawIcon3D ["\a3\Data_f\clear_empty.paa", _subtitleColor, _pos, 0, 2.7, 0, _subtitle, 1, 0.030, "PuristaMedium", "center", false];};
    if (_icon != "") then {
      drawIcon3D [_icon, _iconColor, _pos, 1.4, 1.4, 0, "", 1, 0.035, "PuristaMedium", "center", group _object isEqualTo (group driver cameraOn)];
    };

    //--- Incapacitated
    if (isPlayer _object && {alive _object} && {_object getVariable ["incapacitated", false]}) then {
      drawIcon3D [
        "\a3\ui_f\data\igui\cfg\Actions\heal_ca.paa",
        [0.75, 0, 0, _alpha min 0.9],
        _object modelToWorld (_object selectionPosition "Spine3"),
        0.6,
        0.6,
        0,
        "",
        1
      ];
    };
  } forEach GTA_fnc_nameTags_drawObjects;
}];

//--- Looping thread
GTA_fnc_nameTags_loopHndl = [] spawn {
  private ["_targets", "_objects", "_drawObjects", "_object", "_title", "_enabled", "_titleColor", "_subtitle", "_subtitleColor", "_icon", "_iconColor", "_prefix", "_masked", "_faction", "_factionRank"];
  _targets = getArray (missionConfigFile >> "GTA_CfgNameTags" >> "targets");

  while {true} do {
    //--- Nearby targets
    _objects = (nearestObjects [
      ASLtoAGL getPosASL cameraOn,
      _targets,
      18
    ]) - [cameraOn];

    _drawObjects = [];
    {
      _object = _x;
      _title = _object getVariable "nameTag_title";
      _enabled = _object getVariable ["nameTag_enabled", true];

      if (!isNil "_title" && {_enabled} && {!isObjectHidden _object} && {_enabled} && {!(lineIntersects [eyePos vehicle cameraOn, eyePos _object, vehicle cameraOn, _object])}) then {
        //--- Title parameters
        _titleColor = _object getVariable ["nameTag_titleColor", [0.2, 1, 0, 1]];
        _subtitle = _object getVariable "nameTag_subtitle";
        _subtitleColor = _object getVariable ["nameTag_subtitleColor", [1, 1, 1, 1]];
        _icon = _object getVariable "nameTag_icon";
        _iconColor = _object getVariable ["nameTag_iconColor", [1, 1, 1, 1]];
        _prefix = _object getVariable "nameTag_prefix";

        if (_object isKindOf "Man") then {
          //--- "Man" presets
          _masked = [_object] call GTA_fnc_isMasked;

          //--- Masked
          if (_masked && {alive _object}) then {
            if !(_object in units driver cameraOn) then {
              //--- Hide player details to non group members
              _title = "Unknown";
              _subtitle = "Masked Player";
              _prefix = "";
            };

            _icon = "Masked";
          };

          //--- Restrained
          if (_object getVariable ["restrained", false]) then {
            private _group = _object getVariable ["restrained_group", grpNull];

            //--- Show who the player was restrained by
            if !(_group isEqualTo (group driver cameraOn)) then {
              private _groupName = if (side _group == civilian) then {
                _group getVariable ["gang_name", ""]
              } else {
                groupId _group
              };

              _subtitle = if (_groupName == "") then {
                "Restrained"
              } else {
                format ["Restrained by %1", _groupName];
              };
            };

            _icon = "Cuffs";
          };

          if (isNil "_subtitle" && {isPlayer _object} && {(side group _object) isEqualTo civilian}) then {
            _subtitle = group _object getVariable "gang_name";
          };

          //--- Faction presets
          _faction = [_object] call GTA_fnc_faction;
          if (!isNil "_faction") then {
            _factionRank = switch _faction do {
              case "cop": {_object getVariable "cop_rank"};
              case "mil": {_object getVariable "mil_rank"};
              case "med": {_object getVariable "med_rank"};
              case "hato": {_object getVariable "hato_rank"};
              default {};
            };

            if (!isNil "_factionRank") then {
              _factionRank = _factionRank - 1;

              //--- Icon presets
              if (isNil "_icon") then {
                _icon = switch _faction do {
                  case "cop": {
                    ["CSO", "CSO", "PC", "SPC", "DET", "SDET", "SGT", "SUPT", "CSUPT", "DCOM", "COM", "CMD"] select _factionRank;
                  };
                  case "mil": {
                    [nil, "LanceCorporal", "Corporal", "Sergeant", "StaffSergeant", "Lieutenant", "Captain", "Major", "Colonel"] select _factionRank;
                  };
                  case "med": {"NHS"};
                  case "hato": {"HATO"};
                  default {};
                };
              };

              //--- Subtitle presets
              if (isNil "_subtitle") then {
                _subtitle = switch _faction do {
                  case "cop": {"Police"};
                  case "mil": {"NATO"};
                  case "med": {"NHS"};
                  case "hato": {"Highways Agency"};
                  default {};
                };
              };

              //--- Prefix presets
              if (isNil "_prefix") then {
                _prefix = switch _faction do {
                  case "cop": {
                    ["CSO", "PCSO", "PC", "SPC", "DET", "S/DET", "SGT", "Supt", "C/Supt", "D/COM", "COM", "CMD"] select _factionRank;
                  };
                  case "mil": {
                    ["Pvt.", "L/Cpl.", "Cpl.", "Sgt.", "S/Sgt.", "Lieut.", "Capt.", "Maj.", "Col."] select _factionRank;
                  };
                  case "med": {
                    ["HCA", "Nurse", "Doctor", "Surgeon", "Director", "CEO"] select _factionRank;
                  };

                  case "hato": {
                    ["T.", "T/O.", "SOOC.", "T/M.", "O/M."] select _factionRank;
                  };

                  default {};
                };
              };
            };
          };
        };

        if (isNil "_icon") then {
          _icon = "";
        } else {
          //--- Read icon path from config
          //--- TODO: Icon colors
          _icon = getText (missionConfigFile >> "GTA_CfgNameTags" >> "Icons" >> _icon >> "texture");

          //--- Get absolute path if relative path is given
          if (_icon select [0, 1] != "\") then {
            _icon = (parsingNamespace getVariable "MISSION_ROOT") + _icon;
          };
        };

        if (isNil "_subtitle") then {
          _subtitle = "";
        };

        //--- Prepend prefix to title
        if (!isNil "_prefix") then {
          _title = _prefix + " " + _title;
        };

        //--- Push object and properties to draw objects
        _drawObjects pushBack [_object, _title, _titleColor, _subtitle, _subtitleColor, _icon, _iconColor];

        uiSleep 0.01;
      };
    } forEach _objects;

    //--- Assign draw objects to global namespace
    GTA_fnc_nameTags_drawObjects = _drawObjects;

    uiSleep 0.2;
  };
};
