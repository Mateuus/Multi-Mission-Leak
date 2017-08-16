/**
* Copyright © 2015 DnA, Grand Theft ArmA.
* All Rights Reserved.
*/

if (isNil "_thisScript") exitWith {_this spawn (currentNamespace getVariable _fnc_scriptName)};
private ["_unit1", "_unit2", "_restrain", "_broadcast", "_playSound"];
_unit1 = [_this, 0, objNull, [objNull]] call GTA_fnc_param;
_unit2 = [_this, 1, objNull, [objNull]] call GTA_fnc_param;
_restrain = [_this, 2, true, [true]] call GTA_fnc_param;
_broadcast = [_this, 3, true, [true]] call GTA_fnc_param;
_playSound = [_this, 4, true, [true]] call GTA_fnc_param;

//--- Error checks
if (isNull _unit1) exitWith {};
if (isNull _unit2) exitWith {};

//--- Remove execute if unit1 is not local
if (!local _unit1) exitWith {
  //--- Prevent spam locally
  _unit1 setVariable ["restrained", _restrain];

  //--- Remote exec
  [_this, _fnc_scriptName, _unit1] call GTA_fnc_remoteExec
};

//--- Already restrained/unrestrained
if (_unit1 getVariable ["restrained", false] isEqualTo _restrain) exitWith {};

//--- Terminate previous loop
if (!isNil "GTA_fnc_restrain_loop" && {!isNull GTA_fnc_restrain_loop}) then {
  terminate GTA_fnc_restrain_loop;
  waitUntil {scriptDone GTA_fnc_restrain_loop};
};

//--- Play sound
if (_playSound) then {
  [[_unit1, "handcuffson", 30], "GTA_fnc_say3D"] call GTA_fnc_remoteExec;
};

if (_restrain) then {
  //--- Store variables
  _unit1 setVariable ["restrained", true, true];
  _unit1 setVariable ["restrained_unit", _unit2, true];
  _unit1 setVariable ["restrained_group", group _unit2, true];

  //--- System message (restrain)
  if (_broadcast) then {
    [[[0], ["STR_GTA_ACTIONS_RESTRAINED", profileName, _unit2 getVariable ["nametag_title", name _unit2]]], "GTA_fnc_broadcast"] call GTA_fnc_remoteExec;
  };

  //--- Exit if incapacitated
  if (_unit1 getVariable ["incapacitated", false]) exitWith {};

  //--- Close all displays
  [] call GTA_fnc_closeAllDisplays;

  //--- Reset surrender animation
  if ((_unit1 getVariable ["surrender" ,false])) then {
    _unit1 setVariable ["surrender", false, true];
  };

  //--- Loop
  GTA_fnc_restrain_loop = [_unit1, _unit2, group _unit2] spawn {
    params ["_unit1", "_unit2", "_restrainedGroup"];
    private _nearbyUnitsCheck = time;

    while {alive _unit1 && {_unit1 getVariable ["restrained", false]} && {!(_unit1 getVariable ["incapacitated", false])}} do {
      scopeName "loop";

      if (vehicle _unit1 == _unit1) then {
        //--- Restrain animation
        if (alive _unit1) then {
          _unit1 playMove "AmovPercMstpSnonWnonDnon_Ease";
        };
      } else {
        //--- Detach
        if (!isNull attachedTo _unit1) then {detach _unit1};

        //--- Eject from driver seat
        if (driver vehicle _unit1 == _unit1) then {moveOut _unit1};
      };

      //--- Holster weapon
      if (currentWeapon player != "") then {
        player action ["SwitchWeapon", player, player, 100];
      };

      //--- Nearby units check
      /*if (time - _nearbyUnitsCheck > 10 * 60) then {
        private _break = true;

        //--- Check nearby group units
        {
          if (_x distance _unit1 <= 500 && {alive _x} && {!(_unit1 getVariable ["incapacitated", false])}) exitWith {
            _break = false;
          };
        } forEach units _restrainedGroup;

        //--- Break out
        if (_break) exitWith {
          breakOut "loop";
        };

        //--- Reset check time
        _nearbyUnitsCheck = time;
      };*/
    };

    //--- Unrestrain
    [_unit1, _unit2, false] spawn GTA_fnc_restrain;
  };
} else {
  //--- Unrestrain if alive
  if (alive _unit1) then {
    if !(_unit1 getVariable ["incapacitated", false]) then {
      _unit1 switchMove ([_unit1] call GTA_fnc_getDefaultAnim);
    };

    //--- Destroy variables
    _unit1 setVariable ["restrained", nil, true];
    _unit1 setVariable ["restrained_unit", nil, true];
    _unit1 setVariable ["restrained_group", nil, true];
    _unit1 setVariable ["escorting", nil, true];
    _unit1 setVariable ["transporting", nil, true];
    detach _unit1;
  };
};
