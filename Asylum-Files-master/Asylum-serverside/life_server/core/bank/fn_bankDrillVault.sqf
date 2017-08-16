 
 
 
 
 
 
 
 
_unit = [_this,0,Objnull,[Objnull]] call BIS_fnc_param; 
if (isNull _unit) exitWith {}; 
if (life_bank_drilling) exitWith {}; 
 
life_bank_drilling = true; 
publicVariable "life_bank_drilling"; 
 
_dispatch = ceil (random 9000); 
[_dispatch, "Bank Robbery", 5000, 5, 4, position life_bank_building, ""] spawn life_fnc_createDispatch; 
 
_robbers = []; 
{ 
if (_x distance life_bank_building < 300 && side _x != west) then { _robbers pushBack _x }; 
} forEach allPlayers; 
 
[_dispatch, _robbers] spawn 
{ 
private ["_dispatch", "_robbers"]; 
_dispatch = _this select 0; 
_robbers = _this select 1; 
{ 
[_x,["Bank Robbery",10000],600] call life_fnc_wantedAdd; 
} forEach _robbers; 
sleep 35; 
if (count _robbers < 2 || !life_bank_drilling || life_activeSWAT) exitWith {}; 
if (life_swat_instance == 0) then 
{ 
life_swat_instance = _dispatch; 
_swatPos = switch (worldName) do 
{ 
case "Altis": { [["Office Building",[14942,11150,0]],["Small Lighthouse",[14722,11207,0]],["East Bay",[15278.7,10843,0]],["East Faronaki",[15209.9,10968.7,0]],["North Rocks",[15150.8,11538.0,0]],["Halo Jump",[14771.2,11015.4,1500]]] }; 
case "Tanoa": { [["Regina Gas",[5031,3927,0]],["Bay Rocks",[4424,3876,0]],["South Peninsula",[4432,3115,0]],["East Bay",[4863,3568,0]],["Regina East",[5087,3529,0]],["Halo Jump",[3985,3321,1500]]] }; 
default { [["Runway Hanger",[1740,5226,0]],["Nisi Bay",[1915,4192,0]],["Air Base",[2160,5588,0]]] }; 
}; 
[count _robbers, _swatPos, getPos life_bank_building] spawn life_fnc_swatDispatch; 
}; 
}; 
 
[_unit] spawn { 
while {life_bank_drilling} do 
{ 
playSound3D [MISSION_ROOT + "sounds\bankalarm.ogg", life_bank_building, false, getPos life_bank_building, 10, 1, 50];  
sleep 1.2; 
}; 
}; 
 
