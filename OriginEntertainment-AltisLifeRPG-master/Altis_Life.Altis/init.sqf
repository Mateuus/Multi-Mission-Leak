enableSaving [false, false];

X_Server = false;
X_Client = false;
X_JIP = false;
StartProgress = false;

fn_whoDunnit = compile preprocessFileLineNumbers "scripts\fn_whoDunnit.sqf";  //Kai

if(!isDedicated) then { X_Client = true;};
enableSaving[false,false];

life_versionInfo = "Altis Life RPG v3.1.4.8";
//[] execVM "briefing.sqf"; //Load Briefing
[] execVM "KRON_Strings.sqf";

//Custom Kai
[] execVM "scripts\nosidechat.sqf"; 
[] execVM "scripts\Dynamic_Weather.sqf";
//execVM "R3F_LOG\init.sqf"; // Initialize the Logistics system
[] execVM "scripts\zlt_fastrope.sqf"; //FastRope Script
[] execVM "scripts\fn_disableSnakes.sqf";
[] execVM "scripts\outlw_magRepack\MagRepack_init_sv.sqf";
[] execVM "scripts\statusBar.sqf";
[] execVM "scripts\welcome.sqf"; 

//Repetitive Cleanup
[
    10*60, // seconds to delete dead bodies (0 means don't delete) 
    5*60, // seconds to delete dead vehicles (0 means don't delete)
    0, // seconds to delete immobile vehicles (0 means don't delete)
    5*60, // seconds to delete dropped weapons (0 means don't delete)
    30*60, // seconds to deleted planted explosives (0 means don't delete)
    3*60 // seconds to delete dropped smokes/chemlights (0 means don't delete)
] execVM 'scripts\repetitive_cleanup.sqf';

StartProgress = true;

setTerrainGrid 50;
