/*
  ArmA.Network
  Rathbone
  (c) ArmA.Network 2016

  The usage of this file is restricted to ArmA.Network
  You're not allowed to modify this file!
  Licensed under the Arma EULA and Arma Tools EULA.
  For further questions contact the author!
*/
_shop = param [0,-1,[0]];
disableSerialization;
_display = findDisplay 42125;
switch(_shop) do {
  case 0: {
    _idc = [1501,1100,1502,1503,1504,1505,1105,1102,1103,1104,2406,2407,2408,2409,2410,2413];
    {
    _control = _display displayCtrl _x;
    _control ctrlShow true;
    } forEach _idc;
    _idc = [3000,3002,3003,3006,3009,3012,3005,3008,3010,3014,3001,3004,3007,3011,3013,3023,3024,3025,3026,3027,4001,4100,4002,4401,4402,4403,4004,4007,4010,4101,4102,4103,5000,5411,5100];
    {
    _control = _display displayCtrl _x;
    _control ctrlShow false;
    } forEach _idc;
  };
  case 1: {
    _idc = [3000,3002,3003,3006,3009,3012,3005,3008,3010,3014,3001,3004,3007,3011,3013,3023,3024,3025,3026,3027];
    {
    _control = _display displayCtrl _x;
    _control ctrlShow true;
    } forEach _idc;
    _idc = [4001,4100,4002,4401,4402,4403,4004,4007,4010,4101,4102,4103,1501,1100,1502,1503,1504,1505,1105,1102,1103,1104,2406,2407,2408,2409,2410,2413,5000,5411,5100];
    {
    _control = _display displayCtrl _x;
    _control ctrlShow false;
    } forEach _idc;
  };
  case 2: {
    _idc = [4001,4100,4002,4401,4402,4403,4004,4007,4010,4101,4102,4103];
    {
    _control = _display displayCtrl _x;
    _control ctrlShow true;
    } forEach _idc;
    _idc = [1501,1100,1502,1503,1504,1505,1105,1102,1103,1104,2406,2407,2408,2409,2410,2413,3000,3002,3003,3006,3009,3012,3005,3008,3010,3014,3001,3004,3007,3011,3013,3023,3024,3025,3026,3027,5000,5411,5100];
    {
    _control = _display displayCtrl _x;
    _control ctrlShow false;
    } forEach _idc;
  };
};
