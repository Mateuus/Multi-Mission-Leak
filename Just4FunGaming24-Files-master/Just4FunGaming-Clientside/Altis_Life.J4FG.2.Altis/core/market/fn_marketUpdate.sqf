// Written by Kupferkarpfen
// License: CC BY-NC-SA 4.0

private _market = param [ 1, [], [[]] ];

if( _market isEqualTo [] ) exitWith {
    diag_log "ERROR: Received errornouse market data!";
};

{
    _x set [ 1, (_x select 1) * XY_ssv_PB ];
    _x set [ 2, (_x select 2) * XY_ssv_PB ];
} forEach _market;

private _first = false;
// Initialize market info
if( XY_marketPrices isEqualTo [] ) then {
    _first = true;
    {
        // <NAME>, <PRICE>, <LONG-TERM CHANGE>, <SHORT-TERM-CHANGE>
        XY_marketPrices pushBack [ _x select 0, _x select 1, (_x select 1) - (_x select 2), 0 ];
    } forEach _market;
};

{
    private _item = _x select 0;
    private _price = _x select 1;
    private _startPrice = _x select 2;

    private _priceChange = 0;
    {
        if( _x select 0 isEqualTo _item && (_x select 4) != _price ) exitWith {

            // Set price:
            _priceChange = _price - (_x select 4);
            _x set [ 4, _price ];

        };
    } forEach XY_virtItems;

    // Update market info
    {
        if( (_x select 0) isEqualTo _item ) exitWith {
            _x set [ 1, _price ];
            _x set [ 2, round(_price - _startPrice) ];
            if( _priceChange != 0 && !_first ) then {
                _x set [ 3, round(_priceChange) ];
            };
        };
    } forEach XY_marketPrices;

} forEach _market;