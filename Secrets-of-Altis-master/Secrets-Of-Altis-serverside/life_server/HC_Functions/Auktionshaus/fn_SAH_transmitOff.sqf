private["_pid","_item","_money","_nameCaller","_nameSeller"]; 
 
_pid = [_this,0,-1] call BIS_fnc_param; 
_item = [_this,1,""] call BIS_fnc_param; 
_money = [_this,2,-1] call BIS_fnc_param; 
_nameSeller = [_this,3,""] call BIS_fnc_param; 
_nameCaller = [_this,4,""] call BIS_fnc_param; 
 
if(_pid isEqualTo -1 || _money isEqualTo -1) exitWith {}; 
 
_query = format ["UPDATE players SET bankacc = bankacc + %1 WHERE playerid = %2",_money,_pid]; 
[_query,1] call DB_fnc_asyncCall; 
 
_query = format["INSERT INTO messages (fromID, toID, message, fromName, toName) VALUES ('%1', '%1', '""%2 hat deine Auktion der Ware [%3] im Wert von %5€ ersteigert!""', 'Auktionshaus', '%4')",_pid,_nameCaller,_item,_nameSeller,[_money] call SOA_fnc_numberText]; 
 
[_query,1] call DB_fnc_asyncCall;