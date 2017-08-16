class Life_Clothing {
	idd = 3100;
	name= "Life_Clothing";
	movingEnable = true;
	enableSimulation = true;
	//onLoad = "[] execVM 'core\client\keychain\init.sqf'";
	
	class controlsBackground {

		class Background: Life_RscText
		{
			idc = -1;

			x = 0.278281 * safezoneW + safezoneX;
			y = 0.258 * safezoneH + safezoneY;
			w = 0.185625 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0.1,0.1,0.1,1};
		};

		class Mainbackground: Life_RscText
		{
			idc = -1;

			x = 0.278281 * safezoneW + safezoneX;
			y = 0.28 * safezoneH + safezoneY;
			w = 0.185625 * safezoneW;
			h = 0.473 * safezoneH;
			colorBackground[] = {0,0,0,0.9};
		};
	};
	
	class controls {	


		class ShopTitle: Life_RscTitle
		{
			idc = 3103;	
			text = "Clothing Shop";
			x = 0.278281 * safezoneW + safezoneX;
			y = 0.258 * safezoneH + safezoneY;
			w = 0.159844 * safezoneW;
			h = 0.022 * safezoneH;
			colorText[] = {0.95,0.95,0.95,1};
		};
		class itemList: Life_RscListBox
		{
			idc = 3101;
			onLBSelChanged = "[_this] call life_fnc_changeClothes;";
			rowHeight = 0.1;
			sizeEx = 0.03;
			x = 0.283437 * safezoneW + safezoneX;
			y = 0.291 * safezoneH + safezoneY;
			w = 0.175313 * safezoneW;
			h = 0.396 * safezoneH;
			colorBackground[] = {0.4,0.4,0.4,0.3};
		};

		class ButtonBuy: Life_RscButtonMenu
		{
			idc = -1;
			text = "$STR_Global_Buy";
			onButtonClick = "[] call life_fnc_buyClothes;";
			x = 0.283437 * safezoneW + safezoneX;
			y = 0.72 * safezoneH + safezoneY;
			w = 0.0721875 * safezoneW;
			h = 0.022 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,0.9};
		};

		class itemCostLabel: Life_RscStructuredText
		{
			idc = 3102;

			x = 0.283437 * safezoneW + safezoneX;
			y = 0.6925 * safezoneH + safezoneY;
			w = 0.175313 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0.4,0.4,0.4,0.3};
		};
		class itemCostLabelTotal: Life_RscStructuredText
		{
			idc = 3106;

			x = 0.357343 * safezoneW + safezoneX;
			y = 0.692555 * safezoneH + safezoneY;
			w = 0.0979687 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0.4,0.4,0.4,0};
		};

		
		class buttonFilter: Life_RscButtonMenuIcon
		{
			onButtonClick = "[0,0] call life_fnc_clothingFilterShop";

			idc = -1;
			text = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\uniform_ca.paa"; //--- ToDo: Localize;
			x = 0.463385 * safezoneW + safezoneX;
			y = 0.291 * safezoneH + safezoneY;
			w = 0.020625 * safezoneW;
			h = 0.033 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {-1,-1,-1,0.9};
			tooltip = "Outfits"; //--- ToDo: Localize;
		};
		class buttonFilter1: Life_RscButtonMenuIcon
		{
			onButtonClick = "[0,1] call life_fnc_clothingFilterShop";

			idc = -1;
			text = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\headgear_ca.paa"; //--- ToDo: Localize;
			x = 0.463385 * safezoneW + safezoneX;
			y = 0.324 * safezoneH + safezoneY;
			w = 0.020625 * safezoneW;
			h = 0.033 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {-1,-1,-1,0.9};
			tooltip = "Headgear"; //--- ToDo: Localize;
		};
		class buttonFilter2: Life_RscButtonMenuIcon
		{
			onButtonClick = "[0,2] call life_fnc_clothingFilterShop";

			idc = -1;
			text = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\goggles_ca.paa"; //--- ToDo: Localize;
			x = 0.463385 * safezoneW + safezoneX;
			y = 0.357 * safezoneH + safezoneY;
			w = 0.020625 * safezoneW;
			h = 0.033 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {-1,-1,-1,0.9};
			tooltip = "Facewear"; //--- ToDo: Localize;
		};
		class buttonFilter3: Life_RscButtonMenuIcon
		{
			onButtonClick = "[0,3] call life_fnc_clothingFilterShop";

			idc = -1;
			text = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\vest_ca.paa"; //--- ToDo: Localize;
			x = 0.463385 * safezoneW + safezoneX;
			y = 0.39 * safezoneH + safezoneY;
			w = 0.020625 * safezoneW;
			h = 0.033 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {-1,-1,-1,0.9};
			tooltip = "Vests"; //--- ToDo: Localize;
		};
		class buttonFilter4: Life_RscButtonMenuIcon
		{
			onButtonClick = "[0,4] call life_fnc_clothingFilterShop";

			idc = -1;
			text = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\backpack_ca.paa"; //--- ToDo: Localize;
			x = 0.463385 * safezoneW + safezoneX;
			y = 0.423 * safezoneH + safezoneY;
			w = 0.020625 * safezoneW;
			h = 0.033 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {-1,-1,-1,0.9};
			tooltip = "Backpacks"; //--- ToDo: Localize;
		};
		
		class ButtonClose: Life_RscButtonMenuIcon
		{
			onButtonClick = "closeDialog 0;";

			idc = -1;
			x = 0.463385 * safezoneW + safezoneX;
			y = 0.258 * safezoneH + safezoneY;
			w = 0.0129167 * safezoneW;
			h = 0.022926 * safezoneH;


			colorText[] = {1,1,1,1};
			colorBackground[] = {0.1,0.1,0.1,1};
			tooltip = "Close"; //--- ToDo: Localize;
			text = "a3\ui_f\data\gui\Rsc\RscDisplayArcadeMap\icon_exit_cross_ca.paa";
		};


	};
};