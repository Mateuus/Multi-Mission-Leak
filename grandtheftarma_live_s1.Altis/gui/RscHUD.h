/**
 * Copyright © 2015 DnA, Grand Theft ArmA.
 * All Rights Reserved.
 */

class GTA_RscHUD
{
	idd = -1;
	fadein = 0;
	fadeout = 0;
	duration = 1e+011;
	scriptName = "GTA_RscHUD";
	scriptPath = "GUI";
	scriptIsInternal = 1;
	onLoad = "[ _this, ""GTA_RscHUD"" ] call GTA_fnc_initDisplay";

	class Controls
	{

		class TextMoney: GTA_RscText
		{
			idc = IDC_RSCHUD_TEXTMONEY;
			x = "safezoneX + safezoneW - 7.5 * ( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
			y = "safezoneY + safezoneH - 2.8 * ( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
			w = "7 * 					( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
			h = "1 * 					( (	( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";

			colorText[] = { 1, 1, 1, 1 };
			style = 1;
			text = "£0";
		};

		class BackgroundDamage: GTA_RscText
		{
			idc = -1;
			x = "safezoneX + safezoneW - 12.5 * ( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
			y = "safezoneY + safezoneH - 1.5 * ( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
			w = "12 * 					( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
			h = "1 * 					( (	( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";

			colorBackground[] = { 0.2, 0.2, 0.2, 0.3 };
		};

		/*class BackgroundFatigue: GTA_RscText
		{
			idc = -1;
			x = "safezoneX + safezoneW - 12.5 * ( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
			y = "safezoneY + safezoneH - 2.8 * ( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
			w = "12 * 					( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
			h = "1 * 					( (	( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";

			colorBackground[] = { 0.2, 0.2, 0.2, 0.3 };
		};*/

		class ProgressDamage: GTA_RscProgress
		{
			idc = IDC_RSCHUD_PROGRESSDAMAGE;
			x = "safezoneX + safezoneW - 12.5 * ( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
			y = "safezoneY + safezoneH - 1.5 * ( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
			w = "12 * 					( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
			h = "1 * 					( (	( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";

			colorBackground[] = { 0, 0, 0, 0.25 };
			colorBar[] = { 0, 0, 0, 0.25 };
		};

		/*class ProgressFatigue: GTA_RscProgress
		{
			idc = IDC_RSCHUD_PROGRESSFATIGUE;
			x = "safezoneX + safezoneW - 12.5 * ( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
			y = "safezoneY + safezoneH - 2.8 * ( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
			w = "12 * 					( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
			h = "1 * 					( (	( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";

			colorBackground[] = { 0, 0, 0, 0.25 };
			colorBar[] = { 0, 0, 0, 0.25 };
		};*/

		class TextDamage: GTA_RscText
		{
			idc = -1;
			x = "safezoneX + safezoneW - 12.5 * ( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
			y = "safezoneY + safezoneH - 1.5 * ( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
			w = "12 * 					( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
			h = "1 * 					( (	( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";

			text = "HEALTH";
			sizeEX = "0.8 * 			( (	( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
		};

		/*class TextFatigue: TextDamage
		{
			idc = -1;
			x = "safezoneX + safezoneW - 12.5 * ( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
			y = "safezoneY + safezoneH - 2.8 * ( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
			w = "12 * 					( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
			h = "1 * 					( (	( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";

			text = "FATIGUE";
		};*/

		class ValueDamage: GTA_RscText
		{
			idc = IDC_RSCHUD_VALUEDAMAGE;
			x = "safezoneX + safezoneW - 12.5 * ( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
			y = "safezoneY + safezoneH - 1.5 * ( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
			w = "12 * 					( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
			h = "1 * 					( (	( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";

			sizeEX = "0.8 * 			( (	( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
			style = 1;
		};

		/*class ValueFatigue: ValueDamage
		{
			idc = IDC_RSCHUD_VALUEFATIGUE;
			x = "safezoneX + safezoneW - 12.5 * ( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
			y = "safezoneY + safezoneH - 2.8 * ( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
			w = "12 * 					( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
			h = "1 * 					( (	( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";

			sizeEX = "0.8 * 			( (	( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
		};*/

		class GroupMeta: GTA_RscControlsGroupNoScrollbars
		{
			idc = IDC_RSCHUD_GROUPMETA;
			x = "safezoneX + safezoneW - 12.5 * ( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
			y = "safezoneY + safezoneH - 10 * ( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
			w = "12 *	 				( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
			h = "3.6 * 				( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";

			class Controls
			{

				class BackgroundMeta: GTA_RscText
				{
					idc = -1;
					x = "0 * 					( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
					y = "0 * 					( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
					w = "12 * 					( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
					h = "1.4 * 					( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";

