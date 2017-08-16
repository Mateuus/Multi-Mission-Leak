class Life_My_Gang_Diag {
	idd = 2620;
	name= "life_my_gang_menu";
	movingEnable = 0;
	enableSimulation = 1;
	onLoad = "";
	
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
			y = 0.48075 * safezoneH + safezoneY;
			w = 0.020625 * safezoneW;
			h = 0.0275 * safezoneH;
		};
	};
	
	class controls {		
		class Title : Life_RscTitle {
			idc = 2629;
			text = "";
			x = 0.371094 * safezoneW + safezoneX;
			y = 0.324 * safezoneH + safezoneY;
			w = 0.262969 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {1,0.537,0,0.7};
		};
		
		class GangMemberList : Life_RscListBox 
		{
			idc = 2621;
			text = "";
			sizeEx = 0.035;
			
			x = 0.371094 * safezoneW + safezoneX;
			y = 0.346 * safezoneH + safezoneY;
			w = 0.139219 * safezoneW;
			h = 0.308 * safezoneH;
		};
		
		class GangLeave : Life_RscButtonMenu {
			idc = -1;
			text = "$STR_Gang_Leave";
			onButtonClick = "[] call life_fnc_gangLeave";
			x = 0.520625 * safezoneW + safezoneX;
			y = 0.368 * safezoneH + safezoneY;
			w = 0.113437 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {1,0.537,0,0.6};
		};
		
		class GangLock : Life_RscButtonMenu 
		{
			idc = 2622;
			text = "$STR_Gang_UpgradeSlots";
			onButtonClick = "[] spawn life_fnc_gangUpgrade";
			x = 0.520625 * safezoneW + safezoneX;
			y = 0.412 * safezoneH + safezoneY;
			w = 0.113437 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {1,0.537,0,0.6};
		};
		
		class GangKick : Life_RscButtonMenu 
		{
			idc = 2624;
			text = "$STR_Gang_Kick";
			onButtonClick = "[] call life_fnc_gangKick";
			x = 0.520625 * safezoneW + safezoneX;
			y = 0.456 * safezoneH + safezoneY;
			w = 0.113437 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {1,0.537,0,0.6};
		};
		
		class GangLeader : Life_RscButtonMenu 
		{
			idc = 2625;
			text = "$STR_Gang_SetLeader";
			onButtonClick = "[] spawn life_fnc_gangNewLeader";
			x = 0.520625 * safezoneW + safezoneX;
			y = 0.5 * safezoneH + safezoneY;
			w = 0.113437 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {1,0.537,0,0.6};
		};
		
		class InviteMember : Life_RscButtonMenu
		{
			idc = 2630;
			text = "$STR_Gang_Invite_Player";
			onButtonClick = "[] spawn life_fnc_gangInvitePlayer";
			x = 0.520625 * safezoneW + safezoneX;
			y = 0.544 * safezoneH + safezoneY;
			w = 0.113437 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {1,0.537,0,0.6};
		};
		
		class DisbandGang : Life_RscButtonMenu
		{
			idc = 2631;
			text = "$STR_Gang_Disband_Gang";
			onButtonClick = "[] spawn life_fnc_gangDisband";
			x = 0.520625 * safezoneW + safezoneX;
			y = 0.588 * safezoneH + safezoneY;
			w = 0.113437 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {1,0.537,0,0.6};
		};
		
		class ColorList : Life_RscCombo
		{
			idc = 2632;
			x = 0.520625 * safezoneW + safezoneX;
			y = 0.632 * safezoneH + safezoneY;
			w = 0.113437 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0,0,0,0.6};
		};
		
		class GangBank : Title {
			idc = 601;
			style = 1;
			text = "";
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
		
		class ButtonCell : Life_RscButtonMenu {
			idc = 2014;
			onButtonClick = "closeDialog 0;createDialog ""Life_cell_phone"";switch(playerSide) do {case west:{ctrlShow[2011,false];ctrlShow[2016,false];};case independent:{ctrlShow[2011,false];ctrlShow[2016,false];};};";
			x = 0.262812 * safezoneW + safezoneX;
			y = 0.313 * safezoneH + safezoneY;
			w = 0.0464063 * safezoneW;
			h = 0.048 * safezoneH;
			
			tooltip = "$STR_PM_CellPhone";
			
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

class Life_Create_Gang_Diag {
	idd = 2520;
	name= "life_my_gang_menu_create";
	movingEnable = 0;
	enableSimulation = 1;
	onLoad = "[] spawn {waitUntil {!isNull (findDisplay 2520)}; ((findDisplay 2520) displayCtrl 2523) ctrlSetText format[localize ""STR_Gang_PriceTxt"",[(getNumber(missionConfigFile >> 'Life_Settings' >> 'gang_price'))] call life_fnc_numberText]};";
	
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
			y = 0.48075 * safezoneH + safezoneY;
			w = 0.020625 * safezoneW;
			h = 0.0275 * safezoneH;
		};
	};
	
	class controls {
		class Title : Life_RscTitle {
			colorBackground[] = {1,0.537,0,0.7};
			idc = -1;
			text = "$STR_Gang_Title";
			x = 0.402031 * safezoneW + safezoneX;
			y = 0.357 * safezoneH + safezoneY;
			w = 0.262969 * safezoneW;
			h = 0.022 * safezoneH;
		};
		
		class InfoMsg : Life_RscStructuredText
		{
			idc = 2523;
			sizeEx = 0.020;
			text = "";
			x = 0.427812 * safezoneW + safezoneX;
			y = 0.39 * safezoneH + safezoneY;
			w = 0.201094 * safezoneW;
			h = 0.022 * safezoneH;
		};
		
		class CreateGangText : Life_RscEdit
		{
			idc = 2522;
			text = "$STR_Gang_YGN";
			
			x = 0.448438 * safezoneW + safezoneX;
			y = 0.423 * safezoneH + safezoneY;
			w = 0.165 * safezoneW;
			h = 0.022 * safezoneH;
		};
		
		class GangCreateField : Life_RscButtonMenu {
			idc = -1;
			text = "$STR_Gang_Create";
			colorBackground[] = {1,0.537,0,0.5};
			onButtonClick = "[] call life_fnc_createGang";
			x = 0.494844 * safezoneW + safezoneX;
			y = 0.456 * safezoneH + safezoneY;
			w = 0.061875 * safezoneW;
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
		
		class ButtonCell : Life_RscButtonMenu {
			idc = 2014;
			onButtonClick = "closeDialog 0;createDialog ""Life_cell_phone"";switch(playerSide) do {case west:{ctrlShow[2011,false];ctrlShow[2016,false];};case independent:{ctrlShow[2011,false];ctrlShow[2016,false];};};";
			x = 0.262812 * safezoneW + safezoneX;
			y = 0.313 * safezoneH + safezoneY;
			w = 0.0464063 * safezoneW;
			h = 0.048 * safezoneH;
			
			tooltip = "$STR_PM_CellPhone";
			
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
