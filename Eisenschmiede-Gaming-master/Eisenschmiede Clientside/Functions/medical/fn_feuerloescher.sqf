// made by Eisenschmiede klauen verboten :)


 ES_fnc_loescherraus = {
    _loescher = _this select 0;
    _aid = _this select 1;
    deleteVehicle _loescher;
    player removeAction _aid;
};

_loescher = "Land_FireExtinguisher_F" createvehicle getpos player;
_loescher attachTo [player, [-0.05,0.1,-0.35], "RightHandMiddle1"];
_loescher setVectorDirAndUp [[9,2,1],[3,0,4.0]];

g_loescher = _loescher;
player addAction ["Feuerlöscher: Wegpacken", {[g_loescher, _this select 2] call ES_fnc_loescherraus; g_loescher = nil}];

_loeschersm = "SmokeShell" createVehicle getpos player;
_loeschersm attachTo [player, [-0.05,0.1,-0.35]];