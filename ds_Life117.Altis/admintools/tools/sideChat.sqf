/* Huntah
Plays sound to all server
Warns them of talking in sidechat
*/

private ["_message"];

if(miscInfoArray select 5) exitwith {hint 'Used too recently';};
miscInfoArray set[5,true];
publicVariable "miscInfoArray";

_message = "For all GAME issues come speak with an Admin on our Teamspeak TS.thedarksidegames.com:10004";

[[_message],"DS_fnc_DarkSide_Warnings"] spawn BIS_fnc_MP;

[[2,format["%1",_message]],"DS_fnc_globalMessage"] spawn BIS_fnc_MP;

sleep 30;

miscInfoArray set[5,false];
publicVariable "miscInfoArray";