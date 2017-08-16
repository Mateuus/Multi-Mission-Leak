/*
	Author: DerOnkel & Williams
	Avanix Gaming Community
	The usage of this file is restricted to Avanix-Gaming.de
    You're not allowed to modify this file!
    Licensed under the Arma EULA and Arma Tools EULA.
    For further questions contact the author!
	
	Description:
	Dialog for Fuelstation Owner
*/
class fuelstation_fuelMenu
{
	idd = 9000;
	name= "fuelstation_fuelMenu";
	//movingEnable = false;
	movingEnable = 0;
	enableSimulation = true;
	fadein=0;
	duration = 99999999999;
	fadeout=0;
	onLoad="uiNamespace setVariable ['EMonkeys_fuel_progress',_this select 0]";
	objects[]={};
	
	class controlsBackground 
	{
		class background: EMonkeys_RscPicture 
		{
			text= "core\textures\menu_background\bg_fuelMenu.paa";
			idc = -1;
			x = 0.247344 * safezoneW + safezoneX;
			y = 0.082 * safezoneH + safezoneY;
			w = 0.510469 * safezoneW;
			h = 0.924 * safezoneH;
		};
		
		class super_picture: EMonkeys_RscPicture
		{
			idc = -1;
			text = "core\textures\menu_icons\icon_super.paa";
			x = 0.347761 * safezoneW + safezoneX;
			y = 0.338074 * safezoneH + safezoneY;
			w = 0.020625 * safezoneW;
			h = 0.033 * safezoneH;
		};
		
		class superplus_picture: EMonkeys_RscPicture
		{
			idc = -1;
			text = "core\textures\menu_icons\icon_superplus.paa";
			x = 0.347916 * safezoneW + safezoneX;
			y = 0.379629 * safezoneH + safezoneY;
			w = 0.020625 * safezoneW;
			h = 0.033 * safezoneH;
		};
		
		class diesel_picture: EMonkeys_RscPicture
		{
			idc = -1;
			text = "core\textures\menu_icons\icon_diesel.paa";
			x = 0.347916 * safezoneW + safezoneX;
			y = 0.420371 * safezoneH + safezoneY;
			w = 0.020625 * safezoneW;
			h = 0.033 * safezoneH;
		};
		
		class biodiesel_picture: EMonkeys_RscPicture
		{
			idc = -1;
			text = "core\textures\menu_icons\icon_biodiesel.paa";
			x = 0.347917 * safezoneW + safezoneX;
			y = 0.462038 * safezoneH + safezoneY;
			w = 0.020625 * safezoneW;
			h = 0.033 * safezoneH;
		};
		/*
		class repair_picture: EMonkeys_RscPicture
		{
			idc = -1;
			text = "core\textures\menu_icons\icon_diesel.paa";
			x = 0.347916 * safezoneW + safezoneX;
			y = 0.50463 * safezoneH + safezoneY;
			w = 0.020625 * safezoneW;
			h = 0.033 * safezoneH;
		};
		
		class paint_picture: EMonkeys_RscPicture
		{
			idc = -1;
			text = "core\textures\menu_icons\icon_diesel.paa";
			x = 0.347917 * safezoneW + safezoneX;
			y = 0.547222 * safezoneH + safezoneY;
			w = 0.020625 * safezoneW;
			h = 0.033 * safezoneH;
		};	
		*/
	};

	class controls 
	{
		class tankstellenname_structuredText: EMonkeys_RscStructuredText
		{
			idc = 9001;
			text = "";
			x = 0.483333 * safezoneW + safezoneX;
			y = 0.282407 * safezoneH + safezoneY;
			w = 0.176979 * safezoneW;
			h = 0.0201481 * safezoneH;
		};
		
		class nearestVehicle: EMonkeys_RscCombo
		{
			idc = 9002;
			onLBSelChanged = "[_this] call EMonkeys_fnc_nearestVehicleFuel";
			x = 0.441718 * safezoneW + safezoneX;
			y = 0.347037 * safezoneH + safezoneY;
			w = 0.216042 * safezoneW;
			h = 0.022 * safezoneH;
		};
		
