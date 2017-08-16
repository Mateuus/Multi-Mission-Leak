#include <macro.h>
/*
	File: fn_adminMarkers.sqf
	Sourced from Lystics Player Markers Loop
*/
if(__GETC__(life_adminlevel) < 2) exitWith {
	closeDialog 0; 
	[] call life_fnc_crashStart;
	_message = format["%1 verwendet unbefugt die Admin-Markierungen!", name player];
	[["",_message,player,8],"SOA_fnc_handleMessages",false,false] spawn life_fnc_MP;
};

if(__GETC__(life_adminlevel < 3)) then {
    createDialog "checkAdmin";
    WaitUntil{isnull (finddisplay 8600)};
};

if(!life_markers) then {
	PlayerMarkers = [];
	life_markers = true;
	hint localize "STR_ANOTF_MEnabled";
	[name player, "hat die Markieren-Funktion aktiviert!",call life_adminlevel,7,"",admingrund] remoteExecCall ["life_fnc_logdat",2];

    {
        _marker = createMarkerLocal [format["%1_marker",_x],visiblePosition _x];
        _marker setMarkerColorLocal "ColorRed";
        _marker setMarkerTypeLocal "mil_triangle";
        _marker setMarkerTextLocal format["%1", name _x];
        PlayerMarkers set[count PlayerMarkers,[_marker,_x]];
    } foreach playableUnits;
    
	while {life_markers} do
    {
        {
            private["_marker","_unit"];
            _marker = _x select 0;
            _unit = _x select 1;
            if(!isNil "_unit") then
            {
                if(!isNull _unit) then
                {
                    _marker setMarkerPosLocal (visiblePosition _unit);
                };
            };
        } foreach PlayerMarkers;
        uisleep 0.05;
    };

} else {
	hint localize "STR_ANOTF_MDisabled";
	[name player, "hat die Markieren-Funktion deaktiviert!",call life_adminlevel,7] remoteExecCall ["life_fnc_logdat",2];
	
    {deleteMarkerLocal (_x select 0)} foreach PlayerMarkers;
    PlayerMarkers = [];
	life_markers = false;
};