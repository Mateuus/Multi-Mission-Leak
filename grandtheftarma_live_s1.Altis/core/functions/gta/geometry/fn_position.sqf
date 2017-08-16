/**
 * Copyright © 2015 DnA, Grand Theft ArmA.
 * All Rights Reserved.
 */

params [
  ["_pos", [0, 0, 0], [[], objNull, grpNull, locationNull, "", {}], [2, 3]]
];

switch (typeName _pos) do {
  case (typeName objNull): {
    ASLtoAGL getPosASL _pos
  };

  case (typeName ""): {
    getMarkerPos _pos
  };

  case (typeName grpNull): {
    ASLtoAGL getPosASL leader _pos
  };

  case (typename locationNull): {
    locationPosition _pos
  };

  case (typeName {}): {
    call _pos
  };

  default {_pos}
};
