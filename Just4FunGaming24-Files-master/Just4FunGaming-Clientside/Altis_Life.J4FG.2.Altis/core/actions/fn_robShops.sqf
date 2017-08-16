// Written by Kupferkarpfen
// License: CC BY-NC-SA 4.0

private["_shop", "_robber", "_informed", "_shopName"];

_shop = [ _this, 0, ObjNull, [ObjNull] ] call BIS_fnc_param;
_robber = [ _this, 1, ObjNull, [ObjNull] ] call BIS_fnc_param;

if(isNull _shop || isNull _robber) exitWith {};

if( playersNumber west < 4 ) exitWith {
    hint "Es müssen mindestens 4 Polizisten online sein!"
};
if( playerSide != civilian ) exitWith {
    hint "Du bist kein Zivilist!"
};
if (vehicle player != _robber) exitWith {
    hint "Raus aus dem Fahrzeug!"
};
if( (currentWeapon player) in ["", "binocular", "rangefinder"] ) exitWith {
    hint "Haha, ohne Waffe raubst du niemanden aus. Raus hier du Lappen!"
};
if(_robber distance _shop > 3) exitWith {
    hint "Geh näher ran!"
};

// Check if last rob is not long enough ago:
if( _shop getVariable["locked", false] ) exitWith {
    hint "Die Kasse ist leer!";
};

// Three randomly delayed checks to prevent two players robbing simultaneously:
sleep random 0.2;
if( !(_shop getVariable["rip", false]) ) then {
    sleep random 0.2;
    if( !(_shop getVariable["rip", false]) ) then {
        sleep random 0.2;
    };
};
if( _shop getVariable["rip", false] ) exitWith {
    hint "Hier läuft bereits ein Raub!";
};

if( XY_actionInUse ) exitWith {};
XY_actionInUse = true;

// Launch cooldown server-side to prevent deadlocking when client disconnects
[_shop] remoteExec ["XY_fnc_robCooldown", 2];
[_shop] remoteExec ["XY_fnc_dangerMarker", 2];

// Lock the shop:
_shop setVariable["rip", true, true];

_shopName = _shop getVariable["location", "ERROR"];

hint "Bleib in der Nähe!";

_informed = false;

disableSerialization;
_duration = 150 + floor(random 50);
_cp = 0;
_startTime = time;
_timeOut = _startTime + _duration;
_interrupted = true;

5 cutRsc ["XY_progressBar", "PLAIN"];
_ui = uiNamespace getVariable "XY_progressBar";
_progressBar = _ui displayCtrl 38201;
_progressText = _ui displayCtrl 38202;

while { alive player && !XY_isTazed && !(player getVariable["restrained", false]) && _robber distance _shop <= 10 } do {

    _cp = (time - _startTime) / (_timeOut - _startTime);

	_progressBar progressSetPosition _cp;
	_progressText ctrlSetText format["Tankstellenraub läuft (%1%2)", round(_cp * 100), "%"];

    if(_cp >= 1) exitWith {
        _interrupted = false;
    };

    _chance = random(100);

    // Zufallschance wann die Polizei informiert wird:
    if( _cp > 0.05 && _chance < 15 && !_informed ) then {
        _informed = true;
        hint "Der Kassierer hat heimlich die Polizei informiert!";
        [ [0, 1], format["ALARM! Tankstelle %1 wird überfallen!", _shopName ]] remoteExec ["XY_fnc_broadcast", [west, 2] ];
    };
    sleep 0.25;
};

5 cutText ["", "PLAIN"];
XY_actionInUse = false;
_shop setVariable["rip", false, true];

if( _interrupted ) exitWith {
    hint localize "STR_NOTF_ActionCancel";
};
_shop setVariable["locked", true, true];

_cash = 15000 + floor(random 20000);

hint format["Du hast %1€ geklaut und die Polizei ist auf dem Weg, nichts wie weg hier!", [_cash] call XY_fnc_numberText];
XY_CC = XY_CC + _cash;
[0] call XY_fnc_updatePartial;

// ATM deaktivieren
XY_atmUsable = false;
[] spawn {
    scriptName "ATM cooldown";
    sleep 300;
    XY_atmUsable = true;
};

// News verteilen
[[0, 1], format["110 - Tankstelle %1 wurde von %2 ausgeraubt! Beute: %3€", _shopName, [profileName, "maskierter Person"] select ([player] call XY_fnc_playerMasked), [_cash] call XY_fnc_numberText]] remoteExec ["XY_fnc_broadcast", [west, 2]];
[0, format["NEWS: Tankstelle %1 wurde ausgeraubt: Der Täter erbeutete %2€!", _shopName, [_cash] call XY_fnc_numberText]] remoteExec ["XY_fnc_broadcast", civilian];

// Wanted-Liste
if( !([player] call XY_fnc_playerMasked) || ((random 100) < 50) ) then {
    [getPlayerUID player, "120"] remoteExec ["XY_fnc_wantedAdd", 2];
};