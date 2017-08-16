//Delete Kaserne
private ["_kaserne","_ruins1"];
_kaserne = [3656.13,13199.2,10.2166] nearestObject 1117336;
_kaserne setDamage 1;
sleep 10;
_ruins1 = nearestObject [[3656.13,13199.2,10.2166],"Land_Barracks_ruins_F"];
deleteVehicle _ruins1;

//Spawn Krankenhäuser 

_hs = createVehicle ["Land_Hospital_main_F", [0,0,0], [], 0, "CAN_COLLIDE"];
_hs setDir (markerDir "hospital_3");
_hs setPosATL [(getMarkerPos "hospital_3") select 0, (getMarkerPos "hospital_3") select 1, 0.38];
_hs setVectorUp [0,0,1];
_var = createVehicle ["Land_Hospital_side1_F", [0,0,0], [], 0, "CAN_COLLIDE"];
_var attachTo [_hs, [4.69775,32.6045,-0.1125]];
detach _var;
_var = createVehicle ["Land_Hospital_side2_F", [0,0,0], [], 0, "CAN_COLLIDE"];
_var attachTo [_hs, [-28.0336,-10.0317,0.0889387]]; 
_hs allowDamage false;
detach _var;

_hs2 = createVehicle ["Land_Hospital_main_F", [0,0,0], [], 0, "CAN_COLLIDE"];
_hs2 setDir (markerDir "hospital_2");
_hs2 setPosATL [(getMarkerPos "hospital_2") select 0, (getMarkerPos "hospital_2") select 1, -0.1];
_hs2 setVectorUp [0,0,1];
_var2 = createVehicle ["Land_Hospital_side1_F", [0,0,0], [], 0, "CAN_COLLIDE"];
_var2 attachTo [_hs2, [4.69775,32.6045,-0.1125]];
detach _var2;
_var2 = createVehicle ["Land_Hospital_side2_F", [0,0,0], [], 0, "CAN_COLLIDE"];
_var2 attachTo [_hs2, [-28.0336,-10.0317,0.0889387]]; 
_hs2 allowDamage false;
detach _var2;

//Staatsbank
private["_dome","_rsb"];
_dome = bankdom;
_rsb = bankinnen;

for "_i" from 1 to 3 do {_dome setVariable[format["bis_disabled_Door_%1",_i],1,true]; _dome animate [format["Door_%1_rot",_i],0];};
_rsb setVariable["bis_disabled_Door_1",1,true];

fed_bank setVariable["safe",(count playableUnits),true];
[] spawn TON_fnc_federalUpdate;

//Gefängnis
private["_jail"];
_jail = gefaengnis;

for "_i" from 1 to 8 do {_jail setVariable[format["bis_disabled_Door_%1",_i],1,true];};

//Gefängnis
private["_tutorial"];
_tutorial = tut_haus;

for "_i" from 1 to 9 do {_tutorial setVariable[format["bis_disabled_Door_%1",_i],1,true];};