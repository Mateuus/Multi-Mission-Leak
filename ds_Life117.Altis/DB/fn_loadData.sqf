
/*
	Author: Shawn "Huntah" Macgillivray
	
	Description:
	Sets client up with all his stuff
*/

private ["_bounty"];
DS_dbFailSafe = DS_dbFailSafe + 1;
if(DS_player_setup) exitWith {};
if(DS_dbFailSafe > 3) exitWith {cutText["Error with your profile, talk to the admins","BLACK FADED"]; 0 cutFadeOut 999999999;};

0 cutText ["Your profile has been loaded, setting up your player now....","BLACK FADED"];
0 cutFadeOut 9999999;

if(isNil "_this") exitWith {[] call DS_fnc_enterPlayer;};
if(typeName _this == "STRING") exitWith {[] call DS_fnc_enterPlayer;};
if(count _this == 0) exitWith {[] call DS_fnc_enterPlayer;};
if((_this select 0) == "Error") exitWith {[] call DS_fnc_enterPlayer;};
if((getPlayerUID player) != _this select 0) exitWith {[] call DS_fnc_playerLogin;};

DS_coin = parseNumber (_this select 2);
DS_atmcoin = parseNumber (_this select 3);
DS_adminlevel = parseNumber(_this select 4);
DS_donorLevel = parseNumber(_this select 5);

if(playerside != independent)then
	{
	if(count (_this select 6) > 0) then {
		{
			missionNamespace setVariable [(_x select 0),(_x select 1)];
		} foreach (_this select 6);
	};
	};

switch(playerSide) do {
	case west: {
		DS_coplevel = parseNumber(_this select 7);
		cop_gear = _this select 8;
		[] spawn DS_cop_loadPoliceGear;
		DS_blacklisted = _this select 9;
		DS_moral = _this select 10;
		if((_this select 11) isEqualTo 0)then
			{
			DS_infoArray = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0];
			}
			else
			{
			DS_infoArray = _this select 11;
			};
		DS_Locker = _this select 12;
		if((_this select 13) isEqualTo 0)then
			{
			DS_realEstateArray = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0];
			}
			else
			{
			DS_realEstateArray = _this select 13;
			};
		if((DS_infoArray select 12) == 2)then
				{
				player setVariable ["DS_sick_infection",true,false];
				};
	};
	
	case civilian: {
		DS_jailed = _this select 7;
		civ_gear = _this select 8;
		DS_moral = _this select 9;
		if((_this select 10) isEqualTo 0)then
			{
			DS_infoArray = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0];
			}
			else
			{
			DS_infoArray = _this select 10;
			};
		[] spawn DS_fnc_civLoadGear;
		DS_wanted_stats = _this select 11;
		if((_this select 12) isEqualTo 0)then
			{
			DS_realEstateArray = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0];
			}
			else
			{
			DS_realEstateArray = _this select 12;
			};		
		//DS_myClanBase = _this select 13;
		DS_houses = _this select 14;
		{
			_house = nearestBuilding (call compile format["%1", _x]);
			if(_house distance (call compile format["%1", _x]) > 5)then
				{
				_house = nearestObject (call compile format["%1", _x]);
				};
			DS_keyRing pushBack _house;
		} foreach DS_houses;
		/*
		life_gangData = _This select 12;
		if(count life_gangData != 0) then {
			[] spawn life_fnc_initGang;
		};
		
		[] spawn life_fnc_initHouses;
		*/
		_bounty = (DS_wanted_stats select 0);
		player setVariable["bounty",_bounty,true];
		[] spawn DS_civ_houseMarkers;
		if((DS_infoArray select 12) == 1)then
				{
				player setVariable ["DS_sick_infection",true,false];
				};
		if((_this select 13) > 0)then
			{
			[_this select 13] call DS_fnc_addToBase;
			};
	};
	
	case independent: {
		//wl_gear = _this select 6;
		DS_WLLevel = parseNumber(_this select 7);
		DS_moral = _this select 8;
		if((_this select 9) isEqualTo 0)then
			{
			DS_infoArray = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0];
			}
			else
			{
			DS_infoArray = _this select 9;
			};
		DS_wanted_stats = _this select 10;
		_bounty = (DS_wanted_stats select 0);
		player setVariable["bounty",_bounty,true];
		if((_this select 11) isEqualTo 0)then
			{
			DS_realEstateArray = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0];
			}
			else
			{
			DS_realEstateArray = _this select 11;
			};
			if((DS_infoArray select 12) == 1)then
				{
				player setVariable ["DS_sick_infection",true,false];
				};
	};
};

//[]execVM "core\gasStations\loadQuest.sqf";
/*
((Old donor system, no longer used))
switch(__GETC__(life_donator)) do
{
	case 1: {life_paycheck = life_paycheck + 300;};
	case 2: {life_paycheck = life_paycheck + 400;};
	case 3: {life_paycheck = life_paycheck + 600;};
	case 4: {life_paycheck = life_paycheck + 800;};
	case 5: {life_paycheck = life_paycheck + 1000;};
};
*/
DS_player_setup = true;

if(count(DS_locker) == 0)then
	{
	DS_locker = [[],0];
	};