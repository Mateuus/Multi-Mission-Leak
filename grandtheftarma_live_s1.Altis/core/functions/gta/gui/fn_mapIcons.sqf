/**
 * Copyright © 2015 DnA, Grand Theft ArmA.
 * All Rights Reserved.
 *
 * 3D Name-tags.
 * @param {Boolean} start - Initialise.
 */

params [["_start", true, [true]]];

//--- Deinitialize and dispose
if (!isNil "GTA_fnc_drawMapIcons_loopHndl") then {terminate GTA_fnc_drawMapIcons_loopHndl};
if (!isNil "GTA_fnc_drawMapIcons_mapDrawHndl") then {
  (findDisplay 12 displayCtrl 51) ctrlRemoveEventHandler ["Draw", GTA_fnc_drawMapIcons_mapDrawHndl]
};
if (!isNil "GTA_fnc_drawMapIcons_miniMapDrawHndl") then {
  ([] call GTA_fnc_getMiniMap) ctrlRemoveEventHandler ["Draw", GTA_fnc_drawMapIcons_miniMapDrawHndl]
};

GTA_fnc_drawMapIcons_loopHndl= nil;
GTA_fnc_drawMapIcons_mapDrawHndl = nil;
GTA_fnc_drawMapIcons_miniMapDrawHndl = nil;
GTA_fnc_drawMapIcons_icons = nil;

//--- Exit if required
if (!_start) exitWith {};

