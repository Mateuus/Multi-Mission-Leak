#include "..\..\script_macros.hpp"
/*
 Shows cop arrest dialog
*/
if(playerSide != west) exitWith {};
createDialog "jail_time";