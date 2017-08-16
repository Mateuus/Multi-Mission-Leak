/*
	File: fn_battlEyeReceive.sqf
	Author: John "Paratus" VanderZwet
	
	Description:
	Client receiving GUID and IP address from server BattlEye
*/

life_battleye_guid = [_this,0,"",[""]] call BIS_fnc_param;
life_battleye_ip = [_this,1,"",[""]] call BIS_fnc_param;