/*
  ArmA.Network
  Rathbone
  (c) ArmA.Network 2016

  The usage of this file is restricted to ArmA.Network
  You're not allowed to modify this file!
  Licensed under the Arma EULA and Arma Tools EULA.
  For further questions contact the author!
*/
_response = param[0,0,[0]];

disableUserInput false;
switch(_response) do {
  case 0: {
    createDialog "an_locker_request";
    hintSilent parseText format["<t color='#FF0000' size='2'>AN Lockers</t><br/><t color='#FF0000' size='1.5'>Terms and Services</t><br/><br/><t color='#FFD700' size='1.5'>Price of Locker: $30,000<br/>Monthly Rent: $5,000</t><br/><br/><t color='#FF0000' size='1.5'>AN Lockers will not be held liable for any loss of property.<br/>Failure to pay the required rent will lead to the locker being emptied</t><br/>"];
  };
  case 1: {
    LockerInventory = [];
    _lockerArrayTemp = param[1,[],[[]]];
    _lockerArrayTemp call life_fnc_yanadetr;
    _time = param[2,"",[""]];
    _lockerRentTime = ((parseNumber (_time)) * 4);
    _lockerRentDay = 0;
    for "_i" from 0 to 1 step 0 do {
      if(_lockerRentTime < 24) exitWith {};
      if(_lockerRentTime >= 24) then {_lockerRentDay = _lockerRentDay + 1;};
      _lockerRentTime = _lockerRentTime - 24;
    };
    //hintSilent format["%1 Day(s) und %2 Hours(s) remain on your Locker!",_lockerRentDay,_lockerRentTime];
    RentTime = [_lockerRentDay,_lockerRentTime];
    uiSleep 2;
    0 spawn life_fnc_wrestacr;
  };
  case 2: {
    _name = ctrlText 1400;
    if(_name isEqualTo "") exitWith {hintSilent "You must enter something!";};
    if!(_name isEqualTo profileName) exitWith {hintSilent "That's not your name!";};
    if(an_bank < 30000) exitWith {hintSilent "You do not have enough in your Bank Account to purchase a locker!"; closeDialog 0;};
    closeDialog 0;
    [30000,1,1] call life_fnc_sewawruk;
   [1,[],"168"] spawn life_fnc_yeyevabr;
   [1,[],(getPlayerUID player)] remoteExecCall ["life_fnc_lockerUpdate",2];
  };
  default {};
};

lockerOpen = false;
