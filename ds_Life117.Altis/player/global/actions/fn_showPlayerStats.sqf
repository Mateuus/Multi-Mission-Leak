/*
	Author: Shawn "Huntah" Macgillivray
	
	Description:
	Opens the quick display panel that tells the player their current stats about their job etc
*/

private ["_timeplayed","_level"];

if(playerside == west)then
	{
	_timePlayed = (round(DS_infoArray select 0)/60);
	_level = DS_coplevel;
	hint format 
	[
	"Police officer stats\n\n
	Hours Played: %1\n
	Current Rank: %2\n
	Vehicles Impounded: %3\n
	Tickets Given: %4\n
	Arrest Made: %5\n
	Kills: %6"
	,_timePlayed
	,_level
	,(DS_infoArray select 3)
	,(DS_infoArray select 4)
	,(DS_infoArray select 5)
	,(DS_infoArray select 6)
	];
	};
if(playerside == independent)then
	{
	_timePlayed = (round(DS_infoArray select 2)/60);
	_level = DS_WLLevel;
	hint format 
	[
	"Whitelist Civilian Stats\n\n
	Hours Played: %1\n
	Current level: %2\n
	Vehicles Impounded: %3\n
	Revives: %4\n
	"
	,_timePlayed
	,_level
	,(DS_infoArray select 8)
	,(DS_infoArray select 7)
	];
	};	
if(playerside == civilian)then
	{
	_timePlayed = (round(DS_infoArray select 1)/60);
	_level = DS_perkLevel;
	hint format 
	[
	"Civilian Stats\n\n
	Hours Played: %1\n
	Crafting Level: %4\n
	Trucking Level: %5\n
	Pilot Mission Level: %6\n
	Perk Level: %2\n
	Donation level: %3\n\n\n\n"
	,_timePlayed
	,_level
	,DS_donorLevel
	,(DS_infoArray select 30)
	,(DS_infoArray select 28)
	,(DS_infoArray select 25)
	];
	};

if((player getVariable ["medic",false])&&((DS_infoArray select 10) == 24)&&((DS_infoArray select 7) > 19))then
	{
	[3] call DS_fnc_questCompleted;
	};
	
if((player getVariable ["medic",false])&&((DS_infoArray select 10) == 27)&&((DS_infoArray select 2) > 2999))then
	{
	[3] call DS_fnc_questCompleted;
	};