/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Opens the quick display panel that tells the player their current stats about their job etc
*/

private ["_","_level","_donorEnd"];

_donorEnd = "";

if(DS_donorLevel > 0)then
	{
	_donorEnd = format ["Donation Expiry Date: \n%1",DS_donorExpire];
	};

if(playerSide isEqualTo west)then
	{
	_ = (round(DS_infoArray select 0)/60);
	_level = DS_copLevel;
	hint format
	[
	"Police Officer Stats\n\n
	Hours Played: %1\n
	Current Rank: %2\n
	Vehicles Impounded: %3\n
	Tickets Given: %4\n
	Arrest Made: %5\n
	Kills: %6\n\n
	%7"
	,_
	,_level
	,(DS_infoArray select 3)
	,(DS_infoArray select 4)
	,(DS_infoArray select 5)
	,(DS_infoArray select 6)
	,_donorEnd
	];
	};
if(playerSide isEqualTo independent)then
	{
	_ = (round(DS_infoArray select 2)/60);
	_level = DS_WLLevel;
	hint format
	[
	"Whitelist Civilian Stats\n\n
	Hours Played: %1\n
	Current Level: %2\n
	Vehicles Impounded: %3\n
	Revives: %4\n\n
	%5
	"
	,_
	,_level
	,(DS_infoArray select 8)
	,(DS_infoArray select 7)
	,_donorEnd
	];
	if(((DS_infoArray select 10) == 27)&&((DS_infoArray select 2) > 2999))then { [3] call DS_fnc_questCompleted };
	};
if(playerSide isEqualTo civilian)then
	{
	_ = (round(DS_infoArray select 1)/60);
	_level = DS_perkLevel;
	hint format
	[
	"Civilian Stats\n\n
	Hours Played: %1\n
	Crafting Level: %4\n
	Trucking Level: %5\n
	Chopper Pilot Mission Level: %6\n
	Air Taxi Level: %7\n
	Water Taxi Level: %8\n
	Land Taxi Level: %10\n
	Perk Level: %2\n
	Donation Level: %3\n\n%9"
	,_
	,_level
	,DS_donorLevel
	,(DS_infoArray select 30)
	,(DS_infoArray select 28)
	,(DS_infoArray select 25)
	,(DS_realEstateArray select 15)
	,(DS_realEstateArray select 21)
	,_donorEnd
	,(DS_realEstateArray select 23)
	];
	};
