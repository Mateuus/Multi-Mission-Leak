private["_hudtemplate","_backgroundexp","_backgroundright","_ui"];
disableSerialization;
hudchanged = call compile lbData[2973,(lbCurSel 2973)];
hudselection = hudchanged select 2;

profileNamespace setVariable ["life_hud",hudselection];
saveProfileNamespace;

//[12] call SOCK_fnc_UpdatePartial;

2 cutFadeOut 1;
sleep 1;
[] call life_fnc_hudSetup;