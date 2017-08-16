/**
 * Copyright © 2015 DnA, Grand Theft ArmA.
 * All Rights Reserved.
 */

class GTA_RscDisplayMenu
{
	idd = IDD_RSCDISPLAYMENU;
	scriptName = "GTA_RscDisplayMenu";
	scriptPath = "GUI";
	onLoad = "[ _this, ""GTA_RscDisplayMenu"" ] call GTA_fnc_initDisplay";

	class ControlsBackground
	{

		class Blackout: GTA_RscText
		{
			idc = IDC_RSCDISPLAYMENU_BLACKOUT;
			x = "safezoneX";
			y = "safezoneY";
			w = "safezoneW";
			h = "safezoneH";

			colorBackground[] = { 0, 0, 0, 0.5 };
		};

		class Tiles: GTA_RscTiles {};

	};

	class Controls
	{

		class TextTimer: GTA_RscText
		{
			idc = IDC_RSCDISPLAYADMIN_TEXTTIMER;
			x = "safezoneX + ( safezoneW / 2 ) - ( 20 * ( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 ) )";
			y = "1 * 					( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 ) + ( safezoneY )";
			w = "40 *	 				( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
			h = "1.4 * 					( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";

			shadow = 0;
			sizeEx = "1.4 * 			( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
			style = 2;
			text = "";
		};

		class BackgroundLinks: GTA_RscText
		{
			idc = -1;
			x = "0 * 					( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 ) + ( safezoneX )";
			y = "safezoneY + safezoneH - 1 * ( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
			w = "24 * 					( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
			h = "1 * 					( (	( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";

			colorBackground[] = { 0, 0, 0, 0.5 };
		};

		class TextDonate: GTA_RscStructuredText
		{
			idc = -1;
			x = "0 * 					( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 ) + ( safezoneX )";
			y = "safezoneY + safezoneH - 1 * ( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
			w = "8 * 					( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
			h = "1 * 					( (	( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";

			text = "<a href='http://grandtheftarma.com/donate/' shadow='0'>DONATE</a>";
			tooltip = "Support our server and help us with keeping this community alive.";

			class Attributes
			{
				font = "PuristaBOLD";
				color = "#FFFFFF";
				align = "center";
				shadow = 0;
			};
		};

		class TextGuide: GTA_RscStructuredText
		{
			idc = -1;
			x = "8 * 					( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 ) + ( safezoneX )";
			y = "safezoneY + safezoneH - 1 * ( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
			w = "8 * 					( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
			h = "1 * 					( (	( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";

			text = "<a href='http://grandtheftarma.com/guide/' shadow='0'>GUIDE</a>";
			tooltip = "Having trouble? Click to open our helpful guide to Altis Life, it will open in your default browser.";

			class Attributes
			{
				font = "PuristaBOLD";
				color = "#FFFFFF";
				align = "center";
				shadow = 0;
			};
		};

		class TextRules: GTA_RscStructuredText
		{
			idc = -1;
			x = "16 * 					( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 ) + ( safezoneX )";
			y = "safezoneY + safezoneH - 1 * ( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
			w = "8 * 					( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
			h = "1 * 					( (	( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";

			text = "<a href='http://grandtheftarma.com/topic/2-server-rules/' shadow='0'>RULES</a>";
			tooltip = "Stay out of trouble by keeping up to date with our server rules.";

			class Attributes
			{
				font = "PuristaBOLD";
				color = "#FFFFFF";
				align = "center";
				shadow = 0;
			};
		};

		class TextHeader: GTA_RscText
		{
			idc = IDC_RSCDISPLAYMENU_TEXTHEADER;
			x = "11.9 * 				( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 ) + ( safezoneX + ( safezoneW - ( ( safezoneW / safezoneH ) min 1.2 ) ) / 2 )";
			y = "8.4 * 					( (	( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 ) + ( safezoneY + ( safezoneH - ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) ) / 2 )";
			w = "16.2 * 				( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
			h = "1.1 * 					( (	( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";

			colorBackground[] = { 0, 0, 0, 0.8 };
			colorText[] = { 1, 1, 1, 1 };
			shadow = 0;
			style = 2;
		};

		class GroupButtons: GTA_RscControlsGroupNoScrollbars
		{
			idc = -1;
			x = "11.9 * 				( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 ) + ( safezoneX + ( safezoneW - ( ( safezoneW / safezoneH ) min 1.2 ) ) / 2 )";
			y = "10 * 					( (	( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 ) + ( safezoneY + ( safezoneH - ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) ) / 2 )";
			w = "16.2 * 				( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
			h = "16.9 * 				( (	( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";

			class Controls
			{

				class ButtonPerks: GTA_RscButtonMenu
				{
					idc = IDC_RSCDISPLAYMENU_BUTTONPERKS;
					x = "0 * 					( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
					y = "3.3 * 					( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
					w = "3 *	 				( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
					h = "3 *	 				( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";

					animTextureDefault = "gui\data\menu\button_normal.paa";
					animTextureDisabled = "gui\data\menu\button_normal.paa";
					animTextureFocused = "gui\data\menu\button_focus.paa";
					animTextureNormal = "gui\data\menu\button_normal.paa";
					animTextureOver = "gui\data\menu\button_focus.paa";
					animTexturePressed = "gui\data\menu\button_normal.paa";
					color2[] = { 1, 1, 1, 0.3 };
					color[] = { 1, 1, 1, 1 };
					colorBackground2[] = { 1, 1, 1, 1 };
					colorBackground[] = { 0, 0, 0, 1 };
					colorBackgroundFocused[] = { 1, 1, 1, 1 };
					colorDisabled[] = { 1, 1, 1, 0.25 };
					colorFocused[] = { 1, 1, 1, 1 };
					style = 2;
					text = "<img image='gui\data\menu\icon_perks.paa' align='center' size='2.5' />";
					tooltip = "Perks";
					tooltipColorBox[] = { 0, 0, 0, 0 };
					tooltipColorShade[] = { 0, 0 , 0, 0 };
					tooltipColorText[] = { 0, 0, 0, 0 };

