/*
    Darkside Life

	Author: ShadowRanger (Luke)

	Description:
	Enables or disables the player's input.

    This function has a workaround for disableUserInput locking a player's
    last pressed key when their input gets re-enabled
*/

params [["_state",false,[false]]];

if(_state)then {
    disableUserInput true;
} else {
    disableUserInput false;
    disableUserInput true;
    disableUserInput false;
};