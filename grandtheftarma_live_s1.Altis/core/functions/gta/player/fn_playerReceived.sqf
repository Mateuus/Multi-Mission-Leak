/**
 * Copyright © 2015 DnA, Grand Theft ArmA.
 * All Rights Reserved.
 */

private "_data";
_data = [ _this, 0, [], [[]] ] call GTA_fnc_param;

//--- Subtitle
GTA_RscInfoText_subtitle = "Processing player data...";

//--- Error check
if ( count _data == 0 ) exitWith {};
if ( getPlayerUID player != _data select 0 ) exitWith {};

//--- Money
GTA_money_cash = _data select 2;

//--- Bank
GTA_money_bank = _data select 3;

//--- Donator level
[ "GTA_donatorLevel", _data select 4 ] call GTA_fnc_const;

//--- Admin
[ "GTA_adminLevel", _data select 5 ] call GTA_fnc_const;

//--- Blacklist
[ "GTA_blacklisted", _data select 6 ] call GTA_fnc_const;

//--- Licenses
if ( count ( _data select 7 ) > 0 ) then {

	{

		missionNamespace setVariable [ _x select 0, _x select 1 ];

	} forEach ( _data select 7 );

};

//--- Side specific
switch playerSide do {

	//--- NATO & Cop
	case west: {

		//--- Cop rank
		[ "GTA_copRank", _data select 8 ] call GTA_fnc_const;

		//--- Cop rank
		[ "GTA_milRank", _data select 9 ] call GTA_fnc_const;

	};

	//--- Paramedic & HATO
	case independent: {

		//--- Medic rank
		[ "GTA_medRank", _data select 8 ] call GTA_fnc_const;

		//--- HATO rank
		[ "GTA_hatoRank", _data select 9 ] call GTA_fnc_const;

	};

	//--- Civilian
	case civilian: {

		//--- Arrested
		life_is_gta_arrested = _data select 8;

		//--- Gear
    private _inventory = _data select 9;
    if (count _inventory > 0) then {
      if (typeName (_inventory select 0) == typeName []) then {
        [player, _data select 9] call GTA_fnc_loadInventory;
      } else {
        [_data select 9] call life_fnc_civLoadGear;
      };
    };

		//--- TEMP: assign by radio with default
		player linkItem "ItemRadio";

		//--- TDOD: Housing
		life_houses = _data select 10;
		{

			_house = [call compile format ["%1", _x select 0]] call GTA_fnc_nearestBuilding;
			life_vehicles pushBack _house;

		} foreach life_houses;

		[] spawn life_fnc_initHouses;

		//--- TODO: Gang
		life_gangData = _data select 11;
		[] call life_fnc_initGang;

	};

};

//--- Default loadout for services or fresh civilians
if ( playerSide != civilian || { count ( _data select 9 ) == 0 } ) then {

	[] call GTA_fnc_loadoutPlayer;

};

//--- Player init
[] call GTA_fnc_initPlayer;

//--- Client has received player data
GTA_player_received = true;
