/**
 * Copyright © 2015 DnA, Grand Theft ArmA.
 * All Rights Reserved.
 */

class GTA_RscDisplayAdminChildStats: GTA_RscControlsGroupNoScrollbars
{
	idc = IDC_RSCDISPLAYADMINCHILDSTATS;
	scriptName = "GTA_RscDisplayAdminChildStats";
	scriptPath = "GUI";
	x = "8 * 					( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 ) + ( safezoneX + (safezoneW - ( ( safezoneW / safezoneH ) min 1.2 ) ) / 2 )";
	y = "6.15 *					( (	( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 ) + ( safezoneY + ( safezoneH - ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) ) / 2 )";
	w = "24 *	 				( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
	h = "12.7 * 				( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";

	class Controls
	{

		class Title: GTA_RscTitle
		{
			idc = -1;
			x = "0 * 					( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
			y = "0 * 					( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
			w = "24 *	 				( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
			h = "1 *	 				( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";

			text = "STATS";
		};

		class Background: GTA_RscText
		{
			idc = -1;
			x = "0 * 					( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
			y = "1.1 * 					( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
			w = "24 *	 				( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
			h = "10.5 *	 				( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";

			colorBackground[] = { 0, 0, 0, 0.7 };
		};

		class GroupMoney: GTA_RscControlsGroupNoScrollbars
		{
			idc = -1;
			x = "0.5 * 					( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
			y = "1.6 * 					( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
			w = "23 *	 				( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
			h = "4.5 *	 				( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";

			class Controls
			{

				class TitleMoney: GTA_RscText
				{
					idc = -1;
					x = "0 * 					( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
					y = "0 * 					( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
					w = "23 *	 				( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
					h = "1 *	 				( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";

					colorBackground[] = { 0, 0, 0, 0.5 };
					text = "Money";
				};

				class BackgroundMoney: GTA_RscText
				{
					idc = -1;
					x = "0 * 					( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
					y = "1 * 					( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
					w = "23 *	 				( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
					h = "3.5 *	 				( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";

					colorBackground[] = { 1, 1, 1, 0.1 };
				};

				class TextMoneyPlayer: GTA_RscText
				{
					idc = -1;
					x = "0.5 *					( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
					y = "1.5 * 					( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
					w = "22 *	 				( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
					h = "1 *	 				( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";

					colorBackground[] = { 0, 0, 0, 0.5 };
					text = "Player";
				};

				class EditMoneyPlayer: GTA_RscEdit
				{
					idc = IDC_RSCDISPLAYADMINCHILDSTATS_EDITMONEYPLAYER;
					x = "15.5 *					( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
					y = "1.5 * 					( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
					w = "7 *	 				( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
					h = "1 *	 				( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";

					style = "0x01 + 0x200";
				};

				class TextMoneyBank: GTA_RscText
				{
					idc = -1;
					x = "0.5 *					( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
					y = "3 * 					( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
					w = "22 *	 				( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
					h = "1 *	 				( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";

					colorBackground[] = { 0, 0, 0, 0.5 };
					text = "Bank";
				};

				class EditMoneyBank: GTA_RscEdit
				{
					idc = IDC_RSCDISPLAYADMINCHILDSTATS_EDITMONEYBANK;
					x = "15.5 *					( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
					y = "3 * 					( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
					w = "7 *	 				( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
					h = "1 *	 				( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";

					style = "0x01 + 0x200";
				};

			};

		};

		class GroupSurvival: GTA_RscControlsGroupNoScrollbars
		{
			idc = -1;
			x = "0.5 * 					( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
			y = "6.6 * 					( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
			w = "23 *	 				( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
			h = "4.5 *	 				( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";

			class Controls
			{

				class TitleSurvival: GTA_RscText
				{
					idc = -1;
					x = "0 * 					( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
					y = "0 * 					( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
					w = "23 *	 				( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
					h = "1 *	 				( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";

					colorBackground[] = { 0, 0, 0, 0.5 };
					text = "Survival";
				};

				class BackgroundSurvival: GTA_RscText
				{
					idc = -1;
					x = "0 * 					( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
					y = "1 * 					( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
					w = "23 *	 				( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
					h = "3.5 *	 				( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";

