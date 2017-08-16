Private["_target","_buff"];
_target = cursorTarget;
if (isNull _target) exitWith {};
_buff = _this select 3;
if (LHM_VAR_MEDIC_BUFF_TEST) then {
	_target = player;
};
[[_target,_buff],"lhm_fnc_run_buff_for_client",false,false] call lhm_fnc_mp;