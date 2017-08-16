/*
    Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Loads the player's data
*/

private ["_bounty","_noBlack"];

DS_dbFailSafe = DS_dbFailSafe + 1;
if(DS_player_setup)exitWith{};
if(DS_dbFailSafe > 3)exitWith{cutText ["Error with your profile, talk to the admins","BLACK FADED"];0 cutFadeOut 999999999;};

//No black UID's
_noBlack = ["76561198038366032","76561197992718808","76561198073680229","76561198067949555","76561198088153735","76561198176900577","76561198139940358","76561198073613608","76561198144709998","76561198124984854"];

0 cutText ["Your profile has been loaded, setting up your player now...","BLACK FADED"];
0 cutFadeOut 9999999;
if((getPlayerUID player) in _noBlack)then{cutText ["Your profile has been loaded, setting up your player now...","BLACK IN"];};

if(isNil "_this")exitWith{[] call DS_fnc_enterPlayer;};
if(_this isEqualType "")exitWith{[] call DS_fnc_enterPlayer;};
if(_this isEqualTo [])exitWith{[] call DS_fnc_enterPlayer;};
if((_this select 0) isEqualTo "Error")exitWith{[] call DS_fnc_enterPlayer;};
if(!((getPlayerUID player) isEqualTo (_this select 0)))exitWith{[] call DS_fnc_playerLogin;};

DS_debug99 = _this;

DS_coin = parseNumber (_this select 2);
DS_atmCoin = parseNumber (_this select 3);
DS_adminLevel = (_this select 4);
DS_donorLevel = (_this select 5);

_licenses = (_this select 6);
if(!(playerSide isEqualTo independent))then {
	if(!(_licenses isEqualTo []))then {
		{
			missionNamespace setVariable [(_x select 0),(_x select 1)];
		} forEach _licenses;
	};
};