		class fuellocation: EMonkeys_RscCombo
		{
			idc = 9003;
			tooltip = "Treibstoff wählen";
			onLBSelChanged = "";
			x = 0.442188 * safezoneW + safezoneX;
			y = 0.599074 * safezoneH + safezoneY;
			w = 0.164739 * safezoneW;
			h = 0.0201482 * safezoneH;
		};
		
		class betrag_structuredText: EMonkeys_RscStructuredText
		{
			idc = 9004;
			text = "0,00 €";
			x = 0.504687 * safezoneW + safezoneX;
			y = 0.435185 * safezoneH + safezoneY;
			w = 0.145417 * safezoneW;
			h = 0.0262963 * safezoneH;
		};
		
		class abgabe_structuredText: EMonkeys_RscStructuredText
		{
			idc = 9005;
			text = "0,0 Liter";
			x = 0.504688 * safezoneW + safezoneX;
			y = 0.474075 * safezoneH + safezoneY;
			w = 0.145417 * safezoneW;
			h = 0.0255926 * safezoneH;
		};
		
		class processbar: EMonkeys_RscProgress
		{
			idc = 9006;
			shadow = 2;
			colorFrame[] = {1, 1, 1, 1};
			colorBackground[] = {1, 1, 1,0.7};
			colorBar[] = {1, 1, 1, 1};
			x = 0.449479 * safezoneW + safezoneX;
			y = 0.512963 * safezoneH + safezoneY;
			w = 0.200573 * safezoneW;
			h = 0.0257037 * safezoneH;
		};
		
		class fuel_button: EMonkeys_RscButtonMenu
		{
			idc = 9007;
			text = "";
			colorBackground[] = {-1,-1,-1,-1};
			colorBackgroundFocused[] = {1,1,1,0.12};
			colorBackground2[] = {0.75,0.75,0.75,0.2};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,1};
			color2[] = {0,0,0,1};
			colorText[] = {1,1,1,1};
			colorDisabled[] = {0,0,0,0.4};
			x = 0.60849 * safezoneW + safezoneX;
			y = 0.600296 * safezoneH + safezoneY;
			w = 0.0492187 * safezoneW;
			h = 0.0191111 * safezoneH;
		};
		
		class close_button: EMonkeys_RscButtonMenu
		{
			idc = 9008;
			text = "";
			colorBackground[] = {-1,-1,-1,-1};
			colorBackgroundFocused[] = {1,1,1,0.12};
			colorBackground2[] = {0.75,0.75,0.75,0.2};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,1};
			color2[] = {0,0,0,1};
			colorText[] = {1,1,1,1};
			colorDisabled[] = {0,0,0,0.4};
			onButtonClick = "closeDialog 0;";
			x = 0.349479 * safezoneW + safezoneX;
			y = 0.645371 * safezoneH + safezoneY;
			w = 0.0174478 * safezoneW;
			h = 0.0302222 * safezoneH;
		};
		
		class superprice_structuredText: EMonkeys_RscStructuredText
		{
			idc = 9009;
			text = "";
			x = 0.371094 * safezoneW + safezoneX;
			y = 0.337778 * safezoneH + safezoneY;
			w = 0.061875 * safezoneW;
			h = 0.033 * safezoneH;
		};
		
		class superplusprice_structuredText: EMonkeys_RscStructuredText
		{
			idc = 9010;
			text = "";
			x = 0.371094 * safezoneW + safezoneX;
			y = 0.379926 * safezoneH + safezoneY;
			w = 0.0646875 * safezoneW;
			h = 0.033 * safezoneH;
		};
		
		class dieselprice_structuredText: EMonkeys_RscStructuredText
		{
			idc = 9011;
			text = "";
			x = 0.371354 * safezoneW + safezoneX;
			y = 0.420371 * safezoneH + safezoneY;
			w = 0.0646875 * safezoneW;
			h = 0.033 * safezoneH;
		};
		
		class biedieselprice_structuredText: EMonkeys_RscStructuredText
		{
			idc = 9012;
			text = "";
			x = 0.371354 * safezoneW + safezoneX;
			y = 0.462037 * safezoneH + safezoneY;
			w = 0.0646355 * safezoneW;
			h = 0.033 * safezoneH;
		};	
		
		class repairprice_structuredText: EMonkeys_RscStructuredText
		{
			idc = 9013;
			text = "";
			x = 0.371094 * safezoneW + safezoneX;
			y = 0.50463 * safezoneH + safezoneY;
			w = 0.0646875 * safezoneW;
			h = 0.033 * safezoneH;
		};
		
		class paintprice_structuredText: EMonkeys_RscStructuredText
		{
			idc = 9014;
			text = "";
			x = 0.371354 * safezoneW + safezoneX;
			y = 0.547222 * safezoneH + safezoneY;
			w = 0.0646355 * safezoneW;
			h = 0.033 * safezoneH;
		};
	};
};

