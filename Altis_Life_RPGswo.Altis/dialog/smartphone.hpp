class DWEV_my_smartphone {
	idd = 88888;
	name = "DWEV_my_telephone_menu";
	movingEnable = false;
	enableSimulation = true;
	onLoad = "[""main"",(side player)] spawn DWEV_fnc_tabletbutton; [] spawn DWEV_fnc_smartphone;";

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

// GElbe farbe hinter player list
		class PlayerListTitleBackground:DWEV_RscText {
//				colorBackground[] = {0.588, 0.424, 0.145, 1.0};
				colorBackground[] = {0.28,0.28,0.28,0.28};
				idc = -1;
				x = 0.07;
				y = 0.25;
				w = 0.15;
				h = 0.04;
			};
// GElbe farbe hinter	 von : nachricht:
		class MessageTitleBackground:DWEV_RscText {
//				colorBackground[] = {0.588, 0.424, 0.145, 1.0};
				colorBackground[] = {0.28,0.28,0.28,0.28};
				idc = -1;
				x = 0.225;
				y = 0.25;
				w = 0.70;
				h = 0.04;
			};
// GElbe farbe hinter	 nachricht zum lesen auswählen
		class RandomTitleBackground:DWEV_RscText {
//				colorBackground[] = {0.588, 0.424, 0.145, 1.0};
				colorBackground[] = {0.28,0.28,0.28,0.28};
				idc = -1;
				x = 0.225;
				y = 0.60;
				w = 0.70;
				h = 0.04;
			};
	};

	class controls {
// schriftzug 		von: nachricht:
		class MessageTitle : DWEV_RscTitle {
			colorBackground[] = {0, 0, 0, 0};
			idc = 88886;
			text = "";
			sizeEx = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.9)";
			x = 0.225;
			y = 0.25;
			w = 0.7;
			h = (1 / 25);
		};
// schriftzug 		nachricht zum lesen auswählen
		class RandomTitle : DWEV_RscTitle {
			colorBackground[] = {0, 0, 0, 0};
			idc = 88890;
			text = "Nachricht zum Lesen auswählen";
			sizeEx = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.9)";
			x = 0.225;
			y = 0.60;
			w = 0.7;
			h = (1 / 25);
		};
// spielerliste box
		class PlayerList : DWEV_RscListBox
		{
			idc = 88881;
			onLBSelChanged = "[2] spawn DWEV_fnc_smartphone;";
			sizeEx = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.7)";
			colorBackground[] = {0, 0, 0, 0};
			x = 0.07;
			y = 0.25 + (1 / 25);
			w = 0.15;
			h = 0.5;
		};
//unbekannt müsste nachrichten speicher sein
		class MessageList : DWEV_RscListNBox
		{
			idc = 88882;
			onLBSelChanged = "[(lbCurSel 88882)] call DWEV_fnc_showMsg;";
			//sizeEx = 0.04;
			sizeEx = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8)";
			colorBackground[] = {0, 0, 0, 0};
			columns[] = {0,0.3};
			x = 0.225;
			y = 0.25 + (1 / 25);
			w = 0.7;
			h = 0.3;
		};
//unbekannt müsste nachrichten inhalt sein
		class TextShow : DWEV_RscControlsGroup {
			x = 0.225;
			y =  0.64;
			w =  0.7;
			h =  0.15;
			class HScrollbar : HScrollbar {
				height = 0;
			};
			class controls {
				class showText : DWEV_RscStructuredText {
					idc = 88887;
					text = "";
					colorBackground[] = {0, 0, 0, 0};
//					colorBackground[] = {0.28,0.28,0.28,0.28};
					size = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8)";
					shadow = 0;
					x = 0;
					y = 0;
					w = 0.69;
					h = 1;
				};
			};
		};
//button nachrichten schreiben
		class Schreiben : DWEV_RscButtonMenu {
			idc = 887892;
			text = "Schreiben";
			onButtonClick = "[4] call DWEV_fnc_smartphone;";
//			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 1.0};
			colorBackground[] = {0, 0, 0, 0.7};
			x = 0.07;
			y = 0.80;
			w = 0.15;
			h = 0.04;
		};
