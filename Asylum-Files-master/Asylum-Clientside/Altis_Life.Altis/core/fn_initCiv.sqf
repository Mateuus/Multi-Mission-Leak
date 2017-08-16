/*
	File: fn_initCiv.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Initializes the civilian.
*/
private["_spawnPos","_marker","_house"];

[] spawn life_fnc_trackMarkers;

life_maxTalents = 27;
life_maxGangTalents = 7;
life_maxWeight = 64;

// was ["Land_i_House_Big_01_V1_F","Land_i_House_Small_01_V2_F","Land_i_House_Small_03_V1_F"]
civ_spawn_1 = nearestObjects[getMarkerPos "civ_spawn_1", ["Land_i_Shop_01_V1_F","Land_i_Shop_02_V1_F","Land_i_Shop_01_V1_dam_F","Land_i_Shop_02_V1_dam_F","Land_i_Barracks_V1_F","Land_i_Barracks_V2_dam_F","Land_i_Barracks_V2_F","Land_i_Garage_V1_F"],100];
civ_spawn_2 = nearestObjects[getMarkerPos "civ_spawn_2", ["Land_i_Shop_01_V1_F","Land_i_Shop_02_V1_F","Land_i_Shop_01_V1_dam_F","Land_i_Shop_02_V1_dam_F","Land_i_Barracks_V1_F","Land_i_Barracks_V2_dam_F","Land_i_Barracks_V2_F","Land_i_Garage_V1_F"],100];
civ_spawn_3 = nearestObjects[getMarkerPos "civ_spawn_3", ["Land_i_Shop_01_V1_F","Land_i_Shop_02_V1_F","Land_i_Shop_01_V1_dam_F","Land_i_Shop_02_V1_dam_F","Land_i_Barracks_V1_F","Land_i_Barracks_V2_dam_F","Land_i_Barracks_V2_F","Land_i_Garage_V1_F"],100];
civ_spawn_4 = nearestObjects[getMarkerPos "civ_spawn_4", ["Land_i_Shop_01_V1_F","Land_i_Shop_02_V1_F","Land_i_Shop_01_V1_dam_F","Land_i_Shop_02_V1_dam_F","Land_i_Barracks_V1_F","Land_i_Barracks_V2_dam_F","Land_i_Barracks_V2_F","Land_i_Garage_V1_F"],100];
donor_town = nearestObjects[getMarkerPos "donor_town", ["Land_i_Shop_01_V1_F","Land_i_Shop_02_V1_F","Land_i_Shop_01_V1_dam_F","Land_i_Shop_02_V1_dam_F","Land_i_Barracks_V1_F","Land_i_Barracks_V2_dam_F","Land_i_Barracks_V2_F","Land_i_Garage_V1_F"],150];

if ((count life_houses) > 0) then
{
	for "_i" from 1 to (count life_houses) do
	{
		_house = (life_house_pos select (_i-1)) nearestObject "House_F";
		_numDoors = getNumber(configFile >> "CfgVehicles" >> (typeOf _house) >> "numberOfDoors");
		_house setVariable["life_locked", 1, true];
		_house setVariable["home_owner", getPlayerUID player, true];
		for "_i" from 1 to _numDoors do
		{
			_house setVariable[format["bis_disabled_Door_%1", _i], 1, true];
		};
		deleteMarkerLocal format["house_%1", _i];
		_marker = createMarkerLocal [format["house_%1", _i], getPos _house];
		_marker setMarkerTextLocal getText(configFile >> "CfgVehicles" >> (typeOf _house) >> "displayName");
		_marker setMarkerShapeLocal "ICON"; 
		_marker setMarkerColorLocal "ColorBlue";
		_marker setMarkerTypeLocal "mil_end";
	};
};

waitUntil {!(isNull (findDisplay 46))};

if(life_is_arrested) then
{
	life_is_arrested = false;
	["kavala"] spawn life_fnc_jail;
}
else
{
	if (life_alive) then
	{
		{
			if(life_worldspace distance getMarkerPos _x < 150) exitWith {
				_players = getMarkerPos _x nearEntities ["Man",150];
				{if(!isPlayer _x) then {_players = _players - [_x]}} forEach _players;
				if(count _players == 0) exitWith {};
				[[[1,2],"A potentially hostile player has entered the world nearby!"],"life_fnc_broadcast",_players,false] spawn life_fnc_MP;
			};
		} forEach ["Rebelop_1","Rebelop_2","Rebelop_3","Rebelop_4","Rebelop_5"];
		player setPosATL life_worldspace;
	}
	else
	{
		[0] call life_fnc_setPain;
		[false] call life_fnc_brokenLeg;
		[] call life_fnc_spawnMenu;
		waitUntil{!isNull (findDisplay 38500)}; //Wait for the spawn selection to be open.
		waitUntil{isNull (findDisplay 38500)}; //Wait for the spawn selection to be done.
	};
};
player addRating 9999999;

