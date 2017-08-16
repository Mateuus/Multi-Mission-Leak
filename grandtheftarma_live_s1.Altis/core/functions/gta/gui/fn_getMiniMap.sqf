/**
 * Copyright © 2015 DnA, Grand Theft ArmA.
 * All Rights Reserved.
 *
 * Returns the mini map control (GPS).
 * @returns {Control}
 */

private "_ctrlMiniMap";
_ctrlMiniMap = controlNull;

{
  if (!isNil {_x displayCtrl 101}) then {
    _ctrlMiniMap = _x displayCtrl 101;
  };
} count (uiNamespace getVariable "IGUI_Displays");

_ctrlMiniMap
