class DWEV_my_fwzentral {
	idd = 88888;
	name = "DWEV_my_telephone_menu";
	movingEnable = false;
	enableSimulation = true;
	onLoad = "[""main"",(side player)] spawn DWEV_fnc_tabletbutton; [] spawn DWEV_fnc_fwzentral;";

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

		class MessageTitlebeforeBackground:DWEV_RscText {
				colorBackground[] = {0.28,0.28,0.28,0.28};
				idc = -1;
				x = 0.07;
				y = 0.25;
				w = 0.20;
				h = 0.04;
			};

		class MessageTitleBackground:DWEV_RscText {
				colorBackground[] = {0.28,0.28,0.28,0.28};
				idc = -1;
				x = 0.28;
				y = 0.25;
				w = 0.65;
				h = 0.04;
			};

		class RandomTitleBackground:DWEV_RscText {
				colorBackground[] = {0.28,0.28,0.28,0.28};
				idc = -1;
				x = 0.07;
				y = 0.60;
				w = 0.86;
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
			x = 0.07;
			y = 0.25;
			w = 0.86;
			h = (1 / 25);
		};
// schriftzug 		nachricht zum lesen auswählen
		class RandomTitle : DWEV_RscTitle {
			colorBackground[] = {0, 0, 0, 0};
			idc = 88890;
			text = "Nachricht zum Lesen auswählen";
			sizeEx = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.9)";
			x = 0.07;
			y = 0.60;
			w = 0.86;
			h = (1 / 25);
		};
//nachrichten speicher sein
		class MessageList : DWEV_RscListNBox
		{
			idc = 88882;
			onLBSelChanged = "[(lbCurSel 88882)] call DWEV_fnc_showfwz;[2] spawn DWEV_fnc_fwzentral;";
			sizeEx = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.9)";
			colorBackground[] = {0, 0, 0, 0};
			columns[] = {0,0.27,0.70};
			x = 0.07;
			y = 0.25 + (1 / 25);
      w = 0.86;
			h = 0.3;
		};
//nachrichten inhalt sein
		class TextShow : DWEV_RscControlsGroup {
      /*
        TODO: Location Anzeigen (zb "In der Nähe von Kupferverarbeitung")
        Prio: LOW
       */
			x = 0.07;
			y =  0.64;
			w =  0.86;
			h =  0.15;
			class HScrollbar : HScrollbar {
				height = 0;
			};
			class controls {
				class showText : DWEV_RscStructuredText {
					idc = 88887;
					text = "";
					colorBackground[] = {0, 0, 0, 0};
					size = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.9)";
					shadow = 0;
					x = 0;
					y = 0;
					w = 0.86;
					h = 1;
				};
			};
		};
//button Einsatz Verwalten schreiben
		class Schreiben : DWEV_RscButtonMenu {
			idc = 887892;
			text = "Einsatz Verwalten";
			onButtonClick = "[3] call DWEV_fnc_fwzentral;";
   		colorBackground[] = {0, 0, 0, 0.7};
			x = 0.07;
			y = 0.80;
			w = 0.25;
			h = 0.08;
		};

		class Title : DWEV_RscTitle
		{
			colorBackground[] = {0, 0, 0, 0};
			idc = -1;
			text = "Einsatzzentrale";
			sizeEx = 0.1;
			style = 0x02;
			x = 0;
			y = 0.07;
			w = 1;
			h = 0.1;
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
	};

};

class DWEV_my_fwzentral_edit
{
  /*
    NOTE

    "MarkerOne" setMarkerPos [200,100]
    "MarkerOne" setMarkerColor "ColorBlack";
    "Marker1" setMarkerShape "RECTANGLE";
    "Marker1" setMarkerText "You are here.";

    deleteMarker "Marker1"

    _pos = getMarkerPos "MarkerOne"

  */

