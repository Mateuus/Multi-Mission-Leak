class life_spawn_selection
{
	idd = 38500;
	movingEnable = 0;
	enableSimulation = 1;

	class controlsBackground
	{
	
		class BGha: Life_RscPicture
		{
			idc = 38531;
			text = "textures\allgemein\bg.paa";
			x = -0.75;
			y = -0.5;
			w = 2.5;
			h = 2;
		};
		
		class Hintergrund: Life_RscPicture
		{
			idc = 38311;
			text = "textures\allgemein\spawnmenue.jpg";
			x = -0.25;
			y = -0.1;
			w = 1.5;
			h = 1.2;
		};
		
			class MapView : Life_RscMapControl 
		{
			idc = 38502;
				x = 0.513; y = 0.395;
				w = 0.45;
				h = 0.7 - (22 / 250);
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
			sizeEx = 0.055;
			coloumns[] = {0,0,0.9};
			drawSideArrows = 0;
			idcLeft = -1;
			idcRight = -1;
			rowHeight = 0.085;
			x = 0.329897 * safezoneW + safezoneX;//0.159687
			y = 0.440 * safezoneH + safezoneY;//290
			w = 0.1655463 * safezoneW;//0.0876563
			h = 0.45 * safezoneH;//0.33
			onLBSelChanged = "_this call life_fnc_spawnPointSelected;";
		};
		
		class spawnButton : Life_RscButtonMenu
		{
			idc = -1;
			colorBackground[] = {0.071,0.071,0.071,1};
			text = "          Spawn";
			onButtonClick = "[] call life_fnc_spawnConfirm";
			size = 0.055;
			x = 0.51; y = 1.02;
			w = (18.2 / 40);
			h = (1.5 / 25);
		};
	};
};