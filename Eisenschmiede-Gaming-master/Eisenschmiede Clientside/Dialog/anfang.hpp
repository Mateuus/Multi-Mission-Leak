class ES_anfangmenu
{
	idd = 556789;
	movingEnable = true;
	enableSimulation = 1;
 
	class controlsBackground
	{
		class BG: ES_RscPicture
		{
			idc = -1;
			text = "images\Logos\menu_logo2.jpg";
			x = 0.29375 * safezoneW + safezoneX;
			y = 0.17 * safezoneH + safezoneY;
			w = 0.6 * safezoneW;
			h = 0.055 * safezoneH;
		};

		class MainBackground: ES_RscText
		{
			idc = -1;
			x = 0.294271 * safezoneW + safezoneX;
			y = 0.228592 * safezoneH + safezoneY;
			w = 0.6 * safezoneW;
			h = 0.539 * safezoneH;
			colorBackground[] = {0,0,0,0.7};
		};

		class Title: ES_RscTitle
		{
			idc = 1342;
			text = "Eisenschmiede Infos"; //--- ToDo: Localize;
			x = 0.298906 * safezoneW + safezoneX;
			y = 0.17 * safezoneH + safezoneY;
			w = 0.293906 * safezoneW;
			h = 0.055 * safezoneH;
			colorBackground[] = {-1,-1,-1,0};
			sizeEx =  0.05;
		};
	};

    class controls
	{
		class contentcontrols: ES_RscControlsGroup
		{
			idc = -1;
			x = 0.438125 * safezoneW + safezoneX;
			y = 0.258 * safezoneH + safezoneY;
			w = 0.455 * safezoneW;
			h = 0.5 * safezoneH;
			/*
			class ES_RscScrollBar
			{
				color[] = {1, 1, 1, 1};
		 		width = 0.021;
		 		autoScrollSpeed = -1;
		 		autoScrollDelay = 5;
		 		autoScrollRewind = 0;
			};
			*/

			class Controls
			{
				class Content: ES_RscStructuredText
				{
					idc = 121212;
					text = "";
					x = 0;
					y = 0;
					//x = 0.438125 * safezoneW + safezoneX;
					//y = 0.258 * safezoneH + safezoneY;
					w = 0.45 * safezoneW;
					h = 3 * safezoneH;
					sizeEx = 0.04;
					colorBackground[] = {-1,-1,-1,0};
				};
			};
		};

		class SelContant: ES_RscListbox
		{
			idc = 1997;
			onLBSelChanged = "[] call ES_fnc_anfang;";
			x = 0.298906 * safezoneW + safezoneX;
			y = 0.258 * safezoneH + safezoneY;
			w = 0.134062 * safezoneW;
			h = 0.418 * safezoneH;
			sizeEx = 0.03;
			colorBackground[] = {-1,-1,-1,0};
			colorActive[] = {-1,-1,-1,1};
		};

		class CloseButtonKey: ES_RscButtonMenu
		{
		idc = -1;
		text = "$STR_Global_Close";
		onButtonClick = "closeDialog 0;";

		x = 0.293229 * safezoneW + safezoneX;
		y = 0.774944 * safezoneH + safezoneY;
		w = 0.111927 * safezoneW;
		h = 0.032074 * safezoneH;
		tooltip = "Schließen";
		};
	};
};