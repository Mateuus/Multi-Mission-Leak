
[1,format["DISPATCH: PANIC BUTTON USED BY %1",name player]] remoteExecCall ["life_fnc_broadcast", west];
[1,format["PANIC BUTTON USED BY %1",name player]] remoteExecCall ["life_fnc_broadcast", civilian];
[player,"panicbutton"] spawn life_fnc_nearestSound;
["dpanic", false] remoteExec ["life_fnc_dispatchpanic",west];
[0,"STR_NOTF_Panic",true,[profileName, player getVariable ["realname",name player]]] remoteExecCall ["life_fnc_broadcast",west];
[0,"STR_NOTF_Panic",true,[profileName, player getVariable ["realname",name player]]] remoteExecCall ["life_fnc_broadcast",west];
[0,"STR_NOTF_Panic",true,[profileName, player getVariable ["realname",name player]]] remoteExecCall ["life_fnc_broadcast",west];

[player] remoteExec ["life_fnc_panicMarker",west];

//-- Remove the Vitem when used
//life_inv_panicbutton = life_inv_panicbutton - 1;