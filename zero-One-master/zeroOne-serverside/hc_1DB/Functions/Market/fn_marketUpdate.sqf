/* 
 File: marketUpdate.sqf 
 Author: Dirk Pitt 
 Zero-One Altis Life 
*/ 
while {true} do { 
 { 
  _item = _x select 0; 
  _count = _x select 1; 
  _query = format ["updateMarket:%1:%2",_count,_item]; 
  [_query,1] spawn DB2_fnc_extdbcallHC; 
 } forEach market_changes; 
 market_changes = []; 
 uiSleep 10; 
 _queryResult = ["marketInit",2,true] call DB2_fnc_extdbcallHC; 
 if(_queryResult isEqualTo []) exitWith {diag_log format ["initMarket: _queryResult is empty= %1", _queryResult]}; 
 [] spawn { 
     private["_queryResult","_id","_desc"]; 
     _queryResult = ["marketEvent",2] call DB2_fnc_extdbcallHC; 
     if(_queryResult isEqualTo []) exitWith {}; 
     _id = _queryResult select 0; 
     _desc = _queryResult select 1; 
     if(market_event_id != _id) then { 
         market_event_id = _id; 
            zero_update_market = [0,_desc]; 
            publicVariableServer "zero_update_market"; 
            zero_update_market = nil; 
     }; 
 }; 
 NVrTmQ = []; 
 { 
  _item = _x select 0; 
  _price = round(_x select 1); 
  _diff = round(_x select 2); 
  _percentage = _x select 3; 
  NVrTmQ pushBack [_item,_price,_diff,_percentage]; 
 } forEach _queryResult; 
 NVrTmQ pushBack["goldbar",550000,0,0]; 
    zero_update_market = [1,NVrTmQ]; 
    publicVariableServer "zero_update_market"; 
    zero_update_market = nil; 
    uiSleep 1800; 
}; 