					colorBackground[] = { 1, 1, 1, 0.1 };
				};

				class TextSurvivalWater: GTA_RscText
				{
					idc = -1;
					x = "0.5 *					( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
					y = "1.5 * 					( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
					w = "22 *	 				( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
					h = "1 *	 				( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";

					colorBackground[] = { 0, 0, 0, 0.5 };
					text = "Water";
				};

				class EditSurvivalWater: GTA_RscEdit
				{
					idc = IDC_RSCDISPLAYADMINCHILDSTATS_EDITSURVIVALWATER;
					x = "15.5 *					( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
					y = "1.5 * 					( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
					w = "7 *	 				( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
					h = "1 *	 				( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";

					style = "0x01 + 0x200";
				};

				class TextSurvivalFood: GTA_RscText
				{
					idc = -1;
					x = "0.5 *					( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
					y = "3 * 					( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
					w = "22 *	 				( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
					h = "1 *	 				( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";

					colorBackground[] = { 0, 0, 0, 0.5 };
					text = "Food";
				};

				class EditSurvivalFood: GTA_RscEdit
				{
					idc = IDC_RSCDISPLAYADMINCHILDSTATS_EDITSURVIVALFOOD;
					x = "15.5 *					( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
					y = "3 * 					( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
					w = "7 *	 				( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
					h = "1 *	 				( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";

					style = "0x01 + 0x200";
				};

			};

		};

		class ButtonCancel: GTA_RscButtonMenu
		{
			idc = IDC_RSCDISPLAYADMINCHILDSTATS_BUTTONCANCEL;
			x = "0 * 					( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
			y = "11.7 * 				( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
			w = "5 * 					( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
			h = "1 *	 				( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";

			text = "Cancel";
		};

		class ButtonApply: GTA_RscButtonMenu
		{
			idc = IDC_RSCDISPLAYADMINCHILDSTATS_BUTTONAPPLY;
			x = "19 * 					( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
			y = "11.7 * 				( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
			w = "5 * 					( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
			h = "1 *	 				( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";

			text = "Apply";
		};

	};

};

class GTA_RscDisplayAdminChildSettings: GTA_RscControlsGroupNoScrollbars
{
	idc = IDC_RSCDISPLAYADMINCHILDSETTINGS;
	scriptName = "GTA_RscDisplayAdminChildSettings";
	scriptPath = "GUI";
	x = "10 * 					( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 ) + ( safezoneX + (safezoneW - ( ( safezoneW / safezoneH ) min 1.2 ) ) / 2 )";
	y = "7.85 *					( (	( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 ) + ( safezoneY + ( safezoneH - ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) ) / 2 )";
	w = "20 *	 				( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
	h = "9.3 * 					( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";

	class Controls
	{

		class Title: GTA_RscTitle
		{
			idc = -1;
			x = "0 * 					( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
			y = "0 * 					( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
			w = "20 *	 				( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
			h = "1 *	 				( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";

			text = "SETTINGS";
		};

		class Background: GTA_RscText
		{
			idc = -1;
			x = "0 * 					( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
			y = "1.1 * 					( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
			w = "20 *	 				( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
			h = "7 *	 				( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";

			colorBackground[] = { 0, 0, 0, 0.7 };
		};

		class GroupMap: GTA_RscControlsGroupNoScrollbars
		{
			idc = -1;
			x = "0.5 * 					( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
			y = "1.6 * 					( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
			w = "19 *	 				( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
			h = "6 *	 				( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";

			class Controls
			{

				class TitleMap: GTA_RscText
				{
					idc = -1;
					x = "0 * 					( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
					y = "0 * 					( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
					w = "19 *	 				( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
					h = "1 *	 				( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";

					colorBackground[] = { 0, 0, 0, 0.5 };
					text = "Map Settings";
				};

				class BackgroundMap: GTA_RscText
				{
					idc = -1;
					x = "0 * 					( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
					y = "1 * 					( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
					w = "19 *	 				( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
					h = "5 *	 				( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";

					colorBackground[] = { 1, 1, 1, 0.1 };
				};

				class TextMapEntities: GTA_RscText
				{
					idc = IDC_RSCDISPLAYADMINCHILDSETTINGS_TEXTMAPENTITIES;
					x = "0.5 *					( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
					y = "1.5 * 					( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
					w = "18 *	 				( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
					h = "1 *	 				( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";

