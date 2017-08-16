private["_marketPrices", "_query", "_tickTime", "_queryResult", "_name"]; 
 
 
 
 
 
 
 
 
 
 
 
 
 
_query = "SELECT resource, buyprice, sellprice, varprice, minprice, maxprice, factor FROM economy"; 
 
_queryResult = [_query,2,true] call SERVERDATABASE_fnc_asyncCall; 
_marketPrices = []; 
 
{ 
_marketPrices pushBack [(_x select 0),(_x select 6)]; 
_name = format["%1MarketGoodPrice",(_x select 0)]; 
_x pushBack (_x select 2); 
_x pushBack (_x select 2); 
missionNamespace setVariable [_name, _x]; 
publicVariable _name; 
} forEach _queryResult; 
 
missionNamespace setVariable ["MarketPrices", _marketPrices]; 
publicVariable "MarketPrices";