[_dispatch, _unit] spawn { 
private ["_dispatch", "_unit"]; 
_dispatch = _this select 0; 
_unit = _this select 1; 
deleteMarker "bankMarker"; 
createMarker ["bankMarker", position life_bank_building]; 
"bankMarker" setMarkerShape "ICON"; 
"bankMarker" setMarkerType "mil_dot"; 
"bankMarker" setMarkerColor "ColorRed"; 
"bankMarker" setMarkerText "Robbery in Progress"; 
 
life_bank_building setVariable ["bis_disabled_Door_4", 1, true]; 
life_bank_building animate ["door_4_rot", 0]; 
 
_drillPos = [14789,10753.78,1.77]; 
_drill = "Land_DrillAku_F" createVehicle _drillPos; 
_drill enableSimulationGlobal false; 
_drill setPos _drillPos; 
_drill setDir 255; 
_drill setVariable ["owner", _unit, true]; 
 
[[_unit, "drilling", 30],"life_fnc_playSound",true,false] spawn life_fnc_MP; 
 
_success = false; 
_elapsed = 0; 
while {life_bank_drilling} do 
{ 
sleep 1; 
_elapsed = _elapsed + 1; 
if (!alive _unit || _unit getVariable ["restrained",false] || _unit distance (getPos life_bank_building) > 60) exitWith {_success = false}; 
if (_elapsed >= 600) exitWith {_success = true}; 
}; 
 
 
_policeSuccess = !_success; 
[[_dispatch, _policeSuccess],"life_fnc_finishDispatch",west,false] spawn life_fnc_MP; 
 
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
[[[0,1,2],"The Bank of Altis is no longer being robbed."],"life_fnc_broadcast",west,false] spawn life_fnc_MP; 
 
deleteVehicle _drill; 
"bankMarker" setMarkerText "Elevated Security"; 
[] spawn 
{ 
sleep 1100; 
deleteMarker "bankMarker"; 
}; 
 
if (_success) then 
{ 
 
_cashPos = if (worldName == "Altis") then { [14786.588867,10756.529297,1.22185] } else { [4172.369,8391.861,1.424] }; 
_cash = "Land_Money_F" createVehicle _cashPos; 
_cash enableSimulationGlobal false; 
_cash setPosATL _cashPos; 
_cash setVectorUp [0,0,1]; 
_cash setVariable ["item",["dirty_money",floor (life_bank_funds * 0.5)],true]; 
_cash setVariable ["owner", _unit, true]; 
 
 
_barPrice = 50000; 
{ 
if (_x select 0 == "goldbar") then { _barPrice = _x select 1; }; 
} forEach buy_array; 
_barPrice = _barPrice * 0.50; 
_totalBars = round ((life_bank_funds * 0.5) / _barPrice); 
 
 
_goldPos = switch (worldName) do 
{ 
case "Altis": { [[14786.625977,10755.871094,1.20139],[14786.585938,10756,1.20139],[14786.545898,10756.128906,1.20139],[14786.505859,10756.257813,1.20139],[14785.614258,10755.719727,1.26389],[14785.617188,10755.854492,1.26389],[14785.620117,10755.989258,1.26389],[14785.623047,10756.124023,1.26389],[14785.625977,10756.258789,1.26389],[14785.628906,10756.393555,1.26389]] }; 
case "Tanoa": { [[4171.703,8393.295,1.55],[4172.047,8393.428,1.55],[4172.368,8393.493,1.55],[4174.243,8392.506,1.55],[4173.892,8392.412,1.55],[4173.563,8392.349,1.55],[4174.552,8391.642,1.55],[4174.238,8391.578,1.55],[4173.9,8391.505,1.55],[4169.578,8392.166,1.438]] }; 
case "Australia": { [[2097.0708008,5634.387207,1.02651],[2097.202637,5634.359375,1.02651],[2097.334473,5634.331543,1.02651],[2097.466309,5634.303711,1.02651],[2097.598145,5634.275879,1.02651],[2097.276611,5635.290039,1.02651],[2097.408447,5635.262207,1.02651],[2097.540283,5635.234375,1.02651],[2097.672119,5635.206543,1.02651],[2097.803955,5635.178711,1.02652]] }; 
}; 
_barDir = if (worldName == "Altis") then { -16.326 } else { 76.948 }; 
if (_totalBars > 0) then 
{ 
for "_i" from 0 to (_totalBars-1) do 
{ 
_barPos = _goldPos select _i; 
_bar = "Land_Suitcase_F" createVehicle _barPos; 
_bar setDir _barDir; 
_bar enableSimulationGlobal false; 
_bar setPosATL _barPos; 
_bar setVectorUp [0,0,1]; 
_bar setVariable["item",["goldbar",1],true]; 
_bar setVariable["owner", objNull, true]; 
}; 
} 
 
else 
{ 
_cash setVariable ["item",["dirty_money", life_bank_funds],true]; 
}; 
 
life_bank_building setVariable ["bis_disabled_Door_4", 0, true]; 
life_bank_building animate ["door_4_rot", 1]; 
[[[0,1,2],"The vault door has finished drilling and is now open FOR THREE MINUTES."],"life_fnc_broadcast",_unit,false] spawn life_fnc_MP; 
[_cash] spawn { 
_cash = _this select 0; 
sleep (3*60); 
life_bank_building setVariable ["bis_disabled_Door_4", 1, true]; 
life_bank_building animate ["door_4_rot", 0]; 
if (!isNull _cash) then { deleteVehicle _cash }; 
}; 
} 
else 
{ 
life_bank_building setVariable ["bis_disabled_Door_4", 1, true]; 
life_bank_building animate ["door_4_rot", 0]; 
}; 
 
life_bank_drilling = false; 
life_bank_last = serverTime; 
life_bank_funds = 10000; 
publicVariable "life_bank_drilling"; 
publicVariable "life_bank_funds"; 
publicVariable "life_bank_last"; 
}; 
 
[[[0,1,2],"The alarm at the BANK OF ALTIS has been activated!"],"life_fnc_broadcast",west,false] spawn life_fnc_MP;