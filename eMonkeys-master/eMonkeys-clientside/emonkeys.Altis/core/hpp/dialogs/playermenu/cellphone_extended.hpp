#define ST_MULTI 0x10
class cellphone_extended 
{
	idd = 3000;
	name= "cellphone_extended";
	movingEnable = false;
	enableSimulation = true;
	onLoad = "[] spawn EMonkeys_fnc_cellex_open";
	


class controlsBackground 
	{
		class Background: EMonkeys_RscPicture
		{
			idc = -1;
			text = "core\textures\menu_background\bg_phoneMenu_1.paa";
			x = 0.247344 * safezoneW + safezoneX;
			y = 0.082 * safezoneH + safezoneY;
			w = 0.510469 * safezoneW;
			h = 0.935 * safezoneH;
		};
		
		class Close_Icon: EMonkeys_RscPicture
		{
			idc = -1;
			text = "core\textures\menu_icons\icon_beenden.paa";
			x = 0.345261 * safezoneW + safezoneX;
			y = 0.650296 * safezoneH + safezoneY;
			w = 0.020625 * safezoneW;
			h = 0.033 * safezoneH;
		};
		class Save_Icon: EMonkeys_RscPicture
		{
			idc = -1;
			text = "core\textures\menu_icons\icon_speichern.paa";
			x = 0.36875 * safezoneW + safezoneX;
			y = 0.65 * safezoneH + safezoneY;
			w = 0.020625 * safezoneW;
			h = 0.033 * safezoneH;
		};
		class Settings_Icon: EMonkeys_RscPicture
		{
			idc = -1;
			text = "core\textures\menu_icons\icon_einstellung.paa";
			x = 0.636979 * safezoneW + safezoneX;
			y = 0.65 * safezoneH + safezoneY;
			w = 0.020625 * safezoneW;
			h = 0.033 * safezoneH;
		};
		class Keys_Icon: EMonkeys_RscPicture
		{
			idc = -1;
			text = "core\textures\menu_icons\icon_keys.paa";
			x = 0.5 * safezoneW + safezoneX;
			y = 0.65 * safezoneH + safezoneY;
			w = 0.020625 * safezoneW;
			h = 0.033 * safezoneH;
		};
		class Phone_Icon: EMonkeys_RscPicture
		{
			idc = -1;
			text = "core\textures\menu_icons\icon_handy.paa";
			x = 0.523438 * safezoneW + safezoneX;
			y = 0.65 * safezoneH + safezoneY;
			w = 0.020625 * safezoneW;
			h = 0.033 * safezoneH;
		};
		class PermGangs_Icon: EMonkeys_RscPicture
		{
			idc = -1;
			text = "core\textures\menu_icons\icon_permgang.paa";
			x = 0.476562 * safezoneW + safezoneX;
			y = 0.650001 * safezoneH + safezoneY;
			w = 0.020625 * safezoneW;
			h = 0.033 * safezoneH;
		};
		class Gang_Icon: EMonkeys_RscPicture
		{
			idc = 2051;
			text = "core\textures\menu_icons\icon_gang.paa";
			x = 0.453125 * safezoneW + safezoneX;
			y = 0.650001 * safezoneH + safezoneY;
			w = 0.020625 * safezoneW;
			h = 0.033 * safezoneH;
		};
		class Wanted_Icon: EMonkeys_RscPicture
		{
			idc = 2053;
			text = "core\textures\menu_icons\icon_wanted.paa";
			x = 0.613542 * safezoneW + safezoneX;
			y = 0.650407 * safezoneH + safezoneY;
			w = 0.020625 * safezoneW;
			h = 0.033 * safezoneH;
		};
		class Craft_Icon: EMonkeys_RscPicture
		{
			idc = 2055;
			text = "core\textures\menu_icons\icon_craft.paa";
			x = 0.429687 * safezoneW + safezoneX;
			y = 0.65 * safezoneH + safezoneY;
			w = 0.020625 * safezoneW;
			h = 0.033 * safezoneH;
		};
		class Admin_Icon: EMonkeys_RscPicture
		{
			idc = 2057;
			text = "core\textures\menu_icons\icon_admin.paa";
			x = 0.590104 * safezoneW + safezoneX;
			y = 0.65 * safezoneH + safezoneY;
			w = 0.020625 * safezoneW;
			h = 0.033 * safezoneH;
		};
		class AdminMSG_Icon: EMonkeys_RscPicture
		{
			idc = 2058;
			text = "core\textures\menu_icons\icon_adminNachricht.paa";
			x = 0.238541 * safezoneW + safezoneX;
			y = 0.0812961 * safezoneH + safezoneY;
			w = 0.523697 * safezoneW;
			h = 0.937666 * safezoneH;
		};
	};