					colorBackground[] = { 0.2, 0.2, 0.2, 0.4 };
				};

				class PictureMetaSide: GTA_RscPictureKeepAspect
				{
					idc = IDC_RSCHUD_PICTUREMETASIDE;
					x = "0 *			  	( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
					y = "0.1 * 				( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
					w = "3.8 * 				( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
					h = "1.2 * 				( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";

					text = "";
				};

				class PictureMetaVehicle: GTA_RscPictureKeepAspect
				{
					idc = IDC_RSCHUD_PICTUREMETAVEHICLE;
					x = "4 * 				  ( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
					y = "0.1 * 				( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
					w = "4 *			  	( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
					h = "1.2 * 				( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";

					text = "";
				};

        class TextMetaSpeed: GTA_RscText
				{
					idc = IDC_RSCHUD_TEXTMETASPEED;
          x = "8 * 				  ( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
					y = "0 * 				  ( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
					w = "4 *			    ( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
					h = "1.4 * 			  ( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";

					colorText[] = { 0.95, 0.95, 0.95, 1 };
					shadow = 0;
					sizeEX = "0.7 * 	( (	( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
					style = 2;
					text = "";
				};

				class TextMeta: GTA_RscText
				{
					idc = IDC_RSCHUD_TEXTMETA;
					x = "0 * 				  	( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
					y = "1.4 * 					( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
					w = "12 * 					( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
					h = "1.4 * 					( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";

					colorBackground[] = { 0.95, 0.95, 0.95, 0.8 };
					colorText[] = { 0, 0, 0, 1 };
					shadow = 0;
					sizeEX = "1 * 				( (	( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
					style = 2;
					text = "";
				};

        class TextMetaGroup: GTA_RscText
				{
					idc = IDC_RSCHUD_TEXTMETAGROUP;
          x = "0 * 				    ( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
					y = "2.8 * 			  	( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
					w = "12 * 				  ( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
					h = "0.8 * 					( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";

					colorBackground[] = { 0.2, 0.2, 0.2, 0.9 };
					colorText[] = { 0.95, 0.95, 0.95, 1 };
					shadow = 0;
					sizeEX = "0.7 * 		( (	( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
					style = 2;
					text = "";
				};
			};
		};

		class BackgroundHunger: GTA_RscPictureKeepAspect
		{
			idc = IDC_RSCHUD_BACKGROUNDHUNGER;
			x = "safezoneX + safezoneW - 2.5 * ( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
			y = "10.5 * 				( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
			w = "2 * 					( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
			h = "2 * 					( (	( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";

			colorText[] = { "( profilenamespace getVariable [ 'IGUI_BCG_RGB_R', 0 ] )", "( profilenamespace getVariable [ 'IGUI_BCG_RGB_G', 1 ] )", "( profilenamespace getVariable [ 'IGUI_BCG_RGB_B', 1 ] )", "( profilenamespace getVariable [ 'IGUI_BCG_RGB_A', 0.8 ] )" };
			text = "gui\data\RscHUD\ring_8.paa";
		};

		class BackgroundThirst: BackgroundHunger
		{
			idc = IDC_RSCHUD_BACKGROUNDTHIRST;
			x = "safezoneX + safezoneW - 2.5 * ( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
			y = "8 * 					( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
			w = "2 * 					( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
			h = "2 * 					( (	( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
		};

		class RingHunger: GTA_RscPictureKeepAspect
		{
			idc = IDC_RSCHUD_RINGHUNGER;
			x = "safezoneX + safezoneW - 2.5 * ( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
			y = "10.5 * 				( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
			w = "2 * 					( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
			h = "2 * 					( (	( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";

			colorText[] = { 0.95, 0.95, 0.95, 1 };
			text = "gui\data\RscHUD\ring_6.paa";
		};

		class RingThirst: RingHunger
		{
			idc = IDC_RSCHUD_RINGTHIRST;
			x = "safezoneX + safezoneW - 2.5 * ( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
			y = "8 * 					( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
			w = "2 * 					( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
			h = "2 * 					( (	( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";

			text = "gui\data\RscHUD\ring_3.paa";
		};

		class IconHunger: RingHunger
		{
			idc = IDC_RSCHUD_ICONHUNGER;
			text = "gui\data\RscHUD\icon_hunger.paa";
		};

		class IconThirst: RingThirst
		{
			idc = IDC_RSCHUD_ICONTHIRST;
			text = "gui\data\RscHUD\icon_thirst.paa";
		};

		class TextAddExp: GTA_RscStructuredText
		{
			idc = IDC_RSCHUD_TEXTADDEXP;
			x = "13 * 					( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 ) + ( safezoneX + ( safezoneW - ( ( safezoneW / safezoneH ) min 1.2 ) ) / 2 )";
			y = "safezoneY + safezoneH - 2.3 * ( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
			w = "14 * 					( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
			h = "0.8 * 					( (	( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";

