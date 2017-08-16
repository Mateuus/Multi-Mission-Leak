/**
 * Copyright © 2015 DnA, Grand Theft ArmA.
 * All Rights Reserved.
 */

disableSerialization;

{
  if !(ctrlIDD _x in [ 0, 8, 18, 70, 46, 12]) then {
    _x closeDisplay 2
  };
} foreach allDisplays
