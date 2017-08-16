#include "script_macros.hpp"
StartProgress = false;

[] execVM "KRON_Strings.sqf";

StartProgress = true;

DYNAMICMARKET_boughtItems = [];
[getPlayerUID player] remoteExecCall ["TON_fnc_playerLogged",RSERV];