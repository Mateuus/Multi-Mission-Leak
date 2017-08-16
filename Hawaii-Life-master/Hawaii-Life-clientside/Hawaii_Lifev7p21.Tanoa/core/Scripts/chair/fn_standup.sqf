#include "..\..\..\script_macros.hpp"

private["_unit"];
_unit = _this select 1;
[_unit,"AmovPercMstpSlowWrflDnon"] remoteExecCall ["life_fnc_animSync",RCLIENT];
player removeAction standup
