/* 
 Persistent Market - Load script 
 by Kupferkarpfen 
*/ 
 
{ 
    private _type = _x select 0; 
    diag_log format["Loading market price and volume for %1...", _type]; 
    private _queryResult = [ format["SELECT price FROM pricelog WHERE resource ='%1' ORDER BY id DESC LIMIT 1", _type], 2 ] call XYDB_fnc_asyncCall; 
 
    if( !(_queryResult isEqualTo []) ) then { 
 
        private _price = _queryResult select 0; 
        diag_log format["Price: %1", _price]; 
        _x set [1, _price]; 
        _x set [2, _price]; // < start-price for long-time change calculation 
    }; 
 
    // Load stored volume... 
    _queryResult = [ format["SELECT volume FROM volumelog WHERE resource ='%1' ORDER BY id DESC LIMIT 1", _type], 2 ] call XYDB_fnc_asyncCall; 
    if( !(_queryResult isEqualTo []) ) then { 
 
        private _volume = _queryResult select 0; 
        diag_log format[ "Volume: %1", _volume ]; 
 
        { 
            if( (_x select 0) isEqualTo _type ) exitWith { 
                _x set [1, _volume]; 
            }; 
        } forEach XY_marketVolume; 
    }; 
 
} forEach XY_marketPrices; 
 
publicVariable "XY_marketPrices"; 
