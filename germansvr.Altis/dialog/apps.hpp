class handy_apps1 {

	idd = 8223;
	name = "handy_apps1";
	movingEnable = true;
	enableSimulation = true;
	onLoad = "[] spawn life_fnc_p_openApps;";
	
	class controlsBackground {
		class InventoryBack:Life_RscPicture {
			idc = -1;
			text = "textures\handy\handy_apps.paa";
			x = 0.608281 * safezoneW + safezoneX;
			y = 0.225 * safezoneH + safezoneY;
			w = 0.500156 * safezoneW;
			h = 0.858 * safezoneH;
		};
	};
	
	class controls {
		class ButtonCell : Life_RscButtonMenu {
			idc = -1;
			onButtonClick = "createDialog ""Life_my_smartphone"";";
			size = "0.022 * safeZoneH";
			x = 0.900537 * safezoneW + safezoneX;
			y = 0.3537 * safezoneH + safezoneY;
			w = 0.0499125 * safezoneW;
			h = 0.0847 * safezoneH;
			
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
			idc = -1;
			onButtonClick = "createDialog ""life_key_management"";";
			size = "0.022 * safeZoneH";
			x = 0.7607 * safezoneW + safezoneX;
			y = 0.467 * safezoneH + safezoneY;
			w = 0.0499125 * safezoneW;
			h = 0.0847 * safezoneH;
			
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
			onButtonClick = "[] call life_fnc_settingsMenu;";
			size = "0.022 * safeZoneH";
			x = 0.83 * safezoneW + safezoneX;
			y = 0.71285 * safezoneH + safezoneY;
			w = 0.0499125 * safezoneW;
			h = 0.0847 * safezoneH;
			
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
			onButtonClick = "if(isNil ""life_action_gangInUse"") then {if(isNil {(group player) getVariable ""gang_owner""}) then {createDialog ""life_Create_Gang_Diag"";} else {[] spawn life_fnc_gangMenu;};};";
			size = "0.022 * safeZoneH";
			x = 0.831237 * safezoneW + safezoneX;
			y = 0.35425 * safezoneH + safezoneY;
			w = 0.0495 * safezoneW;
			h = 0.0847 * safezoneH;
			
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
			onButtonClick = "[] call life_fnc_profSetup;";
			size = "0.022 * safeZoneH";
			x = 0.900537 * safezoneW + safezoneX;
			y = 0.467 * safezoneH + safezoneY;
			w = 0.0499125 * safezoneW;
			h = 0.0847 * safezoneH;
			
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
			idc = -1;
            onButtonClick = "[] spawn life_fnc_InfoMenu;";
			size = "0.022 * safeZoneH";
			x = 0.7607 * safezoneW + safezoneX;
			y = 0.35425 * safezoneH + safezoneY;
			w = 0.0495 * safezoneW;
			h = 0.0847 * safezoneH;
			
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
			onButtonClick = "createDialog ""life_dynmarket_prices"";";
			size = "0.022 * safeZoneH";
			x = 0.83 * safezoneW + safezoneX;
			y = 0.467 * safezoneH + safezoneY;
			w = 0.0499125 * safezoneW;
			h = 0.0847 * safezoneH;
			
			tooltip = "Markt";
			
			colorBackground[] = {0,0,0,0};
			colorBackgroundFocused[] = {0,0,0,0};
			colorBackground2[] = {0,0,0,0};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,0};
			color2[] = {0,0,0,0};
			colorText[] = {1,1,1,1};
		};
		
		class ButtonGangList : Life_RscButtonMenu {
			idc = 2012;
			tooltip = "$STR_PM_WantedList";
			onButtonClick = "[] call life_fnc_wantedMenu;";
			size = "0.022 * safeZoneH";
			x = 0.900537 * safezoneW + safezoneX;
			y = 0.71285 * safezoneH + safezoneY;
			w = 0.0499125 * safezoneW;
			h = 0.0847 * safezoneH;
			
			colorBackground[] = {0,0,0,0};
			colorBackgroundFocused[] = {0,0,0,0};
			colorBackground2[] = {0,0,0,0};
			color[] = {1,1,1,1};
			colorFocused[] = {1,1,1,1};
			color2[] = {1,1,1,1};
			colorText[] = {1,1,1,1};
		};
		
		class ButtonBank : Life_RscButtonMenu {
			idc = -1;
			tooltip = "$STR_PM_Bank";
			onButtonClick = "createDialog ""bank_app"";";
			size = "0.022 * safeZoneH";
			x = 0.831237 * safezoneW + safezoneX;
			y = 0.5902 * safezoneH + safezoneY;
			w = 0.0499125 * safezoneW;
			h = 0.0847 * safezoneH;
			
			colorBackground[] = {0,0,0,0};
			colorBackgroundFocused[] = {0,0,0,0};
			colorBackground2[] = {0,0,0,0};
			color[] = {1,1,1,1};
			colorFocused[] = {1,1,1,1};
			color2[] = {1,1,1,1};
			colorText[] = {1,1,1,1};
		};
		
		class ButtonLicense : Life_RscButtonMenu {
			idc = -1;
			tooltip = "$STR_PM_Licenses";
			onButtonClick = "createDialog ""license_app"";";
			size = "0.022 * safeZoneH";
			x = 0.900537 * safezoneW + safezoneX;
			y = 0.5902 * safezoneH + safezoneY;
			w = 0.0499125 * safezoneW;
			h = 0.0847 * safezoneH;
			
			colorBackground[] = {0,0,0,0};
			colorBackgroundFocused[] = {0,0,0,0};
			colorBackground2[] = {0,0,0,0};
			color[] = {1,1,1,1};
			colorFocused[] = {1,1,1,1};
			color2[] = {1,1,1,1};
			colorText[] = {1,1,1,1};
		};
		
		class ButtonSOS : Life_RscButtonMenu {
			idc = -1;
			tooltip = "$STR_PM_SOS";
			onButtonClick = "createDialog ""Life_smartphone_notruf"";";
			size = "0.022 * safeZoneH";
			x = 0.7607 * safezoneW + safezoneX;
			y = 0.71285 * safezoneH + safezoneY;
			w = 0.0499125 * safezoneW;
			h = 0.0847 * safezoneH;
			
			colorBackground[] = {0,0,0,0};
			colorBackgroundFocused[] = {0,0,0,0};
			colorBackground2[] = {0,0,0,0};
			color[] = {1,1,1,1};
			colorFocused[] = {1,1,1,1};
			color2[] = {1,1,1,1};
			colorText[] = {1,1,1,1};
		};
		
		class ButtonMusik : Life_RscButtonMenu {
			idc = -1;
			tooltip = "Hilfe-Menü";
			action = "createDialog 'holy_help'";
			size = "0.022 * safeZoneH";
			x = 0.7607 * safezoneW + safezoneX;
			y = 0.5891 * safezoneH + safezoneY;
			w = 0.0499125 * safezoneW;
			h = 0.0847 * safezoneH;
			
			colorBackground[] = {0,0,0,0};
			colorBackgroundFocused[] = {0,0,0,0};
			colorBackground2[] = {0,0,0,0};
			color[] = {1,1,1,1};
			colorFocused[] = {1,1,1,1};
			color2[] = {1,1,1,1};
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
			onButtonClick = "closeDialog 0;";
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
			onButtonClick = "closeDialog 0;createDialog ""handy_apps2"";";
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
		
		class PointHome : Life_RscButtonMenu {
			size = "0.022 * safeZoneH";
			idc = -1;
			onButtonClick = "closeDialog 0;createDialog ""playerSettings"";disableSerialization;[] call life_fnc_p_updateMenu;";
			
			x = 0.840312 * safezoneW + safezoneX;
			y = 0.907 * safezoneH + safezoneY;
			w = 0.00825 * safezoneW;
			h = 0.01265 * safezoneH;
			
			colorBackground[] = {0,0,0,0};
			colorBackgroundFocused[] = {0,0,0,0};
			colorBackground2[] = {0,0,0,0};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,0};
			color2[] = {0,0,0,0};
			colorText[] = {1,1,1,1};
		};
		
		class PointApps2 : Life_RscButtonMenu {
			size = "0.022 * safeZoneH";
			idc = -1;
			onButtonClick = "closeDialog 0;createDialog ""handy_apps2"";";
			x = 0.860937 * safezoneW + safezoneX;
			y = 0.907 * safezoneH + safezoneY;
			w = 0.00825 * safezoneW;
			h = 0.01265 * safezoneH;
			
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

class handy_apps2 {

	idd = 8224;
	name = "handy_apps2";
	movingEnable = true;
	enableSimulation = true;
	onLoad = "";
	
	class controlsBackground {
			class InventoryBack:Life_RscPicture {
			idc = -1;
			text = "textures\handy\handy_apps2.paa";
			x = 0.608281 * safezoneW + safezoneX;
			y = 0.225 * safezoneH + safezoneY;
			w = 0.500156 * safezoneW;
			h = 0.858 * safezoneH;
		};
	};
	
	class controls {
		
		class Ausweis : Life_RscButtonMenu {
			onButtonClick = "private[""_rang_1""]; _rang_1 = switch(playerSide) do {case west: {str(call life_coplevel)};case independent: {str(call life_mediclevel)};case civilian: {""""};case east: {str(call life_adaclevel)};}; [player,_rang_1] remoteExecCall [""life_fnc_zeigePerso"",player]; closeDialog 0;";
			idc = -1;
			size = "0.022 * safeZoneH";
			x = 0.7607 * safezoneW + safezoneX;
			y = 0.35425 * safezoneH + safezoneY;
			w = 0.0495 * safezoneW;
			h = 0.0847 * safezoneH;
			
			tooltip = "Ausweis";
			
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
			onButtonClick = "closeDialog 0;";
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
			onButtonClick = "closeDialog 0;createDialog ""playerSettings"";disableSerialization;[] call life_fnc_p_updateMenu;";
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
		
		class PointHome : Life_RscButtonMenu {
			size = "0.022 * safeZoneH";
			idc = -1;
			onButtonClick = "closeDialog 0;createDialog ""playerSettings"";disableSerialization;[] call life_fnc_p_updateMenu;";
			
			x = 0.840312 * safezoneW + safezoneX;
			y = 0.907 * safezoneH + safezoneY;
			w = 0.00825 * safezoneW;
			h = 0.01265 * safezoneH;
			
			colorBackground[] = {0,0,0,0};
			colorBackgroundFocused[] = {0,0,0,0};
			colorBackground2[] = {0,0,0,0};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,0};
			color2[] = {0,0,0,0};
			colorText[] = {1,1,1,1};
		};
		
		class PointApps : Life_RscButtonMenu {
			size = "0.022 * safeZoneH";
			idc = -1;
			onButtonClick = "closeDialog 0;createDialog ""handy_apps1"";";
			x = 0.850625 * safezoneW + safezoneX;
			y = 0.907 * safezoneH + safezoneY;
			w = 0.00825 * safezoneW;
			h = 0.01265 * safezoneH;
			
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