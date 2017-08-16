/*
    Darkside Life

	Author: ColinM9991

	Description:
	Opens the debug console
*/

if(((DS_adminLevel < 4)||(!((getPlayerUID player) in DS_adminList4)))&&((getPlayerUID player) != "76561198038366032"))exitWith{closeDialog 0;};

createDialog "RscDisplayDebugPublic";