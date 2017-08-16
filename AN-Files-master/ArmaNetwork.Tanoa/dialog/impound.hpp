class life_impound_menu
{
	idd = 2800;
	name="life_impound_menu";
	movingEnabled = 0;
	enableSimulation = 1;
	class controlsBackground {
		class RscText_1000: Life_RscText
		{
			idc = 1000;
			text = "";
			x = 0.386562 * safezoneW + safezoneX;
			y = 0.313 * safezoneH + safezoneY;
			w = 0.226875 * safezoneW;
			h = 0.297 * safezoneH;
			colorBackground[] = {0,0,0,0.7};
		};
		class RscText_1001: Life_RscText
		{
			idc = 1001;
			text = "Your Garage";
			x = 0.386562 * safezoneW + safezoneX;
			y = 0.313 * safezoneH + safezoneY;
			w = 0.226875 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0,0,0,0.8};
		};
	};
	class controls {	
		class RscListbox_1500: Life_RscListbox
		{
			idc = 2802;
			text = "";
			x = 0.396875 * safezoneW + safezoneX;
			y = 0.346 * safezoneH + safezoneY;
			w = 0.20625 * safezoneW;
			h = 0.22 * safezoneH;
			sizeEx = 0.035;
			colorBackground[] = {0,0,0,0.6};
		};
		class RscButtonMenu_2400: Life_RscButtonMenu
		{
			idc = 2400;
			text = "Retrieve";
			x = 0.396875 * safezoneW + safezoneX;
			y = 0.577 * safezoneH + safezoneY;
			w = 0.20625 * safezoneW;
			h = 0.022 * safezoneH;
			onButtonClick = "closeDialog 0; call life_fnc_vabrumachathe;";
			class Attributes
			{
				align = "center";
			};
		};
		class RscButtonMenu_2401: Life_RscButtonMenu
		{
			idc = 2401;
			text = "Close";
			x = 0.386562 * safezoneW + safezoneX;
			y = 0.61 * safezoneH + safezoneY;
			w = 0.226875 * safezoneW;
			h = 0.022 * safezoneH;
			onButtonClick = "closeDialog 0;";
		};
	};
};	

