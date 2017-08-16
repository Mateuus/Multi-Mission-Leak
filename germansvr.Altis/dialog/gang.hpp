class Life_My_Gang_Diag {
	idd = 2620;
	name= "life_my_gang_menu";
	movingEnable = 0;
	enableSimulation = 1;
	
	class controlsBackground {
		class InventoryBack:Life_RscPicture {
			text = "textures\handy\handy_gang.paa";
			idc = -1;
			x = 0.608281 * safezoneW + safezoneX;
			y = 0.225 * safezoneH + safezoneY;
			w = 0.500156 * safezoneW;
			h = 0.858 * safezoneH;
		};
	};
	
	class controls {		
		class Title : Life_RscTitle {
			idc = 2629;
			text = "";
			sizeEx = "0.022 * safeZoneH";
			x = 0.752656 * safezoneW + safezoneX;
			y = 0.9026 * safezoneH + safezoneY;
			w = 0.20625 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0,0,0,0};
		};
		
		class GangMemberList : Life_RscListBox 
		{
			idc = 2621;
			text = "";
			sizeEx = "0.022 * safeZoneH";
			
			x = 0.754512 * safezoneW + safezoneX;
			y = 0.55995 * safezoneH + safezoneY;
			w = 0.202125 * safezoneW;
			h = 0.175505 * safezoneH;
		};
		
		class GangLeave : Life_RscButtonMenu {
			idc = -1;
			tooltip = "$STR_Gang_Leave";
			onButtonClick = "[] call life_fnc_gangLeave";
			x = 0.752656 * safezoneW + safezoneX;
			y = 0.82725 * safezoneH + safezoneY;
			w = 0.101887 * safezoneW;
			h = 0.0297 * safezoneH;
			
			colorBackground[] = {0,0,0,0};
			colorBackgroundFocused[] = {0,0,0,0};
			colorBackground2[] = {0,0,0,0};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,0};
			color2[] = {0,0,0,0};
			colorText[] = {1,1,1,1};
		};
		
		class GangLock : Life_RscButtonMenu 
		{
			idc = 2622;
			tooltip = "$STR_Gang_UpgradeSlots";
			onButtonClick = "[] spawn life_fnc_gangUpgrade";
			x = 0.856812 * safezoneW + safezoneX;
			y = 0.86025 * safezoneH + safezoneY;
			w = 0.101887 * safezoneW;
			h = 0.0297 * safezoneH;
			
			colorBackground[] = {0,0,0,0};
			colorBackgroundFocused[] = {0,0,0,0};
			colorBackground2[] = {0,0,0,0};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,0};
			color2[] = {0,0,0,0};
			colorText[] = {1,1,1,1};
		};
		
		class GangKick : Life_RscButtonMenu 
		{
			idc = 2624;
			tooltip = "$STR_Gang_Kick";
			onButtonClick = "[] call life_fnc_gangKick";
			x = 0.752656 * safezoneW + safezoneX;
			y = 0.79425 * safezoneH + safezoneY;
			w = 0.101887 * safezoneW;
			h = 0.0297 * safezoneH;
			
			colorBackground[] = {0,0,0,0};
			colorBackgroundFocused[] = {0,0,0,0};
			colorBackground2[] = {0,0,0,0};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,0};
			color2[] = {0,0,0,0};
			colorText[] = {1,1,1,1};
		};
		
		class GangLeader : Life_RscButtonMenu 
		{
			idc = 2625;
			tooltip = "$STR_Gang_SetLeader";
			onButtonClick = "[] spawn life_fnc_gangNewLeader";
			x = 0.752656 * safezoneW + safezoneX;
			y = 0.86025 * safezoneH + safezoneY;
			w = 0.101887 * safezoneW;
			h = 0.0297 * safezoneH;
			
			colorBackground[] = {0,0,0,0};
			colorBackgroundFocused[] = {0,0,0,0};
			colorBackground2[] = {0,0,0,0};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,0};
			color2[] = {0,0,0,0};
			colorText[] = {1,1,1,1};
		};
		
		class InviteMember : Life_RscButtonMenu
		{
			idc = 2630;
			tooltip = "$STR_Gang_Invite_Player";
			onButtonClick = "[] spawn life_fnc_gangInvitePlayer";
			x = 0.856812 * safezoneW + safezoneX;
			y = 0.7937 * safezoneH + safezoneY;
			w = 0.101887 * safezoneW;
			h = 0.0297 * safezoneH;
			
			colorBackground[] = {0,0,0,0};
			colorBackgroundFocused[] = {0,0,0,0};
			colorBackground2[] = {0,0,0,0};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,0};
			color2[] = {0,0,0,0};
			colorText[] = {1,1,1,1};
		};
		
		class DisbandGang : Life_RscButtonMenu
		{
			idc = 2631;
			tooltip = "$STR_Gang_Disband_Gang";
			onButtonClick = "[] spawn life_fnc_gangDisband";
			x = 0.856812 * safezoneW + safezoneX;
			y = 0.82725 * safezoneH + safezoneY;
			w = 0.101887 * safezoneW;
			h = 0.0297 * safezoneH;
			
			colorBackground[] = {0,0,0,0};
			colorBackgroundFocused[] = {0,0,0,0};
			colorBackground2[] = {0,0,0,0};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,0};
			color2[] = {0,0,0,0};
			colorText[] = {1,1,1,1};
		};
		
		class ColorList : Life_RscCombo
		{
			idc = 2632;
			x = 0.752656 * safezoneW + safezoneX;
			y = 0.7563 * safezoneH + safezoneY;
			w = 0.20625 * safezoneW;
			h = 0.033 * safezoneH;
			colorBackground[] = {0,0,0,0.3};
		};
		
		class GangBank : Title {
			idc = 601;
			style = 1;
			text = "";
			sizeEx = "0.022 * safeZoneH";
		};
		
		class ButtonSyncData : Life_RscButtonMenu {
			idc = -1;
			onButtonClick = "[] call SOCK_fnc_syncData;";
			size = "0.022 * safeZoneH";
			x = 0.907344 * safezoneW + safezoneX;
			y = 0.94 * safezoneH + safezoneY;
			w = 0.0154688 * safezoneW;
			h = 0.033 * safezoneH;
			
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
			onButtonClick = "closeDialog 0;closeDialog 0;";
			x = 0.783594 * safezoneW + safezoneX;
			y = 0.94 * safezoneH + safezoneY;
			w = 0.0257812 * safezoneW;
			h = 0.033 * safezoneH;
			
			tooltip = "$STR_Global_Close";
			size = "0.022 * safeZoneH";
			
			colorBackground[] = {0,0,0,0};
			colorBackgroundFocused[] = {0,0,0,0};
			colorBackground2[] = {0,0,0,0};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,0};
			color2[] = {0,0,0,0};
			colorText[] = {1,1,1,1};
		};
		
		class ButtonHome : Life_RscButtonMenu {
			idc = -1;
			onButtonClick = "closeDialog 0;";
			x = 0.845468 * safezoneW + safezoneX;
			y = 0.94 * safezoneH + safezoneY;
			w = 0.020625 * safezoneW;
			h = 0.033 * safezoneH;
			
			tooltip = "HOME";
			size = "0.022 * safeZoneH";
			
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
	
	class controlsBackground {
		class InventoryBack:Life_RscPicture {
			text = "textures\handy\handy_gang_new.paa";
			idc = -1;
			x = 0.608281 * safezoneW + safezoneX;
			y = 0.225 * safezoneH + safezoneY;
			w = 0.500156 * safezoneW;
			h = 0.858 * safezoneH;
		};
	};
	
	class controls {
		
		class CreateGangText : Life_RscEdit
		{
			idc = 2522;
			text = "$STR_Gang_YGN";
			sizeEx = "0.022 * safeZoneH";
			
			x = 0.752656 * safezoneW + safezoneX;
			y = 0.6848 * safezoneH + safezoneY;
			w = 0.20625 * safezoneW;
			h = 0.033 * safezoneH;
			
			colorBackground[] = {0,0,0,0};
		};
		
		class GangCreateField : Life_RscButtonMenu {
			idc = -1;
			tooltip = "$STR_Gang_Create";
			onButtonClick = "[] call life_fnc_createGang";
			x = 0.7805 * safezoneW + safezoneX;
			y = 0.7805 * safezoneH + safezoneY;
			w = 0.149531 * safezoneW;
			h = 0.055 * safezoneH;
			
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
			size = "0.022 * safeZoneH";
			x = 0.907344 * safezoneW + safezoneX;
			y = 0.94 * safezoneH + safezoneY;
			w = 0.0154688 * safezoneW;
			h = 0.033 * safezoneH;
			
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
			onButtonClick = "closeDialog 0;closeDialog 0;";
			x = 0.783594 * safezoneW + safezoneX;
			y = 0.94 * safezoneH + safezoneY;
			w = 0.0257812 * safezoneW;
			h = 0.033 * safezoneH;
			
			tooltip = "$STR_Global_Close";
			size = "0.022 * safeZoneH";
			
			colorBackground[] = {0,0,0,0};
			colorBackgroundFocused[] = {0,0,0,0};
			colorBackground2[] = {0,0,0,0};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,0};
			color2[] = {0,0,0,0};
			colorText[] = {1,1,1,1};
		};
		
		class ButtonHome : Life_RscButtonMenu {
			idc = -1;
			onButtonClick = "closeDialog 0;";
			x = 0.845468 * safezoneW + safezoneX;
			y = 0.94 * safezoneH + safezoneY;
			w = 0.020625 * safezoneW;
			h = 0.033 * safezoneH;
			
			tooltip = "HOME";
			size = "0.022 * safeZoneH";
			
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