					class ShortcutPos
					{
						left = 0;
						top = 0;
						w = 0;
						h = 0;
					};

					class TextPos
					{
						left = 0;
						top = "0.25 *	 		( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
						right = 0;
						bottom = 0;
					};

				};

				class ButtonMoney: ButtonPerks
				{
					idc = IDC_RSCDISPLAYMENU_BUTTONMONEY;
					x = "3.3 * 					( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
					y = "3.3 * 					( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
					w = "3 *	 				( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
					h = "3 *	 				( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";

					text = "<img image='gui\data\menu\icon_money.paa' align='center' size='2.5' />";
					tooltip = "Money";
				};

				class ButtonInventory: ButtonPerks
				{
					idc = IDC_RSCDISPLAYMENU_BUTTONINVENTORY;
					x = "6.6 * 					( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
					y = "3.3 * 					( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
					w = "3 *	 				( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
					h = "3 *	 				( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";

					text = "<img image='gui\data\menu\icon_inventory.paa' align='center' size='2.5' />";
					tooltip = "Inventory (P)";
				};

				class ButtonKeys: ButtonPerks
				{
					idc = IDC_RSCDISPLAYMENU_BUTTONKEYS;
					x = "9.9 * 					( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
					y = "3.3 * 					( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
					w = "3 *	 				( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
					h = "3 *	 				( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";

					text = "<img image='gui\data\menu\icon_keys.paa' align='center' size='2.5' />";
					tooltip = "Keychain";
				};

				class ButtonMessaging: ButtonPerks
				{
					idc = IDC_RSCDISPLAYMENU_BUTTONMESSAGING;
					x = "13.2 * 				( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
					y = "3.3 * 					( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
					w = "3 *	 				( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
					h = "3 *	 				( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";

					text = "<img image='gui\data\menu\icon_messaging.paa' align='center' size='2.5' />";
					tooltip = "Messaging";
				};

				class ButtonGang: ButtonPerks
				{
					idc = IDC_RSCDISPLAYMENU_BUTTONGANG;
					x = "0 * 					( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
					y = "0 * 					( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
					w = "3 *	 				( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
					h = "3 *	 				( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";

					text = "<img image='gui\data\menu\icon_gang.paa' align='center' size='2.5' />";
					tooltip = "Gang";
				};

				class ButtonWanted: ButtonPerks
				{
					idc = IDC_RSCDISPLAYMENU_BUTTONWANTED;
					x = "3.3 * 					( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
					y = "0 * 					( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
					w = "3 *	 				( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
					h = "3 *	 				( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";

					text = "<img image='gui\data\menu\icon_wanted.paa' align='center' size='2.5' />";
					tooltip = "Wanted List";
				};

				class ButtonMarket: ButtonPerks
				{
					idc = IDC_RSCDISPLAYMENU_BUTTONMARKET;
					x = "6.6 * 					( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
					y = "0 * 					( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
					w = "3 *	 				( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
					h = "3 *	 				( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";

					text = "<img image='gui\data\menu\icon_market.paa' align='center' size='2.5' />";
					tooltip = "Resource Index";
				};

				class ButtonSync: ButtonPerks
				{
					idc = IDC_RSCDISPLAYMENU_BUTTONSYNC;
					x = "9.9 * 					( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
					y = "0 * 					( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
					w = "3 *	 				( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
					h = "3 *	 				( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";

					text = "<img image='gui\data\menu\icon_sync.paa' align='center' size='2.5' />";
					tooltip = "Sync";
				};

				class ButtonSettings: ButtonPerks
				{
					idc = IDC_RSCDISPLAYMENU_BUTTONSETTINGS;
					x = "13.2 *					( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
					y = "0 * 					( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
					w = "3 *	 				( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
					h = "3 *	 				( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";

					text = "<img image='gui\data\menu\icon_settings.paa' align='center' size='2.5' />";
					tooltip = "Settings";
				};

				class ButtonExit: ButtonPerks
				{
					idc = IDC_RSCDISPLAYMENU_BUTTONEXIT;
					x = "7.1 * 					( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
					y = "9.6 * 					( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
					w = "2 *	 				( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
					h = "2 *	 				( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";

					text = "<img image='gui\data\menu\icon_exit.paa' align='center' size='1.5' />";
					tooltip = "Exit";
				};

				class ButtonAdmin: ButtonPerks
				{
					idc = IDC_RSCDISPLAYMENU_BUTTONADMIN;
					x = "7.1 * 					( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
					y = "11.9 * 				( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
					w = "2 *	 				( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
					h = "2 *	 				( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";

					text = "<img image='gui\data\menu\icon_admin.paa' align='center' size='1.5' />";
					tooltip = "Admin";
				};

				class ButtonConsole: ButtonPerks
				{
					idc = IDC_RSCDISPLAYMENU_BUTTONCONSOLE;
					x = "7.1 * 					( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
					y = "14.2 * 				( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
					w = "2 *	 				( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
					h = "2 *	 				( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";

					text = "<img image='gui\data\menu\icon_console.paa' align='center' size='1.5' />";
					tooltip = "Console";
				};

			};

		};

	};

};