					colorBackground[] = { 0, 0, 0, 0.5 };
					text = "Draw Entities";
				};

				class CheckMapEntities: GTA_RscCheckbox
				{
					idc = IDC_RSCDISPLAYADMINCHILDSETTINGS_CHECKMAPENTITIES;
					x = "17.5 *					( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
					y = "1.5 * 					( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
					w = "1 *	 				( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
					h = "1 *	 				( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
				};

				class TextMapAnimate: GTA_RscText
				{
					idc = IDC_RSCDISPLAYADMINCHILDSETTINGS_TEXTMAPANIMATE;
					x = "0.5 *					( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
					y = "3 * 					( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
					w = "18 *	 				( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
					h = "1 *	 				( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";

					colorBackground[] = { 0, 0, 0, 0.5 };
					text = "Animate Map";
				};

				class CheckMapAnimate: GTA_RscCheckbox
				{
					idc = IDC_RSCDISPLAYADMINCHILDSETTINGS_CHECKMAPANIMATE;
					x = "17.5 *					( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
					y = "3 * 					( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
					w = "1 *	 				( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
					h = "1 *	 				( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
				};

				class TextMapNames: GTA_RscText
				{
					idc = IDC_RSCDISPLAYADMINCHILDSETTINGS_TEXTMAPNAMES;
					x = "0.5 *					( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
					y = "4.5 * 					( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
					w = "18 *	 				( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
					h = "1 *	 				( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";

					colorBackground[] = { 0, 0, 0, 0.5 };
					text = "Player Names";
				};

				class CheckMapNames: GTA_RscCheckbox
				{
					idc = IDC_RSCDISPLAYADMINCHILDSETTINGS_CHECKMAPNAMES;
					x = "17.5 *					( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
					y = "4.5 * 					( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
					w = "1 *	 				( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
					h = "1 *	 				( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
				};

			};

		};

		class ButtonCancel: GTA_RscButtonMenu
		{
			idc = IDC_RSCDISPLAYADMINCHILDSETTINGS_BUTTONCANCEL;
			x = "0 * 					( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
			y = "8.3 * 					( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
			w = "5 * 					( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
			h = "1 *	 				( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";

			text = "Cancel";
		};

		class ButtonApply: GTA_RscButtonMenu
		{
			idc = IDC_RSCDISPLAYADMINCHILDSETTINGS_BUTTONAPPLY;
			x = "15 * 					( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
			y = "8.3 * 					( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
			w = "5 * 					( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
			h = "1 *	 				( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";

			text = "Apply";
		};

	};

};

class GTA_RscDisplayAdminChildIntel: GTA_RscControlsGroupNoScrollbars
{
	idc = IDC_RSCDISPLAYADMINCHILDINTEL;
	scriptName = "GTA_RscDisplayAdminChildIntel";
	scriptPath = "GUI";
	x = "6.5 * 					( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 ) + ( safezoneX + (safezoneW - ( ( safezoneW / safezoneH ) min 1.2 ) ) / 2 )";
	y = "6.1 *					( (	( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 ) + ( safezoneY + ( safezoneH - ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) ) / 2 )";
	w = "27 *	 				( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
	h = "12.8 * 				( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";

	class Controls
	{

		class Title: GTA_RscTitle
		{
			idc = IDC_RSCDISPLAYADMINCHILDINTEL_TITLE;
			x = "0 * 					( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
			y = "0 * 					( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
			w = "27 *	 				( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
			h = "1 *	 				( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";

			text = "INTEL";
		};

		class Background: GTA_RscText
		{
			idc = IDC_RSCDISPLAYADMINCHILDINTEL_BACKGROUND;
			x = "0 * 					( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
			y = "1.1 * 					( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
			w = "27 *	 				( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
			h = "10.6 *	 				( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";

			colorBackground[] = { 0, 0, 0, 0.7 };
		};

		class GroupTime: GTA_RscControlsGroupNoScrollbars
		{
			idc = IDC_RSCDISPLAYADMINCHILDINTEL_GROUPTIME;
			x = "0.5 * 					( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
			y = "1.6 * 					( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
			w = "26 *	 				( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
			h = "4.5 *	 				( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";

