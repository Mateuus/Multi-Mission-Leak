// Written by Kupferkarpfen 
// License: CC BY-NC-SA 4.0 
 
private["_civ", "_cop", "_uid", "_total"]; 
 
if( !params[ 
        [ "_civ", objNull, [objNull]], 
        [ "_cop", objNull, [objNull]] 
    ]) exitWith {}; 
 
_uid = getPlayerUID _civ; 
{ 
    if( (_x select 0) isEqualTo _uid ) exitWith { 
        _total = 0; 
        { 
            _total = _total + (_x select 1); 
        } forEach (_x select 1); 
        // ony receive fraction of the bounty to encourage the cop to make the guy pay 
        [ round(_total * 0.66) ] remoteExec ["XY_fnc_bountyReceive", _cop]; 
    }; 
} forEach XY_wantedList;