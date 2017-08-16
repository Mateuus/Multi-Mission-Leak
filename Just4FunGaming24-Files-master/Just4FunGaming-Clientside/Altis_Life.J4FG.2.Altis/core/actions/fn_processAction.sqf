// Written by Kupferkarpfen
// License: CC BY-NC-SA 4.0
// based on work by Tonic

private _processor = param[0, objNull, [objNull] ];
private _type = param[ 3, "", [""] ];

if( isNull _processor || _type isEqualTo "" || player distance _processor > 5 || vehicle player != player ) exitWith {};

private _itemInfo = [];
{
    if( (_x select 0) == _type ) exitWith {
        _itemInfo = _x;
    };

} forEach XY_resourceProcessors;

//Error checking
if( _itemInfo isEqualTo [] ) exitWith {};

//Setup vars.
private _oldItems = _itemInfo select 1;
private _newItem = _itemInfo select 2;
private _duration = _itemInfo select 3;
private _amount = _itemInfo select 4;
private _condition = _itemInfo select 5;
private _text = _itemInfo select 6;

if( !(call _condition) ) exitWith {};

private _hasLicense = _processor in [mari_processor, coke_processor, heroin_processor] || { missionNamespace getVariable [ format["license_civ_%1", _type], true] }; // << Default true, for resources without a license!

private _count = 0;
{
    private _tmp = missionNamespace getVariable [ format["%1%2", XY_ssv_mniPrefix, _x], 0];
    if( _tmp <= 0 ) exitWith {
        _count = 0;
    };
    if( _count == 0 || _tmp < _count ) then {
        _count = _tmp;
    };
} forEach _oldItems;

if( _count < 1 ) exitWith {
    hint "Du hast nicht genug Ressourcen zum Verarbeiten";
};
if( _amount > 0 ) then {
    _count = _amount min _count;
};

if( XY_actionInUse ) exitWith {};
XY_actionInUse = true;

if( !_hasLicense ) then {
    // slower w/o license...
    _duration = floor (_duration * 3);
};

disableSerialization;
private _cp = 0;
private _startTime = time;
private _timeOut = _startTime + _duration;
private _interrupted = false;

5 cutRsc ["XY_progressBar", "PLAIN"];
private _ui = uiNamespace getVariable "XY_progressBar";
private _progressBar = _ui displayCtrl 38201;
private _progressText = _ui displayCtrl 38202;

private _interrupted = true;
while { alive player && !XY_isTazed && !(player getVariable["restrained", false])&& {animationState player != "incapacitated" } && player distance _processor <= 10 } do {

    _cp = (time - _startTime) / (_timeOut - _startTime);
    _progressBar progressSetPosition _cp;
    _progressText ctrlSetText format["%1 (%2%3)", _text, round(_cp * 100), "%"];

    if( time >= _timeOut ) exitWith {
        _interrupted = false;
    };
    sleep 0.25;
};

5 cutText ["","PLAIN"];
XY_actionInUse = false;

if(_interrupted) exitWith {
    hint localize "STR_NOTF_ActionCancel";
};

private _message = "";
{
    [false, _x, _count] call XY_fnc_handleInv;

    _message = format["%1 %2x %3", _message, _count, ([_x] call XY_fnc_itemConfig) select 2];

} forEach _oldItems;

[true, _newItem, _count] call XY_fnc_handleInv;

hint format[ "Du hast%1 zu %2 %3 verarbeitet", _message, _count, ([_newItem] call XY_fnc_itemConfig) select 2 ];