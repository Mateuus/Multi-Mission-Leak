class Life_cell_phone {
	idd = 3000;
	name= "life_cell_phone";
	movingEnable = 0;
	enableSimulation = 1;
	onLoad = "[] spawn life_fnc_cellphone";
	
	class controlsBackground {
		class InventoryBack:Life_RscPicture {
			text = "textures\inventory\back2.paa";
			idc = -1;
			x = 0.216406 * safezoneW + safezoneX;
			y = 0.115 * safezoneH + safezoneY;
			w = 0.582656 * safezoneW;
			h = 0.77 * safezoneH;
		};
		class InventoryPfeil:Life_RscPicture {
			text = "textures\inventory\back_pfeil.paa";
			idc = -1;
			x = 0.315612 * safezoneW + safezoneX;
			y = 0.32675 * safezoneH + safezoneY;
			w = 0.020625 * safezoneW;
			h = 0.0275 * safezoneH;
		};
	};
	
	class controls {

		
		class PlayerListTitle : Life_RscTitle {
			idc = -1;
			text = "$STR_SMARTPHONE_PLAYERLISTTITLE";
			sizeEx = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.9)";
			x = 0.350469 * safezoneW + safezoneX;
			y = 0.313 * safezoneH + safezoneY;
			w = 0.128906 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {1,0.537,0,0.6};
		};
		
		class PlayerList : Life_RscListBox
		{
			idc = 3004;
			onLBSelChanged = "[2] spawn life_fnc_smartphone;";
			sizeEx = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8)";
			x = 0.350469 * safezoneW + safezoneX;
			y = 0.335 * safezoneH + safezoneY;
			w = 0.128906 * safezoneW;
			h = 0.341 * safezoneH;
		};
		
		class TextToSend : Life_RscTitle {
			colorBackground[] = {0, 0, 0, 0};
			idc = 3002;
			text = "$STR_CELL_TextToSend";
			x = 0.494844 * safezoneW + safezoneX;
			y = 0.335 * safezoneH + safezoneY;
			w = 0.159844 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class textEdit : Life_RscEdit {
		
			idc = 3003;
			
			text = "";
			sizeEx = 0.030;
			x = 0.5 * safezoneW + safezoneX;
			y = 0.357 * safezoneH + safezoneY;
			w = 0.257813 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class TextMsgButton : life_RscButtonMenu 
		{
			idc = 3015;
			text = "$STR_CELL_TextMSGBtn";
			colorBackground[] = {1,0.537,0,0.8};
			onButtonClick = "[] call TON_fnc_cell_textmsg";
			
			x = 0.5 * safezoneW + safezoneX;
			y = 0.39 * safezoneH + safezoneY;
			w = 0.0825 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class TextCopButton : life_RscButtonMenu 
		{
			idc = 3016;
			text = "$STR_CELL_TextPolice";
			colorBackground[] = {0.025,0.025,0.8,0.8};
			onButtonClick = "[] call TON_fnc_cell_textcop";
			
			x = 0.587656 * safezoneW + safezoneX;
			y = 0.39 * safezoneH + safezoneY;
			w = 0.0825 * safezoneW;
			h = 0.022 * safezoneH;
		};
		
		class EMSRequest : life_RscButtonMenu
		{
			idc = 3022;
			text = "$STR_CELL_THWRequest";
			colorBackground[] = {0.025,0.025,0.8,0.8};
			onButtonClick = "[] call TON_fnc_cell_emsrequest";
			
			x = 0.675313 * safezoneW + safezoneX;
			y = 0.39 * safezoneH + safezoneY;
			w = 0.0825 * safezoneW;
			h = 0.022 * safezoneH;
		};
		
		class TextAdminButton : life_RscButtonMenu 
		{
			idc = 3017;
			text = "$STR_CELL_TextAdmins";
			colorBackground[] = {0.584, 0.086, 0.086,1.0};
			onButtonClick = "[] call TON_fnc_cell_textadmin";
			
			x = 0.5 * safezoneW + safezoneX;
			y = 0.423 * safezoneH + safezoneY;
			w = 0.0825 * safezoneW;
			h = 0.022 * safezoneH;
		};
		
		class AdminMsgButton : life_RscButtonMenu 
		{
			idc = 3020;
			text = "$STR_CELL_AdminMsg";
			colorBackground[] = {0.584, 0.086, 0.086,1.0};
			onButtonClick = "[] call TON_fnc_cell_adminmsg";
			
			x = 0.5 * safezoneW + safezoneX;
			y = 0.423 * safezoneH + safezoneY;
			w = 0.0825 * safezoneW;
			h = 0.022 * safezoneH;
		};
		
		class AdminMsgAllButton : life_RscButtonMenu 
		{
			idc = 3021;
			text = "$STR_CELL_AdminMSGAll";
			colorBackground[] = {0.584, 0.086, 0.086,1.0};
			onButtonClick = "[] call TON_fnc_cell_adminmsgall";
			
			x = 0.587656 * safezoneW + safezoneX;
			y = 0.423 * safezoneH + safezoneY;
			w = 0.0825 * safezoneW;
			h = 0.022 * safezoneH;
		};
		
		class ButtonHome : Life_RscButtonMenu {
			idc = -1;
			onButtonClick = "closeDialog 0;";
			x = 0.262812 * safezoneW + safezoneX;
			y = 0.263 * safezoneH + safezoneY;
			w = 0.0464063 * safezoneW;
			h = 0.048 * safezoneH;
			
			tooltip = "HOME";
			
			colorBackground[] = {0,0,0,0};
			colorBackgroundFocused[] = {0,0,0,0};
			colorBackground2[] = {0,0,0,0};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,0};
			color2[] = {0,0,0,0};
			colorText[] = {1,1,1,1};
		};
		
		class ButtonKeys : Life_RscButtonMenu {
			idc = 2013;
			onButtonClick = "closeDialog 0;createDialog ""life_key_management"";switch(playerSide) do {case west:{ctrlShow[2011,false];ctrlShow[2016,false];};case independent:{ctrlShow[2011,false];ctrlShow[2016,false];};};";
			x = 0.262812 * safezoneW + safezoneX;
			y = 0.366 * safezoneH + safezoneY;
			w = 0.0464063 * safezoneW;
			h = 0.048 * safezoneH;
			
			tooltip = "$STR_PM_KeyChain";
			
			colorBackground[] = {0,0,0,0};
			colorBackgroundFocused[] = {0,0,0,0};
			colorBackground2[] = {0,0,0,0};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,0};
			color2[] = {0,0,0,0};
			colorText[] = {1,1,1,1};
		};
		
		class ButtonSettings : Life_RscButtonMenu {
			idc = -1;
			onButtonClick = "closeDialog 0;[] call life_fnc_settingsMenu;";
			x = 0.262812 * safezoneW + safezoneX;
			y = 0.418 * safezoneH + safezoneY;
			w = 0.0464063 * safezoneW;
			h = 0.048 * safezoneH;
			
			tooltip = "$STR_Global_Settings";
			
			colorBackground[] = {0,0,0,0};
			colorBackgroundFocused[] = {0,0,0,0};
			colorBackground2[] = {0,0,0,0};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,0};
			color2[] = {0,0,0,0};
			colorText[] = {1,1,1,1};
		};
		
		class ButtonMyGang : Life_RscButtonMenu {
			idc = 2011;
			onButtonClick = "closeDialog 0;if(isNil ""life_action_gangInUse"") then {if(isNil {(group player) getVariable ""gang_owner""}) then {createDialog ""life_Create_Gang_Diag"";} else {[] spawn life_fnc_gangMenu;};};";
			x = 0.262812 * safezoneW + safezoneX;
			y = 0.47 * safezoneH + safezoneY;
			w = 0.0464063 * safezoneW;
			h = 0.048 * safezoneH;
			
			tooltip = "$STR_PM_MyGang";
			
			colorBackground[] = {0,0,0,0};
			colorBackgroundFocused[] = {0,0,0,0};
			colorBackground2[] = {0,0,0,0};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,0};
			color2[] = {0,0,0,0};
			colorText[] = {1,1,1,1};
		};
		
        class ButtonShowExp : Life_RscButtonMenu {
            idc = 2016;
			onButtonClick = "closeDialog 0;[] call life_fnc_showEXP;";
			x = 0.262812 * safezoneW + safezoneX;
			y = 0.522 * safezoneH + safezoneY;
			w = 0.0464063 * safezoneW;
			h = 0.048 * safezoneH;
			
			tooltip = "Erfahrung";
			
			colorBackground[] = {0,0,0,0};
			colorBackgroundFocused[] = {0,0,0,0};
			colorBackground2[] = {0,0,0,0};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,0};
			color2[] = {0,0,0,0};
			colorText[] = {1,1,1,1};
        };
		
		class ButtonInfo: Life_RscButtonMenu {
			idc = 99630;
            onButtonClick = "closeDialog 0;[] spawn life_fnc_InfoMenu;";
			x = 0.262812 * safezoneW + safezoneX;
			y = 0.5745 * safezoneH + safezoneY;
			w = 0.0464063 * safezoneW;
			h = 0.048 * safezoneH;
			
			tooltip = "Info";
			
			colorBackground[] = {0,0,0,0};
			colorBackgroundFocused[] = {0,0,0,0};
			colorBackground2[] = {0,0,0,0};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,0};
			color2[] = {0,0,0,0};
			colorText[] = {1,1,1,1};
		};
		
		class ButtonMarket : Life_RscButtonMenu {
			idc = -1;
			onButtonClick = "closeDialog 0;createDialog ""life_dynmarket_prices"";switch(playerSide) do {case west:{ctrlShow[2011,false];ctrlShow[2016,false];};case independent:{ctrlShow[2011,false];ctrlShow[2016,false];};};";
			x = 0.262812 * safezoneW + safezoneX;
			y = 0.627 * safezoneH + safezoneY;
			w = 0.0464063 * safezoneW;
			h = 0.048 * safezoneH;
			
			tooltip = "Markt";
			
			colorBackground[] = {0,0,0,0};
			colorBackgroundFocused[] = {0,0,0,0};
			colorBackground2[] = {0,0,0,0};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,0};
			color2[] = {0,0,0,0};
			colorText[] = {1,1,1,1};
		};
		
		class ButtonSyncData : Life_RscButtonMenu {
			idc = -1;
			onButtonClick = "[] call SOCK_fnc_syncData;";
			x = 0.253 * safezoneW + safezoneX;
			y = 0.696 * safezoneH + safezoneY;
			w = 0.1 * safezoneW;
			h = 0.035 * safezoneH;
			
			tooltip = "$STR_PM_SyncData";
			
			colorBackground[] = {0,0,0,0};
			colorBackgroundFocused[] = {0,0,0,0};
			colorBackground2[] = {0,0,0,0};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,0};
			color2[] = {0,0,0,0};
			colorText[] = {1,1,1,1};
		};
		
		class ButtonClose : Life_RscButtonMenu {
			idc = -1;
			onButtonClick = "closeDialog 0;";
			x = 0.244 * safezoneW + safezoneX;
			y = 0.242 * safezoneH + safezoneY;
			w = 0.0103125 * safezoneW;
			h = 0.014 * safezoneH;
			
			tooltip = "$STR_Global_Close";
			
			colorBackground[] = {0,0,0,0};
			colorBackgroundFocused[] = {0,0,0,0};
			colorBackground2[] = {0,0,0,0};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,0};
			color2[] = {0,0,0,0};
			colorText[] = {1,1,1,1};
		};
	};
};