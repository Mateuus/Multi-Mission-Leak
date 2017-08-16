class XY_dialog_spawnSelection {

	idd = 38500;
	movingEnabled = false;
	enableSimulation = true;
	
	class controlsBackground
	{
		class XY_RscTitleBackground : XY_RscText
		{
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
			idc = -1;
			x = 0.29375 * safezoneW + safezoneX;
			y = 0.225 * safezoneH + safezoneY;
			w = 0.4125 * safezoneW;
			h = 0.044 * safezoneH;
		};
		
		class MainBackground : XY_RscText
		{
			colorBackground[] = {0.4,0.4,0.4,0.3};
			idc = -1;
			x = 0.29375 * safezoneW + safezoneX;
			y = 0.269 * safezoneH + safezoneY;
			w = 0.4125 * safezoneW;
			h = 0.506 * safezoneH;
		};
		
		class Title : XY_RscTitle
		{
			colorBackground[] = {0,0,0,0};
			idc = -1;
			text = "$STR_Spawn_Title";
			x = 0.29375 * safezoneW + safezoneX;
			y = 0.225 * safezoneH + safezoneY;
			w = 0.0979687 * safezoneW;
			h = 0.044 * safezoneH;
		};
		
		class SpawnPointTitle : Title
		{
			idc = 38501;
			style = 1;
			text = "";
			x = 0.443281 * safezoneW + safezoneX;
			y = 0.225 * safezoneH + safezoneY;
			w = 0.262969 * safezoneW;
			h = 0.044 * safezoneH;

		};
		
		class MapView : XY_RscMapControl 
		{
			idc = 38502;
			x = 0.419782 * safezoneW + safezoneX;
			y = 0.291 * safezoneH + safezoneY;
			w = 0.277187 * safezoneW;
			h = 0.473 * safezoneH;
			maxSatelliteAlpha = 0.75;//0.75;
			alphaFadeStartScale = 1.15;//0.15;
			alphaFadeEndScale = 1.29;//0.29;
		};
	};
	
	class controls
	{	
		class SpawnPointList: XY_RscListNBox
		{
			idc = 38510;
			text = "";
			sizeEx = 0.041;
			coloumns[] = {0,0,0.9};
			drawSideArrows = false;
			idcLeft = -1;
			idcRight = -1;
			rowHeight = 0.050;
			x = 0.304062 * safezoneW + safezoneX;
			y = 0.291 * safezoneH + safezoneY;
			w = 0.109531 * safezoneW;
			h = 0.4202 * safezoneH;
			onLBSelChanged = "_this call XY_fnc_spawnPointSelected;";
		};
		
		class spawnButton : XY_RscButtonMenu
		{
			idc = -1;
			type = 1;
			style = "0x02";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			text = "Spawn";
			onButtonClick = "[] call XY_fnc_spawnConfirm";
			x = 0.304062 * safezoneW + safezoneX;
			y = 0.72 * safezoneH + safezoneY;
			w = 0.109531 * safezoneW;
			h = 0.044 * safezoneH;
			colorBackgroundActive[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.69])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.75])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.5])",1};
			colorBackgroundDisabled[] = {0.95,0.95,0.95,0};
			offsetX = 0.003;
			offsetY = 0.003;
			offsetPressedX = 0.002;
			offsetPressedY = 0.002;
			colorShadow[] = {0,0,0,1};
			colorBorder[] = {0,0,0,0};
			borderSize = 0.008;
		};
	};
};