class ES_wantedadd2 {
	idd = 9900;
	name= "ES_wantedadd2";
	movingEnable = 0;
	enableSimulation = 1;
	onLoad = "[] spawn ES_fnc_wantedadd2;";

	class controlsBackground {
			class ES_RscTitleBackground: ES_RscPicture
			{
				idc = -1;
				text = "images\Logos\wantedadd_menu.jpg";
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

			class PlayerList_Admin: ES_RscListbox
			{
				idc = 9902;
				text = "";
				sizeEx = 0.035;
				onLBSelChanged = "[_this] spawn ES_fnc_adminQuery";
				x = 0.200937 * safezoneW + safezoneX;
				y = 0.24 * safezoneH + safezoneY;
				w = 0.257813 * safezoneW;
				h = 0.48 * safezoneH;
			};

			class search : ES_RscEdit
			{
				idc = 9854;
				text = "";
				x = 0.200937 * safezoneW + safezoneX;
				y = 0.2 * safezoneH + safezoneY;
				w = 0.257813 * safezoneW;
				h = 0.027 * safezoneH;
				onKeyUp = "if(ctrlText 9854 != """") then {[] call ES_fnc_sortlist_wantedadd;} else { [] call ES_fnc_wantedadd2;}";
				colorBackground[] = {0,0,0,0};
				tooltip = "Spieler suchen.";
			};

			class RSUCombo_2101: ES_RscListbox
			{
				idc = 9991;
				text = "";
				sizeEx = 0.035;
				x = 0.47422 * safezoneW + safezoneX;
				y = 0.203 * safezoneH + safezoneY;
				w = 0.299062 * safezoneW;
				h = 0.517 * safezoneH;
				// onLBSelChanged="call fnc_Cmb_changed;";
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

			class Adminwanted: ES_RscButtonMenu
			{
				idc = -1;
				text = "Hinzufuegen";
				onButtonClick = "[] call ES_fnc_wanted2;";
				x = 0.680469 * safezoneW + safezoneX;
				y = 0.753 * safezoneH + safezoneY;
				w = 0.103125 * safezoneW;
				h = 0.033 * safezoneH;
			};
		};
	};
	