class ES_key_management {
	idd = 2700;
	name= "ES_key_chain";
	movingEnable = 0;
	enableSimulation = 1;
	onLoad = "[] spawn ES_fnc_keyMenu;";
	
	class controlsBackground {

		class ES_RscTitleBackground: ES_RscPicture
		{
			idc = -1;
			text = "images\Logos\key_menu.jpg";
			x = 0.29375 * safezoneW + safezoneX;
			y = 0.17 * safezoneH + safezoneY;
			w = 0.4125 * safezoneW;
			h = 0.055 * safezoneH;
		};

		class MainBackground: ES_RscText
		{
			idc = -1;
			x = 0.29375 * safezoneW + safezoneX;
			y = 0.2305 * safezoneH + safezoneY;
			w = 0.4125 * safezoneW;
			h = 0.539 * safezoneH;
			colorBackground[] = {0,0,0,0.7};
		};
    };

    class controls {

		class KeyChainList: ES_RscListbox
		{
			idc = 2701;
			text = "";
			sizeEx = 0.035;

			x = 0.304062 * safezoneW + safezoneX;
			y = 0.2525 * safezoneH + safezoneY;
			w = 0.237187 * safezoneW;
			h = 0.418 * safezoneH;
		};

		class CloseButtonKey: ES_RscButtonMenu
		{
			idc = -1;
			text = "$STR_Global_Close";
			onButtonClick = "closeDialog 0;";

			x = 0.293229 * safezoneW + safezoneX;
			y = 0.774944 * safezoneH + safezoneY;
			w = 0.111927 * safezoneW;
			h = 0.032074 * safezoneH;
			tooltip = "Schließen"; //--- ToDo: Localize;
		};

		class NearPlayer: ES_RscListbox
		{
			idc = 2702;
			sizeEx = 0.035;

			x = 0.546406 * safezoneW + safezoneX;
			y = 0.2965 * safezoneH + safezoneY;
			w = 0.149531 * safezoneW;
			h = 0.253 * safezoneH;
		};

		class PlayerNear: ES_RscTitle
		{
			idc = -1;
			text = "Spieler in der Nähe:"; //--- ToDo: Localize;
			x = 0.546406 * safezoneW + safezoneX;
			y = 0.2525 * safezoneH + safezoneY;
			w = 0.09 * safezoneW;
			h = 0.044 * safezoneH;
			colorBackground[] = {0,0,0,0};
		};

		class DropKey: ES_RscButtonMenu
		{
			idc = -1;
			text = "$STR_Keys_DropKey";
			onButtonClick = "[] call ES_fnc_keyDrop";

			x = 0.546406 * safezoneW + safezoneX;
			y = 0.6375 * safezoneH + safezoneY;
			w = 0.149531 * safezoneW;
			h = 0.033 * safezoneH;
			colorBackground[] = {5,-1,-1,1};
			tooltip = "Schlüssel wegwerfen"; //--- ToDo: Localize;
		};

		class GiveKey: ES_RscButtonMenu
		{
			idc = 2703;
			text = "$STR_Keys_GiveKey";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "[] call ES_fnc_keyGive";

			x = 0.546406 * safezoneW + safezoneX;
			y = 0.5825 * safezoneH + safezoneY;
			w = 0.149531 * safezoneW;
			h = 0.033 * safezoneH;
			tooltip = "Schlüssel geben"; //--- ToDo: Localize;
		};
	};
};
