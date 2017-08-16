// Written by Kupferkarpfen
// License: CC BY-NC-SA 4.0

private _zones = [
    getMarkerPos "resource_legal_uran",
    getMarkerPos "processor_legal_uran",
    getMarkerPos "processor_illegal_uran2",
    getMarkerPos "processor_illegal_uran3",
    getMarkerPos "processor_legal_uran4"
];

while {true} do	{
    uisleep 5;

    private _damage = 0;
    {
        while { XY_radx < time && { _x distance player < 85 } && { !(isObjectHidden player) } && { alive player } && { ( !((headgear player) isEqualTo "H_PilotHelmetFighter_B") || !((uniform player) isEqualTo "U_C_WorkerCoveralls") ) } } do {
            if( _damage isEqualTo 0 ) then {
                hint parseText "<t color='#FF0000' size ='1.5' align='center'>RADIOAKTIVE ZONE</t><br/><t color='#FFFFFF' align='center' size='1'>Ohne Schutzausrüstung überlebst du hier nicht lange";
            };
            playSound "radiation";
            uisleep 7.4;
            player setDamage ((damage player) + _damage);
            _damage = _damage + 0.01;
        };
        
        if( !(_damage isEqualTo 0) && !(alive player) ) exitWith {
            [0, format["%1 hat zu lange in der Nähe von Uran gespielt, jetzt leuchtet er im Dunkeln...", profileName] ] remoteExec ["XY_fnc_broadcast"];
        };        
    } forEach _zones;
};