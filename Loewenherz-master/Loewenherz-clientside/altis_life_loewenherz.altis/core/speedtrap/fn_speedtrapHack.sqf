/*
	File: fn_speedtrapHack.sqf
	Author: Wolfgang Bahmüller
	
	Description:
	speedtrap is a speedtrap and sometimes a speedtrap
    
    Das Script darf nicht verändert werden!
    Der Einsatz ist nur auf von mir genehmigten Servern/Clients erlaubt!    
*/

if (isnil ("king_player_speedtrap_hack_is_running")) then {king_player_speedtrap_hack_is_running=0;};

private["_speedtrap","_inventory","_alarmsystems","_upp","_ui","_progress","_pgText","_cP","_displayName","_distance","_badDistance","_var_laptop","_value_laptop","_tool_type","_dice","_unlock_chance","_alarm_chance","_numDoors","_owner","_owner_object"];

_speedtrap = cursorTarget;
if(isNull _speedtrap) exitwith {};

_var_laptop = ["laptop",0] call lhm_fnc_varHandle;
_value_laptop = missionNamespace getVariable _var_laptop;
if(_value_laptop <= 0) exitWith {titleText["Du brauchst einen Laptop","PLAIN"];};

if(king_player_speedtrap_hack_is_running == 1) exitWith {hint "Die Tasten vom Laptop sind so klein und vom vielen tippen tun dir nun die Finger weh. Warte eine Weile dann kannst du es nochmal versuchen.";};

_progress_text = format["Knacke Radarfalle"];

_success = [20, _progress_text, _speedtrap] call lhm_fnc_progressWaitUntilFinished;
if(!_success) exitWith {};

_dice = random(100);
if(_dice <= 25) then
{
    //Speedtrap hacked
    king_player_speedtrap_hack_is_running = 1;
    [] spawn
    {
        sleep (5*60);
        king_player_speedtrap_hack_is_running = 0;
    };
    [] call lhm_fnc_speedtrapGetPhotoList;
    _speedtrap setVariable ["speedtrap_photos", [], true];
    titleText["Hack erfolgreich, alle Bilder wurden gelöscht","PLAIN"];
}
else
{
    //HACK FAILED!!
    titleText["SYSTEM MALFUNCTION... MEMORY SECURITY ALERT...","PLAIN"];
    [[getPlayerUID player,name player,"43"],"lhm_fnc_wantedAdd",false,false] call lhm_fnc_mp;
    [[0,format["%1 wurde dabei gesehen wie er eine Radarfalle hacken wollte.", name player]],"lhm_fnc_broadcast",west,false] call lhm_fnc_mp;
    hint "Hack nicht erfolgreich... nach dir wird gesucht...";
};
