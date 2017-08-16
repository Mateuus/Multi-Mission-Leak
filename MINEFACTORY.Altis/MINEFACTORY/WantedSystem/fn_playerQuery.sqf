#include "..\..\script_macros.hpp"
private["_info","_mode"];
_mode = _this select 0;
disableSerialization;


_info = lbData[6031,lbCurSel (6031)];
_info = call compile format["%1", _info];
life_computergesucht = format ["%1",getPlayerUID _info];
[player,_mode] remoteExec ["TON_fnc_pcplayer_query",_info];