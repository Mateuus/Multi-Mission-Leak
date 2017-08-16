#include "player_sys.sqf"

class Life_money_phone {

	idd = playersys_DIALOG;
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
		class moneyStatusInfo: Life_RscStructuredText
		{
			idc = 2015;
			sizeEx = 0.020;
			text = "";
			x = 0.559062 * safezoneW + safezoneX;
			y = 0.318 * safezoneH + safezoneY;
			w = 0.1575 * safezoneW;
			h = 0.42 * safezoneH;
		};
	};
			
	class controls {
		class moneyEdit: Life_RscEdit
		{
			idc = 2018;

			text = "1"; //--- ToDo: Localize;
			x = 0.598593 * safezoneW + safezoneX;
			y = 0.558 * safezoneH + safezoneY;
			w = 0.0945 * safezoneW;
			h = 0.021 * safezoneH;
		};
		class NearPlayers: Life_RscCombo
		{
			idc = 2022;

			x = 0.598593 * safezoneW + safezoneX;
			y = 0.586 * safezoneH + safezoneY;
			w = 0.0945 * safezoneW;
			h = 0.021 * safezoneH;
		};
		class moneyDrop: Life_RscButtonMenu
		{
			idc = 2001;
			onButtonClick = "[] call life_fnc_giveMoney";

			text = "$STR_Global_Give"; //--- ToDo: Localize;
			x = 0.611875 * safezoneW + safezoneX;
			y = 0.614 * safezoneH + safezoneY;
			w = 0.06825 * safezoneW;
			h = 0.0252 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0.5,0,0,0.5};
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