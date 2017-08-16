#include "..\..\script_macros.hpp"

private ["_pay"];
_pay = (call life_paycheck);

if ([life_currentExpPerks, "hardworker"] call mav_ttm_fnc_hasPerk) then {
    _pay = _pay * 1.2;
};

life_atmbank = life_atmbank + _pay;

systemChat format[localize "STR_FSM_ReceivedPay",_pay] call life_fnc_numberText;