_fnc_scriptName = "Player Synchronization";
private["_exit","_manuelSync"];
_manuelSync = [_this,0,"0",["0"]] call BIS_fnc_param;
if(isNil "life_session_time") then {life_session_time = false;};
if(life_session_time && _manuelSync == "0") exitWith {hint localize "STR_Session_SyncdAlready";};

[] call SOCK_fnc_updateRequest;

profileNamespace setVariable[format["%1_distantView_%2",missionName,getplayerUID player],viewdistance];
saveProfileNamespace;

if(_manuelSync == "0") then {
    hint localize "STR_Session_SyncData";
    [] spawn
    {
        life_session_time = true;
        uisleep (5 * 60);
        life_session_time = false;
    };
};