#include "..\..\script_macros.hpp"
/*
 File: fn_crusher
 
 My first ever custom script
 Author: JedINyte for Altisnetwork.co.uk
 
 Description: Activates the crushing machine
*/

//Activates the gates for effect and then uses a bomb to blow it up in style ;)

if(life_crush) exitWith {closeDialog 0; hint "You have to wait 10 minutes to crush another vehicle!";};//
life_crush = true;
[0, format["%1 is crushing a vehicle .", name player]] remoteExec["life_fnc_broadcast", 0];

hintsilent "Crusher starting.....";
sleep 3;
hintsilent "Is the area clear? Too late now!";
sleep 6;
hintsilent "EXPLOSIVES PLACED";
sleep 4;
hintSilent "CRUSHING STARTED!";
Tower1,"crush" remoteExec ["life_fnc_say3D",RANY];
Tower2,"crush" remoteExec ["life_fnc_say3D",RANY];
Tower3,"crush" remoteExec ["life_fnc_say3D",RANY];
Tower4,"crush" remoteExec ["life_fnc_say3D",RANY];
Tower5,"crush" remoteExec ["life_fnc_say3D",RANY];
Tower6,"crush" remoteExec ["life_fnc_say3D",RANY];
Tower7,"crush" remoteExec ["life_fnc_say3D",RANY];
Tower8,"crush" remoteExec ["life_fnc_say3D",RANY];
Tower9,"crush" remoteExec ["life_fnc_say3D",RANY];
_act = Bar1 animate ["Door_1_Rot", 0], Bar2 animate ["Door_1_Rot", 0], Bar3 animate ["Door_1_Rot", 0], Bar1_1 animate ["Door_1_Rot", 0], Bar2_1 animate ["Door_1_Rot", 0], Bar3_1 animate ["Door_1_Rot", 0];
sleep 2;
_act = Bar1 animate ["Door_1_Rot", 1], Bar2 animate ["Door_1_Rot", 0], Bar3 animate ["Door_1_Rot", 1], Bar1_1 animate ["Door_1_Rot", 0], Bar2_1 animate ["Door_1_Rot", 1], Bar3_1 animate ["Door_1_Rot", 0];
sleep 2;
_act = Bar1 animate ["Door_1_Rot", 0], Bar2 animate ["Door_1_Rot", 1], Bar3 animate ["Door_1_Rot", 0], Bar1_1 animate ["Door_1_Rot", 1], Bar2_1 animate ["Door_1_Rot", 0], Bar3_1 animate ["Door_1_Rot", 1];
sleep 2;
_act = Bar1 animate ["Door_1_Rot", 1], Bar2 animate ["Door_1_Rot", 0], Bar3 animate ["Door_1_Rot", 1], Bar1_1 animate ["Door_1_Rot", 0], Bar2_1 animate ["Door_1_Rot", 1], Bar3_1 animate ["Door_1_Rot", 0];
"Bo_Mk82"  createVehicle [(getmarkerPos "bomb" select 0),( getmarkerPos "bomb" select 1), 3];
_boom = "Bo_Mk82" createVehicle [0,0,9999];
_boom setPos (getPos ied);
_boom setVelocity [100,0,0];
titleText["Vehicle has been destroyed!", "PLAIN"];
[0, format["%1 has crushed a vehicle .", name player]] remoteExec["life_fnc_broadcast", 0];
_act = Bar1 animate ["Door_1_Rot", 1], Bar2 animate ["Door_1_Rot", 0], Bar3 animate ["Door_1_Rot", 1], Bar1_1 animate ["Door_1_Rot", 0], Bar2_1 animate ["Door_1_Rot", 1], Bar3_1 animate ["Door_1_Rot", 0];
sleep 1;
_act = Bar1 animate ["Door_1_Rot", 0], Bar2 animate ["Door_1_Rot", 0], Bar3 animate ["Door_1_Rot", 0], Bar1_1 animate ["Door_1_Rot", 0], Bar2_1 animate ["Door_1_Rot", 0], Bar3_1 animate ["Door_1_Rot", 0];
_act = Gate12 animate ["Door_1_Move", 0];
sleep 10;
hintSilent "CRUSHING COMPLETE";
sleep 10;
hintsilent "GOOD JOB!";
sleep 600;
life_crush = false;



