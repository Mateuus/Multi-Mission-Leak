class life_spawn_selection
{
 idd = 38500;
 movingEnabled = false;
 enableSimulation = true;
 
 class controlsBackground
 {
	class BGha: Life_RscPicture
	{
		idc = 38531;
		text = "textures\bg.paa";
		x = 0 * safezoneW + safezoneX;
		y = 0 * safezoneH + safezoneY;
		w = 1.06734 * safezoneW;
		h = 1.903 * safezoneH;
	};
	class BGMenu: Life_RscPicture
	{
		idc = 38531;
		text = "textures\inventory\back_spawn.paa";
		x = 0.237031 * safezoneW + safezoneX;
		y = 0.159 * safezoneH + safezoneY;
		w = 0.531094 * safezoneW;
		h = 0.704 * safezoneH;
	};
  
    class MapView : Life_RscMapControl 
    {
		idc = 38502;
		colorBackground[] = {0,0,0,0.3};
		x = 0.241666 * safezoneW + safezoneX;
		y = 0.33963 * safezoneH + safezoneY;
		w = 0.291771 * safezoneW;
		h = 0.342037 * safezoneH;
		maxSatelliteAlpha = 0.75;//0.75;
		alphaFadeStartScale = 1.15;//0.15;
		alphaFadeEndScale = 1.29;//0.29;
    };
};
 
 class controls
 { 
  class SpawnPointList: Life_RscListNBox
  {
   idc = 38510;
   text = "";
   sizeEx = 0.041;
   coloumns[] = {0,0,0.9};
   drawSideArrows = false;
   idcLeft = -1;
   idcRight = -1;
   rowHeight = 0.050;
	x = 0.547448 * safezoneW + safezoneX;
	y = 0.344148 * safezoneH + safezoneY;
	w = 0.213125 * safezoneW;
	h = 0.304074 * safezoneH;
   onLBSelChanged = "_this call life_fnc_spawnPointSelected;";
  };

  class spawnButton : Life_RscButtonMenu
  {
   idc = -1;
   tooltip = "Spawn";
   onButtonClick = "[] call life_fnc_spawnConfirm";
	x = 0.548958 * safezoneW + safezoneX;
	y = 0.65463 * safezoneH + safezoneY;
	w = 0.209479 * safezoneW;
	h = 0.0198148 * safezoneH;
	colorBackground[] = {0,0,0,0};
	colorBackgroundFocused[] = {0,0,0,0};
	colorBackground2[] = {0,0,0,0};
	color[] = {1,1,1,1};
	colorFocused[] = {0,0,0,0};
	color2[] = {0,0,0,0};
	colorText[] = {1,1,1,1};
  };
 };
};