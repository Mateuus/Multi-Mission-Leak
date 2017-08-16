class life_wanted_menu {
	idd = 2400;
	name= "life_wanted_menu";
	movingEnable = false;
	enableSimulation = true;
	//onLoad = "[] spawn life_fnc_wantedadd2;";

	class controlsBackground {
		class tabletv3: Life_RscPicture {
			text = "textures\tablet\tabletv3.paa";
			idc = -1;
			x = 0.242187 * safezoneW + safezoneX;
			y = 0.104 * safezoneH + safezoneY;
			w = 0.515625 * safezoneW;
			h = 0.847 * safezoneH;
		};
	};

	class controls {
		class Title: Life_RscTitle {
			colorBackground[] = {0, 0, 0, 0};
			idc = -1;
			text = "$STR_Wanted_Title";
			x = 0.319531 * safezoneW + safezoneX;
			y = 0.357 * safezoneH + safezoneY;
			w = 0.299062 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class WantedConnection: Title {
			idc = 2404;
			style = 1;
			text = "";
			x = 0.319531 * safezoneW + safezoneX;
			y = 0.357 * safezoneH + safezoneY;
			w = 0.340312 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class WantedList: Life_RscListBox {
			idc = 2401;
			text = "";
			sizeEx = 0.035;
			onLBSelChanged = "[] spawn life_fnc_wantedGrab";
			x = 0.324687 * safezoneW + safezoneX;
			y = 0.434 * safezoneH + safezoneY;
			w = 0.103125 * safezoneW;
			h = 0.187 * safezoneH;
		};

		class PlayerList: Life_RscListBox {
			idc = 2406;
			text = "";
			sizeEx = 0.035;
			//colorBackground[] = {0,0,0,0};
			onLBSelChanged = "";
			x = 0.443281 * safezoneW + safezoneX;
			y = 0.434 * safezoneH + safezoneY;
			w = 0.0979687 * safezoneW;
			h = 0.22 * safezoneH;
		};

		class WantedDetails: Life_RscListBox {
			idc = 2402;
			text = "";
			sizeEx = 0.035;
			colorBackground[] = {0, 0, 0, 0};
			x = 0.546406 * safezoneW + safezoneX;
			y = 0.665 * safezoneH + safezoneY;
			w = 0.134062 * safezoneW;
			h = 0.077 * safezoneH;
		};

		class BountyPrice: Life_RscText	{
			idc = 2403;
			text = "";
			x = 0.319531 * safezoneW + safezoneX;
			y = 0.676 * safezoneH + safezoneY;
			w = 0.221719 * safezoneW;
			h = 0.044 * safezoneH;
		};

		class WantedAddL: Life_RscCombo	{
			idc = 2407;
			x = 0.556719 * safezoneW + safezoneX;
			y = 0.434 * safezoneH + safezoneY;
			w = 0.0979687 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class CloseButtonKey: Life_RscButtonMenu {
			idc = -1;
			onButtonClick = "closeDialog 0;";
			x = 0.469062 * safezoneW + safezoneX;
			y = 0.797 * safezoneH + safezoneY;
			w = 0.0644531 * safezoneW;
			h = 0.022 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,0};
			colorActive[] = {0,0,0,0};
		};

		class PardonButtonKey: Life_RscButtonMenu {
			idc = 2405;
			text = "$STR_Wanted_Pardon";
			onButtonClick = "[] call life_fnc_pardon; closeDialog 0;";
			x = 0.345312 * safezoneW + safezoneX;
			y = 0.632 * safezoneH + safezoneY;
			w = 0.0644531 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0,1,0,0.8};
		};

		class ButtonWantedAdd: Life_RscButtonMenu {
			idc = 9800;
			//shortcuts[] = {0x00050000 + 2};
			text = "$STR_Wanted_Add";
			onButtonClick = "[] call life_fnc_wantedAddP;";
			x = 0.567031 * safezoneW + safezoneX;
			y = 0.632 * safezoneH + safezoneY;
			w = 0.0721875 * safezoneW;
			h = 0.022 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {1,0,0,0.8};
		};

		class wantedText: Life_RscText {
			idc = 1000;
			text = "$STR_Wanted_People";
			x = 0.319531 * safezoneW + safezoneX;
			y = 0.39 * safezoneH + safezoneY;
			w = 0.0979687 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class citizensText: Life_RscText {
			idc = 1001;
			text = "$STR_Wanted_Citizens";
			x = 0.438125 * safezoneW + safezoneX;
			y = 0.39 * safezoneH + safezoneY;
			w = 0.0773437 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class crimesText: Life_RscText {
			idc = 1002;
			text = "$STR_Wanted_Crimes";
			x = 0.551562 * safezoneW + safezoneX;
			y = 0.39 * safezoneH + safezoneY;
			w = 0.061875 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class RscFrame_1800: Life_RscFrame
		{
			idc = 1800;
			x = 0.319531 * safezoneW + safezoneX;
			y = 0.423 * safezoneH + safezoneY;
			w = 0.113437 * safezoneW;
			h = 0.242 * safezoneH;
		};

		class RscFrame_1801: Life_RscFrame
		{
			idc = 1801;
			x = 0.438125 * safezoneW + safezoneX;
			y = 0.423 * safezoneH + safezoneY;
			w = 0.108281 * safezoneW;
			h = 0.242 * safezoneH;
		};

		class RscFrame_1802: Life_RscFrame
		{
			idc = 1802;
			x = 0.551562 * safezoneW + safezoneX;
			y = 0.423 * safezoneH + safezoneY;
			w = 0.108281 * safezoneW;
			h = 0.242 * safezoneH;
		};
	};
};