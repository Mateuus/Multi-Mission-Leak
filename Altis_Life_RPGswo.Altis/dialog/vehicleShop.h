#include "..\macros.hpp"
/*
	File: vehicleShop.h
	Author: www.Division-Wolf.de
	
	Description:
	New Vehicle Shop
*/

class DWEV_Vehicle_Shop_v2
{
	idd = IDC_FAHRZEUGSHOP_MAIN;
	name="DWEV_vehicle_shop";
	movingEnabled = 0;
	enableSimulation = 1;
	onLoad = "ctrlShow [2330,false];";

	class controlsBackground {
		class IGUIBack_2200: DWEV_RscText
		{
			idc = -1;
			x = safezoneX + 0.80 * safezoneW;
			y = safezoneY + 0.125 * safezoneH;
			w = safezoneW * 0.197;
			h = safezoneH * 0.75;
			colorBackground[] = {1,1,1,0.4};
		};
	
		class headerleiste: DWEV_RscStructuredText
		{
			idc = -1;
			text = "<t align='center' color='#000000'>Division-Wolf Shop</t>";
			x = safezoneX + 0.80 * safezoneW;
			y = safezoneY + 0.125 * safezoneH;
			w = safezoneW * 0.197;
			h = safezoneH * 0.035;
			colorBackground[] = {1,0.733,0,1};
			colorText[] = {0,0,0,1};
		};
	
		class fahrzeugtypen_name: DWEV_RscText
		{
			idc = -1;
			text = "Fahrzeug Typ";
			x = safezoneX + 0.802 * safezoneW;
			y = safezoneY + 0.322 * safezoneH;
			w = safezoneW * 0.197;
			h = safezoneH * 0.035;
			colorText[] = { 0, 0, 0, 1 };
		};
			
		class dropdown_fahrzeugtypen: DWEV_RscCombo
		{
			idc = IDC_FAHRZEUGSHOP_DROPDOWN_FAHRZEUGTYPEN;
			onLBSelChanged = "_this call DWEV_fnc_vehicleShopLBChange";
			x = safezoneX + 0.803 * safezoneW;
			y = safezoneY + 0.360 * safezoneH;
			w = safezoneW * 0.15;
			h = safezoneH * 0.021;
			colorText[] = { 0, 0, 0, 1 };
			colorBackground[] = {1,1,1,0.7};
		};
		
		class Fahrzeug_lackierungen: DWEV_RscText
		{
			idc = -1;
			text = "Lackierung";
			x = safezoneX + 0.802 * safezoneW;
			y = safezoneY + 0.388 * safezoneH;
			w = safezoneW * 0.197;
			h = safezoneH * 0.035;
			colorText[] = { 0, 0, 0, 1 };
		};
		
		class dropdown_lackierungen: DWEV_RscCombo
		{
			idc = IDC_FAHRZEUGSHOP_DROPDOWN_LACKIERUNGEN;
			onLBSelChanged = "_this call DWEV_fnc_vehicleShopLBColorChange";
			x = safezoneX + 0.803 * safezoneW;
			y = safezoneY + 0.426 * safezoneH;
			w = safezoneW * 0.15;
			h = safezoneH * 0.021;
			colorText[] = { 0, 0, 0, 1 };
			colorBackground[] = {1,1,1,0.7};
		};
		
		class vehicleinformationen_listbox: DWEV_RscStructuredText
		{
			idc = IDC_FAHRZEUGSHOP_VEHICLEINFORMATIONEN_LISTBOX;
			text = "";	
			x = safezoneX + 0.805 * safezoneW;
			y = safezoneY + 0.480 * safezoneH;
			w = safezoneW * 0.185;
			h = safezoneH * 0.31;
			colorBackground[] = {1,1,1,0.3};
		};
	};

	class controls {
		class ctrl_grafik_logo: DWEV_RscPicture
		{
			idc = 507007;
			style = 2096;
			text = "textures\Wolflogo\intro_logo.paa";
			x = safezoneX + 0.81 * safezoneW;
			y = safezoneY + 0.145 * safezoneH;
			w = safezoneW * 0.180;
			h = safezoneH * 0.180;
		};
	
		class ctrl_grafik_kaufen: DWEV_RscPicture
		{
			idc = 507009;
			style = 2096;
			text = "textures\Wolflogo\Tablet\icon_carKauf.paa";
			x = safezoneX + 0.81 * safezoneW;
			y = safezoneY + 0.81 * safezoneH;
			w = safezoneW * 0.041;
			h = safezoneH * 0.041;
		};
		
		class ctrl_button_kaufen: DWEV_RscButtonInvisible
		{
			idc = IDC_FAHRZEUGSHOP_BUTTON_KAUFEN;
			text = "";
			tooltip = "Fahrzeug Kaufen";
			colorBackground[] = {0, 0, 0, 0};
			onButtonClick = "[true] spawn DWEV_fnc_vehicleShopBuy;";
			x = safezoneX + 0.81 * safezoneW;
			y = safezoneY + 0.81 * safezoneH;
			w = safezoneW * 0.041;
			h = safezoneH * 0.041;
		};
		
		class ctrl_grafik_mieten: DWEV_RscPicture
		{
			idc = 507007;
			style = 2096;
			text = "textures\Wolflogo\Tablet\icon_carVK.paa";
			x = safezoneX + 0.945 * safezoneW;
			y = safezoneY + 0.81 * safezoneH;
			w = safezoneW * 0.041;
			h = safezoneH * 0.041;
		};
		
		class ctrl_button_mieten: DWEV_RscButtonInvisible
		{
			idc = IDC_FAHRZEUGSHOP_BUTTON_MIETEN;
			text = "";
			tooltip = "Fahrzeug mieten";
			colorBackground[] = {0, 0, 0, 0};
			onButtonClick = "[false] spawn DWEV_fnc_vehicleShopBuy;";
			x = safezoneX + 0.945 * safezoneW;
			y = safezoneY + 0.81 * safezoneH;
			w = safezoneW * 0.041;
			h = safezoneH * 0.041;
		};
		
		class ctrl_icon_grafik_schliessen: DWEV_RscPicture
		{
			idc = 507001;
			style = 2096;
			text = "textures\Wolflogo\Tablet\icon_schliessen.paa";
			x = safezoneX + 0.97 * safezoneW;
			y = safezoneY + 0.128 * safezoneH;
			w = safezoneW * 0.03;
			h = safezoneH * 0.03;
		};
		
		class ctrl_icon_button_schliessen: DWEV_RscButtonInvisible
		{
			idc = 507002;
			text = "";
			tooltip = "Shop Schließen";
			colorBackground[] = {0, 0, 0, 0};
			onButtonClick = "closeDialog 0;DWEV_veh_shop = NIL;";
			x = safezoneX + 0.97 * safezoneW;
			y = safezoneY + 0.128 * safezoneH;
			w = safezoneW * 0.03;
			h = safezoneH * 0.03;
		};		
	};
};
