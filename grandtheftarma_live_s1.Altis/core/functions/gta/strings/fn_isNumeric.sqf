/**
 * Copyright © 2015 DnA, Grand Theft ArmA.
 * All Rights Reserved.
 */

params [
  ["_string", "", [""]]
];

//--- Return
_string == "0" || {parseNumber _string != 0}
