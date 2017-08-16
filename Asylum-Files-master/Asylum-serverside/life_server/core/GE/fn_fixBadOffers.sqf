 
 
 
 
 
_query = "SELECT ID,ClassName,isVirtual,isWeapon,isVehicle,Amount,pid,VehicleID,BuyorSell,Price FROM exchange WHERE timer>=120 AND active=1"; 
_result = [_query,2,true] call DB_fnc_asyncQuery; 
_query = "UPDATE exchange SET active=0 WHERE timer>=120"; 
[_query,1] call DB_fnc_asyncQuery; 
_query = "DELETE FROM exchange WHERE active=0"; 
[_query,1] call DB_fnc_asyncQuery; 
{ 
_offer = _x; 
_id = _offer select 0; 
_class = _offer select 1; 
_virt = _offer select 2; 
_weapon = _offer select 3; 
_vehicle = _offer select 4; 
_amount = _offer select 5; 
_uid = _offer select 6; 
_veh = _offer select 7; 
_buySell = _offer select 8; 
if(_buySell == 0) then { 
if(_vehicle == 1) exitWith { 
_query = format["UPDATE vehicles SET listed=0 WHERE id=%1",_veh]; 
[_query,1] call DB_fnc_asyncQuery; 
}; 
if(_weapon == 1) exitWith { 
_query = format["SELECT mailbox FROM players_global WHERE playerid='%1'",_uid]; 
_box = [_query,2] call DB_fnc_asyncQuery; 
_box = _box select 0; 
_class pushBack (floor(random 10000)); 
_class pushBack _amount; 
_box pushBack _class; 
_query = format["UPDATE players_global SET mailbox='%1' WHERE playerid='%2'",_box,_uid]; 
[_query,1] call DB_fnc_asyncQuery; 
}; 
if(_virt == 1) then { 
_query = format["SELECT mailbox FROM players_global WHERE playerid='%1'",_uid]; 
_box = [_query,2] call DB_fnc_asyncQuery; 
_box = _box select 0; 
_checkForExisting = false; 
{if(_class == (_x select 0)) exitWith{_checkForExisting = true; _box set[_forEachIndex,[_x select 0,(_x select 1) + _amount,(floor(random 10000))]]};} foreach _box; 
if(!_checkForExisting) then { 
_box pushBack [_class,_amount,(floor(random 10000))]; 
}; 
_query = format["UPDATE players_global SET mailbox='%1' WHERE playerid='%2'",_box,_uid]; 
[_query,1] call DB_fnc_asyncQuery; 
}; 
} else { 
_price = _offer select 9; 
_query = format["SELECT mailbox FROM players_global WHERE playerid='%1'",_uid]; 
_box = [_query,2] call DB_fnc_asyncQuery; 
_box = _box select 0; 
_box pushBack ["cash",_price,floor(random 10000)]; 
_query = format["UPDATE players_global SET mailbox='%1' WHERE playerid='%2'",_box,_uid]; 
[_query,1] call DB_fnc_asyncQuery; 
}; 
} forEach _result;