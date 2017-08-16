/**
 * Copyright © 2015 DnA, Grand Theft ArmA.
 * All Rights Reserved.
 */

 params [
  ["_marker", "", [""]],
  ["_name", "", [""]]
 ];

 if !(getMarkerPos _marker isEqualTo [0, 0, 0]) then {
   //--- New marker text
   private _text = [format ["%1: %2", _name, markerText _marker], _name] select (markerText _marker == "");

   //--- Add name prefix to marker locally
   _marker setMarkerTextLocal _text;
 };
