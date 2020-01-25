/*
Function to cool player by Koil
*/
if(isPlayer cursorTarget) then {
	[cursorTarget] remoteExec ["life_fnc_createGarbage",cursorTarget]; //better way of handling this than infinite loop
};