/*
		class ctrl_grafik_Schreiben: DWEV_RscPicture
		{
			idc = 507035;
			style = 2096;
			text = "textures\Wolflogo\Tablet\icon_senden.paa";
			x = 0.270;
			y = 0.69;
			w = 0.075;
			h = 0.075;
		};

		class ctrl_button_Schreiben: DWEV_RscButtonInvisible
		{
			idc = 507036;
			text = "";
			tooltip = "Nachricht an den Spieler schicken";
			colorBackground[] = {0, 0, 0, 0};
			onButtonClick = "[4] call DWEV_fnc_smartphone;";
			x = 0.270;
			y = 0.69;
			w = 0.075;
			h = 0.075;
		};
*/
		class Taxi : DWEV_RscButtonMenu {
			idc = 887893;
			text = "TAXI RUFEN";
			onButtonClick = "[] call DWEV_fnc_callTaxi;";
//			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 1.0};
			colorBackground[] = {0, 0, 0, 0.7};
			x = 0.615;
			y = 0.80;
			w = 0.15;
			h = 0.04;
		};

		class Title : DWEV_RscTitle
		{
			colorBackground[] = {0, 0, 0, 0};
			idc = -1;
			text = "Smartphone";
			sizeEx = 0.1;
			style = 0x02;
			x = 0;
			y = 0.07;
			w = 1;
			h = 0.1;
		};
//Text spielerliste links
		class PlayerListTitle : DWEV_RscTitle {
			colorBackground[] = {0, 0, 0, 0};
			idc = -1;
			text = "Spielerliste";
			sizeEx = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.9)";
			x = 0.07;
			y = 0.25;
			w = 0.15;
			h = 0.04;
		};

		class Notruf : DWEV_RscButtonMenu {
			idc = -1;
			text = "Notruf";
			onButtonClick = "createDialog ""DWEV_smartphone_notruf"";";
			colorBackground[] = {0.584, 0.086, 0.086,0.7};
			x = 0.775;
			y = 0.80;
			w = 0.15;
			h = 0.04;
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
			tooltip = "Smartphone Schließen";
			colorBackground[] = {0, 0, 0, 0};
			onButtonClick = "closeDialog 0;[] call DWEV_fnc_p_updateMenu";
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

		class Suche : DWEV_RscText {
			idc = -1;
			text = "Suche nach:";
			x = 0.07;
			y = 0.85;
			w = 0.15;
			h = 0.04;
		};

		class SucheEdit : DWEV_RscEdit {
			idc = 88523;
			text = "";
			onKeyDown = "_this call DWEV_fnc_smartphoneSearch";
			x = 0.23;
			y = 0.85;
			w = 0.3;
			h = 0.04;
		};
	};

};