class fuelstation_airfuelMenu
{
	idd = 9000;
	name= "fuelstation_airfuelMenu";
	//movingEnable = false;
	movingEnable = 0;
	enableSimulation = true;
	fadein=0;
	duration = 99999999999;
	fadeout=0;
	onLoad="uiNamespace setVariable ['EMonkeys_fuel_progress',_this select 0]";
	objects[]={};
	
	class controlsBackground 
	{
		class background: EMonkeys_RscPicture 
		{
			text= "core\textures\menu_background\bg_fuelMenu.paa";
			idc = -1;
			x = 0.247344 * safezoneW + safezoneX;
			y = 0.082 * safezoneH + safezoneY;
			w = 0.510469 * safezoneW;
			h = 0.924 * safezoneH;
		};
		
		class kerosin_picture: EMonkeys_RscPicture
		{
			idc = -1;
			text = "core\textures\menu_icons\icon_kerosin.paa";
			x = 0.347761 * safezoneW + safezoneX;
			y = 0.338074 * safezoneH + safezoneY;
			w = 0.020625 * safezoneW;
			h = 0.033 * safezoneH;
		};	
	};

	class controls 
	{
		class tankstellenname_structuredText: EMonkeys_RscStructuredText
		{
			idc = 9001;
			text = "";
			x = 0.483333 * safezoneW + safezoneX;
			y = 0.282407 * safezoneH + safezoneY;
			w = 0.176979 * safezoneW;
			h = 0.0201481 * safezoneH;
		};
		
		class nearestVehicle: EMonkeys_RscCombo
		{
			idc = 9002;
			onLBSelChanged = "[_this] call EMonkeys_fnc_nearestVehicleFuel";
			x = 0.441718 * safezoneW + safezoneX;
			y = 0.347037 * safezoneH + safezoneY;
			w = 0.216042 * safezoneW;
			h = 0.022 * safezoneH;
		};
		
		class fuellocation: EMonkeys_RscCombo
		{
			idc = 9003;
			tooltip = "Treibstoff wählen";
			onLBSelChanged = "";
			x = 0.442188 * safezoneW + safezoneX;
			y = 0.599074 * safezoneH + safezoneY;
			w = 0.164739 * safezoneW;
			h = 0.0201482 * safezoneH;
		};
		
		class betrag_structuredText: EMonkeys_RscStructuredText
		{
			idc = 9004;
			text = "0,00 €";
			x = 0.504687 * safezoneW + safezoneX;
			y = 0.435185 * safezoneH + safezoneY;
			w = 0.145417 * safezoneW;
			h = 0.0262963 * safezoneH;
		};
		
		class abgabe_structuredText: EMonkeys_RscStructuredText
		{
			idc = 9005;
			text = "0,0 Liter";
			x = 0.504688 * safezoneW + safezoneX;
			y = 0.474075 * safezoneH + safezoneY;
			w = 0.145417 * safezoneW;
			h = 0.0255926 * safezoneH;
		};
		
