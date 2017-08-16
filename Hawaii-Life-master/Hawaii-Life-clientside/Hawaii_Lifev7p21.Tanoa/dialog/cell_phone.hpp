class Life_cell_phone {
	idd = 3000;
	name= "life_cell_phone";
	movingEnable = 0;
	enableSimulation = 1;
	onLoad = "[true] spawn life_fnc_cellphone";
	
	class controlsBackground {
		class InventoryBack:Life_RscPicture {
			idc = -1;
			text = "textures\handy\handy_facebook.paa";
			x = 0.608281 * safezoneW + safezoneX;
			y = 0.225 * safezoneH + safezoneY;
			w = 0.500156 * safezoneW;
			h = 0.858 * safezoneH;
		};
	};
	
	class controls {
		
		class PlayerList : Life_RscListBox {
			idc = 3004;
			sizeEx = "0.022 * safeZoneH";
			x = 0.752656 * safezoneW + safezoneX;
			y = 0.555 * safezoneH + safezoneY;
			w = 0.20625 * safezoneW;
			h = 0.374 * safezoneH;
			colorBackground[] = {0,0,0,0};
			colorSelect2[] = {0,0,0,1};
		};
		class textEdit : Life_RscEdit {
		
			idc = 3003;
			
			text = "";
			sizeEx = "0.022 * safeZoneH";
			x = 0.799062 * safezoneW + safezoneX;
			y = 0.44225 * safezoneH + safezoneY;
			w = 0.154687 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0,0,0,0};
		};
		class TextMsgButton : life_RscButtonMenu {
			idc = 3015;
			tooltip = "$STR_CELL_TextMSGBtn";
			onButtonClick = "[0] call life_fnc_sendMSG";
			size = "0.022 * safeZoneH";
			
			x = 0.768125 * safezoneW + safezoneX;
			y = 0.478 * safezoneH + safezoneY;
			w = 0.0309375 * safezoneW;
			h = 0.033 * safezoneH;
			
			colorBackground[] = {0,0,0,0};
			colorBackgroundFocused[] = {0,0,0,0};
			colorBackground2[] = {0,0,0,0};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,0};
			color2[] = {0,0,0,0};
			colorText[] = {1,1,1,1};
		};
		class AdminMsgButton : life_RscButtonMenu {
			idc = 3020;
			tooltip = "$STR_CELL_AdminMsg";
			onButtonClick = "[4] call life_fnc_sendMSG";
			size = "0.022 * safeZoneH";
			
			x = 0.902187 * safezoneW + safezoneX;
			y = 0.478 * safezoneH + safezoneY;
			w = 0.0464062 * safezoneW;
			h = 0.033 * safezoneH;
			
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

class Life_SOS {
	idd = 3001;
	name= "life_SOS";
	movingEnable = 0;
	enableSimulation = 1;
	onLoad = "[false] spawn life_fnc_cellphone";
	
	class controlsBackground {
		class InventoryBack:Life_RscPicture {
			idc = -1;
			text = "textures\handy\handy_sos.paa";
			x = 0.608281 * safezoneW + safezoneX;
			y = 0.225 * safezoneH + safezoneY;
			w = 0.500156 * safezoneW;
			h = 0.858 * safezoneH;
		};
	};
	
	class controls {
		class textEdit : Life_RscEdit {
		
			idc = 3003;
			
			text = "";
			sizeEx = "0.022 * safeZoneH";
			onMouseEnter = "";
			style = 0x00 + 0x200;
			x = 0.753275 * safezoneW + safezoneX;
			y = 0.6782 * safezoneH + safezoneY;
			w = 0.20625 * safezoneW;
			h = 0.033 * safezoneH;
			colorBackground[] = {0,0,0,0};
		};
		
		class TextCopButton : life_RscButtonMenu {
			idc = 3016;
			tooltip = "$STR_CELL_TextPolice";
			onButtonClick = "[2] call life_fnc_sendMSG";
			size = "0.022 * safeZoneH";
			
			x = 0.804219 * safezoneW + safezoneX;
			y = 0.73815 * safezoneH + safezoneY;
			w = 0.099 * safezoneW;
			h = 0.033 * safezoneH;
			
			colorBackground[] = {0,0,0,0};
			colorBackgroundFocused[] = {0,0,0,0};
			colorBackground2[] = {0,0,0,0};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,0};
			color2[] = {0,0,0,0};
			colorText[] = {1,1,1,1};
		};
		
		class EMSRequest : life_RscButtonMenu {
			idc = 3022;
			tooltip = "$STR_CELL_THWRequest";
			onButtonClick = "[1] call life_fnc_sendMSG";
			size = "0.022 * safeZoneH";
			
			x = 0.804219 * safezoneW + safezoneX;
			y = 0.7915 * safezoneH + safezoneY;
			w = 0.099 * safezoneW;
			h = 0.033 * safezoneH;
			
			colorBackground[] = {0,0,0,0};
			colorBackgroundFocused[] = {0,0,0,0};
			colorBackground2[] = {0,0,0,0};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,0};
			color2[] = {0,0,0,0};
			colorText[] = {1,1,1,1};
		};
		
		class TextAdminButton : life_RscButtonMenu {
			idc = 3017;
			tooltip = "$STR_CELL_TextAdmins";
			onButtonClick = "[3] call life_fnc_sendMSG";
			size = "0.022 * safeZoneH";
			
			x = 0.804219 * safezoneW + safezoneX;
			y = 0.8465 * safezoneH + safezoneY;
			w = 0.099 * safezoneW;
			h = 0.033 * safezoneH;
			
			colorBackground[] = {0,0,0,0};
			colorBackgroundFocused[] = {0,0,0,0};
			colorBackground2[] = {0,0,0,0};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,0};
			color2[] = {0,0,0,0};
			colorText[] = {1,1,1,1};
		};
		
		class AdminMsgAllButton : life_RscButtonMenu {
			idc = 3021;
			tooltip = "$STR_CELL_AdminMSGAll";
			onButtonClick = "[5] call life_fnc_sendMSG";
			size = "0.022 * safeZoneH";
			
			x = 0.938281 * safezoneW + safezoneX;
			y = 0.896 * safezoneH + safezoneY;
			w = 0.020625 * safezoneW;
			h = 0.033 * safezoneH;
			
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