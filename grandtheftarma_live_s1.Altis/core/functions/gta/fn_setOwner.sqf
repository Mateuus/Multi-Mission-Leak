/**
 * Copyright © 2015 DnA, Grand Theft ArmA.
 * All Rights Reserved.
 */

if (!isServer) exitWith {
  [_this, _fnc_scriptName, false] call GTA_fnc_remoteExec;
};

params [
  ["_object", objNull, [objNull]],
  ["_client", objNull, [objNull, 0]]
];

if (typeName _client == typeName 0) then {
  _object setOwner 12;
} else {
  _object setOwner owner _client;
};