		class processbar: EMonkeys_RscProgress
		{
			idc = 9006;
			shadow = 2;
			colorFrame[] = {1, 1, 1, 1};
			colorBackground[] = {1, 1, 1,0.7};
			colorBar[] = {1, 1, 1, 1};
			x = 0.449479 * safezoneW + safezoneX;
			y = 0.512963 * safezoneH + safezoneY;
			w = 0.200573 * safezoneW;
			h = 0.0257037 * safezoneH;
		};
		
		class fuel_button: EMonkeys_RscButtonMenu
		{
			idc = 9007;
			text = "";
			colorBackground[] = {-1,-1,-1,-1};
			colorBackgroundFocused[] = {1,1,1,0.12};
			colorBackground2[] = {0.75,0.75,0.75,0.2};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,1};
			color2[] = {0,0,0,1};
			colorText[] = {1,1,1,1};
			colorDisabled[] = {0,0,0,0.4};
			onButtonClick = "[] spawn EMonkeys_fnc_startAirVehicleFueling";
			x = 0.60849 * safezoneW + safezoneX;
			y = 0.600296 * safezoneH + safezoneY;
			w = 0.0492187 * safezoneW;
			h = 0.0191111 * safezoneH;
		};
		
		class kerosin_structuredText: EMonkeys_RscStructuredText
		{
			idc = 9008;
			text = "";
			x = 0.371354 * safezoneW + safezoneX;
			y = 0.337963 * safezoneH + safezoneY;
			w = 0.0644792 * safezoneW;
			h = 0.033 * safezoneH;
		};
		
		class close_button: EMonkeys_RscButtonMenu
		{
			idc = 9009;
			text = "";
			colorBackground[] = {-1,-1,-1,-1};
			colorBackgroundFocused[] = {1,1,1,0.12};
			colorBackground2[] = {0.75,0.75,0.75,0.2};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,1};
			color2[] = {0,0,0,1};
			colorText[] = {1,1,1,1};
			colorDisabled[] = {0,0,0,0.4};
			onButtonClick = "closeDialog 0;";
			x = 0.349479 * safezoneW + safezoneX;
			y = 0.645371 * safezoneH + safezoneY;
			w = 0.0174478 * safezoneW;
			h = 0.0302222 * safezoneH;
		};
	};
};

class fuelstation_ownerMenu
{
	idd = 9000;
	name= "fuelstation_ownerMenu";
	movingEnable = false;
	enableSimulation = true;
	
	class controlsBackground 
	{
		class EMonkeys_RscTitleBackground: EMonkeys_RscPicture
		{
			text= "core\textures\menu_background\bg_fuelstationOwnerMenu.paa";
			idc = -1;
			x = 0.247344 * safezoneW + safezoneX;
			y = 0.071 * safezoneH + safezoneY;
			w = 0.505313 * safezoneW;
			h = 0.957 * safezoneH;
		};
	};

	class controls 
	{
		class tankstellenname_edit: EMonkeys_RscEdit
		{
			idc = 9001;
			text = "";
			colorBackground[] = {-1,-1,-1,-1};
			colorBackgroundFocused[] = {1,1,1,0.12};
			colorBackground2[] = {0.75,0.75,0.75,0.2};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,1};
			color2[] = {0,0,0,1};
			colorText[] = {1,1,1,1};
			colorDisabled[] = {0,0,0,0.4};
			x = 0.431979 * safezoneW + safezoneX;
			y = 0.331296 * safezoneH + safezoneY;
			w = 0.208802 * safezoneW;
			h = 0.022 * safezoneH;
		};
		
