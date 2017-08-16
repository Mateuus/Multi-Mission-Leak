// -- Get the target
params [
    [ "_target", objNull, [ objNull ] ]
];

if ( isNull _target ) exitWith {};
if ( player distance _target > 5 || !alive player || !alive _target ) exitWith {};

[ player ] remoteExec [ "life_fnc_seizeCommsPlayer", _target ]; // -- Do the action

_target setVariable [ "hasRadio", true, true ]; // -- Set communications status on player

//[ 0, format [ "%1:%2 seized %3:%4's communication (Radio)", profileName, ( getPlayerUID player ), ( getPlayerUID _target ), name _target ] ] remoteExec [ "FROG_fnc_logIt", 2 ];
