class life_weapon_shop {
	idd = 38400;
	movingEnable = 0;
	enableSimulation = 1;

	class controlsBackground {
		class RscTitleBackground: Life_RscText {
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
			idc = -1;
			x = 0.0514062 * safezoneW + safezoneX;
			y = 0.269 * safezoneH + safezoneY;
			w = 0.154687 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class MainBackground: Life_RscText {
			colorBackground[] = {0,0,0,0.7};
			idc = -1;
			x = 0.0514057 * safezoneW + safezoneX;
			y = 0.291 * safezoneH + safezoneY;
			w = 0.154687 * safezoneW;
			h = 0.506 * safezoneH;
		};

		class Title: Life_RscTitle {
			colorBackground[] = {0,0,0,0};
			idc = 38401;
			text = "";
			x = 0.0514062 * safezoneW + safezoneX;
			y = 0.269 * safezoneH + safezoneY;
			w = 0.132 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class itemInfo: Life_RscStructuredText {
			idc = 38404;
			text = "";
			sizeEx = 0.035;
			x = 0.0565625 * safezoneW + safezoneX;
			y = 0.643 * safezoneH + safezoneY;
			w = 0.144375 * safezoneW;
			h = 0.066 * safezoneH;
		};

		class FilterList: Life_RscCombo {
			idc = 38402;
			onLBSelChanged = "_this call life_fnc_weaponShopFilter";
			x = 0.0565625 * safezoneW + safezoneX;
			y = 0.599 * safezoneH + safezoneY;
			w = 0.144375 * safezoneW;
			h = 0.022 * safezoneH;
		};
	};

	class controls {
		class itemList: Life_RscListBox {
			idc = 38403;
			onLBSelChanged = "_this call life_fnc_weaponShopSelection";
			sizeEx = 0.035;
			x = 0.0565625 * safezoneW + safezoneX;
			y = 0.302 * safezoneH + safezoneY;
			w = 0.144375 * safezoneW;
			h = 0.286 * safezoneH;
		};

		class ButtonBuySell: Life_RscButtonMenu {
			idc = 38405;
			text = "$STR_Global_Buy";
			onButtonClick = "[] spawn life_fnc_weaponShopBuySell; true";
			x = 0.0565625 * safezoneW + safezoneX;
			y = 0.731 * safezoneH + safezoneY;
			w = 0.0670312 * safezoneW;
			h = 0.022 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,0.8};

		};

		class ButtonClose: Life_RscButtonMenu {
			idc = -1;
			text = "$STR_Global_Close";
			onButtonClick = "closeDialog 0;";
			x = 0.133906 * safezoneW + safezoneX;
			y = 0.731 * safezoneH + safezoneY;
			w = 0.0670312 * safezoneW;
			h = 0.022 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {1,0,0,0.8};
		};

		class ButtonMags: Life_RscButtonMenu {
			idc = 38406;
			text = "Magazine";
			onButtonClick = "_this call life_fnc_weaponShopMags; _this call life_fnc_weaponShopFilter";
			x = 0.0565625 * safezoneW + safezoneX;
			y = 0.764 * safezoneH + safezoneY;
			w = 0.0670312 * safezoneW;
			h = 0.022 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,0.8};
		};

		class ButtonAccs: Life_RscButtonMenu {
			idc = 38407;
			text = "Aufsaetze";
			onButtonClick = "_this call life_fnc_weaponShopAccs; _this call life_fnc_weaponShopFilter";
			x = 0.133906 * safezoneW + safezoneX;
			y = 0.764 * safezoneH + safezoneY;
			w = 0.0670312 * safezoneW;
			h = 0.022 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,0.8};
		};
	};
};