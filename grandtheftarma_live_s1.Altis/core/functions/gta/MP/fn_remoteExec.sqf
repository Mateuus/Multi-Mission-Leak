/**
 * Copyright © 2015 DnA, Grand Theft ArmA.
 * All Rights Reserved.
 */

params [
  ["_params", []],
  ["_functionName", "", [""]],
  ["_target", true, [objNull, true, 0, [], sideUnknown, grpnull]]
];

//--- Local execution
if (typeName _target == typeName objNull && {local _target}) exitWith {
  private _function = missionNamespace getVariable _functionName;

  //--- Function/command
  if (!isNil "_function") then {
    //--- Execute function
    _params spawn _function;
  } else {
    //--- Check if command exists
    if (count supportInfo format ["*:%1*", _functionName] > 0) then {
      private _paramCount = [1, count _params] select (typename _params == typename []);

      //--- Execute command
      switch _paramCount do {
        case 0: {_params call compile format ["%1", _functionName]};
        case 1: {_params call compile format ["%1 _this", _functionName]};
        case 2: {_params call compile format ["(_this select 0) %1 (_this select 1)", _functionName]};
      };
    };
  };
};

//--- Convert bool
if (typeName _target == typeName true) then {
  _target = [2, 0] select _target;
};

_params remoteExec [_functionName, _target];
