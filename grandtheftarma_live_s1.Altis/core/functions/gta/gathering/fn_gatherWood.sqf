/**
 * Copyright © 2015 DnA, Grand Theft ArmA.
 * All Rights Reserved.
 */

private _mode = _this select 0;
private _tree = objNull;

//--- Find the nearest tree
{
  private _model = str _x;
  _model = _model select [(_model find ":") + 2];

  if (_model in ["t_pinuss2s_f.p3d", "t_pinuss2s_b_f.p3d", "t_pinuss1s_f.p3d", "t_pinusp3s_f.p3d"]) exitWith {
    _tree = _x;
  };
} forEach nearestObjects [getPosATLVisual player, [], 20];

//--- No tree
if (isNull _tree) exitWith {false};

//--- Distance
if ([player, _tree] call BIS_fnc_distance2d >= 4) exitWith {[1, "STR_GTA_GATHERING_TREEDISTANCE", ["Warning", "#ff8800"]] call GTA_fnc_broadcast; false};

//--- Damage
if (damage _tree >= 1) exitWith {[1, "STR_GTA_GATHERING_TREEDAMAGED", ["Warning", "#ff8800"]] call GTA_fnc_broadcast; false};

//--- Mode
switch _mode do {
  case "BeforeGather": {
    //--- Wood chop sound
    [[_tree, "Wood_Chop", 100], "life_fnc_playSound"] call GTA_fnc_remoteExec;
  };

  case "AfterGather": {
    //--- Destroy the tree
    _tree setDamage 1;
  };
};

true