			class Controls
			{

				class TitleTime: GTA_RscText
				{
					idc = IDC_RSCDISPLAYADMINCHILDINTEL_TITLETIME;
					x = "0 * 					( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
					y = "0 * 					( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
					w = "26 *	 				( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
					h = "1 *	 				( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";

					colorBackground[] = { 0, 0, 0, 0.5 };
					text = "Time";
				};

				class BackgroundTime: GTA_RscText
				{
					idc = IDC_RSCDISPLAYADMINCHILDINTEL_BACKGROUNDTIME;
					x = "0 * 					( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
					y = "1 * 					( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
					w = "26 *	 				( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
					h = "3.5 *	 				( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";

					colorBackground[] = { 1, 1, 1, 0.1 };
				};

				class SliderTime: GTA_RscXSliderH
				{
					idc = IDC_RSCDISPLAYADMINCHILDINTEL_SLIDERTIME;
					x = "0.5 *					( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
					y = "1.5 * 					( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
					w = "25 *	 				( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
					h = "1 *	 				( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
				};

				class ValueTime: GTA_RscText
				{
					idc = IDC_RSCDISPLAYADMINCHILDINTEL_VALUETIME;
					x = "0.5 *					( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
					y = "2.5 * 					( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
					w = "25 *	 				( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
					h = "1.5 *	 				( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";

					sizeEx = "1.5 * 			( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
					style = 2;
					text = "12:20";
				};

			};

		};

		class GroupWeather: GTA_RscControlsGroupNoScrollbars
		{
			idc = IDC_RSCDISPLAYADMINCHILDINTEL_GROUPWEATHER;
			x = "0.5 * 					( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
			y = "6.6 * 					( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
			w = "26 *	 				( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
			h = "4.5 *	 				( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";

			class Controls
			{

				class TitleWeather: GTA_RscText
				{
					idc = IDC_RSCDISPLAYADMINCHILDINTEL_TITLEWEATHER;
					x = "0 * 					( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
					y = "0 * 					( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
					w = "26 *	 				( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
					h = "1 *	 				( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";

					colorBackground[] = { 0, 0, 0, 0.5 };
					text = "Weather";
				};

				class BackgroundWeather: GTA_RscText
				{
					idc = IDC_RSCDISPLAYADMINCHILDINTEL_BACKGROUNDWEATHER;
					x = "0 * 					( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
					y = "1 * 					( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
					w = "26 *	 				( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
					h = "5 *	 				( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";

					colorBackground[] = { 1, 1, 1, 0.1 };
				};

				class TextOvercast: GTA_RscText
				{
					idc = IDC_RSCDISPLAYADMINCHILDINTEL_TEXTOVERCAST;
					x = "0.5 *					( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
					y = "1.5 * 					( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
					w = "7.9 *	 				( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
					h = "1 *	 				( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";

					colorBackground[] = { 0, 0, 0, 0.5 };
					text = "Overcast";
				};

				class SliderOvercast: GTA_RscXSliderH
				{
					idc = IDC_RSCDISPLAYADMINCHILDINTEL_SLIDEROVERCAST;
					x = "8.5 *					( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
					y = "1.5 * 					( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
					w = "17 *	 				( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
					h = "1 *	 				( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
				};

				class TextFog: GTA_RscText
				{
					idc = IDC_RSCDISPLAYADMINCHILDINTEL_TEXTFOG;
					x = "0.5 *					( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
					y = "3 * 					( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
					w = "7.9 *	 				( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
					h = "1 *	 				( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";

					colorBackground[] = { 0, 0, 0, 0.5 };
					text = "Fog";
				};

				class SliderFog: GTA_RscXSliderH
				{
					idc = IDC_RSCDISPLAYADMINCHILDINTEL_SLIDERFOG;
					x = "8.5 *					( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
					y = "3 * 					( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
					w = "17 *	 				( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
					h = "1 *	 				( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
				};

			};

		};

		class ButtonCancel: GTA_RscButtonMenu
		{
			idc = IDC_RSCDISPLAYADMINCHILDINTEL_BUTTONCANCEL;
			x = "0 * 					( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
			y = "11.8 * 				( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
			w = "5 * 					( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
			h = "1 *	 				( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";

