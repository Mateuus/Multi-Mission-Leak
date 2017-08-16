/*
Script File Author: Repentz
Script File Mod: Life Server
Script File: RPP_Housing_Cfg.sqf

Description:
Player Housing cfg
*/
RPP_HouseMaxDistance = 200; //Max distance for house property!
publicVariable "RPP_HouseMaxDistance";

RPP_House_Class =
[
	/* Add house classnames here that you want to be a ble to own */
	"Land_i_House_Big_01_V1_F",
	"Land_i_House_Big_01_V2_F",
	"Land_i_House_Big_01_V3_F",
	"Land_i_House_Big_02_V1_F",
	"Land_i_House_Big_02_V2_F",
	"Land_i_House_Big_02_V3_F",
	"Land_i_Stone_HouseBig_V1_F",
	"Land_i_Stone_HouseBig_V2_F",
	"Land_i_Stone_HouseBig_V3_F",
	"Land_i_Stone_HouseSmall_V1_F",
	"Land_i_Stone_HouseSmall_V2_F",
	"Land_i_Stone_HouseSmall_V3_F"
];
publicVariable "RPP_House_Class";

RPP_House_Class_Cfg =
[
	/* Config for houses */
	//Classname,buy price,Max weight, distance in meters (MAX DISTANCE 200)
	["Land_i_House_Big_01_V1_F",500,450,30],
	["Land_i_House_Big_01_V2_F",500,450,30],
	["Land_i_House_Big_01_V3_F",500,450,30],
	["Land_i_House_Big_02_V1_F",500,450,30],
	["Land_i_House_Big_02_V2_F",500,450,30],
	["Land_i_House_Big_02_V3_F",500,450,30],
	["Land_i_Stone_HouseBig_V1_F",500,450,30],
	["Land_i_Stone_HouseBig_V2_F",500,450,30],
	["Land_i_Stone_HouseBig_V3_F",500,450,30],
	["Land_i_Stone_HouseSmall_V1_F",500,450,30],
	["Land_i_Stone_HouseSmall_V2_F",500,450,30],
	["Land_i_Stone_HouseSmall_V3_F",500,450,30]
];
publicVariable "RPP_House_Class_Cfg";


RPP_Server_Housing_Ready = false;
publicVariable "RPP_Server_Housing_Ready";