class DWEV_smartphone_schreiben
{
	idd = 88883;
	name = "DWEV_my_smartphone_schreiben";
	movingEnable = false;
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
	};
	class controls {

		class sendenTitle : DWEV_RscTitle
		{
			colorBackground[] = {0, 0, 0, 0};
			idc = -1;
			text = "Nachricht Senden";
			sizeEx = 0.1;
			style = 0x02;
			x = 0;
			y = 0.07;
			w = 1;
			h = 0.1;
		};

		class Title : DWEV_RscTitle
		{
			colorBackground[] = {0, 0, 0, 0};
			idc = 88886;
			text = "Nachricht an:";
			x = 0.20;
			y = 0.40;
			w = 0.95;
			h = 0.04;
		};

		class Absenden : DWEV_RscButtonMenu {
			idc = 88885;
			text = "Absenden";
			onButtonClick = "[1,-1,(ctrlText 88884)] call DWEV_fnc_newMsg;";
//			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 1.0};
			colorBackground[] = {0, 0, 0, 0.7};
			x = 0.64;
			y = 0.50;
			w = 0.15;
			h = 0.04;
		};

		class AdminMsg : DWEV_RscButtonMenu
		{
			idc = 888897;
			text = "Als Admin";
//			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 1.0};
			colorBackground[] = {0, 0, 0, 0.7};
			onButtonClick = "[5,-1,(ctrlText 88884)] call DWEV_fnc_newMsg;";
			x = 0.21;
			y = 0.50;
			w = 0.15;
			h = 0.04);
		};

		class textEdit : DWEV_RscEdit
		{
			idc = 88884;
			text = "";
			sizeEx = 0.030;
			x = 0.21;
			y = 0.45;
			w = 0.58;
			h = 0.03;
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
			tooltip = "Notruf schließen";
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

class DWEV_smartphone_notruf {
	idd = 887890;
	name= "DWEV_my_smartphone_notruf";
	movingEnable = false;
	enableSimulation = true;
	onLoad = "[""main"",(side player)] spawn DWEV_fnc_tabletbutton; [6] spawn DWEV_fnc_newMsg;";

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
	};

	class controls {

		class NotrufTitle : DWEV_RscTitle
		{
			colorBackground[] = {0, 0, 0, 0};
			idc = -1;
			text = "Notrufzentrale";
			sizeEx = 0.1;
			style = 0x02;
			x = 0;
			y = 0.07;
			w = 1;
			h = 0.1;
		};

		class Title : DWEV_RscTitle
		{
			colorBackground[] = {0, 0, 0, 0};
			idc = 888892;
			style = 0x02;
			text = "Missbrauch führt zu einem BAN!";
			x = 0;
			y = 0.25;
			w = 1;
			h = 0.04;
		};

		class textEdit : DWEV_RscEdit
		{
			idc = 888894;
			text = "";
			sizeEx = 0.030;
			x = 0.085;
			y = 0.45;
			w = 0.83;
			h = 0.03;
		};

		class TxtCopButton : DWEV_RscButtonMenu
		{
			idc = 888895;
			text = "110 Polizei";
			colorBackground[] = {0.129, 0.152, 0.450,1};
			onButtonClick = "[2,-1,(ctrlText 888894)] call DWEV_fnc_newMsg;";
			x = 0.085;
			y = 0.50;
			w = 0.2;
			h = 0.04;
		};

		class TxtCopButton1 : DWEV_RscButtonMenu
		{
			idc = 888893;
			text = "Polizei an Alle";
			colorBackground[] = {0.129, 0.152, 0.450,1};
			onButtonClick = "[9,-1,(ctrlText 888894)] call DWEV_fnc_newMsg;";
			x = 0.085;
			y = 0.50;
			w = 0.2;
			h = 0.04;
		};

		class TxtAdminButton : DWEV_RscButtonMenu
		{
			idc = 888896;
			text = "Adminphone";
			colorBackground[] = {0.022, 0.627, 0.022,1};
			onButtonClick = "[3,-1,(ctrlText 888894)] call DWEV_fnc_newMsg;";
			x = 0.715;
			y = 0.50;
			w = 0.2;
			h = 0.04;
		};


		class AdminMsgAll : DWEV_RscButtonMenu
		{
			idc = 888898;
			text = "Admin an Alle";
			colorBackground[] = {0.022, 0.627, 0.022,1};
			onButtonClick = "[7,-1,(ctrlText 888894)] call DWEV_fnc_newMsg;";
			x = 0.715;
			y = 0.50;
			w = 0.2;
			h = 0.04;
		};

		class EventMsgAll : DWEV_RscButtonMenu
		{
			idc = 888901;
			text = "Event an Alle";
			colorBackground[] = {0.576, 0.533, 0.074,1};
			onButtonClick = "[12,-1,(ctrlText 888894)] call DWEV_fnc_newMsg;";
			x = 0.715;
			y = 0.56;
			w = 0.2;
			h = 0.04;
		};

		class EMSReq : DWEV_RscButtonMenu
		{
			idc = 888899;
			text = "Feuerwehr";
			colorBackground[] = {0.988, 0, 0,1};
			onButtonClick = "[4,-1,(ctrlText 888894)] call DWEV_fnc_newMsg;";
			x = 0.295;
			y = 0.50;
			w = 0.2;
			h = 0.04;
		};

		class EMSReq1 : DWEV_RscButtonMenu
		{
			idc = 888891;
			text = "Feuer an Alle";
			colorBackground[] = {0.988, 0, 0,1};
			onButtonClick = "[8,-1,(ctrlText 888894)] call DWEV_fnc_newMsg;";
			x = 0.295;
			y = 0.50;
			w = 0.2;
			h = 0.04;
		};

		class opforReq : DWEV_RscButtonMenu
		{
			idc = 888890;
			text = "Sicherheitsdienst";
			colorBackground[] = {0.576, 0.533, 0.074,1};
			onButtonClick = "[10,-1,(ctrlText 888894)] call DWEV_fnc_newMsg;";
			x = 0.505;
			y = 0.50;
			w = 0.2;
			h = 0.04;
		};

		class opforReq1 : DWEV_RscButtonMenu
		{
			idc = 888889;
			text = "WSC an Alle";
			colorBackground[] = {0.576, 0.533, 0.074,1};
			onButtonClick = "[11,-1,(ctrlText 888894)] call DWEV_fnc_newMsg;";
			x = 0.505;
			y = 0.50;
			w = 0.2;
			h = 0.04;
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
			tooltip = "Notruf schließen";
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
