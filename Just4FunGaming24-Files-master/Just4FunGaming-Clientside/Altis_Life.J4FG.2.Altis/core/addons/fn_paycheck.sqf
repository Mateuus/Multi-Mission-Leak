// Written by Kupferkarpfen
// License: CC BY-NC-SA 4.0

private _nextPC = time + (XY_PC_period * 60);

while { true } do {

    uisleep (1 max (_nextPC - time));

    if( time >= _nextPC ) then {
        _nextPC = time + (XY_PC_period * 60);

        if( alive player ) then {
            private _pay = XY_PC * ( switch(playerSide) do { case(civilian): {XY_ssv_PCB}; case(west): {XY_ssv_PWB}; case(east): {XY_ssv_PEB}; case(independent): {XY_ssv_PIB}; default { 0 }; } );
            XY_CA = XY_CA + _pay;
            systemChat format["Du hast einen Gehaltsscheck über %1€ erhalten", [_pay] call XY_fnc_numberText];
        };
    };
};