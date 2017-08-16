/**
 * Copyright © 2015 DnA, Grand Theft ArmA.
 * All Rights Reserved.
 */

private _mode = param [0, 0, [0]];

//--- Mode
switch _mode do {
  case 0: {
    private _unit = param [1, objNull, [objNull]];

    //--- Seize units money
    [1, player] remoteExec ["GTA_fnc_seizeMoney", _unit];
  };

  case 1: {
    private _unit = param [1, objNull, [objNull]];

    //--- Reset cash
    _cash = GTA_money_cash;
    GTA_money_cash = 0;
    [0] call GTA_fnc_updatePlayerPartial;

    //--- Broadcast seized message
    [[0, ["STR_GTA_ACTIONS_SEIZECASH", [_cash] call life_fnc_numberText, profileName]], "GTA_fnc_broadcast"] call GTA_fnc_remoteExec;

    //--- Send money to the seizer
    if (_cash > 0) then {
      [2, _cash] remoteExec ["GTA_fnc_seizeMoney", _unit];
    };
  };

  case 2: {
    private _cash = param [1, 0, [0]];

    GTA_money_cash = GTA_money_cash + _cash;
    [0] call GTA_fnc_updatePlayerPartial;
  };
};
