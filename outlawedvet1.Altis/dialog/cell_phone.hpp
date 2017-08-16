class Life_cell_phone {
	idd = 3000;
	name= "life_cell_phone";
	movingEnable = false;
	enableSimulation = true;
	onLoad = "[] spawn life_fnc_cellphone";
	
	class controlsBackground {
		class Life_RscTitleBackground:Life_RscText {
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
			idc = -1;
			x = 0.1;
			y = 0.2;
			w = 0.64;
			h = (1 / 25);
		};
		
		class MainBackground:Life_RscText {
			colorBackground[] = {0, 0, 0, 0.8};
			idc = -1;
			x = 0.1;
			y = 0.2 + (11 / 250);
			w = 0.64;
			h = 0.40 - (5 / 250);
		};
	};
	
	class controls {

		
		class Title : Life_RscTitle {
			colorBackground[] = {0, 0, 0, 0};
			idc = 3001;
			text = "$STR_CELL_Title";
			x = 0.1;
			y = 0.2;
			w = 0.6;
			h = (1 / 25);
			class Attributes 
			{
				align = "center";
			};
		};
		
		class TextSend : Life_RscTitle {
			colorBackground[] = {0, 0, 0, 0};
			idc = 3002;
			text = "$STR_CELL_TextToSend";
			x = 0.1;
			y = 0.25;
			w = 0.6;
			h = (1 / 25);
		};
		
		class TextToSend : Life_RscTitle {
			colorBackground[] = {0, 0, 0, 0};
			idc = 3012;
			text = "To:";
			x = 0.1;
			y = 0.431;
			w = 0.6;
			h = (1 / 25);
		};
		
		class textEdit : Life_RscEdit {
		
		idc = 3003;
		
		text = "";
		sizeEx = 0.028;
		lineSpacing = 1;
		x = 0.11; y = 0.3;
		w = 0.4; h = 0.12;
		};
		
		class TextMsgButton : life_RscButtonMenu 
		{
			idc = 3015;
			text = "$STR_CELL_TextMSGBtn";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "[] call TON_fnc_cell_textmsg";
			
			x = 0.11;
			y = 0.55;
			w = 0.4;
			h = (1 / 25);
			class Attributes 
			{
				align = "center";
			};
		};
		
		class PlayerList : Life_RscCombo 
		{
			idc = 3004;
			
			x = 0.11; y = 0.48;
			w = 0.4; h = (1 / 25);
		};

		class TextCopButton : life_RscButtonMenu 
		{
			idc = 3016;
			text = "$STR_CELL_TextPolice";
			onButtonClick = "[] call TON_fnc_cell_textcop";
			colorBackground[] = {0,0,1,0.75};
			
			x = 0.53;
			y = 0.3;
			w = 0.2;
			h = (1 / 25);
			class Attributes 
			{
				align = "center";
			};
		};
		
		class EMSRequest : life_RscButtonMenu
		{
			idc = 3022;
			text = "$STR_CELL_EMSRequest";
			onButtonClick = "[] call TON_fnc_cell_emsrequest";
			colorBackground[] = {0,1,0,0.75};
			
			x = 0.53;
			y = 0.35;
			w = 0.2;
			h = (1 / 25);
			class Attributes 
			{
				align = "center";
			};
		};
		
		class TextAdminButton : life_RscButtonMenu 
		{
			idc = 3017;
			text = "$STR_CELL_TextAdmins";
			onButtonClick = "[] call TON_fnc_cell_textadmin";
			colorBackground[] = {1,0.7,0.1,0.75};
			
			x = 0.53;
			y = 0.45;
			w = 0.2;
			h = (1 / 25);
			class Attributes 
			{
				align = "center";
			};
		};
		
		class AdminMsgButton : life_RscButtonMenu 
		{
			idc = 3020;
			text = "$STR_CELL_AdminMsg";
			onButtonClick = "[] call TON_fnc_cell_adminmsg";
			colorBackground[] = {1,0.7,0.1,0.75};
			
			x = 0.53;
			y = 0.50;
			w = 0.2;
			h = (1 / 25);
			class Attributes 
			{
				align = "center";
			};
		};
		
		class AdminMsgAllButton : life_RscButtonMenu 
		{
			idc = 3021;
			text = "$STR_CELL_AdminMSGAll";
			onButtonClick = "[] call TON_fnc_cell_adminmsgall";
			colorBackground[] = {1,0.7,0.1,0.75};
			
			x = 0.53;
			y = 0.55;
			w = 0.2;
			h = (1 / 25);
			class Attributes 
			{
				align = "center";
			};
		};
		
		class CloseButtonKey : Life_RscButtonMenu {
			idc = -1;
			text = "$STR_Global_Close";
			onButtonClick = "closeDialog 0;";
			colorText[] = {1,1,1,1};
			colorBackground[] = {1,0,0,0.75};
			x = -0.06 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.635;
			w = (6.25 / 40);
			h = (1 / 25);
			class Attributes 
			{
				align = "center";
			};
		};
		
		class MessagesButtonKey: Life_RscButtonMenu {
            idc = 3029;
            text = "Messages";
            onButtonClick = "[] spawn life_fnc_messagesMenu";
            x = 0.53;
            y = 0.45;
            w = 0.2;
            h = (1 / 25);
            colorText[] = {1,1,1,1};
            colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
        };
	};
};