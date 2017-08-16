#include "..\..\script_macros.hpp"

private ["_lic", "_struct", "_side"];
disableSerialization;

_lic = CONTROL(5501,2014);
_struct = "";
_side = switch (playerSide) do {case west:{"cop"}; case civilian:{"civ"}; case independent:{"med"};};

{
    private _displayName = getText(_x >> "displayName");

    if (LICENSE_VALUE(configName _x,_side)) then {
        _struct = _struct + format ["%1<br/>",localize _displayName];
    };
} forEach (format ["getText(_x >> 'side') isEqualTo '%1'",_side] configClasses (missionConfigFile >> "Licenses"));

if (_struct isEqualTo "") then {
    _struct = "No Licenses";
};

_lic ctrlSetStructuredText parseText format ["
<t size='0.8px'>
%1
</t>
",_struct];