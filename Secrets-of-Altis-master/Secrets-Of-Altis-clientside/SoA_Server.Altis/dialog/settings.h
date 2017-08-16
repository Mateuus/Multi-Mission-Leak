class SettingsMenu
{
	idd = 2900;
	name = "SettingsMenu";
	movingEnabled = 1;
	enableSimulation = 1;
	
	class controlsBackground
	{
		class tabletbackground1: Life_RscPicture
		{
			idc = 3450;
			text = "#(argb,8,8,3)color(0.15,0.55,0.55,1)";
			x = -0.0875;
			y = 0;
			w = 1.175;
			h = 1;
		};
		
		class Tablet: Life_RscPicture 
		{
			idc = -1;
			text = "images\tablet\tablet.paa";
			x = -0.4125;
			y = -0.16;
			w = 1.825;
			h = 1.32;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,0.4};
		};

		class Titel : life_RscText
		{
			idc = -1;
			text = "Erweiterte Einstellungen"; 
			x = 0.0125;
			y = 0.02;
			w = 0.975;
			h = 0.08;
			colorBackground[] = {1,1,1,0.5};
		};
		
		class Chat : Life_RscText
		{
			idc = -1;
			text = "Chat ausblenden"; 
			x = 0.314375 * safezoneW + safezoneX;
			y = 0.313 * safezoneH + safezoneY;
			w = 0.108281 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {1,1,1,0.3};
		};
		
		class DetailSenken : Life_RscText
		{
			idc = -1;
			text = "Häuser ausblenden";
			x = 0.314375 * safezoneW + safezoneX;
			y = 0.357 * safezoneH + safezoneY;
			w = 0.108281 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {1,1,1,0.3};
		};
		
		class NamenAnzeigen : Life_RscText
		{
			idc = -1;
			text = "Namen anzeigen"; 
			x = 0.314375 * safezoneW + safezoneX;
			y = 0.401 * safezoneH + safezoneY;
			w = 0.108281 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {1,1,1,0.3};
		};
		
		class HUDchange: Life_RscText
		{
			idc = -1;
			text = "HUD auswählen"; 
			x = 0.510312 * safezoneW + safezoneX;
			y = 0.313 * safezoneH + safezoneY;
			w = 0.0721875 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {1,1,1,0.3};
		};
		
		class ringtonetext: Life_RscText
		{
			idc = -1;
			text = "Klingelton";
			x = 0.510312 * safezoneW + safezoneX;
			y = 0.357 * safezoneH + safezoneY;
			w = 0.0721875 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {1,1,1,0.3};
		};
	};
	
	class controls
	{
		class VDonFoot : life_RscText
		{
			idc = -1;
			text = "Zu Fuß"; 
			x = 0.314375 * safezoneW + safezoneX;
			y = 0.577 * safezoneH + safezoneY;
			w = 0.0721875 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {1,1,1,0.3};
		};
		
		class VDinCar : life_RscText
		{
			idc = -1;
			text = "Im Auto"; 
			x = 0.314375 * safezoneW + safezoneX;
			y = 0.621 * safezoneH + safezoneY;
			w = 0.0721875 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {1,1,1,0.3};
		};
		
		class VDinAir : life_RscText
		{
			idc = -1;
			text = "Im Helikopter"; 
			x = 0.314375 * safezoneW + safezoneX;
			y = 0.665 * safezoneH + safezoneY;
			w = 0.0721875 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {1,1,1,0.3};
		};
		
		class VD_onfoot_slider : life_RscXSliderH 
		{
			idc = 2901;
			text = "";
			onSliderPosChanged = "[0,_this select 1] call life_fnc_s_onSliderChange;";
			x = 0.407187 * safezoneW + safezoneX;
			y = 0.577 * safezoneH + safezoneY;
			w = 0.113437 * safezoneW;
			h = 0.022 * safezoneH;
			tooltip = "Sichtweite zu Fuß"; 
		};
		
		class VD_onfoot_value : life_RscText
		{
			idc = 2902;
			text = "";
			x = 0.530937 * safezoneW + safezoneX;
			y = 0.577 * safezoneH + safezoneY;
			w = 0.0309375 * safezoneW;
			h = 0.022 * safezoneH;
			colorText[] = {0,1,0,1};
			colorBackground[] = {0,0,0,0.3};
		};
		
		class VD_car_slider : life_RscXSliderH 
		{
			idc = 2911;
			text = "";
			onSliderPosChanged = "[1,_this select 1] call life_fnc_s_onSliderChange;";
			x = 0.407187 * safezoneW + safezoneX;
			y = 0.621 * safezoneH + safezoneY;
			w = 0.113437 * safezoneW;
			h = 0.022 * safezoneH;
			tooltip = "Sichtweite im Bodenfahrzeug"; 
		};
		
		class VD_car_value : life_RscText
		{
			idc = 2912;
			text = "";
			x = 0.530937 * safezoneW + safezoneX;
			y = 0.621 * safezoneH + safezoneY;
			w = 0.0309375 * safezoneW;
			h = 0.022 * safezoneH;
			colorText[] = {0,1,0,1};
			colorBackground[] = {0,0,0,0.3};
		};
		
		class VD_air_slider : life_RscXSliderH 
		{
			idc = 2921;
			text = "";
			onSliderPosChanged = "[2,_this select 1] call life_fnc_s_onSliderChange;";
			x = 0.407187 * safezoneW + safezoneX;
			y = 0.665 * safezoneH + safezoneY;
			w = 0.113437 * safezoneW;
			h = 0.022 * safezoneH;
			tooltip = "Sichtweite in der Luft"; 
		};
		
		class VD_air_value : life_RscText
		{
			idc = 2922;
			text = "";
			x = 0.530937 * safezoneW + safezoneX;
			y = 0.665 * safezoneH + safezoneY;
			w = 0.0309375 * safezoneW;
			h = 0.022 * safezoneH;
			colorText[] = {0,1,0,1};
			colorBackground[] = {0,0,0,0.3};
		};
		
		class ChatANAUS : Life_RscCheckbox2
		{
			idc = 2970;
			tooltip = "Blendet den Chat aus. Hilfreich für Streams und Youtube-Videos!";
			onCheckedChanged = "if(_this select 1 == 1) then {life_chat  = true;} else {life_chat  = false;}; [] call life_fnc_settingsMenu;";			
			x = 0.407187 * safezoneW + safezoneX;
			y = 0.313 * safezoneH + safezoneY;
			w = 0.0154688 * safezoneW;
			h = 0.022 * safezoneH;
		};
		
		class DetailANAUS : Life_RscCheckbox2
		{		
			idc = 2971;
			tooltip = "Dies blendet die Namen der eigenen Häuser auf der Karte aus!";
			onCheckedChanged = "if(_this select 1 == 1) then {life_detail  = true;} else {life_detail  = false;}; [] call life_fnc_settingsMenu;";
			x = 0.407187 * safezoneW + safezoneX;
			y = 0.357 * safezoneH + safezoneY;
			w = 0.0154688 * safezoneW;
			h = 0.022 * safezoneH;
		};
		
		class NameANAUS : Life_RscCheckbox2
		{
			idc = 2972;
			tooltip = "Gibt deinen Namen in Schlüssel-, Geld- und Itemvergabe frei!";
			onCheckedChanged = "if(_this select 1 == 1) then {life_name  = true;} else {life_name = false;}; [] call life_fnc_settingsMenu;";		
			x = 0.407187 * safezoneW + safezoneX;
			y = 0.401 * safezoneH + safezoneY;
			w = 0.0154688 * safezoneW;
			h = 0.022 * safezoneH;
		};
		
		class huddropdown: Life_RscCombo
		{
			idc = 2973;
			text = "";
			onLBSelChanged = "[] spawn life_fnc_hudchange";
			x = 0.5825 * safezoneW + safezoneX;
			y = 0.313 * safezoneH + safezoneY;
			w = 0.103125 * safezoneW;
			h = 0.022 * safezoneH;
		};
		
		class ringtone: Life_RscCombo
		{
			idc = 2974;
			text = "";
			onLBSelChanged = "[] spawn life_fnc_ringtone";
			x = 0.5825 * safezoneW + safezoneX;
			y = 0.357 * safezoneH + safezoneY;
			w = 0.103125 * safezoneW;
			h = 0.022 * safezoneH;
		};
		
		class ButtonCancel: Life_RscButtonMenu
		{
			idc = -1;
			OnButtonClick = "closedialog 0; closedialog 0;";
			tooltip = "Schließen";
			x = 0.464646;
			y = 1.02188;
			w = 0.05;
			h = 0.06;
			colorBackground[] = {-1,-1,-1,0};
			colorBackgroundFocused[] = {-1,-1,-1,0};
			colorBackground2[] = {-1,-1,-1,0};
			color[] = {1,1,1,0};
			colorFocused[] = {0,0,0,0};
			color2[] = {0,0,0,0};
			colorText[] = {1,1,1,1};
			colorDisabled[] = {0,0,0,0};
		};
		
		class ButtonReturn: ButtonCancel
		{
			idc = -1;
			OnButtonClick = "closedialog 0;";
			tooltip = "Zurück";
			x = 0.54798;
			y = 1.02188;
			w = 0.05;
			h = 0.06;
		};
		
		class ButtonOhrstoepsel: ButtonCancel
		{
			idc = -1;
			OnButtonClick = "[] spawn life_fnc_fadeSound;";
			tooltip = "Ohrstöpsel verwenden";
			x = 0.616162;
			y = 1.02188;
			w = 0.05;
			h = 0.06;
		};
		
		class ButtonHome: ButtonCancel
		{
			idc = -1;
			OnButtonClick = "[0] spawn life_fnc_closedialog;";
			tooltip = "Home";
			x = 0.311364;
			y = 1.02674;
			w = 0.05;
			h = 0.06;
		};
		
		class ButtonInventory: ButtonCancel
		{
			idc = -1;
			OnButtonClick = "[] call life_fnc_inventory;";
			tooltip = "Inventar";
			x = 0.386364;
			y = 1.02357;
			w = 0.05;
			h = 0.06;
		};
	};
};