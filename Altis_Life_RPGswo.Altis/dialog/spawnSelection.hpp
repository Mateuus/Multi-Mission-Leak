class DWEV_spawn_selection
{
	idd = 38500;
	movingEnabled = false;
	enableSimulation = true;

	class controlsBackground
	{

		class DWEV_RscTitleBackground : DWEV_RscText
		{
		access = 0;
		colorBackground[] = {0,0,0,0};
		colorText[] = {1,1,1,0.7};
		deletable = 0;
		fade = 0;
		fixedWidth = 0;
		font = "TahomaB";
		idc = -1;
		lineSpacing = 0;
		shadow = 0;
		sizeEx = 0;
		style = 48;
		text="textures\Wolflogo\spawn-menu.paa";
		tooltipColorBox[] = {1,1,1,1};
		tooltipColorShade[] = {0,0,0,0.65};
		tooltipColorText[] = {1,1,1,1};
		type = 0;
		h = "safezoneH";
		w = "safezoneWAbs";
		x = "safezoneXAbs";
		y = "safezoneY";
		};

		class Title : DWEV_RscTitle
		{
			colorBackground[] = {1,1,1,0.05};
			idc = -1;
			text = "Spawnpunkt";
			x = 0.05;
			y = 0.27;
			w = 0.9;
			h = (1 / 25);
		};

		class SpawnPointTitle : Title
		{
			idc = 38501;
			style = 1;
			text = "";
		};

		class MapView : DWEV_RscMapControl
		{
			idc = 38502;
			x = 0.378;
			y = 0.33;
			w = 0.56;
			h = 0.56 - (22 / 250);
			maxSatelliteAlpha = 0.75;//0.75;
			alphaFadeStartScale = 1.15;//0.15;
			alphaFadeEndScale = 1.29;//0.29;
		};

		class SpawnInfoText: DWEV_RscStructuredText
		{
			idc = 38503;
			text = "";
			x = 0.05;
			y = 0.82;
			w = 0.9;
			h = (5 / 25);
			colorText[] = {1,1,1,0.7};
			colorBackground[] = {1,1,1,0.08};
		};

	};

	class controls
	{
		class SpawnPointList: DWEV_RscListNBox
		{
			idc = 38510;
			text = "";
			sizeEx = 0.041;
			coloumns[] = {0,0,0.9};
			drawSideArrows = false;
			idcLeft = -1;
			idcRight = -1;
			rowHeight = 0.050;
			x = 0.05;
			y = 0.33;
			w = (11 / 40);
			h = (9 / 25);
			onLBSelChanged = "_this call DWEV_fnc_spawnPointSelected;";
		};

		class spawnButton : DWEV_RscButtonMenu
		{
			idc = 38511;
//			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			colorBackground[] = {0, 0.1, 0, 0.9};
			text = "Spawn";
			onButtonClick = "[] call DWEV_fnc_spawnConfirm";
			x = 0.05;
			y = 0.71;
			w = (11 / 40);
			h = (1 / 25);
		};

		class cancelButton : DWEV_RscButtonMenu
		{
			idc = -1;
//			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			colorBackground[] = {0.1, 0, 0, 0.9};
			text = "Abbrechen";
			onButtonClick = "closeDialog 0; disableUserInput true;['cancelButton',false,true] call BIS_fnc_endMission;";
			x = 0.05;
			y = 0.76;
			w = (11 / 40);
			h = (1 / 25);
		};
	};
};