	idd = 88883;
	name = "DWEV_my_fwzentral_edit";
	movingEnable = false;
	enableSimulation = true;
	onLoad = "[""main"",(side player)] spawn DWEV_fnc_tabletbutton; [] spawn DWEV_fnc_fwedit;";


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
			text = "Einsatz Verwalten";
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
			x = 0.10;
			y = 0.25;
			w = 0.95;
			h = 0.04;
		};

    class Typ : DWEV_RscTitle
		{
			colorBackground[] = {0, 0, 0, 0};
			idc = 88887;
			text = "Typ: Unbekannt";
			x = 0.10;
			y = 0.30;
			w = 0.95;
			h = 0.04;
		};

		class Status : DWEV_RscTitle
		{
			colorBackground[] = {0, 0, 0, 0};
			idc = 88899;
			text = "Status: Unbekannt";
			x = 0.10;
			y = 0.35;
			w = 0.95;
			h = 0.04;
		};

		class MessageTitle : DWEV_RscTitle
		{
			colorBackground[] = {0, 0, 0, 0};
			idc = 88891;
			text = "Meldung:";
			x = 0.10;
			y = 0.40;
			w = 0.95;
			h = 0.04;
		};

		class MessageShow : DWEV_RscControlsGroup {
			x = 0.10;
			y =  0.45;
			w =  0.5;
			h =  0.15;
			class HScrollbar : HScrollbar {
				height = 0;
			};
			class controls {
				class showText : DWEV_RscStructuredText {
					idc = 88889;
					text = "";
					colorBackground[] = {0, 0, 0, 0};
					size = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.9)";
					shadow = 0;
					x = 0;
					y = 0;
					w = 0.86;
					h = 1;
				};
			};
		};


		class Schreiben : DWEV_RscButtonMenu {
					idc = 897918;
					text = "Antworten";
					onButtonClick = "[4] call DWEV_fnc_smartphone;";
		   		colorBackground[] = {0, 0, 0, 0.7};
					x = 0.1;
					y = 0.65;
					w = 0.25;
					h = 0.08;
		};

		class StatusTitle : DWEV_RscTitle
		{
			colorBackground[] = {0, 0, 0, 0};
			idc = 889999;
			text = "Einsatzstatus Ändern";
			x = 0.080;
			y = 0.80;
			w = 0.95;
			h = 0.04;
		};

		//Button Status
		//in bearbeitung
		class InArbeitButton : DWEV_RscButtonMenu
		{
				idc = 888890;
				text = "Übernehmen";
				colorBackground[] = {0.882, 0.560, 0.050,1};
				onButtonClick = "[1] call DWEV_fnc_ezstatus;";
				x = 0.085;
				y = 0.85;
				w = 0.16;
				h = 0.04;
			};
		//Fertig
		class AbgeschlossenButton : DWEV_RscButtonMenu
			{
				idc = 888891;
				text = "Beendet";
				colorBackground[] = {0.022, 0.627, 0.022,1};
				onButtonClick = "[2] call DWEV_fnc_ezstatus;";
				x = 0.255;
				y = 0.85;
				w = 0.16;
				h = 0.04;
			};
		//ablehnen
		class AblehnenButton : DWEV_RscButtonMenu
			{
				idc = 888892;
				text = "Abgelehnt";
				colorBackground[] = {0.988, 0, 0,1};
				onButtonClick = "[3] call DWEV_fnc_ezstatus;";
				x = 0.425;
				y = 0.85;
				w = 0.16;
				h = 0.04;
			};

		class MedicList : DWEV_RscListBox
		{
			idc = 88888;
			sizeEx = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.7)";
			colorBackground[] = {0, 0, 0, 0};
			x = 0.7;
			y = 0.25;
			w = 0.2;
			h = 0.4;
		};

		class assignmedicButton : DWEV_RscButtonMenu
		{
			idc = 888895;
			text = "Mitarbeiter Zuweisen";
			colorBackground[] = {0.129, 0.152, 0.450,1};
			onButtonClick = "[4] call DWEV_fnc_ezstatus;";
			x = 0.715;
			y = 0.60;
			w = 0.2;
			h = 0.08;
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

/*class DWEV_smartphone_notruf {
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
};*/
