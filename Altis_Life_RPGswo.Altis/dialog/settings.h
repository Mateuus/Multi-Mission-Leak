class SettingsMenu
{
	idd = 2900;
	name = "SettingsMenu";
	movingEnabled = 1;
	enableSimulation = 1;
	onLoad = "[""main"",(side player)] spawn DWEV_fnc_tabletbutton;";

	class controlsBackground
	{
		class wolftablet: DWEV_RscPicture
		{
			idc = 505000;
			text = "";
			x = 0;
			y = 0;
			w = 1;
			h = 1;
		};

		class PlayerTagsHeader : DWEV_RscText
		{
			idc = -1;
			text = "Spielernamen";
			style = 0x02;
			x = 0;
			y = 0.43;
			w = 1;
			h = 0.04;
		};

		class SideChatHeader : PlayerTagsHeader
		{
			idc = -1;
			text = "Sidechat";
			shadow = 0;
			y = 0.48;
		};

		class RevealNearestHeader : PlayerTagsHeader
		{
			idc = -1;
			text = "Gegenstände in der nähe zeigen";
			y = 0.53;
		};

		class SkipIntroHeader : PlayerTagsHeader
		{
			idc = -1;
			text = "Intro überspringen";
			y = 0.58;
		};

		class ShowLogoHeader : PlayerTagsHeader
		{
			idc = -1;
			text = "Zeige DW Logo";
			y = 0.63;
		};

		class HideHUDHeader : PlayerTagsHeader
		{
			idc = -1;
			text = "HUD Deaktivieren";
			y = 0.68;
		};

		class ExtendedHUDHeader : PlayerTagsHeader
		{
			idc = -1;
			text = "Erweitertes HUD";
			y = 0.73;
		};

		class Title : DWEV_RscTitle
		{
			colorBackground[] = {0, 0, 0, 0};
			idc = -1;
			text = "Einstellungen";
			sizeEx = 0.1;
			style = 0x02;
			x = 0;
			y = 0.07;
			w = 1;
			h = 0.1;
		};
	};

	class controls
	{
		class VDonFoot : DWEV_RscText
		{
			idc = -1;
			text = "Zu Fuss";

			x = 0.28;
			y = 0.258;
			w = 0.275;
			h = 0.04;
		};

		class VDinCar : DWEV_RscText
		{
			idc = -1;
			text = "Im Auto";

			x = 0.28;
			y = 0.305;
			w = 0.275;
			h = 0.04;
		};

		class VDinAir : DWEV_RscText
		{
			idc = -1;
			text = "Im Heli";

			x = 0.28;
			y = 0.355;
			w = 0.275;
			h = 0.04;
		};

		class VD_onfoot_slider : DWEV_RscXSliderH
		{
			idc = 2901;
			text = "";
			onSliderPosChanged = "[0,_this select 1] call DWEV_fnc_s_onSliderChange;";
			tooltip = "Sichtweite zu Fuß";
			x = 0.38;
			y = 0.26;
			w = "9 * 			(			((safezoneW / safezoneH) min 1.2) / 40)";
			h = "1 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};

		class VD_onfoot_value : DWEV_RscText
		{
			idc = 2902;
			text = "";

			x = 0.66;
			y = 0.258;
			w = 0.275;
			h = 0.04;
		};

		class VD_car_slider : DWEV_RscXSliderH
		{
			idc = 2911;
			text = "";
			onSliderPosChanged = "[1,_this select 1] call DWEV_fnc_s_onSliderChange;";
			tooltip = "Sichtweite im PKW/LKW";
			x = 0.38;
			y = 0.31;
			w = "9 * 			(			((safezoneW / safezoneH) min 1.2) / 40)";
			h = "1 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};

		class VD_car_value : DWEV_RscText
		{
			idc = 2912;
			text = "";

			x = 0.66;
			y = 0.31;
			w = 0.275;
			h = 0.04;
		};

		class VD_air_slider : DWEV_RscXSliderH
		{
			idc = 2921;
			text = "";
			onSliderPosChanged = "[2,_this select 1] call DWEV_fnc_s_onSliderChange;";
			tooltip = "Sichtweite im Helikopter";
			x = 0.38;
			y = 0.36;
			w = "9 * 			(			((safezoneW / safezoneH) min 1.2) / 40)";
			h = "1 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};

		class VD_air_value : DWEV_RscText
		{
			idc = 2922;
			text = "";

			x = 0.66;
			y = 0.36;
			w = 0.275;
			h = 0.04;
		};

		class PlayerTagsONOFF : DWEV_RscActiveText
		{
			text = "AN";
			tooltip = "Zeigt die Spieler namen über den köpfen an";
			idc = 2970;
			sizeEx = 0.04;
			x = 0.68;
			y = 0.43;
			w = 0.275;
		};

		class SideChatONOFF : PlayerTagsONOFF
		{
			idc = 2971;
			tooltip = "";
			action = "[] call DWF_fnc_sidechat;";
			y = 0.48;
		};

		class RevealONOFF : PlayerTagsONOFF
		{
			tooltip = "Zeigt automatisch Gegenstände innerhalb von 15m. Deaktiviere es, wenn du Leistungsprobleme hast..";
			idc = 2972;
			y = 0.53;
		};

		class skipIntroONOFF : PlayerTagsONOFF
		{
			idc = 2973;
			tooltip = "Intro abspielen";
			y = 0.58;
		};

		class showLogoONOFF : PlayerTagsONOFF
		{
			idc = 2974;
			tooltip = "Zeige das Division Wolf Logo oben Links in der Ecke";
			y = 0.63;
		};

		class hideHudONOFF : PlayerTagsONOFF
		{
			idc = 2975;
			tooltip = "Schaltet das HUD ab (für Screenshots etc.)";
			y = 0.68;
		};

		class ExtendedHudONOFF : PlayerTagsONOFF
		{
			idc = 2976;
			tooltip = "Aktiviert des Erweiterte HUD und Zeig mehr Informationen an";
			y = 0.73;
		};

		class ctrl_icon_grafik_schliessen: DWEV_RscPicture
		{
			idc = 507001;
			style = 2096;
			text = "textures\Wolflogo\Tablet\icon_schliessen.paa";
			x = 0.87;
			y = 0.075;
			w = 0.05;
			h = 0.05;
		};

		class ctrl_icon_button_schliessen: DWEV_RscButtonInvisible
		{
			idc = 507002;
			text = "";
			tooltip = "Einstellungen schließen";
			colorBackground[] = {0, 0, 0, 0};
			onButtonClick = "closeDialog 0; call SOCK_fnc_saveSettings;";
			x = 0.87;
			y = 0.075;
			w = 0.05;
			h = 0.05;
		};

		class ctrl_icon_grafik_shutdown: DWEV_RscPicture
		{
			idc = 507003;
			style = 2096;
			text = "textures\Wolflogo\Tablet\icon_shutdown.paa";
			x = 0.05;
			y = 0.012;
			w = 0.04;
			h = 0.04;
		};

		class ctrl_icon_button_shutdown: DWEV_RscButtonInvisible
		{
			idc = 507004;
			text = "";
			tooltip = "Tablet kann nicht ausgeschaltet werden, solange ein Programm läuft";
			colorBackground[] = {0, 0, 0, 0};
			onButtonClick = "";
			x = 0.05;
			y = 0.012;
			w = 0.04;
			h = 0.04;
		};

	};
};
