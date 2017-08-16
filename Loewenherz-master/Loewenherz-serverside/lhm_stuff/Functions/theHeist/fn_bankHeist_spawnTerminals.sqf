/* 
Filename: fn_spawn_terminals.sqf 
 
Author: Barney 
 
Description: BLUB BLUB BLUB BLAH BLAH 
*/ 
 
// Position(atl) - Dir 
private ["_rnd","_wahl","_temp","_veh","_terminals"]; 
_rnd = [ 
 [[15266.8,16235.3,0],356], 
 [[20901.4,19228.5,0],241.033], 
 [[25319,21813.7,0],92.9966], 
 [[19079.4,16626.4,0],30.815], 
 [[11908,16816.4,0],285.007], 
 [[9133.97,15840.1,0],160] 
]; 
if(isnil "BankHeist_Team") exitWith {}; 
 
if(count(BankHeist_Team) == 0) exitWith {}; 
 
_wahl = []; 
_terminals = []; 
{ 
 _temp = _rnd select(floor(random(count(_rnd)))); 
 _wahl pushBack _temp; 
 _rnd = _rnd - [_temp]; 
} foreach [1,2,3]; 
 
 
{ 
 _veh = "Land_DataTerminal_01_F" createVehicle [0,0,0]; 
 _veh setposatl (_x select 0); 
 _veh setdir (_x select 1); 
 _terminals pushBack _veh; 
 
} foreach _wahl; 
 
[["Bank_Way_1_1","ColorRed","hd_destroy",((_wahl select 0) select 0),"Terminal 1"],"lhm_fnc_marker",BankHeist_Team,false] call lhm_fnc_mp; 
[["Bank_Way_1_2","ColorRed","hd_destroy",((_wahl select 1) select 0),"Terminal 2"],"lhm_fnc_marker",BankHeist_Team,false] call lhm_fnc_mp; 
[["Bank_Way_1_3","ColorRed","hd_destroy",((_wahl select 2) select 0),"Terminal 3"],"lhm_fnc_marker",BankHeist_Team,false] call lhm_fnc_mp; 
[[_terminals],"lhm_fnc_way_one_addaction",BankHeist_Team,false] call lhm_fnc_mp; 
 
 
 
 
 
