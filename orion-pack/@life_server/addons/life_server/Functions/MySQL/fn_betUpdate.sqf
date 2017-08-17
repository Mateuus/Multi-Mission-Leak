#include "..\..\script_macros.hpp"

private["_query","_queryResult","_mode","_gamemode"];

_mode = param [0,-1,[0]];


switch(_mode) do {
    
    case 1: { 
	
		_ret = param [1,objNull,[objNull]];
		if (isNull _ret) exitWith {};
		_ret = owner _ret;
        
        _query = "SELECT jackpot FROM casino WHERE id = '1'";
        _queryResult = [_query,2] call DB_fnc_asyncCall;
		diag_log "------------- Jackpot Query Request -------------";
		diag_log format["QUERY: %1",_query];
		diag_log format["Result: %1",_queryResult];
		diag_log "------------------------------------------------";
		
		[2,_queryResult] remoteExec ["life_fnc_casinoInit",_ret];
    };
    
    case 2: {
        
        _value = param [1,0,[0]];
		_value = [_value] call DB_fnc_numberSafe;
		_query = format["UPDATE casino SET jackpot= jackpot + %1 WHERE id = '1'",_value];
        
		if(_query == "") exitWith {};
		[_query,1] call DB_fnc_asyncCall;
    };
	
	case 3: {
	
		_query = "UPDATE casino SET jackpot= '0' WHERE id = '1'";
        
		if(_query == "") exitWith {};
		[_query,1] call DB_fnc_asyncCall;
	};
   
};
