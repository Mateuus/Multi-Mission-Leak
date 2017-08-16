lhm_versionInfo = "4.0";
[] execVM "briefing.sqf"; //Load Briefing
[] execVM "KRON_Strings.sqf";

"lhm_fnc_mp_packet" addPublicVariableEventHandler {_this call lhm_fnc_mpexec};
"BIS_fnc_MP_packet" addPublicVariableEventHandler {format ["BIS_FNC_MP:%1", _this] call bis_fnc_log;};