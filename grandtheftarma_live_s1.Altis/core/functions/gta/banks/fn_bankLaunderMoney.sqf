/**
 * Copyright © 2015 DnA, Grand Theft ArmA.
 * All Rights Reserved.
 */

private ["_price", "_count", "_amount"];

//--- Error checks
if ( life_inv_moneybag <= 0 ) exitWith { titleText ["You have no money to launder", "PLAIN"] };

//--- Launder action
if ( [( 7 * life_inv_moneybag ), "Laundering Money", ""] call GTA_fnc_action ) then {
  _price = [call sell_array, "moneybag", 0] call GTA_fnc_arrayGetKeyValue;
  _count = life_inv_moneybag;
  _amount = _price * _count;

  //--- 'Fortune Finder' perk
  if ( ["fortune_finder"] call GTA_fnc_hasPerk ) then {
    //--- Add 15% to the total value
    _amount = _amount * 1.15;
  };

  //--- Remove all money bags
  [false, "moneybag", _count] call life_fnc_handleInv;

  //--- Convert bag to money
  GTA_money_cash = GTA_money_cash + _amount;

  //--- On screen info
  titleText [format ["Successfully Laundered £%1", [_amount] call life_fnc_numberText], "PLAIN"];
} else {
titleText ["Laundering interrupted", "PLAIN"];
};
