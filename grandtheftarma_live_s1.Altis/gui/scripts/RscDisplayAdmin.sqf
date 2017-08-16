/**
 * Copyright © 2015 DnA, Grand Theft ArmA.
 * All Rights Reserved.
 */

#include "defineRscIncDesign.inc"
#include "\A3\ui_f\hpp\defineDIKCodes.inc"
#define SELF GTA_RscDisplayAdmin_script
#define VAR_DRAW3D GTA_RscDisplayAdmin_draw3d
#define VAR_ONDUTY #GTA_RscDisplayAdmin_onDuty

//--- Check if player is admin
if !([player] call GTA_fnc_isAdmin) exitWith {closeDialog 2};

params ["_mode", "_params"];
switch _mode do {
  case "onLoad": {

    //--- Hide hints
    hint "";

    //--- Default camera settings
    /*
    0 - map
    1 - fp
    2 - tp
    */
    GTA_RscDisplayAdmin_camShow = 0;

    //--- Camera loop

    VAR_DRAW3D = addMissionEventHandler ["Draw3D", {
      if (isNull cameraOn) then {
        vehicle player switchCamera "EXTERNAL";
      };
    }];

    //---
    if (["GTA_adminLevel", 0] call GTA_fnc_getConstant < 4) then {
      player setVariable ["alog", true, true];
      [[["STR_GTA_ALOG", profileName, getPlayerUID player]], "GTA_fnc_log", false] call GTA_fnc_remoteExec;
    };

    //--- Player list
    ["refreshPlayers", []] call GTA_RscDisplayAdmin_script;

    //--- Settings
    GTA_RscDisplayAdmin_mapEntities = missionNamespace getVariable ["GTA_RscDisplayAdmin_mapEntities", false];
    GTA_RscDisplayAdmin_mapAnimate = missionNamespace getVariable ["GTA_RscDisplayAdmin_mapAnimate", true];
    GTA_RscDisplayAdmin_mapNames = missionNamespace getVariable ["GTA_RscDisplayAdmin_mapNames", true];

    //--- Display
    _display = _params select 0;

    //--- Map draw data thread
    GTA_RscDisplayAdmin_drawObjects = [];
    GTA_RscDisplayAdmin_drawThread = [_display] spawn {
      disableSerialization;

      _sideColors = [
        east call BIS_fnc_sideColor,
        west call BIS_fnc_sideColor,
        independent call BIS_fnc_sideColor,
        civilian call BIS_fnc_sideColor,
        sideUnknown call BIS_fnc_sideColor
      ];

      while {!isNull (_this select 0)} do {
        private ["_draw", "_blacklist"];
        _draw = [];
        _blacklist = [];

        //--- Loop though players
        {
          private ["_unit", "_icon", "_name", "_sideID", "_color"];
          _unit = _x;

          if !(vehicle _unit in _blacklist) then {

            //--- Check if player is in vehicle
            if (vehicle _unit == _unit) then {
              //--- On foot
              _icon = "\A3\ui_f\data\map\vehicleicons\iconmanvirtual_ca.paa";
            } else {
              //--- In vehicle
              _blacklist pushBack vehicle _unit;
              _icon = (getText (configFile >> "CfgVehicles" >> typeOf vehicle _unit >> "icon")) call BIS_fnc_textureVehicleIcon;

            };

            //--- Name
            _name = if (GTA_RscDisplayAdmin_mapNames) then {name (effectiveCommander vehicle _unit)} else {""};

            //--- Color
            _sideID = (side group _unit) call BIS_fnc_sideID;
            _color = _sideColors select _sideID;

            //--- Push to draw array
            _draw pushBack [_unit, _icon, _color, _name];
          };
        } forEach ([] call GTA_fnc_allPlayers);

        //--- Draw entities
        if (GTA_RscDisplayAdmin_mapEntities) then {

          {
            private ["_entity", "_icon", "_color"];
            _entity = _x;

            //--- Entity icon
            _icon = (getText (configFile >> "CfgVehicles" >> typeOf vehicle _entity >> "icon")) call BIS_fnc_textureVehicleIcon;

            //--- Color
            _color = [0.9, 0.45, 0.1, 1];

            //--- Push to draw array
            _draw pushBack [_entity, _icon, _color, ""];
          } forEach vehicles;
        };

        GTA_RscDisplayAdmin_drawObjects = _draw;

        sleep 2;
      };
    };

    //--- DisplayChild Settings
    ["onLoad", [_display]] call GTA_RscDisplayAdminChildStats_script;

    //--- DisplayChild Settings
    ["onLoad", [_display]] call GTA_RscDisplayAdminChildSettings_script;

    //--- DisplayChild Intel
    ["onLoad", [_display]] call GTA_RscDisplayAdminChildIntel_script;

    //--- Control BackgroundOverlay
    _ctrlBackgroundOverlay = _display displayCtrl IDC_RSCDISPLAYADMIN_BACKGROUNDOVERLAY;
    _ctrlBackgroundOverlay ctrlShow false;

    //--- Control Map
    _ctrlMap = _display displayCtrl IDC_RSCDISPLAYADMIN_MAP;

    if (["GTA_adminLevel", 0] call GTA_fnc_getConstant >= 3) then {
      _ctrlMap ctrlAddEventHandler ["Draw",  {["onDrawMap", _this] call GTA_RscDisplayAdmin_script}];
      _ctrlMap ctrlAddEventHandler ["MouseButtonDblClick",  {["onClickMap", _this] call GTA_RscDisplayAdmin_script}];
    } else {
      //--- Disable and hide map
      _ctrlMap ctrlEnable false;
      _ctrlMap ctrlShow false;

      //--- Enable camera mode
      GTA_RscDisplayAdmin_camShow = 1;
    };

    //--- Control EditSearch
    GTA_RscDisplayAdmin_search = "";

    _ctrlEditSearch = _display displayCtrl IDC_RSCDISPLAYADMIN_EDITSEARCH;
    _ctrlEditSearch ctrlAddEventHandler ["KeyUp",  {["onSearchChanged", [ctrlParent (_this select 0)]] call GTA_RscDisplayAdmin_script}];
    _ctrlEditSearch ctrlAddEventHandler ["SetFocus",  {["onSearchSetFocus", [ctrlParent (_this select 0)]] call GTA_RscDisplayAdmin_script}];
    _ctrlEditSearch ctrlAddEventHandler ["KillFocus",  {["onSearchKillFocus", [ctrlParent (_this select 0)]] call GTA_RscDisplayAdmin_script}];

    //--- Control ListPlayers
    GTA_RscDisplayAdmin_player = objNull;

    _ctrlListPlayers = _display displayCtrl IDC_RSCDISPLAYADMIN_LISTPLAYERS;
    _ctrlListPlayers ctrlAddEventHandler ["LBSelChanged",  {["onPlayerSelChanged", [ctrlParent (_this select 0)]] call GTA_RscDisplayAdmin_script}];

    //--- Control Filters
    {
      _ctrl = _display displayCtrl _x;
      _ctrl ctrlAddEventHandler ["ButtonClick",  format [" ['onFilterChanged', [ctrlParent (_this select 0), %1]] call GTA_RscDisplayAdmin_script ", _forEachIndex]];
    } forEach [
      IDC_RSCDISPLAYADMIN_FILTER1,
      IDC_RSCDISPLAYADMIN_FILTER0,
      IDC_RSCDISPLAYADMIN_FILTER2,
      IDC_RSCDISPLAYADMIN_FILTER3,
      IDC_RSCDISPLAYADMIN_FILTER4
    ];

    //--- Call filter EH
    GTA_RscDisplayAdmin_filter = missionNamespace getVariable ["GTA_RscDisplayAdmin_filter", 1];
    ["onFilterChanged", [_display]] call GTA_RscDisplayAdmin_script;

    //--- Control ButtonKick
    _ctrlButtonKick = _display displayCtrl IDC_RSCDISPLAYADMIN_BUTTONKICK;
    _ctrlButtonKick ctrlAddEventHandler ["ButtonClick",  {["onClickKick", [ctrlParent (_this select 0)]] call GTA_RscDisplayAdmin_script}];

    //--- Control ButtonKick
    _ctrlButtonBan = _display displayCtrl IDC_RSCDISPLAYADMIN_BUTTONBAN;
    _ctrlButtonBan ctrlAddEventHandler ["ButtonClick",  {["onClickBan", [ctrlParent (_this select 0)]] call GTA_RscDisplayAdmin_script}];

    //--- Control ButtonHeal
    _ctrlButtonHeal = _display displayCtrl IDC_RSCDISPLAYADMIN_BUTTONHEAL;
    _ctrlButtonHeal ctrlAddEventHandler ["ButtonClick",  {["onClickHeal", [ctrlParent (_this select 0)]] call GTA_RscDisplayAdmin_script}];

    //--- Control ButtonKill
    _ctrlButtonKill = _display displayCtrl IDC_RSCDISPLAYADMIN_BUTTONKILL;
    _ctrlButtonKill ctrlAddEventHandler ["ButtonClick",  {["onClickKill", [ctrlParent (_this select 0)]] call GTA_RscDisplayAdmin_script}];

    //--- Control CheckFrozen
    _ctrlCheckFreeze = _display displayCtrl IDC_RSCDISPLAYADMIN_CHECKFREEZE;
    _ctrlCheckFreeze ctrlAddEventHandler ["CheckedChanged",  {["onClickFreeze", [ctrlParent (_this select 0)]] call GTA_RscDisplayAdmin_script}];

    //--- Control CheckHide
    _ctrlCheckHide = _display displayCtrl IDC_RSCDISPLAYADMIN_CHECKHIDE;
    _ctrlCheckHide ctrlAddEventHandler ["CheckedChanged",  {["onClickHide", [ctrlParent (_this select 0)]] call GTA_RscDisplayAdmin_script}];

    //--- Control CheckNeutral
    _ctrlCheckNeutral = _display displayCtrl IDC_RSCDISPLAYADMIN_CHECKNEUTRAL;
    _ctrlCheckNeutral ctrlAddEventHandler ["CheckedChanged",  {["onClickNeutral", [ctrlParent (_this select 0)]] call GTA_RscDisplayAdmin_script}];

    //--- Control CheckImmune
    _ctrlCheckImmune = _display displayCtrl IDC_RSCDISPLAYADMIN_CHECKIMMUNE;
    _ctrlCheckImmune ctrlAddEventHandler ["CheckedChanged",  {["onClickImmune", [ctrlParent (_this select 0)]] call GTA_RscDisplayAdmin_script}];

    //--- Camera settings
    _ctrlCameraSettings = _display displayCtrl IDC_RSCDISPLAYADMIN_CAMERASETTINGS;
    _ctrlCameraSettings ctrlAddEventHandler ["ToolboxSelChanged", {["onCameraSettingChanged", _this] call SELF}];
    if (["GTA_adminLevel", 0] call GTA_fnc_getConstant <= 2) exitWith {
      _ctrlCameraSettings lbSetCurSel 1;
    };

    //--- Duty settings
    _ctrlDutySettings = _display displayCtrl IDC_RSCDISPLAYADMIN_DUTYSETTINGS;
    _ctrlDutySettings ctrlAddEventHandler ["ToolboxSelChanged", {["onDutySettingChanged", _this] call SELF}];
    _ctrlDutySettings lbSetCurSel parseNumber (missionNamespace getVariable [VAR_ONDUTY, false]);

    //--- Control ButtonStats
    _ctrlButtonStats = _display displayCtrl IDC_RSCDISPLAYADMIN_BUTTONSTATS;
    if (["GTA_adminLevel", 0] call GTA_fnc_getConstant >= 4) then {
      _ctrlButtonStats ctrlAddEventHandler ["ButtonClick",  {["displayChild", [ctrlParent (_this select 0), GTA_RscDisplayAdminChildStats_script, true]] call GTA_RscDisplayAdmin_script}];
    } else {
      _ctrlButtonStats ctrlShow false;
    };

    //--- Control ButtonSettings
    _ctrlButtonSettings = _display displayCtrl IDC_RSCDISPLAYADMIN_BUTTONSETTINGS;
    if (["GTA_adminLevel", 0] call GTA_fnc_getConstant >= 3) then {
      _ctrlButtonSettings ctrlAddEventHandler ["ButtonClick",  {["displayChild", [ctrlParent (_this select 0), GTA_RscDisplayAdminChildSettings_script, true]] call GTA_RscDisplayAdmin_script}];
    } else {
      _ctrlButtonSettings ctrlShow false;
    };

    //--- Control ButtonIntel
    _ctrlButtonIntel = _display displayCtrl IDC_RSCDISPLAYADMIN_BUTTONINTEL;
    if (["GTA_adminLevel", 0] call GTA_fnc_getConstant >= 3) then {
      _ctrlButtonIntel ctrlAddEventHandler ["ButtonClick",  {["displayChild", [ctrlParent (_this select 0), GTA_RscDisplayAdminChildIntel_script, true]] call GTA_RscDisplayAdmin_script}];
    } else {
      _ctrlButtonIntel ctrlShow false;
    };

    //--- Set default control focus
    ctrlSetFocus _ctrlListPlayers;
  };

  case "onUnload": {
    showChat true;

    vehicle player switchCamera cameraView;
    player setVariable ["alog", nil, true];
    GTA_RscDisplayAdmin_camShow = nil;

    if (!isNil "GTA_RscDisplayAdmin_drawThread") then {terminate GTA_RscDisplayAdmin_drawThread};
    removeMissionEventHandler ["Draw3D", VAR_DRAW3D];

    GTA_RscDisplayAdmin_drawThread = nil;
    VAR_DRAW3D = nil;
    GTA_RscDisplayAdmin_drawObjects = nil;
    //GTA_RscDisplayAdmin_search = nil;
    //GTA_RscDisplayAdmin_player = nil;
  };

  case "onCameraSettingChanged": {
    _params params ["_ctrl", "_index"];
    private _display = ctrlParent _ctrl;
    private _ctrlMap = _display displayCtrl IDC_RSCDISPLAYADMIN_MAP;
    private _ctrlCameraSettings = _display displayCtrl IDC_RSCDISPLAYADMIN_CAMERASETTINGS;

    if (["GTA_adminLevel", 0] call GTA_fnc_getConstant <= 2 && {_index == 0}) exitWith {
      _ctrlCameraSettings lbSetCurSel lbCurSel _ctrlCameraSettings;
    };

    _ctrlMap ctrlShow (_index == 0);
    _ctrlMap ctrlEnable (_index == 0);

    ["switchCamera", [_display]] call SELF;
  };

  case "switchCamera": {
    private _display = _params select 0;
    private _ctrlMap = _display displayCtrl IDC_RSCDISPLAYADMIN_MAP;
    private _ctrlCameraSettings = _display displayCtrl IDC_RSCDISPLAYADMIN_CAMERASETTINGS;
    private _index = lbCurSel _ctrlCameraSettings;

    switch _index do {
      case 1: {
        GTA_RscDisplayAdmin_player switchCamera "INTERNAL";
      };

      case 2: {
        vehicle GTA_RscDisplayAdmin_player switchCamera "EXTERNAL";
      };
      default {};
    };
  };

  case "onDutySettingChanged": {
    _params params ["_ctrl", "_index"];

    missionNamespace setVariable [VAR_ONDUTY, _index > 0];

    if (_index == 0) then {
      player setVariable ["nametag_icon", nil, true];
      player setVariable ["nametag_titleColor", nil, true];
      player setVariable ["nametag_subtitle", nil, true];
      player setVariable ["nametag_subtitleColor", nil, true];
    } else {
      player setVariable ["nametag_icon", "GTA", true];
      player setVariable ["nametag_titleColor", [1, 0, 0, 1], true];
      player setVariable ["nametag_subtitle", "Staff on Duty", true];
      player setVariable ["nametag_subtitleColor", [0.2, 1, 0, 1], true];
    };
  };

  case "refreshPlayers": {
    _list = [[], [], [], []];

    //--- Sort players to sides
    {
      _sideID = (side group _x) call BIS_fnc_sideID;
      (_list select _sideID) pushBack _x;
    } forEach ([] call GTA_fnc_allPlayers);

    GTA_RscDisplayAdmin_playersList = _list;
  };


  case "showNotification": {
    _display = _params select 0;
    _message = _params select 1;
    _ctrlNotification = _display displayCtrl IDC_RSCDISPLAYADMIN_NOTIFICATION;

    //--- Display the notification
    _ctrlNotification ctrlSetFade 0;
    _ctrlNotification ctrlCommit 0;
    _ctrlNotification ctrlSetText format [_message, name GTA_RscDisplayAdmin_player];

    //--- Fade it
    _ctrlNotification ctrlSetFade 1;
    _ctrlNotification ctrlCommit 2;
  };

  case "onDrawMap": {
    _ctrlMap = _params select 0;

    //--- Draw player icons
    {
      _unit = _x select 0;
      _icon = _x select 1;
      _color = _x select 2;
      _name = _x select 3;

      _ctrlMap drawIcon [
        _icon,
        _color,
        getPosASLVisual vehicle _unit,
        26,
        26,
        getDirVisual vehicle _unit,
        _name,
        0,
        .1,
        "PuristaMedium",
        "right"
      ];
    } foreach GTA_RscDisplayAdmin_drawObjects;
  };

  case "onClickMap": {
    _ctrlMap = _params select 0;
    _posX = _params select 2;
    _posY = _params select 3;
    _shift = _params select 4;
    _pos = _ctrlMap ctrlMapScreenToWorld [_posX, _posY];
    _player = GTA_RscDisplayAdmin_player;

    if (!isNull _player) then {
      //--- If holding shift, move the player's vehicle
      if (_shift) then {_player = vehicle _player};

      //--- Move the player
      [[_player, _pos], "setPos", _player] call GTA_fnc_remoteExec;

      //--- Show notification
      ["showNotification", [ctrlParent _ctrlMap, "Moved %1"]] call GTA_RscDisplayAdmin_script;
    };
  };

  case "onSearchChanged": {
    _display = _params select 0;
    _ctrlEditSearch = _display displayCtrl IDC_RSCDISPLAYADMIN_EDITSEARCH;
    _search = ctrlText _ctrlEditSearch;

    //--- Update player list
    GTA_RscDisplayAdmin_search = _search;
    ["updatePlayers", [_display, GTA_RscDisplayAdmin_filter]] call GTA_RscDisplayAdmin_script;
  };

  case "onSearchSetFocus": {

    _display = _params select 0;
    _ctrlTextSearchPlaceholder = _display displayCtrl IDC_RSCDISPLAYADMIN_TEXTSEARCHPLACEHOLDER;

    //--- Hide placeholder
    _ctrlTextSearchPlaceholder ctrlShow false;

  };

  case "onSearchKillFocus": {

    _display = _params select 0;
    _ctrlTextSearchPlaceholder = _display displayCtrl IDC_RSCDISPLAYADMIN_TEXTSEARCHPLACEHOLDER;

    if (GTA_RscDisplayAdmin_search == "") then {

      //--- Show placeholder
      _ctrlTextSearchPlaceholder ctrlShow true;

    };

  };

  case "onFilterChanged": {

    _display = _params select 0;
    _ctrlListPlayers = _display displayCtrl IDC_RSCDISPLAYADMIN_LISTPLAYERS;
    _ctrlBackgroundFilter = _display displayCtrl IDC_RSCDISPLAYADMIN_BACKGROUNDFILTER;
    _curSel = if (count _params > 1) then {_params select 1} else {GTA_RscDisplayAdmin_filter};

    //--- Update player list
    ["updatePlayers", [_display, _curSel]] call GTA_RscDisplayAdmin_script;

    //--- Update filters visual
    _delay = if (GTA_RscDisplayAdmin_init) then {0.1} else {0};

    {

      _ctrl = _display displayCtrl _x;
      _color = _forEachIndex call BIS_fnc_sideColor;
      _alpha = 0.5;
      _scale = 0.75;

      if (_forEachIndex == _curSel) then {

        _alpha = 1;
        _scale = 1;
        GTA_RscDisplayAdmin_filter = _forEachIndex;

      };

      _ctrl ctrlSetActiveColor _color;
      _color set [3, _alpha];
      _ctrl ctrlSetTextColor _color;
      _pos = [_ctrl, _scale, _delay] call BIS_fnc_ctrlSetScale;

      if (_forEachIndex == _curSel) then {

        _ctrlBackgroundFilter ctrlSetPosition _pos;
        _ctrlBackgroundFilter ctrlCommit _delay;

      };

    } forEach [
      IDC_RSCDISPLAYADMIN_FILTER1,
      IDC_RSCDISPLAYADMIN_FILTER0,
      IDC_RSCDISPLAYADMIN_FILTER2,
      IDC_RSCDISPLAYADMIN_FILTER3,
      IDC_RSCDISPLAYADMIN_FILTER4
    ];

  };

  case "onPlayerSelChanged": {
    _display = _params select 0;
    _ctrlMap = _display displayCtrl IDC_RSCDISPLAYADMIN_MAP;
    _ctrlListPlayers = _display displayCtrl IDC_RSCDISPLAYADMIN_LISTPLAYERS;
    _ctrlTextPlayerName = _display displayCtrl IDC_RSCDISPLAYADMIN_TEXTPLAYERNAME;
    _ctrlButtonKick = _display displayCtrl IDC_RSCDISPLAYADMIN_BUTTONKICK;
    _ctrlButtonBan = _display displayCtrl IDC_RSCDISPLAYADMIN_BUTTONBAN;
    _ctrlButtonKill = _display displayCtrl IDC_RSCDISPLAYADMIN_BUTTONKILL;
    _ctrlButtonHeal = _display displayCtrl IDC_RSCDISPLAYADMIN_BUTTONHEAL;
    _ctrlCheckFreeze = _display displayCtrl IDC_RSCDISPLAYADMIN_CHECKFREEZE;
    _ctrlCheckHide = _display displayCtrl IDC_RSCDISPLAYADMIN_CHECKHIDE;
    _ctrlCheckNeutral = _display displayCtrl IDC_RSCDISPLAYADMIN_CHECKNEUTRAL;
    _ctrlCheckImmune = _display displayCtrl IDC_RSCDISPLAYADMIN_CHECKIMMUNE;

    _curSel = lbCurSel _ctrlListPlayers;
    _uid = _ctrlListPlayers lbData _curSel;
    //_name = _ctrlListPlayers lbText _curSel;
    //_player = ([allUnits, {name _x == _name}] call BIS_fnc_conditionalSelect) select 0;
    _player = _uid call GTA_fnc_unitByUID;

    //--- Globalize selected player
    GTA_RscDisplayAdmin_player = _player;

    //--- Player selected?
    if (!isNull _player) then {
      //--- Switch camera
      ["switchCamera", [_display]] call GTA_RscDisplayAdmin_script;

      _color = [side group _player] call BIS_fnc_sideColor;
      _isAdmin = false;

      //--- Update player name
      _ctrlTextPlayerName ctrlSetStructuredText parseText format ["<a href='http://grandtheftarma.com/admintool/player/?id=%2' color='%1'>%3</a>", _color call GTA_fnc_colorRGBtoHTML, getPlayerUID _player, name _player];

      //--- Check/uncheck immune
      _ctrlCheckFreeze cbSetChecked (_player getVariable ["frozen", false]);

      //--- Check/uncheck immune
      _ctrlCheckHide cbSetChecked (_player getVariable ["nametag_hide", false]);

      //--- Check/uncheck neutral
      _ctrlCheckNeutral cbSetChecked (_player getVariable ["neutral", false]);

      //--- Check/uncheck immune
      _ctrlCheckImmune cbSetChecked (_player getVariable ["immune", false]);

      //--- Check if player is admin
      /*if (_player call GTA_fnc_isAdmin) then {

        _color = [0.9, 0.45, 0.1, 1];
        _isAdmin = true;

      };*/

      //--- Set admin/player name color
      //_ctrlTextPlayerName ctrlSetTextColor _color;

      //--- Enable player controls (with permissions)
      {
        if (["GTA_adminLevel", 0] call GTA_fnc_getConstant >= _x select 1) then {
          (_x select 0) ctrlEnable true;
        };
      } forEach [
        [_ctrlButtonKick, 2],
        [_ctrlButtonBan, 3],
        [_ctrlButtonKill, 2],
        [_ctrlButtonHeal, 2],
        [_ctrlCheckFreeze, 2],
        [_ctrlCheckHide, 2],
        [_ctrlCheckNeutral, 2],
        [_ctrlCheckImmune, 3]
      ];

      //--- Check if map animate is enabled
      if (GTA_RscDisplayAdmin_mapAnimate) then {
        //--- Animate map to selected player
        _delay = if (GTA_RscDisplayAdmin_init) then {0} else {0};
        _scale = ctrlMapScale _ctrlMap;

        if (!ctrlMapAnimDone _ctrlMap) then {ctrlMapAnimClear _ctrlMap};

        _ctrlMap ctrlMapAnimAdd [_delay, _scale, (getPosASL _player)];
        ctrlMapAnimCommit _ctrlMap;
      };
    } else {
      //--- Reset name
      _ctrlTextPlayerName ctrlSetText "";

      //--- Uncheck
      {
        _x cbSetChecked false;
      } forEach [
        _ctrlCheckFreeze,
        _ctrlCheckHide,
        _ctrlCheckNeutral,
        _ctrlCheckImmune
      ];

      //--- Disable player controls
      {
        _x ctrlEnable false;
      } forEach [
        _ctrlButtonKick,
        _ctrlButtonBan,
        _ctrlButtonKill,
        _ctrlButtonHeal,
        _ctrlCheckFreeze,
        _ctrlCheckHide,
        _ctrlCheckNeutral,
        _ctrlCheckImmune
      ];
    };
  };

  case "updatePlayers": {
    _display = _params select 0;
    _ctrlListPlayers = _display displayCtrl IDC_RSCDISPLAYADMIN_LISTPLAYERS;
    _side = _params select 1;
    _search = GTA_RscDisplayAdmin_search;

    //--- Clear player list
    lbClear _ctrlListPlayers;

    //--- Populate player list
    {
      //--- Filter side
      if (
        (_side > 3) ||
        {_side == (side group _x) call BIS_fnc_sideID}
      ) then {
        _name = name _x;

        //--- Filter name
        if (toLower _name find toLower _search >= 0) then {
          _uid = getPlayerUID _x;
          _icon = (getText (configFile >> "CfgVehicles" >> typeOf _x >> "icon")) call BIS_fnc_textureVehicleIcon;
          _color = [side group _x] call BIS_fnc_sideColor;

          //--- Add player to list
          _lbPlayer = _ctrlListPlayers lbAdd _name;
          _ctrlListPlayers lbSetPicture [_lbPlayer, _icon];
          _ctrlListPlayers lbSetData [_lbPlayer, _uid];
          _ctrlListPlayers lbSetPictureColor [_lbPlayer, _color];
          _ctrlListPlayers lbSetPictureColorSelected [_lbPlayer, _color];

          //--- Status icon
          _ctrlListPlayers lbSetPictureRight [_lbPlayer, switch true do {
            //--- Spctating
            case (_x getVariable ["alog", false]): {"\a3\ui_f_curator\Data\Logos\arma3_curator_eye_64_ca.paa"};

            //--- Dead
            case (!alive _x): {"\a3\ui_f_curator\Data\CfgMarkers\kia_ca.paa"};

            //--- Incapacitated
            case (_x getVariable ["incapacitated", false]): {"\a3\ui_f\data\igui\cfg\Actions\heal_ca.paa"};

            //--- Immune
            case (_x getVariable ["immune", false]): {"\a3\ui_f\data\gui\cfg\GameTypes\defend_ca.paa"};

            default {""};
          }];

          //--- Set admin color
          if (_uid in GTA_admin_admins) then {
            _ctrlListPlayers lbSetColor [_lbPlayer, [0.9, 0.45, 0.1, 1]];
          };
        };
      };
    } foreach ([] call GTA_fnc_allPlayers);

    //--- Sort player list
    lbSort _ctrlListPlayers;

    //--- Select first player in list
    _ctrlListPlayers lbSetCurSel -1;

  };

  case "onClickKick": {
    //--- Kick player
    [[getPlayerUID GTA_RscDisplayAdmin_player], "GTA_fnc_adminKickRequest"] call GTA_fnc_sessionExecServer;

    //--- Show notification
    ["showNotification", [_params select 0, "Kicked %1"]] call GTA_RscDisplayAdmin_script;
  };

  case "onClickBan": {
    //--- Ban player
    [[getPlayerUID GTA_RscDisplayAdmin_player], "GTA_fnc_adminBanRequest"] call GTA_fnc_sessionExecServer;

    //--- Show notification
    ["showNotification", [_params select 0, "Banned %1"]] call GTA_RscDisplayAdmin_script;
  };

  case "onClickKill": {
    //--- Kill the player
    GTA_RscDisplayAdmin_player setDamage 1;

    //--- Show notification
    ["showNotification", [_params select 0, "Killed %1"]] call GTA_RscDisplayAdmin_script;
  };

  case "onClickHeal": {
    //--- Heal/revive the player
    if (GTA_RscDisplayAdmin_player getVariable ["incapacitated", false]) then {
      GTA_RscDisplayAdmin_player setVariable ["incapacitated", false, true];
    } else {
      GTA_RscDisplayAdmin_player setDamage 0;
    };

    //--- Show notification
    ["showNotification", [_params select 0, "Healed %1"]] call GTA_RscDisplayAdmin_script;
  };

  case "onClickFreeze": {
    _display = _params select 0;
    _ctrlCheckFreeze = _display displayCtrl IDC_RSCDISPLAYADMIN_CHECKFREEZE;
    _checked = cbChecked _ctrlCheckFreeze;

    //--- Freeze/unfreeze the player
    [[GTA_RscDisplayAdmin_player, _checked], "GTA_fnc_adminFreezeRequest"] call GTA_fnc_sessionExecServer;

    //--- Show notification
    _notification = "%1 has been frozen";

    if (!_checked) then {
      _notification = "%1 has been unfrozen";
    };

    ["showNotification", [_display, _notification]] call GTA_RscDisplayAdmin_script;
  };

  case "onClickHide": {
    _display = _params select 0;
    _ctrlCheckHide = _display displayCtrl IDC_RSCDISPLAYADMIN_CHECKHIDE;
    _checked = cbChecked _ctrlCheckHide;

    //--- Show/hide the player
    [[GTA_RscDisplayAdmin_player, _checked], "GTA_fnc_adminHideRequest"] call GTA_fnc_sessionExecServer;

    //--- Show notification
    _notification = "%1 has been hidden";

    if (!_checked) then {
      _notification = "%1 is now visible";
    };

    ["showNotification", [_display, _notification]] call GTA_RscDisplayAdmin_script;
  };

  case "onClickNeutral": {
    _display = _params select 0;
    _ctrlCheckNeutral = _display displayCtrl IDC_RSCDISPLAYADMIN_CHECKNEUTRAL;
    _checked = cbChecked _ctrlCheckNeutral;

    //--- Set the player as hostile or neutral
    [GTA_RscDisplayAdmin_player, _checked] call GTA_fnc_neutral;

    [[player, GTA_ModuleAdmin_token], [GTA_RscDisplayAdmin_player, _checked]] call GTA_fnc_adminNeutral;

    //--- Show notification
    _notification = "%1 is now neutral";

    if (!_checked) then {
      _notification = "%1 is no longer neutral";
    };

    ["showNotification", [_display, _notification]] call GTA_RscDisplayAdmin_script;
  };

  case "onClickImmune": {
    _display = _params select 0;
    _ctrlCheckImmune = _display displayCtrl IDC_RSCDISPLAYADMIN_CHECKIMMUNE;
    _checked = cbChecked _ctrlCheckImmune;
    _player = GTA_RscDisplayAdmin_player;

    //--- Make the player immune/vulnerable
    [GTA_RscDisplayAdmin_player, _checked] call GTA_fnc_immune;

    //--- Show notification
    _notification = format ["%1 is now immune", name _player];

    if (!_checked) then {
      _notification = format ["%1 is now vulnerable", name _player];
    };

    ["showNotification", [_display, _notification]] call GTA_RscDisplayAdmin_script;
  };

  case "displayChild": {
    _display = _params select 0;
    _fnc = _params select 1;
    _show = _params select 2;

    //--- Disable controls
    {
      (_display displayCtrl _x) ctrlEnable !_show;
    } forEach [
      IDC_RSCDISPLAYADMIN_MAP,
      IDC_RSCDISPLAYADMIN_GROUPPLAYERS,
      IDC_RSCDISPLAYADMIN_GROUPPLAYER,
      IDC_RSCDISPLAYADMIN_BUTTONSTATS,
      IDC_RSCDISPLAYADMIN_BUTTONSETTINGS,
      IDC_RSCDISPLAYADMIN_BUTTONINTEL,
      1
    ];

    //--- Show overlay
    _ctrlBackgroundOverlay = _display displayCtrl IDC_RSCDISPLAYADMIN_BACKGROUNDOVERLAY;
    _ctrlBackgroundOverlay ctrlShow _show;

    //--- Call child function
    _event = if (_show) then {"onShow"} else {"onHide"};
    [_event, [_display]] call _fnc;

    //--- Focus player list on hide
    if (!_show) then {
      _ctrlListPlayers = _display displayCtrl IDC_RSCDISPLAYADMIN_LISTPLAYERS;
      ctrlSetFocus _ctrlListPlayers;
    };
  };
};
