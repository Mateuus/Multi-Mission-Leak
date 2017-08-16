/*

    Saving gear on death if Alt + F4

*/

while { true } do {

	sleep ( 60 * ( 10 + ( random 10 ) ) );

	//if ( !( player getVariable [ "incapacitated", false ] ) ) then 
    if ( !( player getVariable [ "killed", false ] ) ) then
    {
        diag_log "Auto save.";
		[0] call SOCK_fnc_updatePartial;
        [3] call SOCK_fnc_updatePartial;
        [4] call SOCK_fnc_updatePartial;
	};

};