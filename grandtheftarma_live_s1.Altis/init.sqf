/**
 * Copyright © 2015 DnA, Grand Theft ArmA.
 * All Rights Reserved.
 */

//--- Disable remote sensors (raycasting)
disableRemoteSensors true;

//--- Group cleanup
[] spawn {
  while {true} do {
    //--- Group cleanup
    {
      private _group = _x;

      //--- If group is local and empty
      if (local _group && {count units _group <= 0}) then {
        deleteGroup _x;
      };
    } forEach allGroups;
  };

  uiSleep 30;
};
