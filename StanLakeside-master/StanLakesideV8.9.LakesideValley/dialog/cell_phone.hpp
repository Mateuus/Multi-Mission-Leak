













class Life_cell_phone {
	idd = 3000;
	name= "life_cell_phone";
	movingEnable = false;
	enableSimulation = true;
	onLoad = "[] spawn life_fnc_cellphone";
	
	class controlsBackground {
		class dembackground: life_RscPicture
		{
			idc = 1200;
			text = "\A3L_Client2\tablet_new\MessangerAppMain.paa";
			x = 0.288594 * safezoneW + safezoneX;
			y = 0.203 * safezoneH + safezoneY;
			w = 0.417656 * safezoneW;
			h = 0.561 * safezoneH;
		};
		class dembackgroundadmin: life_RscPicture
		{
			idc = 5251;
			text = "\A3L_Client2\tablet_new\MessangerAppMainbtn.paa";
			x = 0.288594 * safezoneW + safezoneX;
			y = 0.203 * safezoneH + safezoneY;
			w = 0.417656 * safezoneW;
			h = 0.561 * safezoneH;
		};

};
	
	class controls {
		
		class Title : Life_RscTitle {
			colorBackground[] = {0, 0, 0, 0};
			idc = 3001;
			text = "$STR_CELL_Title";
			x = 0 * safezoneW + safezoneX;
			y = 0 * safezoneH + safezoneY;
			w = 0 * safezoneW;
			h = 0 * safezoneH;
		};
		
		class TextToSend : Life_RscTitle {
			colorBackground[] = {0, 0, 0, 0};
			idc = 3002;
			text = "$STR_CELL_TextToSend";
			x = 0 * safezoneW + safezoneX;
			y = 0 * safezoneH + safezoneY;
			w = 0 * safezoneW;
			h = 0 * safezoneH;
		};
		
		class textEdit : Life_RscEdit {
		
		idc = 3003;
		
		text = "";
		sizeEx = 0.030;
			x = 0.412344 * safezoneW + safezoneX;
			y = 0.371704 * safezoneH + safezoneY;
			w = 0.165208 * safezoneW;
			h = 0.10963 * safezoneH;
		
		};
		
		class TextMsgButton : Life_RscButtonSilent 
		{
			idc = 3015;
			text = "$STR_CELL_TextMSGBtn";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "[] call fnc_cell_textmsg";
			
			x = 0.413541 * safezoneW + safezoneX;
			y = 0.488889 * safezoneH + safezoneY;
			w = 0.0579167 * safezoneW;
			h = 0.0262963 * safezoneH;
		};
		
		class PlayerList : Life_RscCombo 
		{
			idc = 3004;
			x = 0.484531 * safezoneW + safezoneX;
			y = 0.489 * safezoneH + safezoneY;
			w = 0.0876563 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class TextCopButton : Life_RscButtonSilent 
		{
			idc = 3016;
			text = "$STR_CELL_TextPolice";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "[] call fnc_cell_textcop";
			
			x = 0.328125 * safezoneW + safezoneX;
			y = 0.368519 * safezoneH + safezoneY;
			w = 0.0735417 * safezoneW;
			h = 0.0374074 * safezoneH;
		};
		
		class TextAdminButton : Life_RscButtonSilent 
		{
			idc = 3017;
			text = "$STR_CELL_TextAdmins";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "[] call fnc_cell_textadmin";
			
			x = 0.328124 * safezoneW + safezoneX;
			y = 0.44537 * safezoneH + safezoneY;
			w = 0.0735417 * safezoneW;
			h = 0.0374074 * safezoneH;
		};
		
		class AdminMsgButton : Life_RscButtonSilent 
		{
			idc = 3020;
			text = "$STR_CELL_AdminMsg";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "[] call fnc_cell_adminmsg";
			
			x = 0.328644 * safezoneW + safezoneX;
			y = 0.517592 * safezoneH + safezoneY;
			w = 0.0735417 * safezoneW;
			h = 0.0374074 * safezoneH;
		};
		
		class AdminMsgAllButton : Life_RscButtonSilent 
		{
			idc = 3021;
			text = "$STR_CELL_AdminMSGAll";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "[] call fnc_cell_adminmsgall";
			
			x = 0.328646 * safezoneW + safezoneX;
			y = 0.556482 * safezoneH + safezoneY;
			w = 0.0735417 * safezoneW;
			h = 0.0374074 * safezoneH;
		};
		
		class EMSRequest : Life_RscButtonSilent
		{
			idc = 3022;
			text = "$STR_CELL_EMSRequest";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "[] call fnc_cell_emsrequest";
			
			x = 0.328645 * safezoneW + safezoneX;
			y = 0.407408 * safezoneH + safezoneY;
			w = 0.0735417 * safezoneW;
			h = 0.0374074 * safezoneH;
		};
		
		class CloseButtonKey : Life_RscButtonMenu {
			idc = -1;
			text = "$STR_Global_Close";
			onButtonClick = "closeDialog 0;";
			x = 0 * safezoneW + safezoneX;
			y = 0 * safezoneH + safezoneY;
			w = 0 * safezoneW;
			h = 0 * safezoneH;

		};
	};
};