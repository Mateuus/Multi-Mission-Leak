/*
	File: fn_vAH_init.sqf
	Description: Initialized the new Auction house/shop
	Author: Fresqo
*/

private["_query","_queryResult","_rows","_new"];
vAH_loaded = false;
publicVariable "vAH_loaded";
_query = format["SELECT id, type, amount, item, price, seller, sellername, status, time FROM ah"];
_queryResult = [_query,2,true] call DB_fnc_asyncCall;
diag_log "------------- Auction House Initialization -------------";
diag_log format["Query: %1",_query];
diag_log format["Result: %1",_queryResult];
diag_log "------------------------------------------------";

//Parse item
{_new = [(_x select 3)] call DB_fnc_mresToArray;
if(typeName _new isEqualTo "STRING") then {_new = call compile format["%1", _new];};
_x set[3,_new];} forEach _queryResult;

all_ah_items = _queryResult;
publicVariable "all_ah_items";
vAH_loaded = true;
publicVariable "vAH_loaded";
