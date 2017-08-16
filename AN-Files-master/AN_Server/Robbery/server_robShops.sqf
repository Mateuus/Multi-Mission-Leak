



    private["_shop", "_robber", "_action", "_robber2"];
    _shop = param[0, ObjNull, [ObjNull]];
    _robber = param[1, ObjNull, [ObjNull]];
    _action = param[2];

    if (isNull _shop OR {
            isNull _robber
        }) exitWith {};
    if (!alive _robber) exitWith {};
    _robber2 = owner _robber;

    if (_shop getVariable["rip", false]) exitWith {
        [1, "This station is already being robbed by someone else..."] remoteExecCall["life_fnc_brusathusek", _robber2];
    };
    if (_shop getVariable["locked", false]) exitWith {
        [1, "This station was recently jacked, no money here!"] remoteExecCall["life_fnc_brusathusek", _robber2];
    };
    if (_robber2 < 1) exitWith {};
    _shop setVariable["rip", true, true];
    [_shop, _robber, _action] remoteExec["life_fnc_mububadetrus", _robber2];