GTA_fnc_drawMapIcons_loopHndl = [] spawn {
  disableSerialization;
  private ["_ctrlMap", "_ctrlMiniMap", "_onDraw", "_icons", "_blacklist", "_sideColors"];
  waitUntil {!isNull (findDisplay 12 displayCtrl 51)};
  _ctrlMap = findDisplay 12 displayCtrl 51;
  _ctrlMiniMap = controlNull;

  //--- Map draw event
  _onDraw = {
    if (!(player getVariable ["incapacitated", false]) && {visibleMap || {visibleGPS}}) then {
      params ["_ctrlMap"];
      private _mapScale = ctrlMapScale _ctrlMap;
      private _isMiniMap = ctrlIDC _ctrlMap isEqualTo 101;

      //--- Exit if zoomed out
      if (_mapScale >= 1) exitWith {};

      //--- Loop through icons
      {
        _x params ["_icon", "_color", "_object", "_size", "_text", "_angle"];
        private _pos = getPosASLVisual vehicle _object;
        private _dir = [0, getDirVisual vehicle _object] select _angle;

        if (!_isMiniMap || {_isMiniMap && {player distance2D _object < 1000}}) then {
          //--- Text
          if (
            _text != ""
            && {(_isMiniMap && {freeLook}) || {!_isMiniMap && {_mapScale < 0.8}}}
          ) then {
            private _textSize = if (_isMiniMap) then [{0.03}, {linearConversion [1, 0, _mapScale, 0.1, 0.05, true]}];

            _ctrlMap drawIcon [
              "\a3\Data_f\clear_empty.paa",
              _color,
              _pos,
              _size,
              _size,
              _dir,
              _text,
              2,
              _textSize,
              "PuristaMedium",
              "right"
            ];
          };

          //--- Icon
          _ctrlMap drawIcon [
            _icon,
            _color,
            _pos,
            _size,
            _size,
            _dir,
            "",
            1
          ];
        };
      } forEach GTA_fnc_drawMapIcons_icons;

      //--- Draw player icon
      if (!_isMiniMap) then {
        _ctrlMap drawIcon [
          "\a3\ui_f\data\map\Markers\System\empty_ca.paa",
          [1, 0, 0, 1],
          getPosASLVisual vehicle player,
          28,
          28,
          getDirVisual vehicle player,
          "",
          0
        ];
      };
    };
  };

  //--- Draw icons array
  GTA_fnc_drawMapIcons_icons = [];

  //--- Add draw event handler to map
  GTA_fnc_drawMapIcons_mapDrawHndl = _ctrlMap ctrlAddEventHandler ["Draw", _onDraw];

  //--- Side colours array
  _sideColors = [
    [east] call BIS_fnc_sideColor,
    [west] call BIS_fnc_sideColor,
    [independent] call BIS_fnc_sideColor,
    [civilian] call BIS_fnc_sideColor,
    [sideUnknown] call BIS_fnc_sideColor
	];

  while {true} do {
    waitUntil {visibleMap || {visibleGPS}};

    //--- Add draw event handler to mini map
    if (visibleGPS && {isNil "GTA_fnc_drawMapIcons_miniMapDrawHndl"}) then {
      _ctrlMiniMap = (uiNamespace getVariable "RscMiniMap") displayCtrl 101;
      GTA_fnc_drawMapIcons_miniMapDrawHndl = _ctrlMiniMap ctrlAddEventHandler ["Draw", _onDraw];
    };

    _icons = [];
    _blacklist = [];

    //--- Blacklist player vehicle crew
    if (vehicle player != player) then {
      _blacklist = _blacklist + crew vehicle player;
    };

    {
      private ["_icon", "_color", "_unit", "_size", "_text", "_angle", "_side", "_incapacitated", "_alive"];
      _icon = "\a3\Data_f\clear_empty.paa";
      _color = [0, 0, 0, 1];
      _unit = _x;
      _size = 22;
      _text = "";
      _angle = true;
      _side = side group _unit;
      _incapacitated = _unit getVariable ["incapacitated", false];

      if (
        !(_unit in _blacklist)
        && {(playerSide isEqualTo civilian && {_side isEqualTo civilian} && {["teamviewer"] call GTA_fnc_hasPerk} && {_unit in units group player}) //--- Group members for civs
        || {playerSide isEqualTo west && {_side isEqualTo west || {_side isEqualTo independent && {[_unit] call GTA_fnc_isHATO}}}} //--- Police and NATO
        || {playerSide isEqualTo independent && {[] call GTA_fnc_isMedic} && {_incapacitated || {_side isEqualTo independent && {[_unit] call GTA_fnc_isMedic}}}} //--- NHS
        || {playerSide isEqualTo independent && {[] call GTA_fnc_isHATO} && {_side isEqualTo independent && {[_unit] call GTA_fnc_isHATO}}}} //--- HATO
      ) then {
        if ([_unit] call GTA_fnc_hasGPS || {_incapacitated && {[] call GTA_fnc_isMedic}}) then {
          //--- Determine colour
          _color = _sideColors select ([east, west, independent, civilian, sideUnknown] find _side);

          if (vehicle _unit isEqualTo _unit) then {
            //--- Man
            _alive = alive _unit;

            //--- Alive/Incapacitated/Dead icon
            if (_alive) then {
              _icon = ["\A3\ui_f\data\map\vehicleicons\iconMan_ca.paa", "\a3\ui_f\data\igui\cfg\Actions\heal_ca.paa"] select _incapacitated;
            } else {
              _icon = "\a3\Ui_F_Curator\Data\CfgMarkers\kia_ca.paa";
            };

            //--- Incapacitated/dead color
            if (_incapacitated || {!_alive}) then {
              _color = [1, 0.4, 0, 1];
              _angle = false;
            };

            //--- Unit name
            _text = name _unit;
          } else {
            //--- Vehicle
            _unit = vehicle _unit;
            _icon = [getText (configFile >> "CfgVehicles" >> typeOf _unit >> "icon")] call GTA_fnc_vehicleIcon;
            _size = 26;

            //--- Glue names together
            /*{
              if (_forEachIndex > 0) then {
                _text = _text + ", ";
              };

              _text = _text + name _x;
            } forEach crew _unit;*/
            _text = name effectiveCommander _unit;
            if (count crew _unit > 1) then {
              _text = _text + " +" + str (count crew _unit - 1);
            };

            //--- Add crew to blacklist
            _blacklist append crew _unit;
          };

          //--- Push
          _icons pushBack [_icon, _color, _unit, _size, _text, _angle];
          uiSleep 0.02;
        };
      };
    } forEach (allPlayers - entities "HeadlessClient_F" - [player]);

    //--- HATO empty vehicles
    if ([] call GTA_fnc_isHATO) then {
      {
        if (count crew _x == 0 && {_x isKindOf "Car_F"}) then {
          _icon = [getText (configFile >> "CfgVehicles" >> typeOf vehicle _x >> "icon")] call GTA_fnc_vehicleIcon;
          _icons pushBack [_icon, [1, 0.5, 0, 1], _x, 26, "", true];
          uiSleep 0.01;
        };
      } forEach vehicles;
    };

    GTA_fnc_drawMapIcons_icons = _icons;

    uiSleep ([1, 0.4] select visibleMap);
  };
};
