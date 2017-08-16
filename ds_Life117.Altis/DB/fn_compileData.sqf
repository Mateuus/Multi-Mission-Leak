/*
	Author: Shawn "Huntah" Macgillivray
	
	Description:
	Gathers the players information and sends it to the server to be saved
*/

private ["_force","_packet","_time","_newTime","_counter"];

_force = [_this,0,false,[false]] call BIS_fnc_param;
if((player distance spawnIsland < 1000)&&(!_force))exitwith{};
//if((!_force)&&(DS_dataSynced))exitwith{};
DS_dataSynced = true;

_packet = [getPlayerUID player,(profileName),playerSide,DS_coin,DS_atmcoin,DS_moral];//Initial packed before side related stuff is added
_time = time - DS_playTime;
_time = (round(_time/60));
//Save time played to InfoArra
//Save time played to InfoArray

switch(playerside)do
	{
	case west:
		{
		_newTime = ((_time) + (DS_infoArray select 0));
		DS_infoArray set [0,_newTime];
		_licenses = [];
		{
			_licenses pushBack [_x,(missionNamespace getVariable _x)];
		}forEach DS_licenseArray;
		_packet pushBack _licenses;
		};
	case independent:
		{
		_newTime = ((_time) + (DS_infoArray select 2));
		DS_infoArray set [2,_newTime];
		_licenses = [];
		{
			_licenses pushBack [_x,(missionNamespace getVariable _x)];
		}forEach DS_licenseArray;
		_packet pushBack _licenses;
		};
	case civilian:
		{
		_newTime = ((_time) + (DS_infoArray select 1));
		DS_infoArray set [1,_newTime];
		_licenses = [];
		{
			_licenses pushBack [_x,(missionNamespace getVariable _x)];
		}forEach DS_licenseArray;
		_packet pushBack _licenses;
		};
	};

//Save new playtime
DS_playTime = time;
//Begin adding side specifics
switch(playerside)do
	{
	case west:
		{
		[] call DS_cop_saveCopGear;
		_packet pushBack cop_gear;
		_packet pushBack DS_infoArray;
		_packet pushBack DS_locker;
		_packet pushBack DS_realEstateArray;
		};
	case civilian:
		{
		if(!alive player)then
			{
			civ_gear = [];
			}
			else
			{
			[] call DS_civ_civSaveGear;
			};
		_packet pushBack civ_gear;
		_packet pushBack DS_infoArray;
		_packet pushBack DS_jailed;
		_packet pushBack DS_wanted_stats;
		_packet pushBack DS_realEstateArray;
		};
	case independent:
		{
		/*
		if(!alive player)then
			{
			wl_gear = [];
			}
			else
			{
			[] call DS_fnc_wlSaveGear;
			};
		_packet pushBack wl_gear;
		*/
		_packet pushBack DS_infoArray;
		_packet pushBack DS_jailed;
		_packet pushBack DS_wanted_stats;
		_packet pushBack DS_realEstateArray;
		};
	};
[_packet,"DB_fnc_updateRequest",false,false] spawn BIS_fnc_mp;

[] spawn 
	{
	sleep 10;
	DS_dataSynced = false;
	};

























