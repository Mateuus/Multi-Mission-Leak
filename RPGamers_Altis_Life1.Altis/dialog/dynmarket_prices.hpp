class life_dynmarket_prices {
	idd = 7100;
	name= "life_dynmarket_prices";
	movingEnable = false;
	enableSimulation = true;
	onLoad = "[] spawn {sleep 1;[] call life_fnc_LoadIntoListbox;};";
	
	class controlsBackground {
		class EXphone: life_RscPicture
		{
			idc = 3001;

			text = "textures\phone.paa"; //--- ToDo: Localize;
			x = 0.439625 * safezoneW + safezoneX;
			y = 0.14692 * safezoneH + safezoneY;
			w = 0.426562 * safezoneW;
			h = 0.725732 * safezoneH;
		};
		class Title: Life_RscTitle
		{
			idc = -1;

			text = "Market Prices";
			x = 0.598437 * safezoneW + safezoneX;
			y = 0.248 * safezoneH + safezoneY;
			w = 0.2625 * safezoneW;
			h = 0.028 * safezoneH;
			colorText[] = {0.95,0.95,0.95,1};
		};
	};

	class controls {
		class RscListbox_1500: Life_RscListBox
		{
			idc = 7055;
			onLBSelChanged = "[] spawn {[] call life_fnc_DisplayPrices;};";

			x = 0.548561 * safezoneW + safezoneX;
			y = 0.276 * safezoneH + safezoneY;
			w = 0.18375 * safezoneW;
			h = 0.434 * safezoneH;
		};
		class RscText_1000: Life_RscText
		{
			idc = -1;

			text = "Current Sell Price"; //--- ToDo: Localize;
			x = 0.5525 * safezoneW + safezoneX;
			y = 0.71 * safezoneH + safezoneY;
			w = 0.217708 * safezoneW;
			h = 0.0219914 * safezoneH;
		};
		class RscText_1001: Life_RscText
		{
			idc = 7056;

			text = "Please select an Item"; //--- ToDo: Localize;
			x = 0.585312 * safezoneW + safezoneX;
			y = 0.724 * safezoneH + safezoneY;
			w = 0.20625 * safezoneW;
			h = 0.0549786 * safezoneH;
		};
		class ButtonClose: Life_RscButtonInvisible
		{
			onButtonClick = "closeDialog 0;";

			idc = 1012;
			x = 0.601719 * safezoneW + safezoneX;
			y = 0.801 * safezoneH + safezoneY;
			w = 0.0820312 * safezoneW;
			h = 0.0875 * safezoneH;
			colorText[] = {1,1,1,0};
			colorBackground[] = {0,0,0,0};
			tooltip = "Go back"; //--- ToDo: Localize;
		};
};
};