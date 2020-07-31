/*
cg hud setup
*/

disableSerialization;
if(phone_s_2) exitwith {};


2 cutRsc ["playerHUD","PLAIN"];

[] call life_fnc_hudUpdate;

update_running = false;
sleep 0.75;
update_running = true;

while{update_running} do {
	[] spawn hud_fnc_loop;
	sleep 1;
};

