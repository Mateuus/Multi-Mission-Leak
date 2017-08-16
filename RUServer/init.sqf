/*
    File: init.sqf
    Author:

    Description:

*/
StartProgress = false;

if (hasInterface) then {
    [] execVM "briefing.sqf"; //Load Briefing
};
[] execVM "KRON_Strings.sqf";
[] execVM "core\scripts\deletetask.sqf";
[] execVM "core\items\fn_teargas.sqf";
[] execVM "core\functions\fn_autoMessages.sqf";
[] execVM "core\scripts\fn_statusBar.sqf";
//[] execVM "\life_server\Functions\Schiffswrack\fn_generateschiffwrackauto.sqf";

StartProgress = true;

while {true} do {
0 setfog 0;
};
