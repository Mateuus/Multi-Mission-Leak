class einsatzzentrale {

	idd = 8100;
	movingEnable = 0;
	enableSimulation = 1;
	onLoad = "[0] spawn life_fnc_einsatzzentrale;";

	class controlsBackground {

		class background: Life_RscText
		{
			idc = -1;
			x = 0.195781 * safezoneW + safezoneX;
			y = 0.225 * safezoneH + safezoneY;
			w = 0.603281 * safezoneW;
			h = 0.506 * safezoneH;
			colorBackground[] = {0,0,0,0.7};
		};

		class topbar: Life_RscText
		{
			idc = -1;
			x = 0.283437 * safezoneW + safezoneX;
			y = 0.291 * safezoneH + safezoneY;
			w = 0.510469 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0,0,0,0.3};
		};

		class sidebar: Life_RscText
		{
			idc = -1;
			x = 0.200937 * safezoneW + safezoneX;
			y = 0.291 * safezoneH + safezoneY;
			w = 0.0825 * safezoneW;
			h = 0.429 * safezoneH;
			colorBackground[] = {0,0,0,0.3};
		};

		class frame: Life_RscFrame
		{
			idc = -1;
			x = 0.195781 * safezoneW + safezoneX;
			y = 0.225 * safezoneH + safezoneY;
			w = 0.603281 * safezoneW;
			h = 0.506 * safezoneH;
			colorText[] = {0,0,1,1};
		};

		class maintitle: Life_RscText
		{
			idc = -1;
			text = "Einsatzzentrale";
			x = 0.200937 * safezoneW + safezoneX;
			y = 0.236 * safezoneH + safezoneY;
			w = 0.592969 * safezoneW;
			h = 0.044 * safezoneH;
			colorBackground[] = {0,0.2,0.5,0.5};
		};

		class uhrzeittitle: Life_RscText
		{
			idc = 1007;
			text = "Uhrzeit";
			x = 0.613438 * safezoneW + safezoneX;
			y = 0.291 * safezoneH + safezoneY;
			w = 0.0773437 * safezoneW;
			h = 0.022 * safezoneH;
			colorText[] = {1,1,1,1};
			sizeEx = 1 * GUI_GRID_H;
		};

		class opfertitlea: Life_RscText
		{
			idc = -1;
			text = "Opfer";
			x = 0.448438 * safezoneW + safezoneX;
			y = 0.291 * safezoneH + safezoneY;
			w = 0.0979687 * safezoneW;
			h = 0.022 * safezoneH;
			colorText[] = {1,1,1,1};
			sizeEx = 1 * GUI_GRID_H;
		};

		class falltitlea: Life_RscText
		{
			idc = -1;
			text = "Fall";
			x = 0.288594 * safezoneW + safezoneX;
			y = 0.291 * safezoneH + safezoneY;
			w = 0.154687 * safezoneW;
			h = 0.022 * safezoneH;
			colorText[] = {1,1,1,1};
			sizeEx = 1 * GUI_GRID_H;
		};

		class orttitle: Life_RscText
		{
			idc = -1;
			text = "Ort";
			x = 0.551562 * safezoneW + safezoneX;
			y = 0.291 * safezoneH + safezoneY;
			w = 0.0567187 * safezoneW;
			h = 0.022 * safezoneH;
			colorText[] = {1,1,1,1};
			sizeEx = 1 * GUI_GRID_H;
		};

		class zuteilungtitle: Life_RscText
		{
			idc = -1;
			text = "Zugeteilt";
			x = 0.695937 * safezoneW + safezoneX;
			y = 0.291 * safezoneH + safezoneY;
			w = 0.0979687 * safezoneW;
			h = 0.022 * safezoneH;
			colorText[] = {1,1,1,1};
			sizeEx = 1 * GUI_GRID_H;
		};
	};

	class controls {

		class falllistbox: Life_RscListNbox
		{
			idc = 8101;
			idcLeft = -1;
			idcRight = -1;
			text = "";
			sizeEx = 0.033;
			onLBselChanged = "[3] call life_fnc_einsatzzentrale;";
			x = 0.288594 * safezoneW + safezoneX;
			y = 0.324 * safezoneH + safezoneY;
			w = 0.505313 * safezoneW;
			h = 0.396 * safezoneH;
			colorBackground[] = {0,0,0,0.7};
			columns[] = {0,0.31,0.515,0.64,0.8};
			drawSideArrows = false;
			rowHeight = 0.038;
			colorSelectBackground[] = {0.5,0.5,0.5,0.2};
			colorSelectBackground2[] = {0.5,0.5,0.5,0.1};
			colorSelect[] = {1,1,1,1};
			colorSelect2[] = {1,1,1,1};
		};

		class satellite: Life_RscMapControl
		{
			idc = 8102;
			maxSatelliteAlpha = 0.75;//0.75;
			alphaFadeStartScale = 1.15;//0.15;
			alphaFadeEndScale = 1.29;//0.29;
			x = 0.206094 * safezoneW + safezoneX;
			y = 0.302 * safezoneH + safezoneY;
			w = 0.0721875 * safezoneW;
			h = 0.099 * safezoneH;
		};

		class btnkill: Life_RscButtonMenu
		{
			idc = -1;
			text = "Löschen";
			onButtonClick = "[2] spawn life_fnc_einsatzzentrale;";
			x = 0.206094 * safezoneW + safezoneX;
			y = 0.467 * safezoneH + safezoneY;
			w = 0.0721875 * safezoneW;
			h = 0.033 * safezoneH;
		};

		class btnzuteilung: Life_RscButtonMenu
		{
			idc = -1;
			text = "Zuteilen";
			onButtonClick = "[1] spawn life_fnc_einsatzzentrale;";
			x = 0.206094 * safezoneW + safezoneX;
			y = 0.423 * safezoneH + safezoneY;
			w = 0.0721875 * safezoneW;
			h = 0.033 * safezoneH;
		};

		class protocolbtn: Life_RscButtonMenu
		{
			idc = 8103;
			text = "Protokoll";
			onButtonClick = "createdialog 'protocol'";
			x = 0.206094 * safezoneW + safezoneX;
			y = 0.511 * safezoneH + safezoneY;
			w = 0.0721875 * safezoneW;
			h = 0.033 * safezoneH;
		};

		class btnclose: Life_RscButtonMenu
		{
			idc = -1;
			text = "Schliessen";
			onButtonClick = "closedialog 0";
			x = 0.206094 * safezoneW + safezoneX;
			y = 0.676 * safezoneH + safezoneY;
			w = 0.0721875 * safezoneW;
			h = 0.033 * safezoneH;
		};
	};
};