		class nameaendern_button: EMonkeys_RscButtonMenu
		{
			idc = 9002;
			text = "";
			colorBackground[] = {-1,-1,-1,-1};
			colorBackgroundFocused[] = {1,1,1,0.12};
			colorBackground2[] = {0.75,0.75,0.75,0.2};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,1};
			color2[] = {0,0,0,1};
			colorText[] = {1,1,1,1};
			colorDisabled[] = {0,0,0,0.4};
			x = 0.64375 * safezoneW + safezoneX;
			y = 0.328703 * safezoneH + safezoneY;
			w = 0.0401042 * safezoneW;
			h = 0.0266296 * safezoneH;
		};
		
		class superpreis_edit: EMonkeys_RscEdit
		{
			idc = 9003;
			text = "";
			colorBackground[] = {-1,-1,-1,-1};
			colorBackgroundFocused[] = {1,1,1,0.12};
			colorBackground2[] = {0.75,0.75,0.75,0.2};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,1};
			color2[] = {0,0,0,1};
			colorText[] = {1,1,1,1};
			colorDisabled[] = {0,0,0,0.4};
			x = 0.386562 * safezoneW + safezoneX;
			y = 0.401 * safezoneH + safezoneY;
			w = 0.0928125 * safezoneW;
			h = 0.022 * safezoneH;
		};
		
		class superpluspreis_edit: EMonkeys_RscEdit
		{
			idc = 9004;
			text = "";
			colorBackground[] = {-1,-1,-1,-1};
			colorBackgroundFocused[] = {1,1,1,0.12};
			colorBackground2[] = {0.75,0.75,0.75,0.2};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,1};
			color2[] = {0,0,0,1};
			colorText[] = {1,1,1,1};
			colorDisabled[] = {0,0,0,0.4};
			x = 0.386562 * safezoneW + safezoneX;
			y = 0.430296 * safezoneH + safezoneY;
			w = 0.0928125 * safezoneW;
			h = 0.022 * safezoneH;
		};
		
		class dieselpreis_edit: EMonkeys_RscEdit
		{
			idc = 9005;
			text = "";
			colorBackground[] = {-1,-1,-1,-1};
			colorBackgroundFocused[] = {1,1,1,0.12};
			colorBackground2[] = {0.75,0.75,0.75,0.2};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,1};
			color2[] = {0,0,0,1};
			colorText[] = {1,1,1,1};
			colorDisabled[] = {0,0,0,0.4};
			x = 0.386562 * safezoneW + safezoneX;
			y = 0.460519 * safezoneH + safezoneY;
			w = 0.0928125 * safezoneW;
			h = 0.022 * safezoneH;
		};
		
		class biodieselpreis_edit: EMonkeys_RscEdit
		{
			idc = 9006;
			text = "";
			colorBackground[] = {-1,-1,-1,-1};
			colorBackgroundFocused[] = {1,1,1,0.12};
			colorBackground2[] = {0.75,0.75,0.75,0.2};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,1};
			color2[] = {0,0,0,1};
			colorText[] = {1,1,1,1};
			colorDisabled[] = {0,0,0,0.4};
			x = 0.386562 * safezoneW + safezoneX;
			y = 0.490852 * safezoneH + safezoneY;
			w = 0.0928125 * safezoneW;
			h = 0.022 * safezoneH;
		};
		/*
		class reperaturpreis_edit: EMonkeys_RscEdit
		{
			idc = 9007;
			text = "";
			colorBackground[] = {-1,-1,-1,-1};
			colorBackgroundFocused[] = {1,1,1,0.12};
			colorBackground2[] = {0.75,0.75,0.75,0.2};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,1};
			color2[] = {0,0,0,1};
			colorText[] = {1,1,1,1};
			colorDisabled[] = {0,0,0,0.4};
			x = 0.386562 * safezoneW + safezoneX;
			y = 0.519222 * safezoneH + safezoneY;
			w = 0.0928125 * safezoneW;
			h = 0.022 * safezoneH;
		};
		
		class lackierpreis_edit: EMonkeys_RscEdit
		{
			idc = 9008;
			text = "";
			colorBackground[] = {-1,-1,-1,-1};
			colorBackgroundFocused[] = {1,1,1,0.12};
			colorBackground2[] = {0.75,0.75,0.75,0.2};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,1};
			color2[] = {0,0,0,1};
			colorText[] = {1,1,1,1};
			colorDisabled[] = {0,0,0,0.4};
			x = 0.386562 * safezoneW + safezoneX;
			y = 0.54863 * safezoneH + safezoneY;
			w = 0.0928125 * safezoneW;
			h = 0.022 * safezoneH;
		};
		*/
		class preis_button: EMonkeys_RscButtonMenu
		{
			idc = 9009;
			text = "";
			colorBackground[] = {-1,-1,-1,-1};
			colorBackgroundFocused[] = {1,1,1,0.12};
			colorBackground2[] = {0.75,0.75,0.75,0.2};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,1};
			color2[] = {0,0,0,1};
			colorText[] = {1,1,1,1};
			colorDisabled[] = {0,0,0,0.4};
			x = 0.33125 * safezoneW + safezoneX;
			y = 0.591667 * safezoneH + safezoneY;
			w = 0.157239 * safezoneW;
			h = 0.0247778 * safezoneH;
		};
		
		class benzinlager_structuredText: EMonkeys_RscStructuredText
		{
			idc = 9010;
			text = "";
			x = 0.572186 * safezoneW + safezoneX;
			y = 0.401 * safezoneH + safezoneY;
			w = 0.0928125 * safezoneW;
			h = 0.022 * safezoneH;
		};
		
		class diesellager_structuredText: EMonkeys_RscStructuredText
		{
			idc = 9011;
			text = "";
			x = 0.572186 * safezoneW + safezoneX;
			y = 0.441296 * safezoneH + safezoneY;
			w = 0.0928125 * safezoneW;
			h = 0.022 * safezoneH;
		};
		
		class einkommen_structuredText: EMonkeys_RscStructuredText
		{
			idc = 9012;
			text = "";
			x = 0.572186 * safezoneW + safezoneX;
			y = 0.485296 * safezoneH + safezoneY;
			w = 0.0928125 * safezoneW;
			h = 0.022 * safezoneH;
		};
		
		class abbuchen_button: EMonkeys_RscButtonMenu
		{
			idc = 9013;
			text = "";
			colorBackground[] = {-1,-1,-1,-1};
			colorBackgroundFocused[] = {1,1,1,0.12};
			colorBackground2[] = {0.75,0.75,0.75,0.2};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,1};
			color2[] = {0,0,0,1};
			colorText[] = {1,1,1,1};
			colorDisabled[] = {0,0,0,0.4};
			x = 0.511979 * safezoneW + safezoneX;
			y = 0.591667 * safezoneH + safezoneY;
			w = 0.157344 * safezoneW;
			h = 0.0238519 * safezoneH;
		};
		/*
		class treibstoff_button: EMonkeys_RscButtonMenu
		{
			idc = 9014;
			text = "";
			colorBackground[] = {-1,-1,-1,-1};
			colorBackgroundFocused[] = {1,1,1,0.12};
			colorBackground2[] = {0.75,0.75,0.75,0.2};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,1};
			color2[] = {0,0,0,1};
			colorText[] = {1,1,1,1};
			colorDisabled[] = {0,0,0,0.4};
			onButtonClick = "closeDialog 0;";
			x = 0.511979 * safezoneW + safezoneX;
			y = 0.624075 * safezoneH + safezoneY;
			w = 0.157083 * safezoneW;
			h = 0.0247778 * safezoneH;
		};
		*/		
		class schliessen_button: EMonkeys_RscButtonMenu
		{
			idc = -1;
			text = "";
			colorBackground[] = {-1,-1,-1,-1};
			colorBackgroundFocused[] = {1,1,1,0.12};
			colorBackground2[] = {0.75,0.75,0.75,0.2};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,1};
			color2[] = {0,0,0,1};
			colorText[] = {1,1,1,1};
			colorDisabled[] = {0,0,0,0.4};
			onButtonClick = "closeDialog 0;";
			x = 0.322604 * safezoneW + safezoneX;
			y = 0.688852 * safezoneH + safezoneY;
			w = 0.0198958 * safezoneW;
			h = 0.0383333 * safezoneH;
		};
		
		class infotext: EMonkeys_RscStructuredText
		{
			idc = 9015;
			text = "";
			x = 0.331875 * safezoneW + safezoneX;
			y = 0.621 * safezoneH + safezoneY;
			w = 0.156875 * safezoneW;
			h = 0.0624074 * safezoneH;
		};
	};
};

