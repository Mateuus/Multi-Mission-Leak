/*
	File: fn_initCop.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Cop Initialization file.
*/
if (isNil "ANMeme") exitWith {};
INTRO_CAM cameraEffect ["terminate","back"];
camDestroy INTRO_CAM;
deleteVehicle ANMeme;
closeDialog 0;

tf_no_auto_long_range_radio = true;
TF_terrain_interception_coefficient = 1;
enableRadio false;
enableSentences false;
player disableConversation true;
player setVariable ["tf_sendingDistanceMultiplicator", 10];
call life_fnc_stepremetefuf;
