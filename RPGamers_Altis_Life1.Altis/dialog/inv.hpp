#include "player_sys.sqf"

class Life_inv_phone {
	
	idd = 5502;
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
		class Title : life_RscTitle {
			colorBackground[] = {0, 0, 0, 0};
			idc = -1;
			text = "";
			x = 0.14;
			y = 0.241778 * safezoneH + safezoneY;
			w = 0.8;
			h = (1 / 25);
		};
		class PlayersName : Title {
			idc = carry_weight;
			style = 1;
			text = "";
		};
	};
			
	class controls {
		class invHeader: Life_RscText
		{
			idc = -1;

			text = "Inventory"; //--- ToDo: Localize;
			x = 0.54725 * safezoneW + safezoneX;
			y = 0.241778 * safezoneH + safezoneY;
			w = 0.144375 * safezoneW;
			h = 0.028 * safezoneH;
		};
		class itemList: life_RscListBox
		{
			idc = item_list;
			sizeEx = 0.030;

			x = 0.548561 * safezoneW + safezoneX;
			y = 0.276 * safezoneH + safezoneY;
			w = 0.18375 * safezoneW;
			h = 0.364 * safezoneH;
		};
		class itemEdit: Life_RscEdit
		{
			idc = item_edit;

			text = "1"; //--- ToDo: Localize;
			x = 0.559062 * safezoneW + safezoneX;
			y = 0.654 * safezoneH + safezoneY;
			w = 0.144375 * safezoneW;
			h = 0.021 * safezoneH;
		};
		class iNearPlayers: Life_RscCombo
		{
			idc = 2023;

			x = 0.559062 * safezoneW + safezoneX;
			y = 0.682 * safezoneH + safezoneY;
			w = 0.144375 * safezoneW;
			h = 0.021 * safezoneH;
		};
		class DropButton: Life_RscButtonMenu
		{
			idc = 2002;
			onButtonClick = "[] call life_fnc_giveItem;";

			text = "$STR_Global_Give"; //--- ToDo: Localize;
			x = 0.6575 * safezoneW + safezoneX;
			y = 0.71 * safezoneH + safezoneY;
			w = 0.0689062 * safezoneW;
			h = 0.028 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0.5,0,0,0.5};
		};
		class UseButton: Life_RscButtonMenu
		{
			onButtonClick = "[] call life_fnc_useItem;";
			idc = 1016;

			text = "$STR_Global_Use"; //--- ToDo: Localize;
			x = 0.559062 * safezoneW + safezoneX;
			y = 0.71 * safezoneH + safezoneY;
			w = 0.0689062 * safezoneW;
			h = 0.028 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0.5,0,0,0.5};
		};
		class RemoveButton: Life_RscButtonMenu
		{
			onButtonClick = "[] call life_fnc_removeItem;";
			idc = 1017;

			text = "$STR_Global_Remove"; //--- ToDo: Localize;
			x = 0.6575 * safezoneW + safezoneX;
			y = 0.752 * safezoneH + safezoneY;
			w = 0.0689062 * safezoneW;
			h = 0.028 * safezoneH;
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