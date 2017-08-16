/*
  ArmA.Network
  Rathbone
  Processes Notification Queue
  (c) ArmA.Network 2016

  The usage of this file is restricted to ArmA.Network
  You're not allowed to modify this file!
  Licensed under the Arma EULA and Arma Tools EULA.
  For further questions contact the author!
*/
if(!alive player) exitWith {};
if!(NotificationArray isEqualTo []) then {
  if!(NotificationHUD) then {("NotificationLayer" call BIS_fnc_rscLayer) cutRsc ["ANNotification", "PLAIN", 1, false]; NotificationHUD = true;};
  {
    if(_x select 3) then {
      _x set[3,false];
      if(Message1Active) then {
        if(Message2Active) then {
          if(Message3Active) then {
            if(Message4Active) then {
              if(Message5Active) then {
                if(Message6Active) then {
                } else {
                  [_x] spawn life_fnc_wehezutra;
                };
              } else {
                [_x] spawn life_fnc_frehahuba;
              };
            } else {
              [_x] spawn life_fnc_wrecezeqa;
            };
          } else {
            [_x] spawn life_fnc_phesperes;
          };
        } else {
          [_x] spawn life_fnc_crayetruy;
        };
      } else {
        [_x] spawn life_fnc_drunufram;
      };
    };
  } forEach NotificationArray;
} else {
  ("NotificationLayer" call BIS_fnc_rscLayer) cutText ["", "PLAIN"];
  NotificationHUD = false;
};
