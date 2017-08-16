/* 
    Author: Bryan "Tonic" Boardwine 
 
    Description: 
    Queries to see if the player belongs to any gang. 
*/ 
private _playerID = param[0, "", [""]]; 
if( _playerID isEqualTo "" ) exitWith {}; 
 
private _queryResult = [format["SELECT id, owner, name, maxmembers, bank, members, moderators FROM gangs WHERE active='1' AND members LIKE '%2%1%2'", _playerID, "%"], 2] call XYDB_fnc_asyncCall; 
if( !(_queryResult isEqualTo []) ) then { 
 
    private _tmp = [ _queryResult select 5 ] call XYDB_fnc_mresToArray; 
    if( typeName _tmp == "STRING" ) then { 
        _tmp = call compile format["%1", _tmp]; 
    }; 
    _queryResult set[5, _tmp]; 
 
    _tmp = [ _queryResult select 6 ] call XYDB_fnc_mresToArray; 
    if( typeName _tmp == "STRING" ) then { 
        _tmp = call compile format["%1", _tmp]; 
    }; 
    _queryResult set[6, _tmp]; 
}; 
 
_queryResult;