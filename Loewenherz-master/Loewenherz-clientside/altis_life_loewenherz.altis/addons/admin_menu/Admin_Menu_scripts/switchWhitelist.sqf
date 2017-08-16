/*
	File: switchWhitelist.sqf

	Description:
	activate or deactivates the Soft-Whitelist on the Server

	Author: Blackd0g

*/
closeDialog 0;
[[player],"lhm_fnc_whitelist",false,false] call lhm_fnc_mp;