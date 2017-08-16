class shops_menu {
	idd = 2400;
	name= "shops_menu";
	movingEnable = false;
	enableSimulation = true;
	//onLoad = "['guns'] execVM 'gear\switch.sqf'";
	
	class controlsBackground
	{
		class Background: EMonkeys_RscPicture
		{
			idc = -1;
			text = "core\textures\menu_background\bg_itemShop.paa";
			x = 0.278281 * safezoneW + safezoneX;
			y = 0.115 * safezoneH + safezoneY;
			w = 0.443438 * safezoneW;
			h = 0.77 * safezoneH;
		};
	};
	
	class controls {

		class itemList: EMonkeys_RscListBox
		{
			idc = 2401;

			text = "";
			x = 0.307719 * safezoneW + safezoneX;
			y = 0.350 * safezoneH + safezoneY;
			w = 0.182469 * safezoneW;
			h = 0.231 * safezoneH;
			sizeEx = 0.03;
		};
		class pItemlist: EMonkeys_RscListBox
		{
			idc = 2402;

			text = "";
			x = 0.505156 * safezoneW + safezoneX;
			y = 0.350 * safezoneH + safezoneY;
			w = 0.182469 * safezoneW;
			h = 0.231 * safezoneH;
			sizeEx = 0.03;
		};
		/*class Title: EMonkeys_RscTitle
		{
			idc = 2403;

			x = 0.1;
			y = 0.2;
			w = 0.725;
			h = 0.04;
			colorText[] = {0.95,0.95,0.95,1};
		};*/
		class buyEdit: EMonkeys_RscEdit
		{
			idc = 2404;
			text = "1";
			x = 0.307719 * safezoneW + safezoneX;
			y = 0.587 * safezoneH + safezoneY;
			w = 0.182469 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {-1,-1,-1,-1};
			colorBackgroundFocused[] = {1,1,1,0.12};
			colorBackground2[] = {0.75,0.75,0.75,0.2};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,1};
			color2[] = {0,0,0,1};
			colorText[] = {1,1,1,1};
			colorDisabled[] = {0,0,0,0.4};
		};
		/*class PlayersName: Title
		{
			idc = 601;
			style = 1;

			x = 0.1;
			y = 0.2;
			w = 0.725;
			h = 0.04;
			colorText[] = {0.95,0.95,0.95,1};
		};*/
		class ButtonAddG: EMonkeys_RscButtonMenu 
		{
			onButtonClick = "[] spawn EMonkeys_fnc_virt_buy;";
			idc = 1009;
			text = "";
			x = 0.362781 * safezoneW + safezoneX;
			y = 0.645 * safezoneH + safezoneY;
			w = 0.0785 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {-1,-1,-1,-1};
			colorBackgroundFocused[] = {1,1,1,0.12};
			colorBackground2[] = {0.75,0.75,0.75,0.2};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,1};
			color2[] = {0,0,0,1};
			colorText[] = {1,1,1,1};
			colorDisabled[] = {0,0,0,0.4};
		};
		class sellEdit: EMonkeys_RscEdit
		{
			idc = 2405;
			text = "1";
			x = 0.505156 * safezoneW + safezoneX;
			y = 0.587 * safezoneH + safezoneY;
			w = 0.182469 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {-1,-1,-1,-1};
			colorBackgroundFocused[] = {1,1,1,0.12};
			colorBackground2[] = {0.75,0.75,0.75,0.2};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,1};
			color2[] = {0,0,0,1};
			colorText[] = {1,1,1,1};
			colorDisabled[] = {0,0,0,0.4};
		};
		class ButtonRemoveG: EMonkeys_RscButtonMenu 
		{
			onButtonClick = "[false] call EMonkeys_fnc_virt_sell";
			idc = 1011;
			text = "";
			x = 0.527781 * safezoneW + safezoneX;
			y = 0.645 * safezoneH + safezoneY;
			w = 0.128906 * safezoneW;
			h = 0.022 * safezoneH;
			sizeEx = 0.001;
			colorBackground[] = {-1,-1,-1,-1};
			colorBackgroundFocused[] = {1,1,1,0.12};
			colorBackground2[] = {0.75,0.75,0.75,0.2};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,1};
			color2[] = {0,0,0,1};
			colorText[] = {1,1,1,1};
			colorDisabled[] = {0,0,0,0.4};
		};
		class ButtonRemoveA: EMonkeys_RscButtonMenu 
		{
			onButtonClick = "[true] call EMonkeys_fnc_virt_sell";
			idc = 1013;
			text = "";
			x = 0.527781 * safezoneW + safezoneX;
			y = 0.684 * safezoneH + safezoneY;
			w = 0.128906 * safezoneW;
			h = 0.022 * safezoneH;
			sizeEx = 0.001;
			colorBackground[] = {-1,-1,-1,-1};
			colorBackgroundFocused[] = {1,1,1,0.12};
			colorBackground2[] = {0.75,0.75,0.75,0.2};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,1};
			color2[] = {0,0,0,1};
			colorText[] = {1,1,1,1};
			colorDisabled[] = {0,0,0,0.4};
		};
		class ButtonClose: EMonkeys_RscButtonMenu 
		{
			onButtonClick = "closeDialog 0;";
			idc = -1;
			text = "";
			x = 0.685625 * safezoneW + safezoneX;
			y = 0.269 * safezoneH + safezoneY;
			w = 0.018625 * safezoneW;
			h = 0.0325 * safezoneH;
			colorBackground[] = {-1,-1,-1,-1};
			colorBackgroundFocused[] = {1,1,1,0.12};
			colorBackground2[] = {0.75,0.75,0.75,0.2};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,1};
			color2[] = {0,0,0,1};
			colorText[] = {1,1,1,1};
			colorDisabled[] = {0,0,0,0.4};
		};
	};
};