switch(playerSide)do {
	case west: {
		DS_copLevel = (_this select 7);
		DS_gear = _this select 8;
		[] spawn DS_fnc_loadGear;
		DS_blacklisted = _this select 9;
		DS_moral = _this select 10;

		if((_this select 11) isEqualTo 0)then {
			_this set [11,[0,0,0,0,0,0,0,0,0,10,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]];
			DS_infoArray = [0,0,0,0,0,0,0,0,0,10,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0];
		} else {
			DS_infoArray = _this select 11;
			if((count DS_infoArray) < 40)then {
				DS_infoArray pushBack 0;DS_infoArray pushBack 0;DS_infoArray pushBack 0;DS_infoArray pushBack 0;DS_infoArray pushBack 0;
				DS_infoArray pushBack 0;DS_infoArray pushBack 0;DS_infoArray pushBack 0;DS_infoArray pushBack 0;DS_infoArray pushBack 0;
			};
		};

		DS_locker = _this select 12;

		if((_this select 13) isEqualTo 0)then {
			_this set [13,[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]];
			DS_realEstateArray = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0];
		} else {
			DS_realEstateArray = _this select 13;
		};

		if((DS_infoArray select 12) == 2)then {
			player setVariable ["DS_sick_infection",true,false];
		};

		DS_donorExpire = _this select 14;
	};

	case civilian: {
		DS_jailed = _this select 7;
		DS_gear = _this select 8;
		DS_moral = _this select 9;

		if((_this select 10) isEqualTo 0)then {
			DS_infoArray = [0,0,0,0,0,0,0,0,0,10,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0];
			_this set [10,[0,0,0,0,0,0,0,0,0,10,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]];
		} else {
			DS_infoArray = _this select 10;
			if((count DS_infoArray) < 40)then {
				DS_infoArray pushBack 0;DS_infoArray pushBack 0;DS_infoArray pushBack 0;DS_infoArray pushBack 0;DS_infoArray pushBack 0;
				DS_infoArray pushBack 0;DS_infoArray pushBack 0;DS_infoArray pushBack 0;DS_infoArray pushBack 0;DS_infoArray pushBack 0;
			};
		};

		[] spawn DS_fnc_loadGear;

		DS_wanted_stats = _this select 11;

		if((_this select 12) isEqualTo 0)then {
			DS_realEstateArray = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0];
			_this set [12,[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]];
		} else {
			DS_realEstateArray = _this select 12;
		};

		DS_houses = _this select 15;
		_houseArray = ["Land_i_House_Big_02_V1_F","Land_i_House_Big_02_V2_F","Land_i_House_Big_02_V3_F","Land_i_House_Big_01_V1_F","Land_i_House_Big_01_V2_F","Land_i_House_Big_01_V3_F","Land_i_Garage_V1_F","Land_i_Garage_V2_F",
			"Land_i_House_Small_01_V1_F","Land_i_House_Small_01_V2_F","Land_i_House_Small_01_V3_F","Land_i_House_Small_02_V1_F","Land_i_House_Small_02_V2_F","Land_i_House_Small_02_V3_F","Land_i_House_Small_03_V1_F","Land_i_Stone_HouseSmall_V2_F",
			"Land_i_Stone_HouseSmall_V1_F","Land_i_Stone_HouseSmall_V3_F"];
		{
			_fail = false;
			_pos = call compile format ["%1",_x];
			_counter = 0;
			_house = nearestObjects [_pos,["House","Building"],50] select _counter;

			if(!((typeOf _house) in _houseArray))then {
				while{true}do {
					_counter = _counter + 1;
					_house = nearestObjects [_pos,["House","Building"],30] select _counter;
					diag_log format ["HOUSE 4 || %1",_house];
					if((typeOf _house) in _houseArray)exitWith{};
					if(_counter > 20)exitWith{_fail = true};
				};
			};

			if(!_fail)then {
				DS_keyRing pushBack _house;
			};
		} forEach DS_houses;

		_bounty = (DS_wanted_stats select 0);
		player setVariable ["bounty",_bounty,true];
		[] spawn DS_civ_houseMarkers;

		if((DS_infoArray select 12) == 1)then {
			player setVariable ["DS_sick_infection",true,false];
		};

		if((_this select 13) > 0)then{
			[_this select 13] call DS_fnc_addToBase;
		};

		DS_donorExpire = format ["Because of the recent DB wipe some expiry dates are months early, if you think this is the case just ignore any false expiry date and ask an admin for the actual date\n\n%1",(_this select 14)];
	};

	case independent: {
		DS_WLLevel = (_this select 7);
		DS_moral = _this select 8;

		if((_this select 9) isEqualTo 0)then {
			_this set [9,[0,0,0,0,0,0,0,0,0,10,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]];
			DS_infoArray = [0,0,0,0,0,0,0,0,0,10,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0];
		} else {
			DS_infoArray = _this select 9;
			if((count DS_infoArray) < 40)then {
				DS_infoArray pushBack 0;DS_infoArray pushBack 0;DS_infoArray pushBack 0;DS_infoArray pushBack 0;DS_infoArray pushBack 0;
				DS_infoArray pushBack 0;DS_infoArray pushBack 0;DS_infoArray pushBack 0;DS_infoArray pushBack 0;DS_infoArray pushBack 0;
			};
		};

		DS_wanted_stats = _this select 10;
		_bounty = (DS_wanted_stats select 0);
		player setVariable ["bounty",_bounty,true];

		if((_this select 11) isEqualTo 0)then {
			_this set [11,[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]];
			DS_realEstateArray = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0];
		} else {
			DS_realEstateArray = _this select 11;
		};

		if((DS_infoArray select 12) == 1)then {
			player setVariable ["DS_sick_infection",true,false];
		};

		DS_donorExpire = _this select 12;
	};
};

DS_player_setup = true;
6 enableChannel [true, false];
7 enableChannel [true, false];
8 enableChannel [true, false];

if(DS_locker isEqualTo [])then {
	DS_locker = [[],0];
};