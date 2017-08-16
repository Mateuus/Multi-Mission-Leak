class lhm_cell_phone {
	idd = 3000;
	name= "lhm_cell_phone";
	movingEnable = false;
	enableSimulation = true;
	onLoad = "[] spawn lhm_fnc_cellphone";
	
	class controlsBackground {
		class lhm_RscTitleBackground:lhm_RscText {
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
			idc = -1;
			x = 0.1;
			y = 0.2;
			w = 0.64;
			h = (1 / 25);
		};
		
		class MainBackground:lhm_RscText {
			colorBackground[] = {0, 0, 0, 0.7};
			idc = -1;
			x = 0.1;
			y = 0.2 + (11 / 250);
			w = 0.64;
			h = 0.3 - (5 / 250);
		};
	};
	
	class controls {

		
		class Title : lhm_RscTitle {
			colorBackground[] = {0, 0, 0, 0};
			idc = 3001;
			text = "$STR_CELL_Title";
			x = 0.1;
			y = 0.2;
			w = 0.6;
			h = (1 / 25);
		};
		
		class TextToSend : lhm_RscTitle {
			colorBackground[] = {0, 0, 0, 0};
			idc = 3002;
			text = "$STR_CELL_TextToSend";
			x = 0.1;
			y = 0.25;
			w = 0.6;
			h = (1 / 25);
		};
		
		class textEdit : lhm_RscEdit {
		
		idc = 3003;
		
		text = "";
		sizeEx = 0.030;
		x = 0.11; y = 0.3;
		w = 0.62; h = 0.03;
		
		};
		
		class TextMsgButton : lhm_RscButtonMenu 
		{
			idc = 3015;
			text = "$STR_CELL_TextMSGBtn";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "[] call TON_fnc_cell_textmsg";
			
			x = 0.11;
			y = 0.35;
			w = 0.2;
			h = (1 / 25);
		};
		
		class PlayerList : lhm_RscCombo 
		{
			idc = 3004;
			
			x = 0.11; y = 0.4;
			w = 0.2; h = (1 / 25);
		};

		class TextCopButton : lhm_RscButtonMenu 
		{
			idc = 3016;
			text = "$STR_CELL_TextPolice";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "[] call TON_fnc_cell_textcop";
			
			x = 0.32;
			y = 0.35;
			w = 0.2;
			h = (1 / 25);
		};
		
		class TextAdminButton : lhm_RscButtonMenu 
		{
			idc = 3017;
			text = "$STR_CELL_TextAdmins";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "[] call TON_fnc_cell_textadmin";
			
			x = 0.53;
			y = 0.35;
			w = 0.2;
			h = (1 / 25);
		};
		
		class AdminMsgButton : lhm_RscButtonMenu 
		{
			idc = 3020;
			text = "$STR_CELL_AdminMsg";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "[] call TON_fnc_cell_adminmsg";
			
			x = 0.32;
			y = 0.4;
			w = 0.2;
			h = (1 / 25);
		};
		
		class AdminMsgAllButton : lhm_RscButtonMenu 
		{
			idc = 3021;
			text = "$STR_CELL_AdminMSGAll";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "[] call TON_fnc_cell_adminmsgall";
			
			x = 0.53;
			y = 0.4;
			w = 0.2;
			h = (1 / 25);
		};
		
		class EMSRequest : lhm_RscButtonMenu
		{
			idc = 3022;
			text = "$STR_CELL_EMSRequest";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "[] call TON_fnc_cell_emsrequest";
			
			x = 0.11;
			y = 0.45;
			w = 0.2;
			h = (1 / 25);
		};
		
		class CloseButtonKey : lhm_RscButtonMenu {
			idc = -1;
			text = "$STR_Global_Close";
			onButtonClick = "closeDialog 0;";
			x = -0.06 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.51 + (1 / 50);
			w = (6.25 / 40);
			h = (1 / 25);
		};
	};
};