			text = "Cancel";
		};

		class ButtonApply: GTA_RscButtonMenu
		{
			idc = IDC_RSCDISPLAYADMINCHILDINTEL_BUTTONAPPLY;
			x = "22 * 					( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
			y = "11.8 * 				( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
			w = "5 * 					( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
			h = "1 *	 				( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";

			text = "Apply";
		};

	};

};

class GTA_RscDisplayAdmin
{
	idd = IDD_RSCDISPLAYADMIN;
	scriptName = "GTA_RscDisplayAdmin";
	scriptPath = "GUI";
	onLoad = "[ _this, ""GTA_RscDisplayAdmin"" ] call GTA_fnc_initDisplay";

	class ControlsBackground
	{

		class Map: GTA_RscMapControl
		{
			idc = IDC_RSCDISPLAYADMIN_MAP;
			x = "safezoneX";
			y = "safezoneY";
			w = "safezoneW";
			h = "safeZoneH";

			alphaFadeEndScale = 100;
			alphaFadeStartScale = 100;
			colorBackground[] = {1,1,1,1};
			colorCountlines[] = {0,0,0,0};
			colorCountlinesWater[] = {0,0,0,0};
			colorForest[] = {1,1,1,1};
			colorGrid[] = {0,0,0,0};
			colorGridMap[] = {0,0,0,0};
			colorMainCountlines[] = {0,0,0,0};
			colorMainCountlinesWater[] = {0,0,0,0};
			colorOutside[] = { 0.251, 0.275, 0.31, 1 };
			colorRocks[] = {0,0,0,0};
			colorSea[] = {0.467,0.631,0.851,0.25};
			drawObjects = 0;
			font = "PuristaMedium";
			fontGrid = "PuristaMedium";
			fontInfo = "PuristaMedium";
			fontLabel = "PuristaMedium";
			fontLevel = "PuristaMedium";
			fontNames = "PuristaMedium";
			fontUnits = "PuristaMedium";
			maxSatelliteAlpha = 1;
			ptsPerSquareCLn = 200;
			ptsPerSquareCost = 200;
			ptsPerSquareFor = 200;
			ptsPerSquareForEdge = 200;
			ptsPerSquareObj = 200;
			ptsPerSquareRoad = 200;
			ptsPerSquareTxt = 20;
			scaleDefault = 0.3;
			sizeExGrid = 0.06;
			sizeExInfo = 0;
			sizeExLabel = 0;
			sizeExLevel = 0;
			sizeExNames = 0;
			sizeExUnits = 0;
		};

	};

	class Controls
	{

		class Title: GTA_RscTitle
		{
			idc = IDC_RSCDISPLAYADMIN_TITLE;
			x = "safezoneX";
			y = "safezoneY";
			w = "safezoneW";
			h = "2 * 					( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";

			colorBackground[] = { 0, 0, 0, 0.9 };
			text = "ADMINISTRATION";
		};

		class Notification: GTA_RscText
		{
			idc = IDC_RSCDISPLAYADMIN_NOTIFICATION;
			x = "safezoneX + ( safezoneW / 2 ) - ( 20 * ( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 ) )";
			y = "safezoneY";
			w = "40 * 					( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
			h = "2 * 					( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";

			shadow = 0;
			sizeEx = "1.2 * 			( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
			style = 2;
		};

		class GroupPlayers: GTA_RscControlsGroupNoScrollbars
		{
			idc = IDC_RSCDISPLAYADMIN_GROUPPLAYERS;
			x = "0 * 					( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 ) + ( safezoneX )";
			y = "2 * 					( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 ) + ( safezoneY )";
			w = "14 *	 				( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
			h = "28 * 					( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";

			class Controls
			{

				class BackgroundPlayers: GTA_RscText
				{
					idc = IDC_RSCDISPLAYADMIN_BACKGROUNDPLAYERS;
					x = "0 * 					( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
					y = "0 * 					( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
					w = "14 *	 				( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
					h = "28 * 					( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";

					colorBackground[] = { 0, 0, 0, 0.7 };
				};

