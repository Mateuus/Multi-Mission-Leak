if(isServer)exitWith{};
private["_msg"];
_pers = _this select 0;
_msg = _this select 1;
hintSilent parseText _msg;

_pers setVariable ["ausweis_gezeigt", true, false];