			sizeEX = "0.6 * 			( (	( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
			text = "";

			class Attributes
			{
				font = "PuristaMedium";
				color = "#ffffff";
				align = "center";
				size = 0.8;
				shadow = 1;
			};
		};

		class TextLevel: GTA_RscText
		{
			idc = IDC_RSCHUD_TEXTLEVEL;
			x = "12.2 * 				( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 ) + ( safezoneX + ( safezoneW - ( ( safezoneW / safezoneH ) min 1.2 ) ) / 2 )";
			y = "safezoneY + safezoneH - 1.3 * ( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
			w = "0.8 * 					( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
			h = "0.8 * 					( (	( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";

			colorBackground[] = { "( profilenamespace getVariable [ 'IGUI_BCG_RGB_R', 0 ] )", "( profilenamespace getVariable [ 'IGUI_BCG_RGB_G', 1 ] )", "( profilenamespace getVariable [ 'IGUI_BCG_RGB_B', 1 ] )", 0.8 };
			colorText[] = { "( profilenamespace getVariable [ 'IGUI_TEXT_RGB_R', 0 ] )", "( profilenamespace getVariable [ 'IGUI_TEXT_RGB_G', 1 ] )", "( profilenamespace getVariable [ 'IGUI_TEXT_RGB_B', 1 ] )", "( profilenamespace getVariable [ 'IGUI_TEXT_RGB_A', 0.8 ] )" };
			font = "PuristaLight";
			shadow = 0;
			sizeEX = "0.6 * 			( (	( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
			style = 2;
		};

		class TextNextLevel: TextLevel
		{
			idc = IDC_RSCHUD_TEXTNEXTLEVEL;
			x = "27 * 					( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 ) + ( safezoneX + ( safezoneW - ( ( safezoneW / safezoneH ) min 1.2 ) ) / 2 )";
			y = "safezoneY + safezoneH - 1.3 * ( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
			w = "0.8 * 					( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
			h = "0.8 * 					( (	( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
		};

		class BackgroundEXP: GTA_RscText
		{
			idc = IDC_RSCHUD_BACKGROUNDEXP;
			x = "13 * 					( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 ) + ( safezoneX + ( safezoneW - ( ( safezoneW / safezoneH ) min 1.2 ) ) / 2 )";
			y = "safezoneY + safezoneH - 1.3 * ( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
			w = "14 * 					( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
			h = "0.8 * 					( (	( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";

			colorBackground[] = { "( profilenamespace getVariable [ 'IGUI_BCG_RGB_R', 0 ] )", "( profilenamespace getVariable [ 'IGUI_BCG_RGB_G', 1 ] )", "( profilenamespace getVariable [ 'IGUI_BCG_RGB_B', 1 ] )", "( profilenamespace getVariable [ 'IGUI_BCG_RGB_A', 0.8 ] )" };
		};

		class ProgressEXP: GTA_RscProgress
		{
			idc = IDC_RSCHUD_PROGRESSEXP;
			x = "13 * 					( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 ) + ( safezoneX + ( safezoneW - ( ( safezoneW / safezoneH ) min 1.2 ) ) / 2 )";
			y = "safezoneY + safezoneH - 1.3 * ( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
			w = "14 * 					( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
			h = "0.8 * 					( (	( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";

			colorBackground[] = { "( profilenamespace getVariable [ 'GUI_BCG_RGB_R', 0.77 ] )", "( profilenamespace getVariable [ 'GUI_BCG_RGB_G', 0.51 ] )", "( profilenamespace getVariable [ 'GUI_BCG_RGB_B', 0.08 ] )", 0.8 };
			colorBar[] = { "( profilenamespace getVariable [ 'GUI_BCG_RGB_R', 0.77 ] )", "( profilenamespace getVariable [ 'GUI_BCG_RGB_G', 0.51 ] )", "( profilenamespace getVariable [ 'GUI_BCG_RGB_B', 0.08 ] )", 0.8 };
			shadow = 0;
		};

		class TextEXP: GTA_RscText
		{
			idc = IDC_RSCHUD_TEXTEXP;
			x = "13 * 					( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 ) + ( safezoneX + ( safezoneW - ( ( safezoneW / safezoneH ) min 1.2 ) ) / 2 )";
			y = "safezoneY + safezoneH - 1.35 * ( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
			w = "14 * 					( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
			h = "0.8 * 					( (	( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";

			shadow = 0;
			sizeEX = "0.8 * 			( (	( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
			style = 2;
			text = "";
		};

	};
};