// Disallow 7.62 and guns in jail
[] spawn
{
	private ["_prev"];
	while {true} do
	{
		waitUntil { alive player && life_alive };
		_prev = primaryWeapon player;
		if ((_prev in ["srifle_DMR_01_F","srifle_EBR_F","srifle_DMR_03_khaki_F","srifle_DMR_03_multicam_F","srifle_DMR_03_tan_F","srifle_DMR_03_woodland_F","srifle_DMR_06_olive_F","srifle_DMR_06_camo_F","arifle_SPAR_03_snd_F","arifle_SPAR_03_khk_F"]) && !(31 in life_talents)) then { player removeWeapon (primaryWeapon player); };
		if ((life_is_arrested && _prev != "") || ((!license_civ_bounty || !(126 in life_talents) || count life_honortalents == 0) && _prev in["arifle_MX_F","arifle_MXC_F"])) then { player removeWeapon (primaryWeapon player); };
		waitUntil {sleep 5;_prev != (primaryWeapon player)};
	};
};

// Informants, etc.
[] spawn
{
	while {true} do
	{
		waitUntil {sleep 300; life_wanted > 1000};
		if (round (random 1) == 0) then
		{
			if ((player distance (getMarkerPos "city") < 250) || (player distance (getMarkerPos "donor_town") < 250) || (player distance (getMarkerPos "civ_spawn_2") < 250) || (player distance (getMarkerPos "civ_spawn_3") < 250) || (player distance (getMarkerPos "civ_spawn_4") < 250)) then
			{
				[["0",name player,6],"life_fnc_clientMessage",true,false] spawn life_fnc_MP;
			}
			else
			{
				if ({player distance getMarkerPos format["%1",_x] < 150} count ["cocaine_1","heroin_1","meth_1","liquor","Weed_p_1","cokeProc","heroin_p","methlab_1"] > 0) then
				{
					[["1",name player,6],"life_fnc_clientMessage",true,false] spawn life_fnc_MP;
				};
			};
		};
	};
};

// Security Cams
if (worldName != "Tanoa") then
{
	[] spawn
	{
		private ["_chance"];
		while {true} do
		{
			_distance = if (worldName == "Australia") then { 500 } else { 150 };
			waitUntil {sleep 60; _lastRobbed = 0; _cops = 0; { if (side _x == west) then { _cops = _cops + 1; }; } forEach allPlayers; if (!isNil "life_bank_lastRobbed") then { _lastRobbed = life_bank_lastRobbed; }; (!life_bank_inProgress && (player distance (getMarkerPos "fed_reserve") < _distance) && (_lastRobbed < (time - 600)) && _cops > 5)};
			_hidden = ((goggles player) in ["G_Balaclava_blk","G_Balaclava_combat","G_Balaclava_lowprofile","G_Balaclava_oli","G_Bandanna_aviator","G_Bandanna_beast","G_Bandanna_blk","G_Bandanna_khk","G_Bandanna_oli","G_Bandanna_shades","G_Bandanna_sport","G_Bandanna_tan"]);
			_chance = 1;
			if (118 in life_talents) then { _chance = _chance + 1; };
			if (_hidden) then { _chance = _chance + 1; };
			_detected = ((floor random _chance) == 0);
			if (vehicle player != player) then { _detected = true };
			if (_detected && (life_inv_drill > 0 || life_inv_goldbar > 0 || life_inv_boltCutter > 0 || life_inv_demoCharge > 0)) then
			{
				_concealed = false;
				//{ if (player distance (getPos _x) < 25) then { _concealed = true; }; } forEach life_bank_vaults;
				if (!_concealed) then
				{
					hint "You have been spotted by the Federal Reserve Security and set off a security alarm! You, and any who are with you, are now wanted for bank robbery.";
					[[player],"ASY_fnc_fedAlarm",false,false] spawn life_fnc_MP;
				};
			};
		};
	};
};

// Reveal donor houses
/*if (worldName == "Altis") then
{
	[] spawn
	{
		private ["_h"];
		waitUntil {life_session_completed};
		sleep 3;
		_h = nearestObjects [(getMarkerPos "donor_town"), ["House_F"], 500];
		{ player reveal _x } forEach _h;
	};
};*/

//[[24, player, format["Initialized as civilian"]],"ASY_fnc_logIt",false,false] spawn life_fnc_MP;