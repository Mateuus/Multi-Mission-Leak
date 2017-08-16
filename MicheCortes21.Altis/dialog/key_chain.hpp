class Life_key_management {
	idd = 2700;
	name= "life_key_chain";
	movingEnable = 0;
	enableSimulation = 1;
	onLoad = "[] spawn life_fnc_keyMenu;";

	class controlsBackground {
		class tabletv3: Life_RscPicture {
			idc = 1200;
			text = "textures\tablet\tabletv3.paa";
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
			text = "$STR_Keys_Title";
			x = 0.345312 * safezoneW + safezoneX;
			y = 0.324 * safezoneH + safezoneY;
			w = 0.309375 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class KeyChainList: Life_RscListBox {
			idc = 2701;
			text = "";
			sizeEx = 0.035;
			x = 0.350469 * safezoneW + safezoneX;
			y = 0.368 * safezoneH + safezoneY;
			w = 0.299062 * safezoneW;
			h = 0.176 * safezoneH;
		};

		class CloseButtonKey: Life_RscButtonMenu {
			idc = -1;
			text = "$STR_Global_Close";
			onButtonClick = "closeDialog 0;";
			x = 0.350469 * safezoneW + safezoneX;
			y = 0.643 * safezoneH + safezoneY;
			w = 0.0644531 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class NearPlayers: Life_RscCombo {
			idc = 2702;
			x = 0.422656 * safezoneW + safezoneX;
			y = 0.555 * safezoneH + safezoneY;
			w = 0.154687 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class DropKey: Life_RscButtonMenu {
			idc = -1;
			text = "$STR_Keys_DropKey";
			onButtonClick = "[] call life_fnc_keyDrop";
			x = 0.350469 * safezoneW + safezoneX;
			y = 0.555 * safezoneH + safezoneY;
			w = 0.0670312 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class GiveKey: Life_RscButtonMenu {
			idc = 2703;
			text = "$STR_Keys_GiveKey";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "[] call life_fnc_keyGive";
			x = 0.5825 * safezoneW + safezoneX;
			y = 0.555 * safezoneH + safezoneY;
			w = 0.0670312 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class RscFrame_1800: Life_RscFrame
		{
			idc = 1800;
			x = 0.345312 * safezoneW + safezoneX;
			y = 0.357 * safezoneH + safezoneY;
			w = 0.309375 * safezoneW;
			h = 0.319 * safezoneH;
		};
	};
};