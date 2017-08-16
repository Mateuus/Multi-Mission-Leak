 
 
 
 
 
 
 
 
while {true} do 
{ 
if (count life_laser_queue < 2) then 
{ 
if (count life_laser_queue == 1) then 
{ 
[[[0,1,2],"The laser tag queue has elapsed but only you joined this session.  Join again now to make it into the next session."],"life_fnc_broadcast",life_laser_queue select 0,false] spawn life_fnc_MP; 
}; 
life_laser_queue = []; 
sleep 120; 
} 
else  
{ 
 
life_laser_players = []; 
_team = 1; 
_playerCount = 0; 
_totalPlayers = count life_laser_queue; 
if (_totalPlayers > 10) then { _totalPlayers = 10; }; 
{ 
if (!isNull _x && alive _x && vehicle _x == _x && ((_x distance (_x getVariable ["life_laser_pos", [0,0,0]])) < 15)) then 
{ 
_playerCount = _playerCount + 1; 
if (_playerCount < 11) then 
{ 
if ((_forEachIndex + 1) <= ceil (_totalPlayers / 2)) then { _team = 1; } else { _team = 2; }; 
life_laser_players pushBack [_x, _team, true]; 
} 
else 
{ 
[[[0,1,2],"Sorry, you signed up for laser tag too late and didn't make this game (it filled). Sign up for the next one now!"],"life_fnc_broadcast",_x,false] spawn life_fnc_MP; 
}; 
} 
else 
{ 
if (!isNull _x) then 
{ 
[[[0,1,2],"You were unable to attend this laser tag session.  You likely moved too far from the laser tag NPC."],"life_fnc_broadcast",_x,false] spawn life_fnc_MP; 
}; 
}; 
} forEach life_laser_queue; 
life_laser_queue = []; 
_endTime = time + 180; 
 
_blueStarts = switch (worldName) do 
{ 
case "Altis": { [[22923.8,16985.3,0],[22923.5,16986.9,0],[22924.8,16988.3,0],[22925.8,16986.3,0],[22925.9,16984.7,0]] }; 
case "Tanoa": { [[11028.1,8472.45,0],[11028.2,8473.8,0],[11028.5,8474.98,0],[11026.5,8472.27,0],[11026.5,8473.81,0]] }; 
case "Stratis": { [[1782.12,5911.99,0],[1782.05,5913.35,0],[1782.17,5915.02,0],[1783.63,5914.95,0],[1783.56,5912.79,0]] }; 
}; 
_redStarts = switch (worldName) do 
{ 
case "Altis": { [[22917.8,17028.8,0],[22917.9,17027.3,0],[22916.5,17025.7,0],[22916.3,17027.2,0],[22916.2,17028.7,0]] }; 
case "Tanoa": { [[11105.2,8475.01,0],[11105,8473.94,0],[11104.9,8472.86,0],[11106.5,8474.94,0],[11106.3,8473.86,0]]}; 
case "Stratis": { [[1776.38,5955.53,0],[1776.44,5954.35,0],[1776.51,5952.82,0],[1774.85,5952.86,0],[1774.87,5954.55,0]] }; 
}; 
_blueIndex = 0; 
_redIndex = 0; 
 
if (isNull life_laser_group1) then { life_laser_group1 = (createGroup civilian); }; 
if (isNull life_laser_group2) then { life_laser_group2 = (createGroup civilian); }; 
if (count (units life_laser_group1) > 0) then { (units life_laser_group1) joinSilent grpNull; }; 
if (count (units life_laser_group2) > 0) then { (units life_laser_group2) joinSilent grpNull; }; 
 
{ 
if ((_x select 1) == 1) then 
{ 
(_x select 0) setDir 90; 
(_x select 0) setPos (_blueStarts select _blueIndex); 
_blueIndex = _blueIndex + 1; 
if (_blueIndex > 4) then { _blueIndex = 4; }; 
[_x select 0] joinSilent life_laser_group1; 
} 
else 
{ 
(_x select 0) setDir 270; 
(_x select 0) setPos (_redStarts select _redIndex); 
_redIndex = _redIndex + 1; 
if (_redIndex > 4) then { _redIndex = 4; }; 
[_x select 0] joinSilent life_laser_group2; 
}; 
[[_x select 1,_endTime],"life_fnc_initLaser",_x select 0,false] spawn life_fnc_MP; 
} forEach life_laser_players; 
 
 
life_laser_inprogress = true; 
{ ((_x select 0) getVariable ["ownerID", -1]) publicVariableClient "life_laser_inprogress"; } forEach life_laser_players; 
sleep 20; 
life_laser_begin = true; 
{ ((_x select 0) getVariable ["ownerID", -1]) publicVariableClient "life_laser_begin"; } forEach life_laser_players; 
 
 
waitUntil { sleep 1; (time >= _endTime || !life_laser_inprogress) }; 
 
 
sleep 3; 
_living = []; 
{ if (!((_x select 0) getVariable["laserTagged", false]) && (_x select 2)) then { _living pushBack _x; }; } forEach life_laser_players; 
if (time >= _endTime) then 
{ 
life_laser_inprogress = false; 
{ ((_x select 0) getVariable ["ownerID", -1]) publicVariableClient "life_laser_inprogress"; } forEach _living; 
}; 
_blueAlive = 0; 
_redAlive = 0; 
{ if ((_x select 1) == 1) then { _blueAlive = _blueAlive + 1; } else { _redAlive = _redAlive + 1; }; } forEach _living; 
_roundResult = switch (true) do 
{ 
case (_blueAlive > _redAlive): { "the BLUE team won!" }; 
case (_blueAlive < _redAlive): { "the RED team won!" }; 
default { "the round was a draw." }; 
}; 
 
{ [[[0,1,2],format["Laser tag round complete, %1", _roundResult]],"life_fnc_broadcast",_x select 0,false] spawn life_fnc_MP; } forEach life_laser_players; 
 
 
sleep 40; 
}; 
};