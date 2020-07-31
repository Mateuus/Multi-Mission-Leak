/*
	File: fn_initCiv.sqf
	
	
	Description:
	Initializes the civilian.
*/

// TFR Variables API
tf_no_auto_long_range_radio = true; 

TF_terrain_interception_coefficient = 1;

private["_spawnPos"];


if(side player == east) then {
	["NotWhitelisted",false,true] call BIS_fnc_endMission;
	uiSleep 35;
};

switch (true) do
		{
			case(license_civ_donator1):
			{
				life_paycheck = 600; //Paycheck Amount
			};
			case(license_civ_donator2):
			{
				life_paycheck = 800; //Paycheck Amount
			};
			case(license_civ_donator3):
			{
				life_paycheck = 1000; //Paycheck Amount
			};
		};

if(life_karma > 999) then {
	karma_level = life_karma / 400;
	karma_level = floor (karma_level);
} else {
	karma_level = 0;
};

if(life_karma < 0) then {
	life_rebelbadguyman = true;
};

if(karma_level > 80) then {
	karma_level = 80;
};

if(life_is_arrested) then
{
	jail_money_init = false;
	[false,false,life_arrestMinutes,life_arrestReason] call life_fnc_jailSetup;
} else {
	jail_money_init = true;


	[] call life_fnc_spawnMenu;
	waitUntil{!isNull (findDisplay 38500)}; //Wait for the spawn selection to be open.
	waitUntil{isNull (findDisplay 38500)}; //Wait for the spawn selection to be done.
};


if(side player == civilian) then {
	[] spawn fnc_resetCallSpawn;
	[] call fnc_checkphone;
};

player setUnitRecoilCoefficient 2.8;
player addRating 9999999;