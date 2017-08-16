#include "player_sys.sqf"

class playerSettings 
{
	idd = playersys_DIALOG;
	movingEnable = true;
	enableSimulation = true;
	
	class controlsBackground 
	{
		class Background: EMonkeys_RscPicture
		{
			idc = -1;
			text = "core\textures\menu_background\bg_playerMenu.paa";
			x = 0.247344 * safezoneW + safezoneX;
			y = 0.082 * safezoneH + safezoneY;
			w = 0.505313 * safezoneW;
			h = 0.902 * safezoneH;
		};
		
		class moneyStatusInfo : EMonkeys_RscStructuredText
		{
			idc = 2015;
			sizeEx = 0.020;
			text = "";
			colorBackground[] = {-1,-1,-1,-1};
			colorBackgroundFocused[] = {1,1,1,0.12};
			colorBackground2[] = {0.75,0.75,0.75,0.2};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,1};
			color2[] = {0,0,0,1};
			colorText[] = {1,1,1,1};
			colorDisabled[] = {0,0,0,0.4};
			x = 0.319531 * safezoneW + safezoneX;
			y = 0.387222 * safezoneH + safezoneY;
			w = 0.101667 * safezoneW;
			h = 0.0614816 * safezoneH;
		};
		
		class PlayersName : EMonkeys_RscText 
		{
			idc = carry_weight;
			style = 1;
			text = "";
			sizeEx = 0.030;
			x = 0.64526 * safezoneW + safezoneX;
			y = 0.32963 * safezoneH + safezoneY;
			w = 0.0366145 * safezoneW;
			h = 0.0147037 * safezoneH;
		};
		