class fuelstation_auction
{
	idd = 9000;
	name= "fuelstation_auction";
	movingEnable = false;
	enableSimulation = true;
	
	class controlsBackground 
	{
		class EMonkeys_RscTitleBackground: EMonkeys_RscPicture
		{
			text= "core\textures\menu_background\bg_fuelstationAuctionMenu.paa";
			idc = -1;
			x = 0.314316 * safezoneW + safezoneX;
			y = 0.125969 * safezoneH + safezoneY;
			w = 0.381684 * safezoneW;
			h = 0.726059 * safezoneH;
		};
	};

	class controls 
	{
		class fuelstations_listbox: emonkeys_RscListbox
		{
			idc = 9001;
			sizeEx = 0.035;
			colorText[] = {0,0,0,1};
			onLBSelChanged = "[0] call EMonkeys_fnc_endOfFuelstationAuction";
			x = 0.376211 * safezoneW + safezoneX;
			y = 0.342001 * safezoneH + safezoneY;
			w = 0.252161 * safezoneW;
			h = 0.341601 * safezoneH;
		};
		class fuelstationOffer_edit: emonkeys_RscEdit
		{
			idc = 9002;
			text = "";
			colorBackground[] = {-1,-1,-1,-1};
			colorBackgroundFocused[] = {1,1,1,0.12};
			colorBackground2[] = {0.75,0.75,0.75,0.2};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,1};
			color2[] = {0,0,0,1};
			colorText[] = {0,0,0,1};
			colorDisabled[] = {0,0,0,0.4};
			x = 0.374829 * safezoneW + safezoneX;
			y = 0.732484 * safezoneH + safezoneY;
			w = 0.16959 * safezoneW;
			h = 0.0269461 * safezoneH;
		};
		class setOffer_button: emonkeys_RscButtonMenu
		{
			idc = 9003;
			text = "";
			colorBackground[] = {-1,-1,-1,-1};
			colorBackgroundFocused[] = {1,1,1,0.12};
			colorBackground2[] = {0.75,0.75,0.75,0.2};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,1};
			color2[] = {0,0,0,1};
			colorText[] = {1,1,1,1};
			colorDisabled[] = {0,0,0,0.4};
			onButtonClick = "closeDialog 0; [] call emonkeys_fnc_fuelstationSetOffer;";
			x = 0.552067 * safezoneW + safezoneX;
			y = 0.732484 * safezoneH + safezoneY;
			w = 0.077774 * safezoneW;
			h = 0.0269902 * safezoneH;
		};
		class auctionEnt_text: emonkeys_RscStructuredText
		{
			idc = 9004;
			text = "";
			x = 0.374437 * safezoneW + safezoneX;
			y = 0.697168 * safezoneH + safezoneY;
			w = 0.255538 * safezoneW;
			h = 0.0279922 * safezoneH;
		};
		class close_button: emonkeys_RscPictureButton
		{
			idc = 9015;
			text = "core\textures\menu_icons\icon_close.paa";
			onButtonClick = "closeDialog 0;";
			x = 0.355579 * safezoneW + safezoneX;
			y = 0.213977 * safezoneH + safezoneY;
			w = 0.0257895 * safezoneW;
			h = 0.0440036 * safezoneH;
		};
	};
};