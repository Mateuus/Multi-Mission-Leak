#include "player_sys.sqf"

class playerSettings {

	idd = playersys_DIALOG;
	movingEnable = true;
	enableSimulation = true;
	onLoad = "[""main"",(side player)] spawn DWEV_fnc_tabletbutton;";
	class controlsBackground {
		
	class wolftablet: DWEV_RscPicture
		{
			idc = 505000;
			text = "";
			x = 0;
			y = 0;
			w = 1;
			h = 1;
		};
		
	class invTitle : DWEV_RscTitle
		{
			colorBackground[] = {0, 0, 0, 0};
			idc = -1;
			text = "Inventar";
			sizeEx = 0.1;
			style = 0x02;
			x = 0;
			y = 0.07;
			w = 1;
			h = 0.1;		
		};
		
		class Title : DWEV_RscTitle {
			colorBackground[] = {0, 0, 0, 0};
			idc = -1;
			text = "";
			x = 0.1;
			y = 0.15;
			w = 0.8;
			h = 0.04;
		};
		
		class moneyStatusInfo : DWEV_RscStructuredText
		{
			idc = 2015;
			sizeEx = 0.020;
			text = "";
			x = 0.105;
			y = 0.25;
			w = 0.3;
			h = 0.6;
		};
		
		class PlayersName : Title {
			idc = carry_weight;
			style = 1;
			text = "";
		};
	};
	
	class controls {
		
		class itemHeader : DWEV_RscText
		{
			idc = -1;
			colorBackground[] = {0, 0, 0, 0};
			text = "Gegenstände";
			sizeEx = 0.04;
			
			x = 0.69;
			y = 0.21;
			w = 0.275;
			h = 0.04;
		};
		
		class moneySHeader : DWEV_RscText
		{
			idc = -1;
			colorBackground[] = {0, 0, 0, 0};
			text = "Bankstatus";
			sizeEx = 0.04;
			
			x = 0.15;
			y = 0.21;
			w = 0.219;
			h = 0.04;
		};
	
		class itemList : DWEV_RscListBox 
		{
			idc = item_list;
			sizeEx = 0.030;
			colorBackground[] = {0, 0, 0, 0};
			x = 0.62;
			y = 0.25;
			w = 0.275;
			h = 0.3;
		};
		
		class moneyEdit : DWEV_RscEdit 
		{
			idc = 2018;
			text = "1";
			sizeEx = 0.030;
			colorBackground[] = {0, 0, 0, 0.7};
			x = 0.12;
			y = 0.37;
			w = 0.18;
			h = 0.03;
		};
		
		class NearPlayers : DWEV_RscCombo 
		{
			idc = 2022;
			colorBackground[] = {0, 0, 0, 0.5};
			x = 0.12;
			y = 0.41;
			w = 0.18;
			h = 0.03;
		};
	
		class ctrl_grafik_geldgeben: DWEV_RscPicture
		{
			idc = 507005;
			style = 2096;
			text = "textures\Wolflogo\Tablet\icon_geben.paa";
			x = 0.1725;
			y = 0.48;
			w = 0.075;
			h = 0.075;
		};
		
		class ctrl_button_geldgeben: DWEV_RscButtonInvisible
		{
			idc = 2001;
			text = "";
			tooltip = "Geld an Spieler geben.";
			colorBackground[] = {0, 0, 0, 0};
			onButtonClick = "[] call DWEV_fnc_giveMoney";
			x = 0.1725;
			y = 0.48;
			w = 0.075;
			h = 0.075;
		};
		
		class itemEdit : DWEV_RscEdit {
		
		idc = item_edit;
		
		text = "1";
		sizeEx = 0.030;
		colorBackground[] = {0, 0, 0, 0.7};
		x = 0.62;
		y = 0.56;
		w = 0.275;
		h = 0.03;
		
		};
		class iNearPlayers : DWEV_RscCombo
		{
			idc = 2023;
			colorBackground[] = {0, 0, 0, 0.5};
			x = 0.62;
			y = 0.60;
			w = 0.275;
			h = 0.03;
		};
		
		class ctrl_grafik_GebenButton: DWEV_RscPicture
		{
			idc = 507005;
			style = 2096;
			text = "textures\Wolflogo\Tablet\icon_geben.paa";
			x = 0.820;
			y = 0.65;
			w = 0.075;
			h = 0.075;
		};
		
		class ctrl_button_GebenButton: DWEV_RscButtonInvisible
		{
			idc = 2002;
			text = "";
			tooltip = "Gegenstand an Spieler geben.";
			colorBackground[] = {0, 0, 0, 0};
			onButtonClick = "[] call DWEV_fnc_giveItem;";
			x = 0.820;
			y = 0.65;
			w = 0.075;
			h = 0.075;
		};
		
		class ctrl_grafik_usebutton: DWEV_RscPicture
		{
			idc = 507005;
			style = 2096;
			text = "textures\Wolflogo\Tablet\icon_ok.paa";
			x = 0.720;
			y = 0.65;
			w = 0.075;
			h = 0.075;
		};
		
		class ctrl_button_usebutton: DWEV_RscButtonInvisible
		{
			idc = 507006;
			text = "";
			tooltip = "Gegenstand benutzen.";
			colorBackground[] = {0, 0, 0, 0};
			onButtonClick = "[] call DWEV_fnc_useItem;";
			x = 0.720;
			y = 0.65;
			w = 0.075;
			h = 0.075;
		};	
		
		class ctrl_grafik_RemoveButton: DWEV_RscPicture
		{
			idc = 507005;
			style = 2096;
			text = "textures\Wolflogo\Tablet\icon_wegwerfen.paa";
			x = 0.620;
			y = 0.65;
			w = 0.075;
			h = 0.075;
		};
		
		class ctrl_button_RemoveButton: DWEV_RscButtonInvisible
		{
			idc = 507006;
			text = "";
			tooltip = "Gegenstand löschen.";
			colorBackground[] = {0, 0, 0, 0};
			onButtonClick = "[] call DWEV_fnc_removeItem;";
			x = 0.620;
			y = 0.65;
			w = 0.075;
			h = 0.075;
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
			tooltip = "Inventar schließen";
			colorBackground[] = {0, 0, 0, 0};
			onButtonClick = "closeDialog 0;";
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

class playerSettings_lizenzen {

	idd = playersys_DIALOG;
	movingEnable = true;
	enableSimulation = true;
	onLoad = "[""main"",(side player)] spawn DWEV_fnc_tabletbutton;";
	
	class controlsBackground {

		class wolftablet: DWEV_RscPicture
		{
			idc = 505000;
			text = "";
			x = 0;
			y = 0;
			w = 1;
			h = 1;
		};
		
		class Title : DWEV_RscTitle
		{
			colorBackground[] = {0, 0, 0, 0};
			idc = -1;
			text = "Lizenzen";
			sizeEx = 0.1;
			style = 0x02;
			x = 0;
			y = 0.07;
			w = 1;
			h = 0.1;		
		};
	};
	
	class controls {	
		class Licenses_Menu : DWEV_RscControlsGroup
		{
			idc = -1;
			x = 0.31;
			y = 0.30;
			w = 0.38;
			h = 0.48;
			
			class Controls
			{
				class DWEV_Licenses : DWEV_RscStructuredText
				{
					idc = 2014;
					text = "";
					x = 0;
					y = 0;
					w = 0.37;
					h = 2.7;
				};
			};
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
			tooltip = "Lizenzen schließen";
			colorBackground[] = {0, 0, 0, 0};
			onButtonClick = "closeDialog 0;";
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