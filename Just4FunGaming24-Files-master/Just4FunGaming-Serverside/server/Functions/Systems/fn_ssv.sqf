// SSV, Server-Side-Variables 
// Written by Kupferkarpfen 
// License: CC BY-NC-SA 4.0 
 
// Retrieves variables from DB and pushes them to all clients via publicVariable 
 
private _mode = param[0, "", [""]]; 
if( _mode isEqualTo "" ) exitWith {}; 
 
if( _mode isEqualTo "loop" ) exitWith { 
 
    XY_ssv_daytime = (["SELECT value FROM config_ssv WHERE name = 'XY_ssv_daytime'", 2] call XYDB_fnc_asyncCall) select 0; 
    diag_log format["INIT DAYTIME: %1", XY_ssv_daytime]; 
 
    "SSVloop" spawn { scriptName _this; 
        while{ true } do { 
            uisleep 1200; 
            [ "update" ] remoteExec [ "XY_fnc_ssv", XYDB ]; 
        }; 
    }; 
}; 
 
if( !(_mode isEqualTo "update") ) exitWith { 
    diag_log format["<ERROR> SSV, invalid mode: %1", _this]; 
}; 
 
diag_log "<SSV> updating variables..."; 
{ 
    // diag_log format[ "<SSV> processing: %1", _x ]; 
 
    private _name = _x select 0; 
    private _value = _x select 1; 
 
    if( isNil { missionNamespace getVariable _name } || { !((missionNamespace getVariable _name) isEqualTo _value) } ) then { 
        diag_log format[ "<SSV> publish: %1 = %2 (%3)", _name, _value, typeName _value ]; 
        missionNamespace setVariable[ _name, _value ]; 
        publicVariable _name; 
    }; 
 
} forEach ([ "SELECT name, value FROM config_ssv", 2, true ] call XYDB_fnc_asyncCall); 
 
diag_log "<SSV> updating XY_virtItems"; 
private _itemList = []; 
{ 
    _x set[ 5, (_x select 5 isEqualTo 1) ]; 
 
    private _condition = { true }; 
    if( typeName (_x select 6) isEqualTo "CODE" ) then { 
        _condition = _x select 6; 
    }; 
    // move condition to 7, as this was added later 
    _x set[7, _condition]; 
 
    _x set[ 6, format["%1%2", XY_ssv_mniPrefix, _x select 0] ]; 
 
    _itemList pushBack _x; 
 
} forEach ([ "SELECT internalName, weight, displayName, buyPrice, sellPrice, illegal, requirements FROM config_items", 2, true ] call XYDB_fnc_asyncCall); 
 
if( isNil "XY_virtItems" || { !(XY_virtItems isEqualTo _itemList) } ) then { 
    diag_log format["<SSV> publish XY_virtItems: %1", _itemList]; 
    XY_virtItems = _itemList; 
    publicVariable "XY_virtItems"; 
}; 
 
diag_log "<SSV> updating XY_vehicleList"; 
private _vehicleList = []; 
{ 
    // diag_log format[ "<SSV> processing: %1, %2", _x,  typeName (_x select 7), typeName (_x select 8) ]; 
 
    private _shops = []; 
    if( typeName (_x select 7) isEqualTo "ARRAY" ) then { 
        _shops = _x select 7; 
    }; 
 
    private _condition = { true }; 
    if( typeName (_x select 8) isEqualTo "CODE" ) then { 
        _condition = _x select 8; 
    }; 
 
    _vehicleList pushBack [ 
        // IDX 0: vehicle side 
        switch( _x select 0) do { case "all": { sideUnknown }; case "cop": { west }; case "civ": { civilian }; case "med": { independent }; case "thw": { east }; default { "ERR" } }, 
        _x select 1, // IDX 1: classname 
        _x select 2, // IDX 2: trunk capacity 
        (_x select 3) * XY_ssv_VD * XY_ssv_GD, // IDX 3: buy value 
        (_x select 4) * XY_ssv_VD * XY_ssv_GD, // IDX 4: rent value 
        (_x select 5) * XY_ssv_VD * XY_ssv_GD, // IDX 5: insure value 
        (_x select 6) * XY_ssv_VD * XY_ssv_GD, // IDX 6: unpark value 
        ((_x select 3) * XY_ssv_VD * XY_ssv_GD) * XY_ssv_SF, // IDX 7: sale value 
        _shops, // IDX 8: shop list 
        _condition // IDX 9: buy pre-condition 
    ]; 
 
} forEach ([ "SELECT side, classname, trunk, priceBuy, priceRent, priceInsure, priceUnpark, shops, requirements FROM config_vehicles ORDER BY priceBuy ASC", 2, true ] call XYDB_fnc_asyncCall); 
 
if( isNil "XY_vehicleList" || { !(XY_vehicleList isEqualTo _vehicleList) } ) then { 
    diag_log "<SSV> publish XY_vehicleList"; 
    XY_vehicleList = _vehicleList; 
    publicVariable "XY_vehicleList"; 
}; 
 
diag_log "<SSV> updating XY_virtShops"; 
private _shopList = []; 
{ 
    _shopList pushBack [ _x select 0, [ _x select 1, _x select 2] ]; 
 
} forEach ([ "SELECT name, caption, contents FROM config_traders", 2, true ] call XYDB_fnc_asyncCall); 
 
if( isNil "XY_virtShops" || { !(XY_virtShops isEqualTo _shopList) } ) then { 
    diag_log "<SSV> publish XY_virtShops"; 
    XY_virtShops = _shopList; 
    publicVariable "XY_virtShops"; 
}; 
 
// We cannot load the whole list in one go, so we have to do a few more calls... 
diag_log "<SSV> updating XY_objectShops"; 
private _objectShopList = []; 
{ 
    private _shop = _x select 0; 
    { 
        private _condition = { true }; 
        if( typeName (_x select 3) isEqualTo "CODE" ) then { 
            _condition = _x select 3; 
        }; 
 
        private _entry = [ _x select 0, _x select 1, _x select 2, _condition ]; 
        private _found = false; 
        { 
            if( (_x select 0) isEqualTo _shop )exitWith { 
                _found = true; 
                (_x select 1) pushBack _entry; 
            }; 
        } forEach _objectShopList; 
 
        if( !_found )then { 
            _objectShopList pushBack [ _shop, [_entry] ]; 
        }; 
 
    } forEach ( [format[ "SELECT class, caption, price, requirements FROM config_objects WHERE orderNr > 0 AND shop = '%1' ORDER BY orderNr", _shop], 2, true ] call XYDB_fnc_asyncCall); 
} forEach ([ "SELECT DISTINCT shop FROM config_objects", 2, true ] call XYDB_fnc_asyncCall); 
 
if( isNil "XY_objectShops" || { !(XY_objectShops isEqualTo _objectShopList) } ) then { 
    diag_log "<SSV> publish XY_objectShops"; 
    XY_objectShops = _objectShopList; 
    publicVariable "XY_objectShops"; 
}; 
 
[format["UPDATE config_ssv SET value = '%1' WHERE name = 'XY_ssv_daytime'", daytime], 1] call XYDB_fnc_asyncCall;