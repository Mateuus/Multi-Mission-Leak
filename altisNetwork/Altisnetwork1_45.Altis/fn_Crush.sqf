/*
 File: fn_crusher
 
 Author: JedINyte for Altisnetwork.co.uk
 
 Description: Activates the crushing machine
*/

//Activates the gates for effect and then uses a bomb to blow it up ;)

if(life_crush) exitWith {closeDialog 0; hint "You have to wait 10 minutes to destroy another vehicle!";};//
life_crush = true;
[0, format["%1 is about to destroy an illegal vehicle!", name player]] remoteExec["life_fnc_broadcast", 0];
hintsilent "Explodatron starting.....";
sleep 20;
hintsilent "Is the area clear?";
sleep 10;
hintsilent "EXPLOSIVES PLACED";
[0, format["%1 has placed the explosives!", name player]] remoteExec["life_fnc_broadcast", 0];
[speaker1,"crush"] remoteExec ["life_fnc_say3D",RANY];
[speaker2,"crush"] remoteExec ["life_fnc_say3D",RANY];
[speaker3,"crush"] remoteExec ["life_fnc_say3D",RANY];
[speaker4,"crush"] remoteExec ["life_fnc_say3D",RANY];
[speaker5,"crush"] remoteExec ["life_fnc_say3D",RANY];
[speaker6,"crush"] remoteExec ["life_fnc_say3D",RANY];
[speaker7,"crush"] remoteExec ["life_fnc_say3D",RANY];
[speaker8,"crush"] remoteExec ["life_fnc_say3D",RANY];
[speaker9,"crush"] remoteExec ["life_fnc_say3D",RANY];
sleep 10;
hintSilent "PROCESS STARTED!";
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
titleText["Vehicle has been blown up!", "PLAIN"];
[0, format["%1 has destroyed an illegal vehicle .", name player]] remoteExec["life_fnc_broadcast", 0];
hintSilent "PROCESS FINISHED!";
_act = Bar1 animate ["Door_1_Rot", 1], Bar2 animate ["Door_1_Rot", 0], Bar3 animate ["Door_1_Rot", 1], Bar1_1 animate ["Door_1_Rot", 0], Bar2_1 animate ["Door_1_Rot", 1], Bar3_1 animate ["Door_1_Rot", 0];
sleep 1;
_act = Bar1 animate ["Door_1_Rot", 0], Bar2 animate ["Door_1_Rot", 0], Bar3 animate ["Door_1_Rot", 0], Bar1_1 animate ["Door_1_Rot", 0], Bar2_1 animate ["Door_1_Rot", 0], Bar3_1 animate ["Door_1_Rot", 0];
_act = Gate12 animate ["Door_1_Move", 0];
sleep 10;
hintSilent "Explodatron has finished destroying the illegal vehicle";
sleep 10;
hintsilent "Now, back to work!";
sleep 600;
life_crush = false;