		class Close_Icon: EMonkeys_RscPicture
		{
			idc = -1;
			text = "core\textures\menu_icons\icon_beenden.paa";
			x = 0.31901 * safezoneW + safezoneX;
			y = 0.666852 * safezoneH + safezoneY;
			w = 0.020625 * safezoneW;
			h = 0.033 * safezoneH;
		};
		class Save_Icon: EMonkeys_RscPicture
		{
			idc = -1;
			text = "core\textures\menu_icons\icon_speichern.paa";
			x = 0.342708 * safezoneW + safezoneX;
			y = 0.666445 * safezoneH + safezoneY;
			w = 0.020625 * safezoneW;
			h = 0.033 * safezoneH;
		};
		class Settings_Icon: EMonkeys_RscPicture
		{
			idc = -1;
			text = "core\textures\menu_icons\icon_einstellung.paa";
			x = 0.660417 * safezoneW + safezoneX;
			y = 0.666667 * safezoneH + safezoneY;
			w = 0.020625 * safezoneW;
			h = 0.033 * safezoneH;
		};
		class Keys_Icon: EMonkeys_RscPicture
		{
			idc = -1;
			text = "core\textures\menu_icons\icon_keys.paa";
			x = 0.499426 * safezoneW + safezoneX;
			y = 0.666852 * safezoneH + safezoneY;
			w = 0.020625 * safezoneW;
			h = 0.033 * safezoneH;
		};
		class Phone_Icon: EMonkeys_RscPicture
		{
			idc = -1;
			text = "core\textures\menu_icons\icon_handy.paa";
			x = 0.523644 * safezoneW + safezoneX;
			y = 0.666852 * safezoneH + safezoneY;
			w = 0.020625 * safezoneW;
			h = 0.033 * safezoneH;
		};
		class PermGangs_Icon: EMonkeys_RscPicture
		{
			idc = -1;
			text = "core\textures\menu_icons\icon_permgang.paa";
			x = 0.475729 * safezoneW + safezoneX;
			y = 0.666852 * safezoneH + safezoneY;
			w = 0.020625 * safezoneW;
			h = 0.033 * safezoneH;
		};
		class Gang_Icon: EMonkeys_RscPicture
		{
			idc = 2051;
			text = "core\textures\menu_icons\icon_gang.paa";
			x = 0.451511 * safezoneW + safezoneX;
			y = 0.666852 * safezoneH + safezoneY;
			w = 0.020625 * safezoneW;
			h = 0.033 * safezoneH;
		};
		class Wanted_Icon: EMonkeys_RscPicture
		{
			idc = 2053;
			text = "core\textures\menu_icons\icon_wanted.paa";
			x = 0.636459 * safezoneW + safezoneX;
			y = 0.666667 * safezoneH + safezoneY;
			w = 0.020625 * safezoneW;
			h = 0.033 * safezoneH;
		};
		class Craft_Icon: EMonkeys_RscPicture
		{
			idc = 2055;
			text = "core\textures\menu_icons\icon_craft.paa";
			x = 0.427812 * safezoneW + safezoneX;
			y = 0.666852 * safezoneH + safezoneY;
			w = 0.020625 * safezoneW;
			h = 0.033 * safezoneH;
		};
		class Admin_Icon: EMonkeys_RscPicture
		{
			idc = 2057;
			text = "core\textures\menu_icons\icon_admin.paa";
			x = 0.6125 * safezoneW + safezoneX;
			y = 0.666667 * safezoneH + safezoneY;
			w = 0.020625 * safezoneW;
			h = 0.033 * safezoneH;
		};
	};
	
	class controls 
	{
		class itemList : EMonkeys_RscListBox 
		{
			idc = item_list;
			sizeEx = 0.030;
			colorBackground[] = {-1,-1,-1,-1};
			colorBackgroundFocused[] = {1,1,1,0.12};
			colorBackground2[] = {0.75,0.75,0.75,0.2};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,1};
			color2[] = {0,0,0,1};
			colorText[] = {1,1,1,1};
			colorDisabled[] = {0,0,0,0.4};
			x = 0.554636 * safezoneW + safezoneX;
			y = 0.388148 * safezoneH + safezoneY;
			w = 0.127917 * safezoneW;
			h = 0.188296 * safezoneH;
		};
		
		class moneyEdit : EMonkeys_RscEdit 
		{
			idc = 2018;
			text = "1";
			colorBackground[] = {-1,-1,-1,-1};
			colorBackgroundFocused[] = {1,1,1,0.12};
			colorBackground2[] = {0.75,0.75,0.75,0.2};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,1};
			color2[] = {0,0,0,1};
			colorText[] = {1,1,1,1};
			colorDisabled[] = {0,0,0,0.4};
			sizeEx = 0.030;
			x = 0.319531 * safezoneW + safezoneX;
			y = 0.453333 * safezoneH + safezoneY;
			w = 0.101771 * safezoneW;
			h = 0.022 * safezoneH;
		};
		
		class NearPlayers : EMonkeys_RscCombo 
		{
			idc = 2022;
			x = 0.319218 * safezoneW + safezoneX;
			y = 0.481481 * safezoneH + safezoneY;
			w = 0.101719 * safezoneW;
			h = 0.022 * safezoneH;
		};
		
		class moneyDrop : EMonkeys_RscButtonMenu
		{
			idc = 2001;
			text = "";
			colorBackground[] = {-1,-1,-1,-1};
			colorBackgroundFocused[] = {1,1,1,0.12};
			colorBackground2[] = {0.75,0.75,0.75,0.2};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,1};
			color2[] = {0,0,0,1};
			colorText[] = {1,1,1,1};
			colorDisabled[] = {0,0,0,0.4};
			onButtonClick = "[] call EMonkeys_fnc_giveMoney";
			sizeEx = 0.025;
			x = 0.319531 * safezoneW + safezoneX;
			y = 0.509259 * safezoneH + safezoneY;
			w = 0.101667 * safezoneW;
			h = 0.0257037 * safezoneH;
		};

		class refreshPalyer : EMonkeys_RscButtonMenu
		{
			idc = -1;
			text = "";
			colorBackground[] = {-1,-1,-1,-1};
			colorBackgroundFocused[] = {1,1,1,0.12};
			colorBackground2[] = {0.75,0.75,0.75,0.2};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,1};
			color2[] = {0,0,0,1};
			colorText[] = {1,1,1,1};
			colorDisabled[] = {0,0,0,0.4};
			onButtonClick = "[] call EMonkeys_fnc_p_UpdatePlayer;";
			x = 0.319531 * safezoneW + safezoneX;
			y = 0.540296 * safezoneH + safezoneY;
			w = 0.101719 * safezoneW;
			h = 0.0247778 * safezoneH;
		};
		
		class itemEdit : EMonkeys_RscEdit 
		{
			idc = item_edit;
			text = "1";
			colorBackground[] = {-1,-1,-1,-1};
			colorBackgroundFocused[] = {1,1,1,0.12};
			colorBackground2[] = {0.75,0.75,0.75,0.2};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,1};
			color2[] = {0,0,0,1};
			colorText[] = {1,1,1,1};
			colorDisabled[] = {0,0,0,0.4};
			sizeEx = 0.030;
			x = 0.554687 * safezoneW + safezoneX;
			y = 0.580704 * safezoneH + safezoneY;
			w = 0.12875 * safezoneW;
			h = 0.022 * safezoneH;
		};
		
		class iNearPlayers : EMonkeys_RscCombo
		{
			idc = 2023;
			x = 0.554687 * safezoneW + safezoneX;
			y = 0.607408 * safezoneH + safezoneY;
			w = 0.12875 * safezoneW;
			h = 0.022 * safezoneH;
		};
		
		class DropButton : EMonkeys_RscButtonMenu {
			
			idc = 2002;
			text = "";
			colorBackground[] = {-1,-1,-1,-1};
			colorBackgroundFocused[] = {1,1,1,0.12};
			colorBackground2[] = {0.75,0.75,0.75,0.2};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,1};
			color2[] = {0,0,0,1};
			colorText[] = {1,1,1,1};
			colorDisabled[] = {0,0,0,0.4};
			onButtonClick = "[] call EMonkeys_fnc_giveItem;";
			x = 0.641146 * safezoneW + safezoneX;
			y = 0.633332 * safezoneH + safezoneY;
			w = 0.0422917 * safezoneW;
			h = 0.0247778 * safezoneH;
		};
		
		class UseButton : EMonkeys_RscButtonMenu 
		{
			text = "";
			colorBackground[] = {-1,-1,-1,-1};
			colorBackgroundFocused[] = {1,1,1,0.12};
			colorBackground2[] = {0.75,0.75,0.75,0.2};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,1};
			color2[] = {0,0,0,1};
			colorText[] = {1,1,1,1};
			colorDisabled[] = {0,0,0,0.4};
			onButtonClick = "[] call EMonkeys_fnc_useItem;";
			x = 0.597969 * safezoneW + safezoneX;
			y = 0.633741 * safezoneH + safezoneY;
			w = 0.0422917 * safezoneW;
			h = 0.0247778 * safezoneH;
		};
		
		class RemoveButton : EMonkeys_RscButtonMenu 
		{
			text = "";
			colorBackground[] = {-1,-1,-1,-1};
			colorBackgroundFocused[] = {1,1,1,0.12};
			colorBackground2[] = {0.75,0.75,0.75,0.2};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,1};
			color2[] = {0,0,0,1};
			colorText[] = {1,1,1,1};
			colorDisabled[] = {0,0,0,0.4};
			onButtonClick = "[] call EMonkeys_fnc_removeItem;";
			x = 0.554687 * safezoneW + safezoneX;
			y = 0.633333 * safezoneH + safezoneY;
			w = 0.0422917 * safezoneW;
			h = 0.0247778 * safezoneH;
		};
		
		class Licenses_Menu : EMonkeys_RscControlsGroup
		{
			idc = -1;
			x = 0.423177 * safezoneW + safezoneX;
			y = 0.388148 * safezoneH + safezoneY;
			w = 0.129792 * safezoneW;
			h = 0.270741 * safezoneH;
			
			class Controls
			{
				class EMonkeys_Licenses : EMonkeys_RscStructuredText
				{
					idc = 2014;
					sizeEx = 0.020;
					text = "";
					x = 0;
					y = 0;
					w = 0.27;
					h = 1.15;
				};
			};
		};
		////////////////////////////////////////////////////
		class ButtonClose: EMonkeys_RscButtonMenu
		{
			idc = -1;
			x = 0.31901 * safezoneW + safezoneX;
			y = 0.666852 * safezoneH + safezoneY;
			w = 0.020625 * safezoneW;
			h = 0.033 * safezoneH;
			onButtonClick = "closeDialog 0;";
			tooltip = "Schliessen";
			colorBackground[] = {-1,-1,-1,-1};
			colorBackgroundFocused[] = {1,1,1,0.12};
			colorBackground2[] = {0.75,0.75,0.75,0.2};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,1};
			color2[] = {0,0,0,1};
			colorText[] = {1,1,1,1};
			colorDisabled[] = {0,0,0,0.4};
		};
		////////////////////////////////////////////////////
		class ButtonSave: EMonkeys_RscButtonMenu
		{
			idc = -1;
			x = 0.342708 * safezoneW + safezoneX;
			y = 0.666445 * safezoneH + safezoneY;
			w = 0.020625 * safezoneW;
			h = 0.033 * safezoneH;
			onButtonClick = "[] call SOCK_fnc_syncData;";
			tooltip = "Speichern";
			colorBackground[] = {-1,-1,-1,-1};
			colorBackgroundFocused[] = {1,1,1,0.12};
			colorBackground2[] = {0.75,0.75,0.75,0.2};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,1};
			color2[] = {0,0,0,1};
			colorText[] = {1,1,1,1};
			colorDisabled[] = {0,0,0,0.4};
		};
		////////////////////////////////////////////////////
		class ButtonSettings: EMonkeys_RscButtonMenu
		{
			idc = -1;
			x = 0.660417 * safezoneW + safezoneX;
			y = 0.666667 * safezoneH + safezoneY;
			w = 0.020625 * safezoneW;
			h = 0.033 * safezoneH;
			onButtonClick = "[] call EMonkeys_fnc_settingsMenu;";
			tooltip = "Einstellungen";
			colorBackground[] = {-1,-1,-1,-1};
			colorBackgroundFocused[] = {1,1,1,0.12};
			colorBackground2[] = {0.75,0.75,0.75,0.2};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,1};
			color2[] = {0,0,0,1};
			colorText[] = {1,1,1,1};
			colorDisabled[] = {0,0,0,0.4};
		};
		////////////////////////////////////////////////////
		class ButtonKeys: EMonkeys_RscButtonMenu
		{
			idc = -1;
			x = 0.499426 * safezoneW + safezoneX;
			y = 0.666852 * safezoneH + safezoneY;
			w = 0.020625 * safezoneW;
			h = 0.033 * safezoneH;
			onButtonClick = "closeDialog 0; createDialog ""EMonkeys_key_management"";";
			tooltip = "Schlüssel";
			colorBackground[] = {-1,-1,-1,-1};
			colorBackgroundFocused[] = {1,1,1,0.12};
			colorBackground2[] = {0.75,0.75,0.75,0.2};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,1};
			color2[] = {0,0,0,1};
			colorText[] = {1,1,1,1};
			colorDisabled[] = {0,0,0,0.4};
		};
		////////////////////////////////////////////////////
		class ButtonPhone: EMonkeys_RscButtonMenu
		{
			idc = -1;
			x = 0.523644 * safezoneW + safezoneX;
			y = 0.666852 * safezoneH + safezoneY;
			w = 0.020625 * safezoneW;
			h = 0.033 * safezoneH;
			onButtonClick = "[] call EMonkeys_fnc_callCellPhone";
			tooltip = "Telefon";
			colorBackground[] = {-1,-1,-1,-1};
			colorBackgroundFocused[] = {1,1,1,0.12};
			colorBackground2[] = {0.75,0.75,0.75,0.2};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,1};
			color2[] = {0,0,0,1};
			colorText[] = {1,1,1,1};
			colorDisabled[] = {0,0,0,0.4};
		};
		////////////////////////////////////////////////////
		class ButtonPermGangs: EMonkeys_RscButtonMenu
		{
			idc = -1;
			x = 0.475729 * safezoneW + safezoneX;
			y = 0.666852 * safezoneH + safezoneY;
			w = 0.020625 * safezoneW;
			h = 0.033 * safezoneH;
			onButtonClick = "[] spawn EMonkeys_fnc_permManager";
			tooltip = "Gruppenmenü";
			colorBackground[] = {-1,-1,-1,-1};
			colorBackgroundFocused[] = {1,1,1,0.12};
			colorBackground2[] = {0.75,0.75,0.75,0.2};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,1};
			color2[] = {0,0,0,1};
			colorText[] = {1,1,1,1};
			colorDisabled[] = {0,0,0,0.4};
		};
		////////////////////////////////////////////////////
		class ButtonGang: EMonkeys_RscButtonMenu
		{
			idc = 2050;
			x = 0.451511 * safezoneW + safezoneX;
			y = 0.666852 * safezoneH + safezoneY;
			w = 0.020625 * safezoneW;
			h = 0.033 * safezoneH;
			onButtonClick = "[] call EMonkeys_fnc_gangMenu";
			tooltip = "Gangmenü";
			colorBackground[] = {-1,-1,-1,-1};
			colorBackgroundFocused[] = {1,1,1,0.12};
			colorBackground2[] = {0.75,0.75,0.75,0.2};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,1};
			color2[] = {0,0,0,1};
			colorText[] = {1,1,1,1};
			colorDisabled[] = {0,0,0,0.4};
		};
		////////////////////////////////////////////////////
		class ButtonWanted: EMonkeys_RscButtonMenu
		{
			idc = 2052;
			x = 0.636459 * safezoneW + safezoneX;
			y = 0.666667 * safezoneH + safezoneY;
			w = 0.020625 * safezoneW;
			h = 0.033 * safezoneH;
			onButtonClick = "[] call EMonkeys_fnc_wantedMenu";
			tooltip = "Fahndungsliste";
			colorBackground[] = {-1,-1,-1,-1};
			colorBackgroundFocused[] = {1,1,1,0.12};
			colorBackground2[] = {0.75,0.75,0.75,0.2};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,1};
			color2[] = {0,0,0,1};
			colorText[] = {1,1,1,1};
			colorDisabled[] = {0,0,0,0.4};
		};
		////////////////////////////////////////////////////
		class ButtonCraft: EMonkeys_RscButtonMenu
		{
			idc = 2054;
			x = 0.427812 * safezoneW + safezoneX;
			y = 0.666852 * safezoneH + safezoneY;
			w = 0.020625 * safezoneW;
			h = 0.033 * safezoneH;
			onButtonClick = "closeDialog 0; createDialog ""EMonkeys_craft"";";
			tooltip = "Baumenü";
			colorBackground[] = {-1,-1,-1,-1};
			colorBackgroundFocused[] = {1,1,1,0.12};
			colorBackground2[] = {0.75,0.75,0.75,0.2};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,1};
			color2[] = {0,0,0,1};
			colorText[] = {1,1,1,1};
			colorDisabled[] = {0,0,0,0.4};
		};
		////////////////////////////////////////////////////
		class ButtonAdmin: EMonkeys_RscButtonMenu
		{
			idc = 2056;
			x = 0.6125 * safezoneW + safezoneX;
			y = 0.666667 * safezoneH + safezoneY;
			w = 0.020625 * safezoneW;
			h = 0.033 * safezoneH;
			onButtonClick = "closeDialog 0; createDialog ""EMonkeys_admin_menu"";";
			tooltip = "Adminmenü";
			colorBackground[] = {-1,-1,-1,-1};
			colorBackgroundFocused[] = {1,1,1,0.12};
			colorBackground2[] = {0.75,0.75,0.75,0.2};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,1};
			color2[] = {0,0,0,1};
			colorText[] = {1,1,1,1};
			colorDisabled[] = {0,0,0,0.4};
		};
		////////////////////////////////////////////////////
	};	
};