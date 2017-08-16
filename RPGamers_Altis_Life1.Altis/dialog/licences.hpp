#include "player_sys.sqf"

class Life_licences_phone {
	
	idd = 5501;
	movingEnable = 1;
	enableSimulation = 1;

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
	};
			
	class controls {
		class licenseHeader: Life_RscText
		{
			idc = -1;

			text = "$STR_PM_Licenses"; //--- ToDo: Localize;
			x = 0.611875 * safezoneW + safezoneX;
			y = 0.244 * safezoneH + safezoneY;
			w = 0.144375 * safezoneW;
			h = 0.028 * safezoneH;
		};
		class Licenses_Menu : Life_RscControlsGroup
		{
			idc = -1;
			x = 0.548561 * safezoneW + safezoneX;
			y = 0.276 * safezoneH + safezoneY;
			w = 0.18375 * safezoneW;
			h = 0.434 * safezoneH;
			
			class Controls
			{
				class Life_Licenses : Life_RscStructuredText
				{
					idc = 2014;
					sizeEx = 0.020;
					text = "";
					x = 0;
					y = 0;
					w = 0.27; h = 0.65;
				};
			};
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