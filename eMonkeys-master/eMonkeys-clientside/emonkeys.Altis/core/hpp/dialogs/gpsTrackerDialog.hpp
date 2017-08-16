class EMonkeys_gpsTrackerDialog
{
	name = "EMonkeys_gpsTrackerDialog";
	idd = 38300;
	fadein=0;
	duration = 99999999999;
	fadeout=0;
	movingEnable = 0;
	objects[]={};

	class controlsBackground 
	{
		class background : EMonkeys_RscPicture
		{
			idc = -1;
			text = "core\textures\menu_background\bg_gpsTracker.paa";
			x = 0.231875 * safezoneW + safezoneX;
			y = -0.028 * safezoneH + safezoneY;
			w = 0.520781 * safezoneW;
			h = 0.946 * safezoneH;
		};
		
		class button_speichern : EMonkeys_RscPicture
		{
			idc = 3301;
			text = "core\textures\menu_icons\icon_speichern.paa";
			x = 0.606198 * safezoneW + safezoneX;
			y = 0.603519 * safezoneH + safezoneY;
			w = 0.0144272 * safezoneW;
			h = 0.0238519 * safezoneH;
		};
	};
	
	class controls
	{
		class beschreibung : EMonkeys_RscTitle
		{
			idc = 3303;
			text = "Trage einen Namen für den GPS Tracker ein";
			sizeEx = 0.040;
			colorText[] = {0.157,0.157,0.157,1};
			font = PuristaSemiBold;
			shadow = 0;
			x = 0.399115 * safezoneW + safezoneX;
			y = 0.445926 * safezoneH + safezoneY;
			w = 0.223073 * safezoneW;
			h = 0.033 * safezoneH;
		};
		
		class eingabefeld : EMonkeys_RscEdit
		{
			idc = 3304;
			text = "Beispiel Fahrzeug";
			colorBackground[] = {0.184,0.184,0.184,1};
			x = 0.407187 * safezoneW + safezoneX;
			y = 0.5 * safezoneH + safezoneY;
			w = 0.185625 * safezoneW;
			h = 0.033 * safezoneH;
		};
		
		class erstellen : EMonkeys_RscButtonMenu
		{
			idc = 3305;
			onButtonClick = "[cursorTarget] spawn EMonkeys_fnc_gpsTracker;";
			tooltip = "Erstellen eines GPS Trackers";
			colorBackground[] = {-1,-1,-1,-1};
			colorBackgroundFocused[] = {1,1,1,0.12};
			colorBackground2[] = {0.75,0.75,0.75,0.2};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,1};
			color2[] = {0,0,0,1};
			colorText[] = {1,1,1,1};
			colorDisabled[] = {0,0,0,0.4};
			x = 0.605364 * safezoneW + safezoneX;
			y = 0.602963 * safezoneH + safezoneY;
			w = 0.016771 * safezoneW;
			h = 0.0272223 * safezoneH;	
		};
		
		class close : EMonkeys_RscButtonMenu
		{
			idc = 3306;
			onButtonClick = "closeDialog 0;";
			colorBackground[] = {-1,-1,-1,-1};
			colorBackgroundFocused[] = {1,1,1,0.12};
			colorBackground2[] = {0.75,0.75,0.75,0.2};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,1};
			color2[] = {0,0,0,1};
			colorText[] = {1,1,1,1};
			colorDisabled[] = {0,0,0,0.4};
			x = 0.379034 * safezoneW + safezoneX;
			y = 0.60252 * safezoneH + safezoneY;
			w = 0.0159375 * safezoneW;
			h = 0.0265186 * safezoneH;
		};
	};
};

class EMonkeys_gpsScanner
{
	name = "EMonkeys_gpsScanner";
	idd = 38300;
	fadein=0;
	duration = 99999999999;
	fadeout=0;
	movingEnable = 0;
	objects[]={};

	class controlsBackground 
	{	
		class background : EMonkeys_RscPicture
		{
			idc = 3301;
			text = "core\textures\menu_background\bg_gpsTracker.paa";
			x = 0.231875 * safezoneW + safezoneX;
			y = -0.028 * safezoneH + safezoneY;
			w = 0.520781 * safezoneW;
			h = 0.946 * safezoneH;
		};
		
		class picture_button : EMonkeys_RscPicture
		{
			idc = 3302;
			text = "core\textures\menu_icons\icon_loeschen.paa";
			x = 0.606198 * safezoneW + safezoneX;
			y = 0.603519 * safezoneH + safezoneY;
			w = 0.0144272 * safezoneW;
			h = 0.0238519 * safezoneH;
		};
			
		class liste : EMonkeys_RscListBox 
		{
			idc = 3303;
			sizeEx = 0.039;
			colorBackground[] = {-1,-1,-1,-1};
			colorBackgroundFocused[] = {1,1,1,0.12};
			colorBackground2[] = {0.75,0.75,0.75,0.2};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,1};
			color2[] = {0,0,0,1};
			colorText[] = {0.184,0.184,0.184,1};
			colorDisabled[] = {0,0,0,0.4};
			x = 0.379859 * safezoneW + safezoneX;
			y = 0.39638 * safezoneH + safezoneY;
			w = 0.242813 * safezoneW;
			h = 0.182778 * safezoneH;
		};
		
		class loeschen : EMonkeys_RscButtonMenu
		{
			idc = 3305;
			onButtonClick = "[cursorTarget] call EMonkeys_fnc_gpsDelete;";
			tooltip = "Entfernen eines ausgewählten GPS Trackers";
			colorBackground[] = {-1,-1,-1,-1};
			colorBackgroundFocused[] = {1,1,1,0.12};
			colorBackground2[] = {0.75,0.75,0.75,0.2};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,1};
			color2[] = {0,0,0,1};
			colorText[] = {1,1,1,1};
			colorDisabled[] = {0,0,0,0.4};
			x = 0.605364 * safezoneW + safezoneX;
			y = 0.602963 * safezoneH + safezoneY;
			w = 0.016771 * safezoneW;
			h = 0.0272223 * safezoneH;
		};
		
		class close : EMonkeys_RscButtonMenu
		{
			idc = 3306;
			onButtonClick = "closeDialog 0;";
			colorBackground[] = {-1,-1,-1,-1};
			colorBackgroundFocused[] = {1,1,1,0.12};
			colorBackground2[] = {0.75,0.75,0.75,0.2};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,1};
			color2[] = {0,0,0,1};
			colorText[] = {1,1,1,1};
			colorDisabled[] = {0,0,0,0.4};
			x = 0.379034 * safezoneW + safezoneX;
			y = 0.60252 * safezoneH + safezoneY;
			w = 0.0159375 * safezoneW;
			h = 0.0265186 * safezoneH;
		};
	};
};