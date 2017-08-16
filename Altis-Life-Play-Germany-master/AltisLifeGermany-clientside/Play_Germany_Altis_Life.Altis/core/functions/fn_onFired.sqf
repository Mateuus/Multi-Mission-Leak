/*
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Handles various different ammo types being fired.
*/
private["_ammoType","_projectile"];
_player = _this select 0;
_ammoType = _this select 4; 
_projectile = _this select 6;
_weap = currentWeapon _player;
_ammo = _player ammo _weap;

if(playerSide == civilian && (call life_adminlevel < 1)) then {

	_continue = true;
	{if(((_x getVariable ["HouseSpawnBlockTime",0]) > serverTime) && {(_x distance player) < 1000}) exitWith {_continue = false;};} forEach life_vehicles;

	if(_continue) then {
		{
			if((player distance getMarkerPos(_x select 0)) < (_x select 1)) exitWith {if(PG_warning > 3) then {["Bitte schieße nicht in Savezones!", -1, 0.42, 20, 0, 0, 11126] spawn BIS_fnc_dynamicText; PG_shootInSavezone = _x select 2; publicVariable "PG_shootInSavezone";} else {PG_warning = PG_warning +1; hint format["Du darfst in Savezones nicht schießen! (Warnung %1 von 3)",PG_warning];}};
		} forEach [["safezone_1",500,"Kavala"],["Safezone_1_1_2_1_2_1",145,"Athira"],["Safezone_1_1_2_1_2_1_3",145,"Pyrgos"],["Safezone_1_1_2_1_2",145,"Sofia"]];
	};
};

/*
	["sdasdasd",150,"RebHQ"]
	["safezone_1_1_1",75,"Schwarzmarkt"]
*/

//Flashbang
if(_ammoType == "GrenadeHand_stone") then {
	_projectile spawn {
		private "_position";
		while {!isNull _this} do {
			_position = ASLtoATL (visiblePositionASL _this);
			sleep 0.1;
		};
		[[_position],"life_fnc_flashbang",true,false] call life_fnc_MP;
	};
};

//Three shot Taser
if (_weap == "hgun_P07_snds_F" && playerSide in [west,east] ) then {
   	if (_ammo >= 3) then {
		_player setAmmo ["hgun_P07_snds_F",2];
	};
};

//Teargas
if(_ammoType in ["SmokeShellGreen","G_40mm_SmokeGreen"]) then {
	[[_projectile],"PG_fnc_teargas",true,false] call life_fnc_MP;
};