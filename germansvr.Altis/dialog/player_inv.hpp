#include "player_sys.sqf"

class playerSettings {

	idd = playersys_DIALOG;
	movingEnable = true;
	enableSimulation = true;
	
	class controlsBackground {
			class InventoryBack:Life_RscPicture {
			idc = -1;
			text = "textures\handy\handy_home.paa";
			x = 0.608281 * safezoneW + safezoneX;
			y = 0.225 * safezoneH + safezoneY;
			w = 0.500156 * safezoneW;
			h = 0.858 * safezoneH;
		};
		
		class Title : Life_RscTitle {
			colorBackground[] = {1,1,1,0.3};
			text = "INVENTORY";
			sizeEx = "0.022 * safeZoneH";
			idc = -1;
			x = 0.752655 * safezoneW + safezoneX;
			y = 0.357 * safezoneH + safezoneY;
			w = 0.20625 * safezoneW;
			h = 0.022 * safezoneH;
		};
		
		class PlayersName : Title {
			idc = carry_weight;
			style = 1;
			text = "";
			sizeEx = "0.022 * safeZoneH";
		};
	};
	
	class controls {
	
		class itemList : Life_RscListBox
		{
			idc = item_list;
			sizeEx = "0.02 * safeZoneH";
			
			x = 0.752654 * safezoneW + safezoneX;
			y = 0.379 * safezoneH + safezoneY;
			w = 0.20625 * safezoneW;
			h = 0.462 * safezoneH;
			colorBackground[] = {0,0,0,0.3};
			colorBackgroundFocused[] = {0,0,0,0};
			colorBackground2[] = {0,0,0,0};
		};
		
		class itemEdit : Life_RscEdit {
		
			idc = item_edit;
			
			text = "1";
			sizeEx = "0.022 * safeZoneH";
			x = 0.752656 * safezoneW + safezoneX;
			y = 0.841 * safezoneH + safezoneY;
			w = 0.103125 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0,0,0,0.3};
		
		};
		class NearPlayers : Life_RscCombo
		{
			idc = 2022;
			sizeEx = "0.022 * safeZoneH";
			
