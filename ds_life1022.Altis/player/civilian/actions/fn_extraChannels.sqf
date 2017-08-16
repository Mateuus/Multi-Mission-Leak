/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Turns on or off the extra channels
*/

private["_unit"];

if(isNil "DS_extraChannels")then{DS_extraChannels = true};

if(DS_spam > 1)exitwith {hint "You can not perform this task at this time, please try again soon"};
DS_spam = DS_spam + 1;
[] spawn {
	sleep 25;
	DS_spam = DS_spam - 1;
};

if(DS_extraChannels)then {
	[civilian,player,true] remoteExec ["HUNT_fnc_setupChat",2];
	hint "Help/Trade Channels Removed";
	DS_extraChannels = false;
} else {
	DS_extraChannels = true;
	[civilian,player,false,true] remoteExec ["HUNT_fnc_setupChat",2];
	hint "Help/Trade Channels Enabled";
};