class Life_cell_phone {
	idd = 3000;
	name= "life_cell_phone";
	movingEnable = false;
	enableSimulation = true;
	onLoad = "[] spawn life_fnc_cellphone";
	
	class controlsBackground {

		class EXphone: life_RscPicture
		{
			idc = 3001;

			text = "textures\phone.paa"; //--- ToDo: Localize;
			x = 0.439625 * safezoneW + safezoneX;
			y = 0.14692 * safezoneH + safezoneY;
			w = 0.426562 * safezoneW;
			h = 0.725732 * safezoneH;
		};
	};
			
	class controls {
		class TextToSend: Life_RscTitle
		{
			idc = 3002;

			text = "Message To Send:"; //--- ToDo: Localize;
			x = 0.555387 * safezoneW + safezoneX;
			y = 0.29756 * safezoneH + safezoneY;
			w = 0.143063 * safezoneW;
			h = 0.028 * safezoneH;
			colorText[] = {0.95,0.95,0.95,1};
		};
		class textEdit: Life_RscEdit
		{
			idc = 3003;

			text = "";

			x = 0.5567 * safezoneW + safezoneX;
			y = 0.388 * safezoneH + safezoneY;
			w = 0.170625 * safezoneW;
			h = 0.182 * safezoneH;
		};
		class TextMsgButton: Life_RscButtonMenu
		{
			idc = 3015;
			onButtonClick = "[] call TON_fnc_cell_textmsg";

			text = "Text"; //--- ToDo: Localize;
			x = 0.559062 * safezoneW + safezoneX;
			y = 0.598 * safezoneH + safezoneY;
			w = 0.07875 * safezoneW;
			h = 0.035 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0.6,0.2,0.7};
			colorActive[] = {0,0,0,0};
		};
		class PlayerList: Life_RscCombo
		{
			idc = 3004;

			x = 0.559062 * safezoneW + safezoneX;
			y = 0.346 * safezoneH + safezoneY;
			w = 0.124687 * safezoneW;
			h = 0.028 * safezoneH;
		};
		class TextCopButton: Life_RscButtonMenu
		{
			idc = 3016;
			onButtonClick = "[] call TON_fnc_cell_textcop";

			text = "Police"; //--- ToDo: Localize;
			x = 0.644375 * safezoneW + safezoneX;
			y = 0.598 * safezoneH + safezoneY;
			w = 0.07875 * safezoneW;
			h = 0.035 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0.23,1,0.48};
		};
		class TextAdminButton: Life_RscButtonMenu
		{
			idc = 3017;
			onButtonClick = "[] call TON_fnc_cell_textadmin";

			text = "Admin"; //--- ToDo: Localize;
			x = 0.644375 * safezoneW + safezoneX;
			y = 0.654 * safezoneH + safezoneY;
			w = 0.07875 * safezoneW;
			h = 0.035 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0.23,1,0.48};
		};
		class AdminMsgButton: Life_RscButtonMenu
		{
			idc = 3020;
			onButtonClick = "[] call TON_fnc_cell_adminmsg";

			text = "Admin Msg"; //--- ToDo: Localize;
			x = 0.559062 * safezoneW + safezoneX;
			y = 0.71 * safezoneH + safezoneY;
			w = 0.07875 * safezoneW;
			h = 0.035 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0.23,1,0.48};
		};
		class AdminMsgAllButton: Life_RscButtonMenu
		{
			idc = 3021;
			onButtonClick = "[] call TON_fnc_cell_adminmsgall";

			text = "Admin All"; //--- ToDo: Localize;
			x = 0.644375 * safezoneW + safezoneX;
			y = 0.71 * safezoneH + safezoneY;
			w = 0.07875 * safezoneW;
			h = 0.035 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0.23,1,0.48};
		};
		class EMSRequest: Life_RscButtonMenu
		{
			idc = 3022;
			onButtonClick = "[] call TON_fnc_cell_emsrequest";

			text = "EMS"; //--- ToDo: Localize;
			x = 0.559062 * safezoneW + safezoneX;
			y = 0.654 * safezoneH + safezoneY;
			w = 0.07875 * safezoneW;
			h = 0.035 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0.23,1,0.48};
		};
		class MessagesButtonKey: Life_RscButtonMenu
		{
			onButtonClick = "[] spawn life_fnc_messagesMenu";

			idc = 1011;
			text = "Message History"; //--- ToDo: Localize;
			x = 0.571719  * safezoneW + safezoneX;
			y = 0.25556 * safezoneH + safezoneY;
			w = 0.150187 * safezoneW;
			h = 0.03 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0.5,0,0,0.5};
		};
		class ButtonClose: Life_RscButtonInvisible
		{
			onButtonClick = "closeDialog 0;";

			idc = 1012;
			x = 0.601719 * safezoneW + safezoneX;
			y = 0.801 * safezoneH + safezoneY;
			w = 0.0820312 * safezoneW;
			h = 0.0875 * safezoneH;
			colorText[] = {1,1,1,0};
			colorBackground[] = {0,0,0,0};
			tooltip = "Go back"; //--- ToDo: Localize;
		};
	};
};