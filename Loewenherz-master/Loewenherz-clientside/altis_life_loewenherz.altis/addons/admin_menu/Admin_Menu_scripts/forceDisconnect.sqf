[] call SOCK_fnc_updateRequest;
[] call SOCK_fnc_PlayerStatUpdateRequest;
[[player],"TON_fnc_cleanupRequest",false,false] call lhm_fnc_mp;
["Aborted",true,false] call LHM_fnc_endMission;
[] call lhm_fnc_resetStackedEVH;