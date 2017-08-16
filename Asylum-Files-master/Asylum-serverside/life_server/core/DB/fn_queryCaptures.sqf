 
 
 
 
 
 
 
 
private ["_query","_result","_ret","_rPos","_i","_pos","_conCount"]; 
 
 
 
_rPos = switch (worldName) do 
{ 
case "Altis": { [[[11208,8714,0],[8911,7477,0],[9229,8047,0],[12286,8895,0]],[[4853.02,21866.8,8.96136],[14246,13008,0],[22000,21068,0]],[[9622,15105,0],[23722, 16238, 0]],[[8133,22548,0],[11379,14186,0]]] }; 
case "Tanoa": { [[[4076,12562,0],[3141.6,11233,1],[2294,13208,0]],[[12433,14246,0]],[[2653,9313,0]],[[7195,12696,0],[7316,12822,0]]] }; 
case "Australia": { [[[33575,4600,0]],[[31900,15232,0]],[[35525,12957,0]],[[9624,23261,0],[23428,32778,0]]] }; 
case "Stratis": { [[[2629,596,0],[2717,958,0]],[[3287,2927,0],[3389,3002,0]],[],[]] }; 
}; 
life_capturePos = []; 
 
for "_i" from 1 to 4 do 
{ 
_container = objNull; 
if (count (_rPos select (_i - 1)) > 1) then 
{ 
_capIndex = floor random (count (_rPos select (_i - 1))); 
_pos = (_rPos select (_i - 1)) select _capIndex; 
(call compile (format["capture_%1",_i])) setPos _pos; 
(call compile (format["capture_flag_%1",_i])) setPosATL _pos; 
(call compile (format["capture_pole_%1",_i])) setPosATL _pos; 
(format["capture_label_%1",_i]) setMarkerPos _pos; 
(format["capture_area_%1",_i]) setMarkerPos _pos; 
life_capturePos set [_i - 1, [_pos,_capIndex]]; 
} 
else 
{ 
life_capturePos set [_i - 1, []]; 
}; 
 
if ((life_capture_list select (_i-1)) select 5 != "") then 
{ 
_container = (call compile (format["capture_container_%1",_i])); 
if (count (_rPos select (_i - 1)) > 1) then { _container setPosATL _pos; }; 
}; 
life_capture_containers set [_i-1, _container]; 
}; 
 
 
_query = "SELECT `id`,`gang`,`percent`,`container`,`level` FROM captures ORDER BY `id`"; 
_result = "Arma2Net.Unmanaged" callExtension format ["Arma2NETMySQLCommand ['asylumlife%2', '%1']", _query, life_server_instance]; 
_result = call compile format["%1", _result]; 
if(isNil {((_result select 0) select 0)}) then 
{ 
_ret = []; 
} 
else 
{ 
_ret = (_result select 0); 
}; 
 
{ 
_grown = false; 
_id = parseNumber(_x select 0); 
_conCount = parseNumber(_x select 3); 
_gang = (_x select 1); 
_lvl = parseNumber(_x select 4); 
_percent = parseNumber(_x select 2) / 100; 
if (_lvl < 2 && _percent == 1) then { _lvl = _lvl + 1; _grown = true; }; 
_row = life_capture_list select (_id - 1); 
_row set [1, _gang]; 
_row set [2, _percent]; 
_row set [6, _lvl]; 
life_capture_list set [(_id - 1), _row]; 
if (_grown) then { life_capture_changed set [(_id - 1), _row]; }; 
if (!isNull (life_capture_containers select _forEachIndex)) then 
{ 
(life_capture_containers select _forEachIndex) setVariable ["gangContainer", [_row select 5,_conCount], true]; 
} 
} foreach _ret; 
publicVariable "life_capture_list"; 
{ 
_lvl = (life_capture_list select _forEachIndex) select 6; 
if (_lvl > 0 && worldName == "Altis" && count _x > 0) then 
{ 
[_forEachIndex, _x select 1, _lvl, true] spawn ASY_fnc_spawnCaptures; 
}; 
} forEach life_capturePos; 
publicVariable "life_capturePos"; 
 
_query = "SELECT `turf`.`gang`, IFNULL(`gangs`.`name`,""Contested""), `turf`.`id` FROM `turf` LEFT JOIN `gangs` ON `gangs`.`id`=`turf`.`gang` GROUP BY `turf`.`id` ORDER BY `turf`.`id`"; 
_result = "Arma2Net.Unmanaged" callExtension format ["Arma2NETMySQLCommand ['asylumlife%2', '%1']", _query, life_server_instance]; 
_result = call compile format["%1", _result]; 
if(isNil {((_result select 0) select 0)}) then 
{ 
_ret = []; 
} 
else 
{ 
_ret = (_result select 0); 
}; 
 
{ 
_row = life_turf_list select _forEachIndex; 
_row set [1, (_x select 0)]; 
_row set [2, (_x select 1)]; 
life_turf_list set [_forEachIndex, _row]; 
} foreach _ret; 
publicVariable "life_turf_list";