			x = 0.855781 * safezoneW + safezoneX;
			y = 0.841 * safezoneH + safezoneY;
			w = 0.103125 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0,0,0,0.3};
		};
		
		class DropButton : Life_RscButtonMenu {
			
			idc = -1;
			onButtonClick = "[] call life_fnc_giveItem;";
			
			x = 0.752656 * safezoneW + safezoneX;
			y = 0.874 * safezoneH + safezoneY;
			w = 0.0360937 * safezoneW;
			h = 0.022 * safezoneH;
			text = "GEBEN";
			size = "0.022 * safeZoneH";
			
			colorBackground[] = {0,0,0,0};
			colorBackgroundFocused[] = {0,0,0,0};
			colorBackground2[] = {0,0,0,0};
			color[] = {1,1,1,1};
			colorFocused[] = {1,1,1,1};
			color2[] = {1,1,1,1};
			colorText[] = {1,1,1,1};
			
		};
		
		class UseButton : Life_RscButtonMenu {
			idc = -1;
			onButtonClick = "[] call life_fnc_useItem;";
			
			x = 0.822575 * safezoneW + safezoneX;
			y = 0.874 * safezoneH + safezoneY;
			w = 0.061875 * safezoneW;
			h = 0.022 * safezoneH;
			text = "VERWENDEN";
			size = "0.022 * safeZoneH";
			
			colorBackground[] = {0,0,0,0};
			colorBackgroundFocused[] = {0,0,0,0};
			colorBackground2[] = {0,0,0,0};
			color[] = {1,1,1,1};
			colorFocused[] = {1,1,1,1};
			color2[] = {1,1,1,1};
			colorText[] = {1,1,1,1};
			
		};
		
		class RemoveButton : Life_RscButtonMenu {
			idc = -1;
			onButtonClick = "[] call life_fnc_removeItem;";
			
			x = 0.902187 * safezoneW + safezoneX;
			y = 0.874 * safezoneH + safezoneY;
			w = 0.061875 * safezoneW;
			h = 0.022 * safezoneH;
			text = "ENTFERNEN";
			size = "0.022 * safeZoneH";
			
			colorBackground[] = {0,0,0,0};
			colorBackgroundFocused[] = {0,0,0,0};
			colorBackground2[] = {0,0,0,0};
			color[] = {1,1,1,1};
			colorFocused[] = {1,1,1,1};
			color2[] = {1,1,1,1};
			colorText[] = {1,1,1,1};
		};
		
		class ButtonAdminMenu : Life_RscButtonMenu {
			idc = 2021;
			tooltip = "$STR_PM_AdminMenu";
			onButtonClick = "createDialog ""life_admin_menu"";";
			size = "0.022 * safeZoneH";
			x = 0.922813 * safezoneW + safezoneX;
			y = 0.874 * safezoneH + safezoneY;
			w = 0.0360937 * safezoneW;
			h = 0.055 * safezoneH;
			
			colorBackground[] = {0,0,0,0};
			colorBackgroundFocused[] = {0,0,0,0};
			colorBackground2[] = {0,0,0,0};
			color[] = {1,1,1,1};
			colorFocused[] = {1,1,1,1};
			color2[] = {1,1,1,1};
			colorText[] = {1,1,1,1};
		};
		
		class ButtonSyncData : Life_RscButtonMenu {
			idc = -1;
			onButtonClick = "[] call SOCK_fnc_syncData;";
			size = "0.022 * safeZoneH";
			x = 0.907344 * safezoneW + safezoneX;
			y = 0.94 * safezoneH + safezoneY;
			w = 0.0154688 * safezoneW;
			h = 0.033 * safezoneH;
			
			tooltip = "$STR_PM_SyncData";
			
			colorBackground[] = {0,0,0,0};
			colorBackgroundFocused[] = {0,0,0,0};
			colorBackground2[] = {0,0,0,0};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,0};
			color2[] = {0,0,0,0};
			colorText[] = {1,1,1,1};
		};
		
		class ButtonClose : Life_RscButtonMenu {
			idc = -1;
			onButtonClick = "closeDialog 0;";
			x = 0.783594 * safezoneW + safezoneX;
			y = 0.94 * safezoneH + safezoneY;
			w = 0.0257812 * safezoneW;
			h = 0.033 * safezoneH;
			
			tooltip = "$STR_Global_Close";
			size = "0.022 * safeZoneH";
			
			colorBackground[] = {0,0,0,0};
			colorBackgroundFocused[] = {0,0,0,0};
			colorBackground2[] = {0,0,0,0};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,0};
			color2[] = {0,0,0,0};
			colorText[] = {1,1,1,1};
		};
		
		class ButtonHome : Life_RscButtonMenu {
			idc = -1;
			onButtonClick = "closeDialog 0;createDialog ""handy_apps1"";";
			x = 0.845468 * safezoneW + safezoneX;
			y = 0.94 * safezoneH + safezoneY;
			w = 0.020625 * safezoneW;
			h = 0.033 * safezoneH;
			
			tooltip = "HOME";
			size = "0.022 * safeZoneH";
			
			colorBackground[] = {0,0,0,0};
			colorBackgroundFocused[] = {0,0,0,0};
			colorBackground2[] = {0,0,0,0};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,0};
			color2[] = {0,0,0,0};
			colorText[] = {1,1,1,1};
		};
		
		class PointApps : Life_RscButtonMenu {
			size = "0.022 * safeZoneH";
			idc = -1;
			onButtonClick = "closeDialog 0;createDialog ""handy_apps1"";";
			x = 0.850625 * safezoneW + safezoneX;
			y = 0.907 * safezoneH + safezoneY;
			w = 0.00825 * safezoneW;
			h = 0.01265 * safezoneH;
			
			colorBackground[] = {0,0,0,0};
			colorBackgroundFocused[] = {0,0,0,0};
			colorBackground2[] = {0,0,0,0};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,0};
			color2[] = {0,0,0,0};
			colorText[] = {1,1,1,1};
		};
		
		class PointApps2 : Life_RscButtonMenu {
			size = "0.022 * safeZoneH";
			idc = -1;
			onButtonClick = "closeDialog 0;createDialog ""handy_apps2"";";
			x = 0.860937 * safezoneW + safezoneX;
			y = 0.907 * safezoneH + safezoneY;
			w = 0.00825 * safezoneW;
			h = 0.01265 * safezoneH;
			
			colorBackground[] = {0,0,0,0};
			colorBackgroundFocused[] = {0,0,0,0};
			colorBackground2[] = {0,0,0,0};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,0};
			color2[] = {0,0,0,0};
			colorText[] = {1,1,1,1};
		};
	};
};