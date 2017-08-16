class life_spawn_selection
{
	idd = 38500;
	movingEnabled = 0;
	enableSimulation = 1;
	class controlsBackground
	{
		class MainBackground : Life_RscText
		{
			colorBackground[] = {0.067,0.067,0.067,1};
			idc = -1;
			x = 0; y = 0.1;
			w = 1; h = 0.8;
		};			
		class MapView : Life_RscMapControl 
		{
			idc = 38502;
			x = 0.4; 
			y = 0.1 + 0.02;
			w = 0.6 - 0.02;
			h = 0.8 - 0.04;
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
			drawSideArrows = 0;
			idcLeft = -1;
			idcRight = -1;
			rowHeight = 0.055;
			x = 0 + 0.01; 
			y = 0.1 + 0.02;
			w = 0.38;
			h = 0.65;
			onLBSelChanged = "_this call life_fnc_spawnPointselected;";
		};
		
		class spawnButton : Life_RscButtonMenu
		{
			idc = -1;
			colorBackground[] = {0,0.59,0.04,1};
			text = "CONFIRMER";
			onButtonClick = "[] call life_fnc_spawnConfirm";
			x = 0.02; 
			y = 0.765;
			w = 0.36;
			h = 0.05;
			 class Attributes 
            {
                align = "center";
            };    
		};
		class closeButton : Life_RscButtonMenu
		{
			idc = -1;
			colorBackground[] = {0.69,0.14,0,1};
			text = "ANNULER";
			onButtonClick = "[] call BIS_fnc_endMission; closeDialog 0;";
			x = 0.02; 
			y = 0.83;
			w = 0.36;
			h = 0.05;
			 class Attributes 
            {
                align = "center";
            };    
		};
	};
};