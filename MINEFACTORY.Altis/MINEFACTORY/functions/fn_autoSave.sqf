while {true} do {
    sleep 600;
    if (alive player) then
        {
        [false] call SOCK_fnc_syncData;;
		systemChat "Gespeichert";
    };
};