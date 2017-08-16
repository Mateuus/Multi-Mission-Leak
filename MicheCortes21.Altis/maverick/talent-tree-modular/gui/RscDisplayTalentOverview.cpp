class TTM_GUI_RscDisplayTalentOverview {
    idd = 6600;
    movingEnable = 0;
    enableSimulation = 1;
    scriptPath = "maverick\talent-tree-modular\gui\RscDisplayTalentOverview.sqf";
    onLoad = "[_this, 'onLoad'] spawn TTM_GUI_master_script;";

    class controls {
		class RscText_1000: Life_RscText
		{
			idc = -1;

			x = 0.298906 * safezoneW + safezoneX;
			y = 0.291 * safezoneH + safezoneY;
			w = 0.402187 * safezoneW;
			h = 0.473 * safezoneH;
			colorBackground[] = {0.12,0.14,0.16,0.8};
		};
		class RscText_1001: Life_RscText
		{
			idc = -1;
			x = 0.298906 * safezoneW + safezoneX;
			y = 0.236 * safezoneH + safezoneY;
			w = 0.04125 * safezoneW;
			h = 0.066 * safezoneH;
			colorBackground[] = {0.99,0.49,0,1};
		};
		class RscText_1003: Life_RscText
		{
			idc = -1;
			x = 0.340156 * safezoneW + safezoneX;
			y = 0.291 * safezoneH + safezoneY;
			w = 0.360937 * safezoneW;
			h = 0.011 * safezoneH;
			colorBackground[] = {1,1,1,1};
		};
		class textCurrentRank: Life_RscStructuredText
		{
			idc = 3;
			text = ""; //--- ToDo: Localize;
			x = 0.298906 * safezoneW + safezoneX;
			y = 0.236 * safezoneH + safezoneY;
			w = 0.04125 * safezoneW;
			h = 0.066 * safezoneH;
			sizeEx = 2.7 * 0.04;
		};
		class RscText_1002: Life_RscText
		{
			idc = -1;
			x = 0.340156 * safezoneW + safezoneX;
			y = 0.236 * safezoneH + safezoneY;
			w = 0.360937 * safezoneW;
			h = 0.066 * safezoneH;
			//colorBackground[] = {0.98,0.74,0.1,1};
			colorBackground[] = {1,1,1,0.5};
		};
		class textRankName: Life_RscText
		{
			idc = 4;
			text = ""; //--- ToDo: Localize;
			x = 0.343156 * safezoneW + safezoneX;
			y = 0.245 * safezoneH + safezoneY;
			w = 0.1979687 * safezoneW;
			h = 0.022 * safezoneH;
			sizeEx = 1.5 * 0.04;
			shadow = 0;
		};
		class textStatusInfo: Life_RscText
		{
			idc = 5;
			text = ""; //--- ToDo: Localize;
			x = 0.343156 * safezoneW + safezoneX;
			y = 0.2655 * safezoneH + safezoneY;
			w = 0.279687 * safezoneW;
			h = 0.022 * safezoneH;
			shadow = 0;
		};
		class RscText_1700: Life_RscText
		{
			idc = -1;
			x = 0.340156 * safezoneW + safezoneX;
			y = 0.291 * safezoneH + safezoneY;
			w = 0.360937 * safezoneW;
			h = 0.011 * safezoneH;
    		colorBackground[] = {1,1,1,1};
		};
		class progressRankProgress: Life_RscProgress
		{
			idc = 6;
			x = 0.340156 * safezoneW + safezoneX;
			y = 0.291 * safezoneH + safezoneY;
			w = 0.360937 * safezoneW;
			h = 0.011 * safezoneH;
			colorFrame[] = {0,0,0,0};
    		colorBackground[] = {0,0,0,0};
   	 		colorBar[] = {0.99,0.49,0,1};
		};
		class treeSkillsOverview
		{
			onTreeSelChanged = "[_this, 'onTreeSelectionChanged'] spawn TTM_GUI_master_script;";

			idc = 7;
			type = 12;
			default = 0;
			style = 2;
			blinkingPeriod = 0;
			x = 0.304062 * safezoneW + safezoneX;
			y = 0.313 * safezoneH + safezoneY;
			w = 0.180469 * safezoneW;
			h = 0.44 * safezoneH;
			colorBackground[] = {0,0,0,0.2};
			sizeEx = 0.04;

			picture = "";
			colorPicture[] = {1,1,1,1};
			colorPictureSelected[] = {1,1,1,1};
			colorPictureDisabled[] = {1,1,1,1};
			colorPictureRight[] = {1,1,1,1};
			colorPictureRightSelected[] = {1,1,1,1};
			colorPictureRightDisabled[] = {1,1,1,1};
			colorPictureLeft[] = {1,1,1,1};
			colorPictureLeftSelected[] = {1,1,1,1};
			colorPictureLeftDisabled[] = {1,1,1,1};

			font = "RobotoCondensed";

			rowHeight = 0.0439091;
		    color[] = {1, 1, 1, 1};
		    colorSelect[] = {0.7, 0.7, 0.7, 1};
		    colorSelectBackground[] = {0, 0, 0, 0.5};
		    colorBorder[] = {0, 0, 0, 0};
		    borderSize = 0;

			colorMarked[] = {1,0.5,0,0.5}; // Marked item fill color (when multiselectEnabled is 1)
			colorMarkedSelected[] = {1,0.5,0,1}; // Selected item fill color (when multiselectEnabled is 1)

			colorText[] = {1,1,1,1}; // Text color
			colorSelectText[] = {1,1,1,1}; // Selected text color (when multiselectEnabled is 0)
			colorMarkedText[] = {1,1,1,1}; // Selected text color (when multiselectEnabled is 1)

			tooltip = "CT_TREE"; // Tooltip text
			tooltipColorShade[] = {0,0,0,1}; // Tooltip background color
			tooltipColorText[] = {1,1,1,1}; // Tooltip text color
			tooltipColorBox[] = {1,1,1,1}; // Tooltip frame color

			multiselectEnabled = 1; // Allow selecting multiple items while holding Ctrl or Shift
			expandOnDoubleclick = 1; // Expand/collapse item upon double-click
			hiddenTexture = "\A3\ui_f\data\gui\rsccommon\rsctree\hiddenTexture_ca.paa"; // Expand icon
			expandedTexture = "\A3\ui_f\data\gui\rsccommon\rsctree\expandedTexture_ca.paa"; // Collapse icon
			maxHistoryDelay = 1; // Time since last keyboard type search to reset it

			// Scrollbar configuration
			class ScrollBar
			{
				width = 0; // width of ScrollBar
				height = 0; // height of ScrollBar
				scrollSpeed = 0.01; // scroll speed of ScrollBar

				arrowEmpty = "\A3\ui_f\data\gui\cfg\scrollbar\arrowEmpty_ca.paa"; // Arrow
				arrowFull = "\A3\ui_f\data\gui\cfg\scrollbar\arrowFull_ca.paa"; // Arrow when clicked on
				border = "\A3\ui_f\data\gui\cfg\scrollbar\border_ca.paa"; // Slider background (stretched vertically)
				thumb = "\A3\ui_f\data\gui\cfg\scrollbar\thumb_ca.paa"; // Dragging element (stretched vertically)

				color[] = {1,1,1,1}; // Scrollbar color
			};

			colorDisabled[] = {0,0,0,0}; // Does nothing, but must be present, otherwise an error is shown
			colorArrow[] = {0,0,0,0}; // Does nothing, but must be present, otherwise an error is shown
		};
		class textPerkName: Life_RscText
		{
			idc = 8;
			text = "PERK NAME"; //--- ToDo: Localize;
			x = 0.494844 * safezoneW + safezoneX;
			y = 0.324 * safezoneH + safezoneY;
			w = 0.220469 * safezoneW;
			h = 0.033 * safezoneH;
			sizeEx = 2 * 0.04;
			shadow = 2;
		};
		class textPerkSubtitle: Life_RscText
		{
			idc = 9;
			text = "PERK SUBTITLE"; //--- ToDo: Localize;
			x = 0.494844 * safezoneW + safezoneX;
			y = 0.357 * safezoneH + safezoneY;
			w = 0.165 * safezoneW;
			h = 0.022 * safezoneH;
			shadow = 2;
		};
		class textPerkDescription: Life_RscStructuredText
		{
			idc = 11;
			x = 0.494844 * safezoneW + safezoneX;
			y = 0.39 * safezoneH + safezoneY;
			w = 0.201094 * safezoneW;
			h = 0.33 * safezoneH;
			shadow = 2;
		};
		class RscButton_1600: Life_RscButtonMenu
		{
			idc = 10;
			text = "PURCHASE"; //--- ToDo: Localize;
			x = 0.608281 * safezoneW + safezoneX;
			y = 0.731 * safezoneH + safezoneY;
			w = 0.0876563 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0.12,0.14,0.16,1};
			onButtonClick = "[_this, 'onButtonPurchaseClick'] spawn TTM_GUI_master_script;";
			enabled = 0;

			class Attributes {
				align = "center";
			};
		};
    };
};