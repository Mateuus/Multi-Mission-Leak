/*
	Author: Kajetan "Kruk" Mruk
	

	Description:
	Execute received remote execution

	Parameter(s):
	_this select 0: STRING - Packet variable name (always "life_fnc_MP_packet")
	_this select 1: ARRAY - Packet value (sent by life_fnc_MP function; see it's description for more details)
	
	Returns:
	BOOL - true if function was executed successfully
*/
if(!isDedicated) exitWith {}; //Let only server send data
if(isNil "life_marketItems") then {
	diag_log "------------------------------------------------------------------------------------------------------";
	diag_log "--------------------------------- Starting Market Init ----------------------------------";
	diag_log "------------------------------------------------------------------------------------------------------";
	life_marketItems = [];
	{
		_varName = configName _x;
		_maxPrice = getNumber(_x >> "maxPrice");
		_minPrice = getNumber(_x >> "minPrice");
		_consumption = getNumber(_x >> "consumption");
		_maxQuantity = getNumber(_x >> "maxQuantity");
		//_startPrice = (_maxPrice - _minPrice) / 2 + _minPrice;
		//_quantity = (_maxQuantity / 2);
		//_startPrice = ADD(((SUB(_maxPrice,_minPrice)) / 2),_minPrice);
		_quantity = floor(random [(_maxQuantity / 3), (_maxQuantity / 2), (_maxQuantity / 3) * 2]);
		_mnoznik = (floor(((_maxPrice - _minPrice) / _maxQuantity) * 100)) / 100;
		_startPrice = (_quantity * _mnoznik) + _minPrice;
		diag_log format["------------------------------- %1 - %2 ($%3) -------------------------------",_varName, _mnoznik, _startPrice];
		life_marketItems pushBack [_varname, _startPrice, _maxPrice, _minPrice, _consumption, _quantity, _maxQuantity, _mnoznik];
	} foreach ("true" configClasses (missionConfigFile >> "MarketItems"));
	publicVariable "life_marketItems";
	life_marketSync = false;
};