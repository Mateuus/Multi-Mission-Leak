/*
	File: fn_feedPlayer.sqf
	Author: Michael Francis
 
	Description:
	Feeds selected player
*/
hint localize "STR_NOTF_Feed";
life_hunger = 150;
life_thirst = 150;
[] call life_fnc_hudUpdate;