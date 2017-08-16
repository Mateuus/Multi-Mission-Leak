 
 
 
 
 
 
 
 
private ["_id","_point","_players","_totals","_new","_gang","_updated","_percent","_value","_lastUpdate","_row"]; 
 
while {true} do 
{ 
_lastUpdate = time; 
sleep 60; 
_updated = false; 
{ 
if (!(worldName == "Stratis" && !(_x select 4))) then 
{ 
_id = _forEachIndex + 1; 
_point = call compile format["capture_%1", _id]; 
_players = list _point; 
if (time - (_x select 3) > 900) then 
{ 
_totals = []; 
_rowUpdated = false; 
{ 
_pointPos = getPosATL(_point);  
if (_x in playableUnits && ((getPosATL _x) distance _pointPos) < 50) then 
{ 
_gang = _x getVariable ["gang", "0"]; 
if (_gang != "0" && (!(surfaceIsWater (position _x)) || _id == 3) && !(primaryWeapon _x in ["","Binocular","SMG_02_F","hgun_PDW2000_F","arifle_sdar_F"]) && !(_x getVariable ["isBountyHunter", false])) then 
{ 
if (!(_gang in _totals)) then { _totals set [count _totals, _gang]; }; 
}; 
}; 
} foreach _players; 
 
 
if (count _totals == 1) then 
{ 
 
if ((_x select 2) == 0) then 
{ 
_value = _x; 
_value set [1, (_totals select 0)]; 
life_capture_list set [_forEachIndex, _value]; 
_updated = true; 
_rowUpdated = true; 
_x = _value; 
}; 
 
 
if ((_totals select 0) == (_x select 1)) then 
{ 
if ((_x select 2) < 1) then 
{ 
_new = (_x select 2) + 0.1; 
if (_new > 1) then { _new = 1; }; 
_value = _x; 
_value set [2, _new]; 
 
 
if (_new == 1) then 
{ 
_value set [3, time]; 
_value set [6, -1];  
if (worldName == "Altis") then { [_forEachIndex, (life_capturePos select _forEachIndex) select 1, 2, false] spawn ASY_fnc_spawnCaptures; }; 
_row = _x; 
{ 
if (_x getVariable ["gang","0"] == _row select 1) then 
{ 
[[2,5],"life_fnc_addStatistic",_x,false] spawn life_fnc_MP; 
}; 
} forEach _players; 
}; 
 
life_capture_list set [_forEachIndex, _value]; 
_updated = true; 
_rowUpdated = true; 
_x = _value; 
}; 
} 
 
else 
{ 
if ((_x select 2) > 0) then 
{ 
_new = (_x select 2) - 0.1; 
if (_new < 0) then { _new = 0; }; 
_value = _x; 
_value set [2, _new]; 
life_capture_list set [_forEachIndex, _value]; 
_updated = true; 
_rowUpdated = true; 
_x = _value; 
 
 
[[_id],"life_fnc_capNotice",civilian,false] spawn life_fnc_MP; 
}; 
}; 
 
if (_rowUpdated) then 
{ 
life_capture_changed set [_forEachIndex, _x]; 
}; 
}; 
} 
else 
{ 
_row = _x; 
{ 
[[2,format["This area was recently captured and cannot be again for another %1 + minutes.", floor ((900 - (time - (_row select 3))) / 60)]],"life_fnc_broadcast",_x,false] spawn life_fnc_MP; 
} forEach _players; 
}; 
 
_marker = format["capture_label_%1", _id]; 
_currentText = markerText _marker; 
_newText = _currentText; 
switch (true) do 
{ 
case ((_x select 2) == 1): 
{ 
_point = _x; 
_gangRow = []; 
{ if ((_x select 0) == (_point select 1)) then { _gangRow = _x; }; } foreach life_server_gangs; 
if (count _gangRow == 0) exitWith {}; 
_newText = format["%1 - %2", (_point select 0), _gangRow select 1];  
}; 
default { _newText = format["%1 - Contested", (_x select 0)]; }; 
}; 
if (_newText != _currentText) then { _marker setMarkerText _newText; }; 
}; 
} forEach life_capture_list; 
if (_updated) then { life_capture_old = life_capture_list; publicVariable "life_capture_list"; }; 
}; 
