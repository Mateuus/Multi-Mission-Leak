class Life_cell_phone {
	idd = 3000;
	name= "life_cell_phone";
	movingEnable = false;
	enableSimulation = true;
	onLoad = "";
	
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
			colorBackground[] = {0, 0, 0, 0.7};
			idc = -1;
			x = 0.1;
			y = 0.2 + (11 / 250);
			w = 0.64;
			h = 0.4 - (5 / 250);
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
		};
		
		class TextToSend : Life_RscTitle {
			colorBackground[] = {0, 0, 0, 0};
			idc = 3002;
			text = "$STR_CELL_TextToSend";
			x = 0.1;
			y = 0.25;
			w = 0.6;
			h = (1 / 25);
		};
		
		class textEdit : Life_RscEdit {
		
		idc = 3003;
		
		text = "";
		sizeEx = 0.030;
		x = 0.11; y = 0.3;
		w = 0.54; h = 0.03;
		
		};
		
		class PosText : Life_RscTitle {
			colorBackground[] = {0, 0, 0, 0};
			idc = 3002;
			text = "Skicka din pos:";
			x = 0.56;
			y = 0.25;
			w = 0.6;
			h = (1 / 25);
		};
		
		class TransmitPos : Life_Checkbox {
		
		idc = 3009;
		onCheckedChanged = "if((_this select 1) == 0) then {MessageTransmitPos = false} else {[] spawn {MessageTransmitPos = true; waitUntil {isNull (findDisplay 3000)}; MessageTransmitPos = false;}};";
		Tooltip = "Skicka din position till mottagaren/mottagarna, de får isåfall upp en blinkande markör på kartan vid din position.";
		sizeEx = 0.030;
		x = 0.67;
		y = 0.3;
		
		};
		
		class TextMsgButton : life_RscButtonMenu 
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
		
		class PlayerList : Life_RscCombo 
		{
			idc = 3004;
			
			x = 0.11; y = 0.4;
			w = 0.2; h = (1 / 25);
		};

		class TextCopButton : life_RscButtonMenu 
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
		
		class CopmsgButton : life_RscButtonMenu 
		{
			idc = 8526;
			text = "Cop msg all";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "[] call TON_fnc_cell_copmsg";
			
			
			x = 0.53;
			y = 0.45;
			w = 0.2;
			h = (1 / 25);
		};
		
		class EventmsgsafeButton : life_RscButtonMenu 
		{
			idc = 8529;
			text = "Event msg all";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "[] call TON_fnc_cell_eventmsg";
			
			x = 0.53;
			y = 0.5;
			w = 0.2;
			h = (1 / 25);
		};
		
		class EventmsgButton : life_RscButtonMenu 
		{
			idc = 8530;
			text = "All Safekeeped";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "[] call TON_fnc_cell_eventmsgsafe";
			
			x = 0.53;
			y = 0.55;
			w = 0.2;
			h = (1 / 25);
		};
		
		class TextAdminButton : life_RscButtonMenu 
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
		
		class AdminMsgButton : life_RscButtonMenu 
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
		
		class AdminMsgAllButton : life_RscButtonMenu 
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
		
		class EMSRequest : life_RscButtonMenu
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
		
		class TextRebels : life_RscButtonMenu
		{
			idc = 3023;
			text = "Text rebels";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "[] call TON_fnc_cell_textrebels";
			
			x = 0.32;
			y = 0.45;
			w = 0.2;
			h = (1 / 25);
		};
		
		class CloseButtonKey : Life_RscButtonMenu {
			idc = -1;
			text = "$STR_Global_Close";
			onButtonClick = "closeDialog 0;";
			x = -0.06 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.61 + (1 / 50);
			w = (6.25 / 40);
			h = (1 / 25);
		};
	};
};