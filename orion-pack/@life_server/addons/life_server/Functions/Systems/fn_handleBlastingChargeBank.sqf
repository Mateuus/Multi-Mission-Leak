/*
    Author: GetSomePanda / Panda
    SteamID: 76561198145366418
    File Name: fn_handleBlastingCharge.sqf
    Information: Nothing really special, just handles the fed explosion over the server so if the client who place the charge logs out it still blows up.
*/
private ["_bomb","_time"];
_time = time + (1 * 20);
waitUntil{(round(_time - time) < 1)};
sleep 0.9;
if (!(fed_bank_1 getVariable["chargeplaced",false])) exitWith {};

_bomb = "Bo_GBU12_LGB_MI10" createVehicle [getPosATL fed_bank_1 select 0, getPosATL fed_bank_1 select 1, (getPosATL fed_bank_1 select 2)+0.5];
fed_bank_1 setVariable ["chargeplaced",false,true];
fed_bank_1 setVariable ["safe_open",true,true];