	class controls 
	{
	    class lbDst: EMonkeys_RscListbox
		{
			idc = 1500;
			x = 0.347396 * safezoneW + safezoneX;
			y = 0.338889 * safezoneH + safezoneY;
			w = 0.0877604 * safezoneW;
			h = 0.302556 * safezoneH;
			sizeEx = "0.02 / (getResolution select 5)";
			colorBackground[] = {-1,-1,-1,-1};
			colorBackgroundFocused[] = {1,1,1,0.12};
			colorBackground2[] = {0.75,0.75,0.75,0.2};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,1};
			color2[] = {0,0,0,1};
			colorText[] = {1,1,1,1};
			colorDisabled[] = {0,0,0,0.4};
	    };
	    class editMessage: emonkeys_RscMessageEdit
		{
			idc = 1400;
			style = ST_MULTI;
			lineSpacing = 1;
			x = 0.439062 * safezoneW + safezoneX;
			y = 0.338889 * safezoneH + safezoneY;
			w = 0.217135 * safezoneW;
			h = 0.107185 * safezoneH;
			text="";
			colorBackground[] = {-1,-1,-1,-1};
			colorBackgroundFocused[] = {1,1,1,0.12};
			colorBackground2[] = {0.75,0.75,0.75,0.2};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,1};
			color2[] = {0,0,0,1};
			colorText[] = {1,1,1,1};
			colorDisabled[] = {0,0,0,0.4};
		};
		class TextShow : EMonkeys_RscControlsGroup 
		{
			type = 15;
			idc = -1;
			style = 0;
			x = 0.438958 * safezoneW + safezoneX;
			y = 0.487222 * safezoneH + safezoneY;
			w = 0.217292 * safezoneW;
			h = 0.139259 * safezoneH;
			colorBackground[] = {-1,-1,-1,-1};
			colorBackgroundFocused[] = {1,1,1,0.12};
			colorBackground2[] = {0.75,0.75,0.75,0.2};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,1};
			color2[] = {0,0,0,1};
			colorText[] = {1,1,1,1};
			colorDisabled[] = {0,0,0,0.4};
			class VScrollbar 
			{
				color[] = {1, 1, 1, 1};
				width = 0.021;
				autoScrollSpeed = -1;
				autoScrollDelay = 5;
				autoScrollRewind = 0;
			};
			class HScrollbar : HScrollbar 
			{
				color[] = {1, 1, 1, 1};
				height = 0.028;
			};
			class ScrollBar
			{
				color[] = {1,1,1,0.6};
				colorActive[] = {1,1,1,1};
				colorDisabled[] = {1,1,1,0.3};
				thumb = "#(argb,8,8,3)color(1,1,1,1)";
				arrowEmpty = "#(argb,8,8,3)color(1,1,1,1)";
				arrowFull = "#(argb,8,8,3)color(1,1,1,1)";
				border = "#(argb,8,8,3)color(1,1,1,1)";
			};
	
			class controls {
				class showText : EMonkeys_RscStructuredText {
					idc = 1501;
					text = "";
					colorBackground[] = {0.28,0.28,0.28,0.28};
					size = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8)";
					shadow = 0.5;
					x = 0;
					y = 0;
					w = (SafezoneW  * 0.3);
					h = (SafezoneH  * 3);
				};
			};
		};
		class bSend: EMonkeys_RscButtonMenu
		{
			idc = 2401;
			text = "";
			x = 0.590625 * safezoneW + safezoneX;
			y = 0.312037 * safezoneH + safezoneY;
			w = 0.0641667 * safezoneW;
			h = 0.0235185 * safezoneH;
			onButtonClick="[false] spawn EMonkeys_fnc_cellex_sendClick;";
			tooltip="Nachricht an den Kontakt aus der Linken Liste senden";
			colorBackground[] = {-1,-1,-1,-1};
			colorBackgroundFocused[] = {1,1,1,0.12};
			colorBackground2[] = {0.75,0.75,0.75,0.2};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,1};
			color2[] = {0,0,0,1};
			colorText[] = {1,1,1,1};
			colorDisabled[] = {0,0,0,0.4};
		};
		class bSendAdmin: EMonkeys_RscButtonMenu
		{
			idc = 2402;
			text = "";
			x = 0.524479 * safezoneW + safezoneX;
			y = 0.312037 * safezoneH + safezoneY;
			w = 0.0641667 * safezoneW;
			h = 0.0235185 * safezoneH;
			colorBackground[] = {-1,-1,-1,-1};
			colorBackgroundFocused[] = {1,1,1,0.12};
			colorBackground2[] = {0.75,0.75,0.75,0.2};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,1};
			color2[] = {0,0,0,1};
			colorText[] = {1,1,1,1};
			colorDisabled[] = {0,0,0,0.4};
			onButtonClick="[true] spawn EMonkeys_fnc_cellex_sendClick;";
			tooltip="Nachricht als Admin senden. Funktioniert nur bei privaten Nachrichten an einen Spieler.";
		};
		////////////////////////////////////////////////////
		class ButtonClose: EMonkeys_RscButtonMenu
		{
			idc = -1;
			x = 0.345261 * safezoneW + safezoneX;
			y = 0.650296 * safezoneH + safezoneY;
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
			x = 0.36875 * safezoneW + safezoneX;
			y = 0.65 * safezoneH + safezoneY;
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
			x = 0.636979 * safezoneW + safezoneX;
			y = 0.65 * safezoneH + safezoneY;
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
			x = 0.5 * safezoneW + safezoneX;
			y = 0.65 * safezoneH + safezoneY;
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
			x = 0.523438 * safezoneW + safezoneX;
			y = 0.65 * safezoneH + safezoneY;
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
			x = 0.476562 * safezoneW + safezoneX;
			y = 0.650001 * safezoneH + safezoneY;
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
			x = 0.453125 * safezoneW + safezoneX;
			y = 0.650001 * safezoneH + safezoneY;
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
			x = 0.613542 * safezoneW + safezoneX;
			y = 0.650407 * safezoneH + safezoneY;
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
			x = 0.429687 * safezoneW + safezoneX;
			y = 0.65 * safezoneH + safezoneY;
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
			x = 0.590104 * safezoneW + safezoneX;
			y = 0.65 * safezoneH + safezoneY;
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