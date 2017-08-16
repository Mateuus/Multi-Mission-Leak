private ["_target", "_who", "_obj"];
_target = [_this,0, objNull, [objNull]] call GTA_fnc_param;
_who = [_this, 1, "", [""]] call GTA_fnc_param;
if (isNull _target) exitWith {};
if (_target != player) exitWith {};
if (_who == "") exitWith {};

//--- Close all displays
[] call GTA_fnc_closeAllDisplays;

titleText [format [localize "STR_Civ_KnockedOut", _who], "PLAIN"];
[[player, "acts_injuredlyingrifle02"], "switchMove"] call GTA_fnc_remoteExec;
player setVariable ["unconscious", true, true];
sleep 15;
[[player, "AmovPpneMstpSnonWnonDnon"], "switchMove"] call GTA_fnc_remoteExec;
player setVariable ["unconscious", nil, true];
detach player;
