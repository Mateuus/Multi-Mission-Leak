if(!alive player || dialog) exitWith {};createDialog "cbEPsE";disableSerialization;switch(playerSide) do { case west: { ctrlShow[2011,false]; ctrlShow[2016,false]; if(call(qGwMF) < 2) then {ctrlShow[9800,false];};  }; case independent: { ctrlShow[9800,false];  ctrlShow[2012,false]; ctrlShow[2011,false]; ctrlShow[2017,false]; if(call(crvpV) < 6) then {ctrlEnable[2016,false];}; }; default { ctrlShow[2012,false]; ctrlShow[9800,false];  ctrlShow[2112,false];  ctrlShow[2016,false]; ctrlShow[2017,false]; };};if(isNil "zero_fnc_adminmenu") then {ctrlShow[2021,false];};[] call zero_fnc_hxDeBiItD;