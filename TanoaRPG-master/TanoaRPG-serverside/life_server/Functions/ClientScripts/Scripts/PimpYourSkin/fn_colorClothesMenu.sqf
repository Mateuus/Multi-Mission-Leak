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

//Setup Sliders range For Red, Green and Blue
{ slidersetRange [_x, 0, 255];} foreach [49092, 49094, 49096];

//For Light
slidersetRange [49098, 0, 240];

//Setup Sliders speed For Red, Green, Blue and Light
{ sliderSetSpeed [_x, 1, 1, 1];} foreach [49092, 49094, 49096, 49098];

//Setup Sliders position For Red, Green, Blue and Light
{ sliderSetPosition[_x , 120];} foreach [49092, 49094, 49096, 49098];

life_colorClothSelection = 0;
life_colorClothPrevCloth = ((getObjectTextures player) select 0);
life_colorClothPrevBack = ((getObjectTextures (unitBackpack player)) select 0);
life_colorClothBought = 0;
life_colorClothR = 120;
life_colorClothG = 120;
life_colorClothB = 120;
life_colorClothH = 120;
life_colorClothTempR = 120;
life_colorClothTempG = 120;
life_colorClothTempB = 120;
life_colorClothTempH = 120;


life_shop_cam = "CAMERA" camCreate getPos player;
showCinemaBorder false;
life_shop_cam cameraEffect ["Internal", "Back"];
life_shop_cam camSetTarget (player modelToWorld [0,0,1]);
life_shop_cam camSetPos (player modelToWorld [1,4,2]);
life_shop_cam camSetFOV .33;
life_shop_cam camSetFocus [50, 0];
life_shop_cam camCommit 0;

[] spawn
{
	waitUntil {isNull (findDisplay 49090)};
	
	life_shop_cam cameraEffect ["TERMINATE","BACK"];
	camDestroy life_shop_cam;
	
	if(life_colorClothBought == 0) then
	{
		player setObjectTexture [0, life_colorClothPrevCloth];
		
		if(!isNull(unitBackpack player)) then
		{
			(unitBackpack player) setObjectTexture [0, life_colorClothPrevBack];
		};
	} else {
		if(life_colorClothBought == 1) then
		{
			if(!isNull(unitBackpack player)) then
			{
				(unitBackpack player) setObjectTexture [0, life_colorClothPrevBack];
			};
		} else {
			player setObjectTexture [0, life_colorClothPrevCloth];
		};
	};
};