				class BackgroundSearch: GTA_RscText
				{
					idc = IDC_RSCDISPLAYADMIN_BACKGROUNDSEARCH;
					x = "0.5 * 					( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
					y = "0.5 * 					( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
					w = "13 *	 				( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
					h = "1 * 					( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";

					colorBackground[] = { 1, 1, 1, 0.1 };
				};

				class EditSearch: GTA_RscEdit
				{
					idc = IDC_RSCDISPLAYADMIN_EDITSEARCH;
					x = "0.5 * 					( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
					y = "0.5 * 					( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
					w = "13 *	 				( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
					h = "1 * 					( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";

					shadow = 0;
					style = "0x200";
				};

				class TextSearchPlaceholder: GTA_RscText
				{
					idc = IDC_RSCDISPLAYADMIN_TEXTSEARCHPLACEHOLDER;
					x = "0.5 * 					( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
					y = "0.5 * 					( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
					w = "13 *	 				( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
					h = "1 * 					( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";

					shadow = 0;
					style = "0x200";
					text = "Search...";
				};

				class BackgroundFilter: GTA_RscText
				{
					idc = IDC_RSCDISPLAYADMIN_BACKGROUNDFILTER;
					x = "0.5 * 					( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
					y = "2 * 					( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
					w = "2.6 *	 				( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
					h = "2 * 					( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";

					colorBackground[] = { 1, 1, 1, 0.1 };
				};

				class Filter0: GTA_RscActivePictureKeepAspect
				{
					idc = IDC_RSCDISPLAYADMIN_FILTER0;
					x = "0.5 * 					( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
					y = "2 * 					( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
					w = "2.6 *	 				( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
					h = "2 * 					( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";

					text = "\a3\ui_f_curator\Data\Displays\RscDisplayCurator\side_west_ca.paa";
					tooltip = "BLUEFOR";
				};

				class Filter1: GTA_RscActivePictureKeepAspect
				{
					idc = IDC_RSCDISPLAYADMIN_FILTER1;
					x = "3.1 * 					( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
					y = "2 * 					( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
					w = "2.6 *	 				( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
					h = "2 * 					( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";

					text = "\a3\ui_f_curator\Data\Displays\RscDisplayCurator\side_east_ca.paa";
					tooltip = "OPFOR";
				};

				class Filter2: GTA_RscActivePictureKeepAspect
				{
					idc = IDC_RSCDISPLAYADMIN_FILTER2;
					x = "5.7 * 					( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
					y = "2 * 					( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
					w = "2.6 *	 				( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
					h = "2 * 					( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";

					text = "\a3\ui_f_curator\Data\Displays\RscDisplayCurator\side_guer_ca.paa";
					tooltip = "Independant";
				};

				class Filter3: GTA_RscActivePictureKeepAspect
				{
					idc = IDC_RSCDISPLAYADMIN_FILTER3;
					x = "8.3 * 					( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
					y = "2 * 					( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
					w = "2.6 *	 				( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
					h = "2 * 					( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";

					text = "\a3\ui_f_curator\Data\Displays\RscDisplayCurator\side_civ_ca.paa";
					tooltip = "Civilian";
				};

				class Filter4: GTA_RscActivePictureKeepAspect
				{
					idc = IDC_RSCDISPLAYADMIN_FILTER4;
					x = "10.9 * 				( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
					y = "2 * 					( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
					w = "2.6 *	 				( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
					h = "2 * 					( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";

					text = "\a3\ui_f_curator\Data\Displays\RscDisplayCurator\side_unknown_ca.paa";
					tooltip = "All";
				};

				class ListPlayers: GTA_RscListbox
				{
					idc = IDC_RSCDISPLAYADMIN_LISTPLAYERS;
					x = "0.5 * 					( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
					y = "4 * 					( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
					w = "13 *	 				( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
					h = "23.5 *	 				( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";

					colorBackground[] = { 1, 1, 1, 0.1 };
					colorSelect[] = { 0.95, 0.95, 0.95, 1 };
					colorSelect2[] = { 0.95, 0.95, 0.95, 1 };
					colorSelectBackground[] = { 1, 1, 1, 0.25 };
					colorSelectBackground2[] = { 1, 1, 1, 0.25 };
				};

			};

		};

