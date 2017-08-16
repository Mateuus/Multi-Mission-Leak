/*
	File: fn_colorClothesMenu
	Author: CooliMC
	
	Description:
	Setup the colorClothesMenu.
	YOU ARE NOT ALLOWED TO MODIFY/USE THIS SCRIPT ON OTHER SERVERS ITS MY WORK DONT STEAL IT !!!!
*/
if(isNull (findDisplay 49090)) then
{
	if(!createDialog "ColorClothesMenu") exitWith {hint "Ups es scheint was mit dem Menü nicht zu stimmen es will sich nicht öffnen !!!"};
};

disableSerialization;

//Setup Sliders range
{ slidersetRange [_x, 0, 255];} foreach [49092, 49094, 49096];	//For Red, Green and Blue
slidersetRange [49098, 0, 240];	//For Light

//Setup Sliders speed
{ sliderSetSpeed [_x, 1, 1, 1];} foreach [49092, 49094, 49096, 49098];	//For Red, Green, Blue and Light

//Setup Sliders position
{ sliderSetPosition[_x , 120];} foreach [49092, 49094, 49096, 49098];	//For Red, Green, Blue and Light

ES_colorClothSelection = 0;
ES_colorClothPrevCloth = ((getObjectTextures player) select 0);
ES_colorClothPrevBack = ((getObjectTextures (unitBackpack player)) select 0);
ES_colorClothBought = 0;
ES_colorClothR = 120;
ES_colorClothG = 120;
ES_colorClothB = 120;
ES_colorClothH = 120;
ES_colorClothTempR = 120;
ES_colorClothTempG = 120;
ES_colorClothTempB = 120;
ES_colorClothTempH = 120;


ES_shop_cam = "CAMERA" camCreate getPos player;
showCinemaBorder false;
ES_shop_cam cameraEffect ["Internal", "Back"];
ES_shop_cam camSetTarget (player modelToWorld [0,0,1]);
ES_shop_cam camSetPos (player modelToWorld [1,4,2]);
ES_shop_cam camSetFOV .33;
ES_shop_cam camSetFocus [50, 0];
ES_shop_cam camCommit 0;

[] spawn
{
	waitUntil {isNull (findDisplay 49090)};
	
	ES_shop_cam cameraEffect ["TERMINATE","BACK"];
	camDestroy ES_shop_cam;
	
	if(ES_colorClothBought == 0) then
	{
		player setObjectTexture [0, ES_colorClothPrevCloth];
		
		if(!isNull(unitBackpack player)) then
		{
			(unitBackpack player) setObjectTexture [0, ES_colorClothPrevBack];
		};
	} else {
		if(ES_colorClothBought == 1) then
		{
			if(!isNull(unitBackpack player)) then
			{
				(unitBackpack player) setObjectTexture [0, ES_colorClothPrevBack];
			};
		} else {
			player setObjectTexture [0, ES_colorClothPrevCloth];
		};
	};
};