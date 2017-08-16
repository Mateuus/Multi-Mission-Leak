// ["test",123] call lhm_fnc_showHint;

if (count _this == 2) then {
hint format ["%1 %2",_this select 0, _this select 1];
} else 
{
hint format ["%1",_this select 0];
};

