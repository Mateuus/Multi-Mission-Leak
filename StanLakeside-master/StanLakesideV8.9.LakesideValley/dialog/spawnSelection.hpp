class life_spawn_selection
{
	idd = 38500;
	movingEnabled = false;
	enableSimulation = true;
	
	class controlsBackground
	{
		class screwxtreme: life_RscPicture
		{
			idc = 1200;
			text = "\CG_Client\textures\SpawnMenu.paa";
			x = 0.288594 * safezoneW + safezoneX;
			y = 0.203 * safezoneH + safezoneY;
			w = 0.417656 * safezoneW;
			h = 0.561 * safezoneH;
		};
		
		class Title : Life_RscTitle
		{
			colorBackground[] = {0,0,0,0};
			idc = -1;
			text = "$STR_Spawn_Title";
			x = 0 * safezoneW + safezoneX;
			y = 0 * safezoneH + safezoneY;
			w = 0 * safezoneW;
			h = 0 * safezoneH;
		};
		
		class SpawnPointTitle : Title
		{
			idc = 38501;
			style = 1;
			text = "";
		};
		
		class MapView : Life_RscMapControl 
		{
			idc = 38502;
			x = 0.394792 * safezoneW + safezoneX;
			y = 0.275 * safezoneH + safezoneY;
			w = 0.295937 * safezoneW;
			h = 0.403148 * safezoneH;
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
			x = 0.301042 * safezoneW + safezoneX;
			y = 0.299074 * safezoneH + safezoneY;
			w = 0.0855208 * safezoneW;
			h = 0.441111 * safezoneH;
			onLBSelChanged = "_this call life_fnc_spawnPointSelected;";
		};
		
		class spawnButton : Life_RscButtonSilent
		{
			idc = -1;
			text = "$STR_Spawn_Spawn";
			onButtonClick = "[] call life_fnc_spawnConfirm";
			x = 0.509375 * safezoneW + safezoneX;
			y = 0.691667 * safezoneH + safezoneY;
			w = 0.0777083 * safezoneW;
			h = 0.042037 * safezoneH;
		};
	};
};