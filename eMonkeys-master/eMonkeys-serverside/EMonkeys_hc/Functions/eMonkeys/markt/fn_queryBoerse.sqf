 
 private["_query","_queryResult","_queryResult2","_query2"]; 
 
 _query =  format["SELECT preis, item, differenz, prozent, eventprozent FROM economy"]; 
 
 _queryResult = [_query,2,true] call DB_fnc_asyncCall; 
  
 _query2 =  format["SELECT beschreibung FROM economy_events WHERE id='1' AND active='0'"]; 
 
 _queryResult2 = [_query2,2] call DB_fnc_asyncCall;  
 
  
 EMonkeys_Market_price = _queryResult; 
 eM_market_event = _queryResult2; 
 publicVariable "EMonkeys_Market_price"; 
 publicVariable "eM_market_event"; 
 
 
 
 