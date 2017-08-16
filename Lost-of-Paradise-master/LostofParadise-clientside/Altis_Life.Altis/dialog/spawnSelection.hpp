class life_spawn_selection
{
	idd = 38500;
	movingEnabled = false;
	enableSimulation = true;
	
	class controlsBackground
	{
		
		class Hintergrund: Life_RscPicture
		{
			idc = 38511;
			text = "textures\spawnmenu\spawnmenu.paa";
			x = 0;
			y = 0;
			w = 1;
			h = 1;
		};
		
		class Title : Life_RscTitle
		{
			colorBackground[] = {0,0,0,0};
			idc = -1;
			text = "$STR_Spawn_Title";
			x = 0.075; 
			y = 0.26;
			w = 0.2625; 
			h = 0.04;
		};
		
		class SpawnPointTitle : Title
		{
			idc = 38501;
			style = 1;
			text = "";
			x = 0.3625; 
			y = 0.26;
			w = 0.55; 
			h = 0.04;
		};
		
		class MapView : Life_RscMapControl 
		{
			idc = 38502;
			colorBackground[] = {0.47,0.45,0,0.1};
			x = 0.3625; 
			y = 0.32;
			w = 0.55;
			h = 0.42;
			maxSatelliteAlpha = 0.75;
			alphaFadeStartScale = 1.15;
			alphaFadeEndScale = 1.29;
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
			colorBackground[] = {0.47,0.45,0,0.1};
			drawSideArrows = false;
			idcLeft = -1;
			idcRight = -1;
			rowHeight = 0.050;
			x = 0.075; 
			y = 0.32;
			w = 0.2625;
			h = 0.42;
			onLBSelChanged = "_this call life_fnc_spawnPointSelected;";
		};
		
		class spawnButton : Life_RscButtonMenu
		{
			idc = -1;
			colorBackground[] = {0.51,0.51,0.51,1};
			text = "Spawn";
			align = "center";
			onButtonClick = "[] call life_fnc_spawnConfirm";
			x = 0.3625; 
			y = 0.76;
			w = 0.55;
			h = 0.04;
		};
	};
};