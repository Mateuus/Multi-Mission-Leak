class ES_wanted_menu {
	idd = 2400;
	name= "ES_wanted_menu";
	movingEnable = 0;
	enableSimulation = 1;

	class controlsBackground {
			class ES_RscTitleBackground: ES_RscPicture
			{
				idc = -1;
				text = "images\Logos\wanted_menu.jpg";
				x = 0.190625 * safezoneW + safezoneX;
				y = 0.115 * safezoneH + safezoneY;
				w = 0.592969 * safezoneW;
				h = 0.044 * safezoneH;
			};

			class MainBackground: ES_RscText
			{
				idc = -1;
				x = 0.190625 * safezoneW + safezoneX;
				y = 0.17 * safezoneH + safezoneY;
				w = 0.592969 * safezoneW;
				h = 0.572 * safezoneH;
				colorBackground[] = {0, 0, 0, 0.7};
			};
		};

	class controls {
			class WantedList: ES_RscListbox
			{
				idc = 2401;
			    text = "";
				sizeEx = 0.035;
				onLBSelChanged = "[] call ES_fnc_wantedInfo";
				x = 0.200937 * safezoneW + safezoneX;
				y = 0.203 * safezoneH + safezoneY;
				w = 0.257813 * safezoneW;
				h = 0.517 * safezoneH;
			};

			class WantedDetails: ES_RscListbox
			{
				idc = 2402;
				text = "";
				sizeEx = 0.035;
				colorBackground[] = {0, 0, 0, 0};
				x = 0.47422 * safezoneW + safezoneX;
				y = 0.346 * safezoneH + safezoneY;
				w = 0.299062 * safezoneW;
				h = 0.374 * safezoneH;
			};

			class BountyPrice: ES_RscText
			{
				idc = 2403;
			    text = "";
				x = 0.479375 * safezoneW + safezoneX;
				y = 0.269 * safezoneH + safezoneY;
				w = 0.278437 * safezoneW;
				h = 0.044 * safezoneH;
			};

			class CloseButtonKey: ES_RscButtonMenu
			{
				idc = -1;
				text = "$STR_Global_Close";
				onButtonClick = "closeDialog 0;";
				x = 0.190625 * safezoneW + safezoneX;
				y = 0.753 * safezoneH + safezoneY;
				w = 0.139219 * safezoneW;
				h = 0.033 * safezoneH;
				tooltip = "Schliessen";
			};

			class PardonButtonKey: ES_RscButtonMenu
			{
				idc = 2405;
				text = "$STR_Wanted_Pardon";
				onButtonClick = "[] call ES_fnc_pardon; closeDialog 0;";
				x = 0.680469 * safezoneW + safezoneX;
				y = 0.753 * safezoneH + safezoneY;
				w = 0.103125 * safezoneW;
				h = 0.033 * safezoneH;
			};
		};
	};
	