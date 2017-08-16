class Life_cell_phone {
	idd = 3000;
	name= "life_cell_phone";
	movingEnable = 0;
	enableSimulation = 1;
	onLoad = "[] spawn life_fnc_cellphone";

	class controlsBackground {
		class tabletv3: life_RscPicture
		{
			idc = 1200;
			text = "textures\tablet\tabletv3.paa";
			x = 0.242187 * safezoneW + safezoneX;
			y = 0.104 * safezoneH + safezoneY;
			w = 0.515625 * safezoneW;
			h = 0.847 * safezoneH;
		};
	};

	class controls
	{
		class Title: Life_RscTitle
		{
			colorBackground[] = {0, 0, 0, 0};
			idc = 3001;
			text = "Mobile";
			x = 0.654688 * safezoneW + safezoneX;
			y = 0.302 * safezoneH + safezoneY;
			w = 0.319688 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class TextToSend: Life_RscTitle {
			colorBackground[] = {0, 0, 0, 0};
			idc = 3002;
			text = "$STR_CELL_TextToSend";
			x = 0.329844 * safezoneW + safezoneX;
			y = 0.302 * safezoneH + safezoneY;
			w = 0.2475 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class SendTo: Life_RscText {
			idc = -1;
			text = "Senden an:";
			x = 0.335 * safezoneW + safezoneX;
			y = 0.511 * safezoneH + safezoneY;
			w = 0.237187 * safezoneW;
			h = 0.022 * safezoneH;
		};


		class textEdit: Life_RscEdit {
			idc = 3003;
			text = "";
			sizeEx = 0.030;
			x = 0.334999 * safezoneW + safezoneX;
			y = 0.346 * safezoneH + safezoneY;
			w = 0.340312 * safezoneW;
			h = 0.121 * safezoneH;
		};

		class TextMsgButton: Life_RscButtonMenu {
			idc = 3015;
			text = "Naricht senden";
			onButtonClick = "[] call TON_fnc_cell_textmsg";
			x = 0.592812 * safezoneW + safezoneX;
			y = 0.511 * safezoneH + safezoneY;
			w = 0.0825 * safezoneW;
			h = 0.022 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0.9,0.5,0.1,1};
		};

	//	class PlayerList: Life_RscCombo {
	//		idc = 3004;
	//		x = 0.335 * safezoneW + safezoneX;
	//		y = 0.544 * safezoneH + safezoneY;
	//		w = 0.237187 * safezoneW;
	//		h = 0.022 * safezoneH;
	//	};

		class PlayerList: Life_RscListbox
		{
			idc = 3004;
			x = 0.335 * safezoneW + safezoneX;
			y = 0.544 * safezoneH + safezoneY;
			w = 0.237187 * safezoneW;
			h = 0.154 * safezoneH;
			sizeEx = 0.035;
		};

		class TextCopButton: Life_RscButtonMenu {
			idc = 3016;
			text = "Polizei";
			onButtonClick = "[] call TON_fnc_cell_textcop";
			x = 0.592812 * safezoneW + safezoneX;
			y = 0.544 * safezoneH + safezoneY;
			w = 0.0825 * safezoneW;
			h = 0.022 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0.5,1};
		};

		class TextAdminButton: Life_RscButtonMenu {
			idc = 3017;
			text = "$STR_CELL_TextAdmins";
			onButtonClick = "[] call TON_fnc_cell_textadmin";
			x = 0.592812 * safezoneW + safezoneX;
			y = 0.61 * safezoneH + safezoneY;
			w = 0.0825 * safezoneW;
			h = 0.022 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0.5,0,0,0.7};
		};

		class AdminMsgButton: Life_RscButtonMenu {
			idc = 3020;
			text = "$STR_CELL_AdminMsg";
			onButtonClick = "[] call TON_fnc_cell_adminmsg";
			x = 0.329844 * safezoneW + safezoneX;
			y = 0.731 * safezoneH + safezoneY;
			w = 0.0825 * safezoneW;
			h = 0.022 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0.5,0,0,0.7};
		};

		class AdminMsgAllButton: Life_RscButtonMenu {
			idc = 3021;
			text = "$STR_CELL_AdminMSGAll";
			onButtonClick = "[] call TON_fnc_cell_adminmsgall";
			x = 0.4175 * safezoneW + safezoneX;
			y = 0.731 * safezoneH + safezoneY;
			w = 0.0825 * safezoneW;
			h = 0.022 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0.5,0,0,0.7};
		};

		class EMSRequest: Life_RscButtonMenu {
			idc = 3022;
			text = "STHW";
			onButtonClick = "[] call TON_fnc_cell_emsrequest";
			x = 0.592812 * safezoneW + safezoneX;
			y = 0.577 * safezoneH + safezoneY;
			w = 0.0825 * safezoneW;
			h = 0.022 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0.5,0,0.7};
		};
		
		class PoliceMsgAllButton : life_RscButtonMenu {
            idc = 3023;
            text = "Rundfunk";
            colorBackground[] = {"(profileNamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profileNamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profileNamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
            onButtonClick = "[] call TON_fnc_cell_polizeimsgall";
            x = 0.32;
            y = 0.45;
            w = 0.2;
            h = (1 / 25);
        };


		class CloseButtonKey: Life_RscButtonMenu {
			idc = -1;
			text = "$STR_Global_Close";
			onButtonClick = "closeDialog 0;";
			x = 0.592812 * safezoneW + safezoneX;
			y = 0.676 * safezoneH + safezoneY;
			w = 0.0825 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class RscFrame_1800: Life_RscFrame
		{
			idc = 1800;
			x = 0.587656 * safezoneW + safezoneX;
			y = 0.5 * safezoneH + safezoneY;
			w = 0.0928125 * safezoneW;
			h = 0.209 * safezoneH;
		};

		class RscFrame_1801: Life_RscFrame
		{
			idc = 1801;
			x = 0.329844 * safezoneW + safezoneX;
			y = 0.5 * safezoneH + safezoneY;
			w = 0.2475 * safezoneW;
			h = 0.209 * safezoneH;
		};

		class RscFrame_1802: Life_RscFrame
		{
			idc = 1802;
			x = 0.329844 * safezoneW + safezoneX;
			y = 0.335 * safezoneH + safezoneY;
			w = 0.350625 * safezoneW;
			h = 0.143 * safezoneH;
		};
	};
};