		class GroupPlayer: GTA_RscControlsGroupNoScrollbars
		{
			idc = IDC_RSCDISPLAYADMIN_GROUPPLAYER;
			x = "safezoneX + safezoneW - ( 14 * ( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 ) )";
			y = "2 * 					( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 ) + ( safezoneY )";
			w = "14 *	 				( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
			h = "8.6 * 					( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";

			class Controls
			{

				class BackgroundPlayer: GTA_RscText
				{
					idc = IDC_RSCDISPLAYADMIN_GROUPPLAYER;
					x = "0 * 					( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
					y = "0 * 					( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
					w = "14 *	 				( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
					h = "9.7 *	 				( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";

					colorBackground[] = { 0, 0, 0, 0.7 };
				};

				class TextPlayerName: GTA_RscStructuredText
				{
					idc = IDC_RSCDISPLAYADMIN_TEXTPLAYERNAME;
					x = "0.5 * 					( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
					y = "0.5 * 					( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
					w = "13 *	 				( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
					h = "1 *	 				( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";

					colorBackground[] = { 0, 0, 0, 0.9 };
					style = 2;
					text = "";

					class Attributes
					{
						font = "PuristaMedium";
						color = "#ffffff";
						align = "center";
						shadow = 0;
					};
				};

				class ButtonKick: GTA_RscButton
				{
					idc = IDC_RSCDISPLAYADMIN_BUTTONKICK;
					x = "0.5 * 					( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
					y = "1.6 * 					( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
					w = "6.45 *	 				( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
					h = "1 *	 				( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";

					text = "Kick";
				};

				class ButtonBan: GTA_RscButton
				{
					idc = IDC_RSCDISPLAYADMIN_BUTTONBAN;
					x = "7.05 *					( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
					y = "1.6 * 					( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
					w = "6.45 *	 				( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
					h = "1 *	 				( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";

					text = "Ban";
				};

				class ButtonKill: GTA_RscButton
				{
					idc = IDC_RSCDISPLAYADMIN_BUTTONKILL;
					x = "0.5 * 					( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
					y = "2.7 * 					( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
					w = "6.45 *	 				( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
					h = "1 *	 				( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";

					text = "Kill";
				};

				class ButtonHeal: GTA_RscButton
				{
					idc = IDC_RSCDISPLAYADMIN_BUTTONHEAL;
					x = "7.05 * 				( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
					y = "2.7 * 					( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
					w = "6.45 *	 				( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
					h = "1 *	 				( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";

					text = "Heal";
				};

				class TextFreeze: GTA_RscText
				{
					idc = IDC_RSCDISPLAYADMIN_TEXTFREEZE;
					x = "0.5 * 					( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
					y = "3.8 * 					( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
					w = "13 *	 				( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
					h = "1 *	 				( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";

					colorBackground[] = { 0, 0, 0, 0.5 };
					text = "Freeze";
				};

				class CheckFreeze: GTA_RscCheckbox
				{
					idc = IDC_RSCDISPLAYADMIN_CHECKFREEZE;
					x = "12.5 * 				( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
					y = "3.8 * 					( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
					w = "1 *	 				( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
					h = "1 *	 				( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
				};

				class TextHide: GTA_RscText
				{
					idc = IDC_RSCDISPLAYADMIN_TEXTHIDE;
					x = "0.5 * 					( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
					y = "4.9 * 					( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
					w = "13 *	 				( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
					h = "1 *	 				( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";

					colorBackground[] = { 0, 0, 0, 0.5 };
					text = "Hide";
				};

				class CheckHide: GTA_RscCheckbox
				{
					idc = IDC_RSCDISPLAYADMIN_CHECKHIDE;
					x = "12.5 * 				( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
					y = "4.9 * 					( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
					w = "1 *	 				( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
					h = "1 *	 				( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
				};

				class TextNeutral: GTA_RscText
				{
					idc = IDC_RSCDISPLAYADMIN_TEXTNEUTRAL;
					x = "0.5 * 					( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
					y = "6 * 					( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
					w = "13 *	 				( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
					h = "1 *	 				( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";

					colorBackground[] = { 0, 0, 0, 0.5 };
					text = "Neutral";
				};

