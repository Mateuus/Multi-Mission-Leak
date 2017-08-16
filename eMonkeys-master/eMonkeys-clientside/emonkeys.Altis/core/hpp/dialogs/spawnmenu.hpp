class EMonkeys_spawn_selection
{
	idd = 38500;
	movingEnabled = false;
	enableSimulation = true;
	
	class controlsBackground
	{
		
		class Background: EMonkeys_RscPicture
		{
			idc = -1;
			text = "core\textures\menu_background\bg_spawnMenu.paa";
			x = 0.257656 * safezoneW + safezoneX;
			y = 0.126 * safezoneH + safezoneY;
			w = 0.479531 * safezoneW;
			h = 0.825 * safezoneH;
		};
		
		class SpawnPointTitle : EMonkeys_RscTitle
		{
			idc = 38501;
			style = 1;
			text = "";
			font = PuristaMedium;
			x = 0.422656 * safezoneW + safezoneX;
			y = 0.324 * safezoneH + safezoneY;
			w = 0.299062 * safezoneW;
			h = 0.022 * safezoneH;
		};
		
		class MapView : EMonkeys_RscMapControl 
		{
			idc = 38502;
			colorBackground[] = {0.47,0.45,0,0.1};
			x = 0.422656 * safezoneW + safezoneX;
			y = 0.357 * safezoneH + safezoneY;
			w = 0.299062 * safezoneW;
			h = 0.407 * safezoneH;
			maxSatelliteAlpha = 0.75;
			alphaFadeStartScale = 1.15;
			alphaFadeEndScale = 1.29;
		};
	};
	
	class controls
	{	
		class SpawnPointList: EMonkeys_RscListNBox
		{
			idc = 38510;
			text = "";
			sizeEx = 0.041;
			font = PuristaMedium;
			coloumns[] = {0,0,0.9};
			colorBackground[] = {0.47,0.45,0,0.1};
			drawSideArrows = false;
			idcLeft = -1;
			idcRight = -1;
			rowHeight = 0.050;
			x = 0.285594 * safezoneW + safezoneX;
			y = 0.364 * safezoneH + safezoneY;
			w = 0.132906 * safezoneW;
			h = 0.359 * safezoneH;
			onLBSelChanged = "_this call EMonkeys_fnc_spawnPointSelected;";
		};
		
		class spawnButton : EMonkeys_RscButtonMenu
		{
			idc = -1;
			align = "center";
			font = PuristaMedium;
			onButtonClick = "[] call EMonkeys_fnc_spawnConfirm";
			colorBackground[] = {-1,-1,-1,-1};
			colorBackgroundFocused[] = {1,1,1,0.12};
			colorBackground2[] = {0.75,0.75,0.75,0.2};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,1};
			color2[] = {0,0,0,1};
			colorText[] = {1,1,1,1};
			colorDisabled[] = {0,0,0,0.4};
			x = 0.285594 * safezoneW + safezoneX;
			y = 0.725 * safezoneH + safezoneY;
			w = 0.132906 * safezoneW;
			h = 0.039 * safezoneH;
		};
	};
};