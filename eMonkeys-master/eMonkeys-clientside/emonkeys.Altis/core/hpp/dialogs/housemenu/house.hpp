class house_houseDialog
{
	idd = 38400;
	movingEnabled = false;
	enableSimulation = true;
	
	class controlsBackground 
	{
		class Background: EMonkeys_RscPicture
		{
			idc = -1;
			text = "core\textures\menu_background\bg_houseMenu_1.paa";
			x = 0.262812 * safezoneW + safezoneX;
			y = 0.126 * safezoneH + safezoneY;
			w = 0.474375 * safezoneW;
			h = 0.847 * safezoneH;
		};
		
		class house_value: EMonkeys_RscStructuredText
		{
			idc = 1102;
			text = "<t size='2' align='center'>xxxxxxxx €</t>";
			x = 0.315677 * safezoneW + safezoneX;
			y = 0.605482 * safezoneH + safezoneY;
			w = 0.150625 * safezoneW;
			h = 0.0311481 * safezoneH;
			colorBackground[] = {1,1,1,0};
		};
		
		class RscStructuredText_1101: EMonkeys_RscStructuredText
		{
			idc = 1101;
			text = "<t size='1.1'>Willkommen bei der Altis Wohngesellschaft!<br/></br>Leben Sie nicht mehr in der Gosse, sondern kaufen Sie sich dieses wunderschöne Haus in toller Lage!<br/><br/><br/><br/>Folgende Vorteile bekommen Sie:<br/> <t color='#00dd00'><br/>* Respawnen Sie in ihrem Haus!<br/>* Lagern Sie Ihre Gegenstände!<br/>* Parken Sie Ihr Auto ein und aus<br/>* Legen Sie sich Schlafen und heilen sich</t></t> ";
			x = 0.516146 * safezoneW + safezoneX;
			y = 0.313889 * safezoneH + safezoneY;
			w = 0.183958 * safezoneW;
			h = 0.366111 * safezoneH;
			colorBackground[] = {0,0,0,0.5};
		};
	};
	
	class controls
	{
		class bClose: EMonkeys_RscButtonMenu
		{
			idc = 2400;
			text = "";
			colorBackground[] = {-1,-1,-1,-1};
			colorBackgroundFocused[] = {1,1,1,0.12};
			colorBackground2[] = {0.75,0.75,0.75,0.2};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,1};
			color2[] = {0,0,0,1};
			colorText[] = {1,1,1,1};
			colorDisabled[] = {0,0,0,0.4};
			x = 0.703125 * safezoneW + safezoneX;
			y = 0.243518 * safezoneH + safezoneY;
			w = 0.0149999 * safezoneW;
			h = 0.0210741 * safezoneH;
			onButtonClick="closeDialog 0;";
		};
		class bBuyHouse: EMonkeys_RscButtonMenu
		{
			idc = 2401;
			text = "";
			colorBackground[] = {-1,-1,-1,-1};
			colorBackgroundFocused[] = {1,1,1,0.12};
			colorBackground2[] = {0.75,0.75,0.75,0.2};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,1};
			color2[] = {0,0,0,1};
			colorText[] = {1,1,1,1};
			colorDisabled[] = {0,0,0,0.4};
			x = 0.315104 * safezoneW + safezoneX;
			y = 0.659259 * safezoneH + safezoneY;
			w = 0.0709375 * safezoneW;
			h = 0.0198148 * safezoneH;
		};
		class bSellHouse: EMonkeys_RscButtonMenu
		{
			idc = 2402;
			text = "";
			colorBackground[] = {-1,-1,-1,-1};
			colorBackgroundFocused[] = {1,1,1,0.12};
			colorBackground2[] = {0.75,0.75,0.75,0.2};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,1};
			color2[] = {0,0,0,1};
			colorText[] = {1,1,1,1};
			colorDisabled[] = {0,0,0,0.4};
			x = 0.392709 * safezoneW + safezoneX;
			y = 0.65926 * safezoneH + safezoneY;
			w = 0.0709375 * safezoneW;
			h = 0.0198148 * safezoneH;
		};
		class bVehiclePark: EMonkeys_RscButtonMenu
		{
			idc = 2403;
			text = "";
			colorBackground[] = {-1,-1,-1,-1};
			colorBackgroundFocused[] = {1,1,1,0.12};
			colorBackground2[] = {0.75,0.75,0.75,0.2};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,1};
			color2[] = {0,0,0,1};
			colorText[] = {1,1,1,1};
			colorDisabled[] = {0,0,0,0.4};
			x = 0.329166 * safezoneW + safezoneX;
			y = 0.331482 * safezoneH + safezoneY;
			w = 0.119896 * safezoneW;
			h = 0.0198148 * safezoneH;
			tooltip = "Fahrzeug in der Nähe einparken.";
		};
		class bVehicleOpenGarage: EMonkeys_RscButtonMenu
		{
			idc = 2404;
			text = "";
			colorBackground[] = {-1,-1,-1,-1};
			colorBackgroundFocused[] = {1,1,1,0.12};
			colorBackground2[] = {0.75,0.75,0.75,0.2};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,1};
			color2[] = {0,0,0,1};
			colorText[] = {1,1,1,1};
			colorDisabled[] = {0,0,0,0.4};
			x = 0.329167 * safezoneW + safezoneX;
			y = 0.362037 * safezoneH + safezoneY;
			w = 0.119896 * safezoneW;
			h = 0.0188889 * safezoneH;
			tooltip = "Garage öffnen und Fahrzeug ausparken.";
		};
		class bKeyDialog: EMonkeys_RscButtonMenu
		{
			idc = 2405;
			text = "";
			colorBackground[] = {-1,-1,-1,-1};
			colorBackgroundFocused[] = {1,1,1,0.12};
			colorBackground2[] = {0.75,0.75,0.75,0.2};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,1};
			color2[] = {0,0,0,1};
			colorText[] = {1,1,1,1};
			colorDisabled[] = {0,0,0,0.4};
			x = 0.329167 * safezoneW + safezoneX;
			y = 0.421296 * safezoneH + safezoneY;
			w = 0.119896 * safezoneW;
			h = 0.0198148 * safezoneH;
			tooltip = "Einem anderen Spieler Hausschlüssel geben.";
			sizeEx = "0.02 / (getResolution select 5)";
		};
		class bVehicleHeliOpenGarage: EMonkeys_RscButtonMenu
		{
			idc = 2406;
			text = "";
			colorBackground[] = {-1,-1,-1,-1};
			colorBackgroundFocused[] = {1,1,1,0.12};
			colorBackground2[] = {0.75,0.75,0.75,0.2};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,1};
			color2[] = {0,0,0,1};
			colorText[] = {1,1,1,1};
			colorDisabled[] = {0,0,0,0.4};
			x = 0.329167 * safezoneW + safezoneX;
			y = 0.391666 * safezoneH + safezoneY;
			w = 0.119896 * safezoneW;
			h = 0.0198148 * safezoneH;
			tooltip = "Heli-Garage öffnen.";
		};
	};
};