				class CheckNeutral: GTA_RscCheckbox
				{
					idc = IDC_RSCDISPLAYADMIN_CHECKNEUTRAL;
					x = "12.5 * 				( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
					y = "6 * 					( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
					w = "1 *	 				( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
					h = "1 *	 				( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
				};

				class TextImmune: GTA_RscText
				{
					idc = IDC_RSCDISPLAYADMIN_TEXTIMMUNE;
					x = "0.5 * 					( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
					y = "7.1 * 				( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
					w = "13 *	 				( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
					h = "1 *	 				( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";

					colorBackground[] = { 0, 0, 0, 0.5 };
					text = "Immune";
				};

				class CheckImmune: GTA_RscCheckbox
				{
					idc = IDC_RSCDISPLAYADMIN_CHECKIMMUNE;
					x = "12.5 * 				( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
					y = "7.1 * 					( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
					w = "1 *	 				( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
					h = "1 *	 				( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
				};

			};

		};

		class CameraSettings: GTA_RscToolbox
		{
			idc = IDC_RSCDISPLAYADMIN_CAMERASETTINGS;
			x = "0 * 					( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 ) + ( safezoneX )";
			y = "safezoneY + safezoneH - 3.1 * ( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
			w = "10 *	 				( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
			h = "1 * 					( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";

      colorBackground[] = {0, 0, 0, 0.8};
      colorSelectedBg[] = {0.2, 0.2, 0.2, 1};
      columns = 3;
      font = "PuristaLight";
      strings[] = {"Map", "1st Person", "3rd Person"};
		};

    class DutySettings: GTA_RscToolbox
		{
			idc = IDC_RSCDISPLAYADMIN_DUTYSETTINGS;
			x = "0 * 					( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 ) + ( safezoneX )";
			y = "safezoneY + safezoneH - 2 * ( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
			w = "10 *	 				( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
			h = "1 * 					( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";

      colorBackground[] = {0, 0, 0, 0.8};
      colorSelectedBg[] = {0.2, 0.2, 0.2, 1};
      columns = 2;
      font = "PuristaLight";
      strings[] = {"Off Duty", "On Duty"};
		};

		class ButtonStats: GTA_RscButtonMenu
		{
			idc = IDC_RSCDISPLAYADMIN_BUTTONSTATS;
			x = "safezoneX + safezoneW - ( 29.3 * ( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 ) )";
			y = "23 * 					( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 ) + ( safezoneY + safezoneH - ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) )";
			w = "7 *	 				( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
			h = "1 * 					( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";

			text = "Edit Stats";
		};

		class ButtonSettings: GTA_RscButtonMenu
		{
			idc = IDC_RSCDISPLAYADMIN_BUTTONSETTINGS;
			x = "safezoneX + safezoneW - ( 22.2 * ( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 ) )";
			y = "23 * 					( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 ) + ( safezoneY + safezoneH - ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) )";
			w = "7 *	 				( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
			h = "1 * 					( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";

			text = "Map Settings";
		};

		class ButtonIntel: GTA_RscButtonMenu
		{
			idc = IDC_RSCDISPLAYADMIN_BUTTONINTEL;
			x = "safezoneX + safezoneW - ( 15.1 * ( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 ) )";
			y = "23 * 					( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 ) + ( safezoneY + safezoneH - ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) )";
			w = "7 *	 				( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
			h = "1 * 					( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";

			text = "Intel";
		};

		class ButtonOK: GTA_RscButtonMenuOK
		{
			x = "safezoneX + safezoneW - ( 8 * ( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 ) )";
			y = "23 * 					( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 ) + ( safezoneY + safezoneH - ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) )";
			w = "7 *	 				( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
			h = "1 * 					( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";

			text = "Close";
		};

		class BackgroundOverlay: GTA_RscText
		{
			idc = IDC_RSCDISPLAYADMIN_BACKGROUNDOVERLAY;
			x = "safezoneX";
			y = "safezoneY";
			w = "safezoneW";
			h = "safezoneH";

			colorBackground[] = { 0, 0, 0, 0.3 };
		};

		class ChildStats: GTA_RscDisplayAdminChildStats {};

		class ChildSettings: GTA_RscDisplayAdminChildSettings {};

		class ChildIntel: GTA_RscDisplayAdminChildIntel {};

	};
};
