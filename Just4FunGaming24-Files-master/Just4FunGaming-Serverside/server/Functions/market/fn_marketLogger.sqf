// Kupferkarpfen market volume logger 
 
private["_data", "_item", "_config", "_price"]; 
 
_data = ["INSERT INTO market (type, players, oil, iron, diamond, copper, salt, cement, gold, jewelry, silber, holz, beer, brandy, nuclearfuel, moonshine, turtle, marijuana, cocaine, heroin, lsd, meth, sarin, crocodile, uran235, plutonium, waste, trashbag, trashp) VALUES ('%1', '%2', '%3', '%4', '%5', '%6', '%7', '%8', '%9', '%10', '%11', '%12', '%13', '%14', '%15', '%16', '%17', '%18', '%19', '%20', '%21', '%22', '%23', '%24', '%25', '%26', '%27', '%28', '%29')"]; 
 
_data set [1, 0]; 
_data set [2, count allPlayers]; 
{ 
    _item = _x select 0; 
    _config = [ _item ] call XY_fnc_sourceConfig; 
    _price = round((_x select 1) / (_config select 1)); 
    _data set [ _forEachIndex + 3, [_price] call XYDB_fnc_numberSafe ]; 
 
} forEach XY_marketPrices; 
 
[ format _data, 1] remoteExec ["XYDB_fnc_asyncCall", XYDB]; 
 
_data set [1, 1]; 
{ 
    _data set [_forEachIndex + 3, _x select 1]; 
    _x set [1, 0]; 
} forEach XY_marketVolumeLogger; 
 
[ format _data, 1] remoteExec ["XYDB_fnc_asyncCall", XYDB];