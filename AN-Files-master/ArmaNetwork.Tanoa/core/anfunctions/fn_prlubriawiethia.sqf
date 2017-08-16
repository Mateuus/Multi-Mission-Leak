/*
  ArmA.Network
  Rathbone
  (c) ArmA.Network 2016

  The usage of this file is restricted to ArmA.Network
  You're not allowed to modify this file!
  Licensed under the Arma EULA and Arma Tools EULA.
  For further questions contact the author!
*/
_type = param [0,-1,[0]];
if(_type isEqualTo -1) exitWith {};
switch(_type)do {

  case 0: {
    _info = param [1,-1,[0]];
    if(_info isEqualTo -1) exitWith {};
    hintSilent "No Lawyers currently working. You're money has been deposited back into your bank account!";
    [_amount,1,0] call life_fnc_sewawruk;
    RequestedLawyer = nil;
  };
  case 1: {
    ["NewLawyerJob"] call life_fnc_notificationHandler;
  };
  case 2: {
    _info = param [1,-1,[0]];
    if(_info isEqualTo -1) exitWith {};
    hintSilent "No Lawyers accepted your Request. You're money has been deposited back into your bank account!";
    [_amount,1,0] call life_fnc_sewawruk;
    RequestedLawyer = nil;
  };
  case 3: {
    ["LawyerAccepted"] call life_fnc_notificationHandler;
  };
  case 4: {
    ["LawyerJobTaken"] call life_fnc_notificationHandler;
  };
  case 5: {
    _info = param [1,[],[[]]];
    LawyerDutyOn = false;
    OnLawyerJob = true;
    ["LawyerJobYours"] call life_fnc_notificationHandler;
    _markerText = createMarkerLocal ["LawClientPos", getPos (_info select 0)];
    "LawClientPos" setMarkerColorLocal "ColorRed";
    "LawClientPos" setMarkerTextLocal format ["CLIENT %1",name _player];
    "LawClientPos" setMarkerTypeLocal "mil_warning";
    if(isNil "LawyerJobInfo") then {LawyerJobInfo = [(_info select 2)];};
  };
  default {};
};
