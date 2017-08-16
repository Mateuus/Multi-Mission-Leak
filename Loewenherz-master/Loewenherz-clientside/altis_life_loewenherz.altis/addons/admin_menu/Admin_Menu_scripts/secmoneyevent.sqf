if(LHM_admin_sec_event_allowed)then{
	
	[{LHM_admin_sec_event_allowed = false; publicVariable "LHM_admin_sec_event_allowed";},"BIS_fnc_spawn", false, false] call LHM_fnc_MP; //test public variable restriction
	
	hint "Sec Event nicht mehr erlaubt";

	[["admin",(format["%1 with UID %2 has disabled the Sec-Event",name player,getPlayerUID player])],"TON_fnc_externLog",false,false] call lhm_fnc_mp;
}else{

	[{LHM_admin_sec_event_allowed = true; publicVariable "LHM_admin_sec_event_allowed";},"BIS_fnc_spawn", false, false] call LHM_fnc_MP; //test public variable restriction
	
	hint "Sec Event erlaubt";
	[["admin",(format["%1 with UID %2 has enabled the Sec-Event",name player,getPlayerUID player])],"TON_fnc_externLog",false,false] call lhm_fnc_mp;
};