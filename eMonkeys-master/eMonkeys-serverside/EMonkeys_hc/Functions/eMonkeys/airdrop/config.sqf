/*
	@file Version: 1.0.0.0
	@file Author: RYN_Ryan
	@file edit: 20.01.2015
	Copyright � 2015 Ryan Torzynski, All rights reserved
	All servers are allowed to use this code, modify and publish it. Every modified release of this script must contain "Original by RTT"
*/

airdrop_helicopter_main = "B_Heli_Transport_03_unarmed_F";
airdrop_helicopter_scnd = "B_Heli_Transport_01_F";
airdrop_chance = 100;
airdrop_positions = [[7328.27,13866.9,0.00137329],[21291.7,14524.5,0.00144851],[23803.9,21893.1,0.00143051],[16796.3,19175,0.00149727],[18669,10906.5,0.00138855]];
_airdrop_time_interval = [0.8,1.4]; //Time given in hours, this is the interval in which the airdrop should take place

// Do not modify the following code

airdrop_time_min = _airdrop_time_interval select 0;
airdrop_time_max = _airdrop_time_interval select 1;
airdrop_time_min = airdrop_time_min*3600;
airdrop_time_max = airdrop_time_max*3600;

if (airdrop_time_min>=airdrop_time_max) exitWith {airdrop_enable=false;};
airdrop_enable=true;
airdrop_goingon=false;