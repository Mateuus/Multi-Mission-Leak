// showPassport
// Written by Kupferkarpfen
// License: CC BY-NC-SA 4.0

private _info = [player] call XY_fnc_playerInfo;
private _rank = _info select 3;

// prepare message
_message = switch( playerSide ) do {
    case civilian: {
        format["<img size='10' image='images\passport.paa'/><br/><br/><t size='2.5'>%1</t><br/><br/><t size='1'>Altis Bürger</t>", profileName];
    };    
    case west: {
        format["<img size='10' image='images\license_cop.paa'/><br/><br/><t size='2.5'>%1</t><br/><t size='1.8'>%2</t><br/><t size='1'>Altis Polizei</t>", profileName, _rank];
    };
    case east: {
        format["<img size='10' image='images\license_thw.paa'/><br/><br/><t size='2.5'>%1</t><br/><t size='1.8'>%2</t><br/><t size='1'>Altis THW</t>", _info select 1, _rank];
    };
    case independent: {
        format["<img size='10' image='images\license_med.paa'/><br/><br/><t size='2.5'>%1</t><br/><t size='1.8'>%2</t><br/><t size='1'>Altis Sanitätsdienst</t>", _info select 1, _rank];
    };
    default { "" };
};

if( _message isEqualTo "" ) exitWith {
    hint "Du hast keinen Ausweis"; 
};

// send to nearby players and myself...
{
    [ 1, _message, "", 6 ] remoteExec ["XY_fnc_broadcast", _x];
} forEach ([player] + (player nearEntities ["Man", 5]));