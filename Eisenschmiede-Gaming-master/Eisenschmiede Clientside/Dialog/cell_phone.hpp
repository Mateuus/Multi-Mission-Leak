class ES_cell_phone {
	idd = 3000;
	name= "ES_cell_phone";
	movingEnable = 0;
	enableSimulation = 1;
	onLoad = "[] spawn ES_fnc_cellphone";

	class controlsBackground {
		class ES_RscTitleBackground: ES_RscPicture
		{
			idc = -1;
			text = "images\Logos\cellphone_menu.jpg";
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
		class TextToSend: ES_RscText
		{
			idc = 3002;
			text = "$STR_CELL_TextToSend";
			x = 0.309219 * safezoneW + safezoneX;
			y = 0.247 * safezoneH + safezoneY;
			w = 0.144375 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0,0,0,0};
		};

		class textEdit: ES_RscEdit
		{
			idc = 3003;
		
			text = "";
			sizeEx = 0.030;
			x = 0.309219 * safezoneW + safezoneX;
			y = 0.28 * safezoneH + safezoneY;
			w = 0.386719 * safezoneW;
			h = 0.033 * safezoneH;
			colorBackground[] = {0,0,0,0};
		};

		class TextMsgButton: ES_RscButtonMenu
		{
			idc = 3015;
			text = "$STR_CELL_TextMSGBtn";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "[] call ES_fnc_cell_textmsg";

			x = 0.567031 * safezoneW + safezoneX;
			y = 0.335 * safezoneH + safezoneY;
			w = 0.12375 * safezoneW;
			h = 0.033 * safezoneH;
		};

		class TextCopButton: ES_RscButtonMenu
		{
			idc = 3016;
			text = "$STR_CELL_TextPolice";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "[] call ES_fnc_cell_textcop";

			x = 0.567031 * safezoneW + safezoneX;
			y = 0.379 * safezoneH + safezoneY;
			w = 0.12375 * safezoneW;
			h = 0.033 * safezoneH;
		};

		class TextAdminButton: ES_RscButtonMenu
		{
			idc = 3017;
			text = "$STR_CELL_TextAdmins";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "[] call ES_fnc_cell_textadmin";

			x = 0.567031 * safezoneW + safezoneX;
			y = 0.423 * safezoneH + safezoneY;
			w = 0.12375 * safezoneW;
			h = 0.033 * safezoneH;
		};

		class EMSRequest: ES_RscButtonMenu
		{
			idc = 3022;
			text = "$STR_CELL_EMSRequest";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "[] call ES_fnc_cell_emsrequest";

			x = 0.567031 * safezoneW + safezoneX;
			y = 0.467 * safezoneH + safezoneY;
			w = 0.12375 * safezoneW;
			h = 0.033 * safezoneH;
		};

        class search : ES_RscEdit
		{
			idc = 9854;
			text = "";
			x = 0.3099 * safezoneW + safezoneX;
			y = 0.365 * safezoneH + safezoneY;
			w = 0.211406 * safezoneW;
			h = 0.027 * safezoneH;
			onKeyUp = "if(ctrlText 9854 != """") then {[] call ES_fnc_sortlist_cell;} else { [] call ES_fnc_cellphone;}";
			colorBackground[] = {0,0,0,0};
		};

		class Title_search : ES_RscTitle
		{
			idc = -1;
			text = "Spieler suchen:";

			x = 0.3087 * safezoneW + safezoneX;
			y = 0.33 * safezoneH + safezoneY;
			w = 0.0825 * safezoneW;
			h = 0.03 * safezoneH;
		};

		class AdminMsgButton: ES_RscButtonMenu
		{
			idc = 3020;
			text = "$STR_CELL_AdminMsg";
			onButtonClick = "[] call ES_fnc_cell_adminmsg";

			x = 0.567031 * safezoneW + safezoneX;
			y = 0.654 * safezoneH + safezoneY;
			w = 0.12375 * safezoneW;
			h = 0.033 * safezoneH;
			colorBackground[] = {10,-1,-1,1};
		};

		class AdminMsgAllButton: ES_RscButtonMenu
		{
			idc = 3021;
			text = "$STR_CELL_AdminMSGAll";
			onButtonClick = "[] call ES_fnc_cell_adminmsgall";

			x = 0.567031 * safezoneW + safezoneX;
			y = 0.698 * safezoneH + safezoneY;
			w = 0.12375 * safezoneW;
			h = 0.033 * safezoneH;
			colorBackground[] = {10,-1,-1,1};
		};

		class CloseButtonKey: ES_RscButtonMenu
		{
			idc = -1;
			text = "$STR_Global_Close";
			onButtonClick = "closeDialog 0;";

			x = 0.29375 * safezoneW + safezoneX;
			y = 0.775 * safezoneH + safezoneY;
			w = 0.113437 * safezoneW;
			h = 0.033 * safezoneH;
		};

		class PlayerList: ES_RscListbox
		{
			idc = 3004;
			sizeEx = 0.033;
			font = "PuristaMedium";
			
			x = 0.309219 * safezoneW + safezoneX;
			y = 0.4 * safezoneH + safezoneY;
			w = 0.211406 * safezoneW;
			h = 0.35 * safezoneH;
		};
	};
};
