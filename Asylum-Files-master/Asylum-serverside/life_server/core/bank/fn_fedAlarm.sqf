 
 
 
 
 
 
 
private["_unit","_ret","_dispatch"]; 
_unit = [_this,0,Objnull,[Objnull]] call BIS_fnc_param; 
if (isNull _unit) exitWith {}; 
if (life_bank_inProgress) exitWith {}; 
 
life_bank_robbers = []; 
life_bank_inProgress = true; 
publicVariable "life_bank_inProgress"; 
 
_dispatch = ceil (random 9000); 
[_dispatch, "Reserve Robbery", 10000, 2, 7, getMarkerPos "fed_reserve", ""] spawn life_fnc_createDispatch; 
 
[_dispatch] spawn 
{ 
private ["_dispatch"]; 
_dispatch = _this select 0; 
sleep 35; 
if (count life_bank_robbers < 2 || !life_bank_inProgress || life_activeSWAT) exitWith {}; 
if (life_swat_instance == 0) then 
{ 
life_swat_instance = _dispatch; 
switch (worldName) do 
{ 
case "Altis": { [count life_bank_robbers, [["Power Plant",[16144,16108,0]],["Air HQ",[15566,17584,0]],["Telos East",[16591,17153,0]],["Telos North",[16144,17455,0]],["Forest",[15800.9,16715.3,0]]], getMarkerPos "fed_reserve"] spawn life_fnc_swatDispatch; }; 
case "Australia": { [count life_bank_robbers, [["Pine Gap",[19453,23959,0]],["Oasis",[18482,24382,0]],["Bridge",[21699,24097,0]],["North Ridge",[19369,25625,0]]], getMarkerPos "fed_reserve"] spawn life_fnc_swatDispatch; }; 
}; 
}; 
}; 
 
[_dispatch] spawn { 
private ["_newRobbers","_activeRobbers","_dispatch","_success"]; 
_dispatch = _this select 0; 
_soundOn = createSoundSource ["Sound_Alarm", position fed_alarm, [], 0]; 
deleteMarker "robberyMarker"; 
createMarker ["robberyMarker", position fed_alarm]; 
"robberyMarker" setMarkerShape "ICON"; 
"robberyMarker" setMarkerType "mil_dot"; 
"robberyMarker" setMarkerColor "ColorRed"; 
"robberyMarker" setMarkerText "Robbery in Progress"; 
while {life_bank_inProgress} do 
{ 
sleep 30; 
_newRobbers = []; 
_activeRobbers = 0; 
{ 
if(alive _x && {side _x != west} && {_x distance getMarkerPos "fed_reserve" < 200} && {!(_x getVariable["restrained",false])} && {getPosATL _x select 2 < 20}) then { 
_activeRobbers = _activeRobbers + 1; 
if(!(_x in life_bank_robbers)) then {_newRobbers pushBack _x; life_bank_robbers pushBack _x}; 
}; 
} forEach allPlayers; 
 
if (_activeRobbers == 0) then 
{ 
_success = true; 
{ 
if (!(_x getVariable ["restrained",false])) exitWith { _success = false; }; 
} forEach life_bank_robbers; 
[[_dispatch, _success],"life_fnc_finishDispatch",west,false] spawn life_fnc_MP; 
life_bank_inProgress = false; 
life_bank_robbers = []; 
publicVariable "life_bank_inProgress"; 
publicVariable "life_bank_robbers"; 
deleteVehicle _soundOn;  
 
if (life_swat_instance == _dispatch) then 
{ 
_dispatch spawn 
{ 
sleep 300;  
if (life_swat_deployed && life_swat_instance == _this) then 
{ 
[] call life_fnc_swatDeactivate; 
}; 
}; 
}; 
[[[0,1,2],"The federal reserve security is no longer tracking unauthorized persons. Continue with standard duties."],"life_fnc_broadcast",west,false] spawn life_fnc_MP; 
{ 
if ((_x animationPhase "Door_1_rot") > 0) then 
{ 
_x animate ["Door_1_rot", 0]; 
}; 
_x setVariable ["gate_max", 0, true]; 
} forEach life_bank_gates; 
{ 
_x setVariable["life_locked", 1, true]; 
_numDoors = getNumber(configFile >> "CfgVehicles" >> (typeOf _x) >> "numberOfDoors"); 
for "_i" from 1 to _numDoors do 
{ 
_x setVariable[format["bis_disabled_Door_%1", _i], 1, true]; 
}; 
if (typeOf _x == "Land_Dome_Big_F") then 
{ 
if ((_x animationPhase "Door_1A_move") > 0) then { _x animate ["Door_1A_move", 0]; }; 
if ((_x animationPhase "Door_1B_move") > 0) then { _x animate ["Door_1B_move", 0]; }; 
if ((_x animationPhase "Door_2_rot") > 0) then { _x animate ["Door_2_rot", 0]; }; 
if ((_x animationPhase "Door_3_rot") > 0) then { _x animate ["Door_3_rot", 0]; }; 
} 
else 
{ 
if ((_x animationPhase "Door_1_rot") > 0) then { _x animate ["Door_1_rot", 0]; }; 
if ((_x animationPhase "Door_2_rot") > 0) then { _x animate ["Door_2_rot", 0]; }; 
}; 
} forEach life_bank_vaults; 
{ 
_x setVariable["life_locked", 1, true]; 
_numDoors = getNumber(configFile >> "CfgVehicles" >> (typeOf _x) >> "numberOfDoors"); 
for "_i" from 1 to _numDoors do 
{ 
_x setVariable[format["bis_disabled_Door_%1", _i], 1, true]; 
}; 
if ((_x animationPhase "Door_1_rot") > 0) then { _x animate ["Door_1_rot", 0]; }; 
if (typeOf _x != "Land_Research_house_V1_F") then 
{ 
if ((_x animationPhase "Door_2_rot") > 0) then { _x animate ["Door_2_rot", 0]; }; 
} 
} forEach life_bank_safes; 
life_bank_lastRobbed = time; 
publicVariable "life_bank_lastRobbed"; 
"robberyMarker" setMarkerText "Elevated Security"; 
[] spawn 
{ 
sleep 450; 
deleteMarker "robberyMarker"; 
}; 
} 
else 
{ 
if (count _newRobbers > 0) then 
{ 
publicVariable "life_bank_robbers"; 
{ 
[_x,["Bank Robbery",10000],600] call life_fnc_wantedAdd; 
} forEach _newRobbers; 
}; 
}; 
}; 
}; 
 
[[[0,1,2],"The alarm at the FEDERAL RESERVE has been activated! Police officers, respond immediately."],"life_fnc_broadcast",west,false] spawn life_fnc_MP;