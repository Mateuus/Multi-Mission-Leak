/* Huntah
Plays sound to all server
Warns them of talking in sidechat
*/

private ["_message"];

if(miscInfoArray select 5) exitwith {hint 'Used too recently';};
miscInfoArray set[5,true];
publicVariable "miscInfoArray";

_message = "No Meta-Gaming, Abuse, Complaints or Voice in sidechat, doing so can result in a kick!";

[[_message],"DS_fnc_DarkSide_Warnings"] spawn BIS_fnc_MP;

[[2,format["%1",_message]],"DS_fnc_global"] spawn BIS_fnc_MP;

sleep 30;

miscInfoArray set[5,false];
publicVariable "miscInfoArray";