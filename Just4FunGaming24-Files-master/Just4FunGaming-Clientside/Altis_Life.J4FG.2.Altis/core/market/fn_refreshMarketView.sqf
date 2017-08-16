// market view refresh
// Written by Kupferkarpfen
// License: CC BY-NC-SA 4.0

private[ "_display", "_index", "_shortName", "_itemInfo", "_config" ];

disableSerialization;
if(!dialog) exitWith {hint "Could not find dialog.";}; //cancel if no dlg

_display = findDisplay 39500;
if(isNull _display) exitWith {hint "Dialog not open!"; };

//Selected index
_index = lbCurSel 1500;

//If selected index is -1, set it to 0 (triggers refresh)
if( _index < 0 ) then {
    if( XY_marketRefreshing ) exitWith {};
    XY_marketRefreshing = true;

    // lbSetCurSel [1500, 0];
    lbClear 1500;

    {
        _itemInfo = [ _x select 0 ] call XY_fnc_itemConfig;

        _index = lbAdd [1500, _itemInfo select 2 ];
        lbSetData [1500, _index, _x select 0];

    } forEach XY_marketPrices;

    lbSetCurSel [1500, 0];

    XY_marketRefreshing = false;

} else {

    _shortName = lbData [1500, _index];

    ctrlSetText [1000, lbText [1500, _index] ];

    {
        if( (_x select 0) == _shortName ) exitWith {

            // Find source resource...
            _config = [_shortName] call XY_fnc_sourceConfig;

            if( count _config == 0 ) then {
                format [ "<CERROR> %1 (%2) didn't find source resource for: %3", profileName, getPlayerUID player, _shortName ] remoteExec ["XY_fnc_log", 2];
                _config = [_shortName] call XY_fnc_itemConfig;
            };

            ctrlSetText [1001, format["%1€ (%2€ pro LE)", [_x select 1] call XY_fnc_numberText, [ (_x select 1) / (_config select 1) ] call XY_fnc_numberText ] ];

            //Trend Global
            ctrlSetText [1004, format["%1€", [_x select 2] call XY_fnc_numberText ] ];
            ctrlSetText [1200, "icons\" + ( ["trenddown", "trendup"] select (_x select 2 >= 0) ) + ".paa"];

            //Trend local
            ctrlSetText [1005, format["%1€", [_x select 3] call XY_fnc_numberText ] ];
            ctrlSetText [1201, "icons\" + ( ["trenddown", "trendup"] select (_x select 3 >= 0) ) + ".paa"];

        };
    } forEach XY_marketPrices;
};