// Schaltet den Sidechat ein oder Aus

if(DWEV_sidechat) then {DWEV_sidechat = false;} else {DWEV_sidechat = true;};
[player,DWEV_sidechat,(side player)] remoteExec ["DWF_fnc_managesc",2];
[] call DWEV_fnc_settingsMenu;