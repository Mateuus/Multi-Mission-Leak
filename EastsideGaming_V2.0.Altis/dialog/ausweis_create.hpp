class esg_ausweis_create {
    idd = 2777;
    name= "esg_ausweis_create";
    movingEnable = 0;
    enableSimulation = 1;

    class controlsBackground {
				class riffel: life_RscPicture
				{
					idc = -1;
					text = "a3\ui_f\data\IGUI\RscTitles\SplashArma3\arma3_splashNoise_ca.paa";
					x = -0.000156274 * safezoneW + safezoneX;
					y = -0.00599999 * safezoneH + safezoneY;
					w = 1.00547 * safezoneW;
					h = 1.012 * safezoneH;
				};
				class header_bg: life_RscText
				{
					idc = -1;
					x = 0.237031 * safezoneW + safezoneX;
					y = 0.192 * safezoneH + safezoneY;
					w = 0.53625 * safezoneW;
					h = 0.044 * safezoneH;
					colorBackground[] = {0.753,0.145,0.145,1};
				};
				class header: life_RscStructuredText
				{
					idc = -1;
					text = "<t align='center' size='2' font='puristaBold'>Ausweis beantragen</t>"; //--- ToDo: Localize;
					x = 0.237031 * safezoneW + safezoneX;
					y = 0.192 * safezoneH + safezoneY;
					w = 0.53625 * safezoneW;
					h = 0.044 * safezoneH;
					colorBackground[] = {-1,-1,-1,0};
				};
				class bg: life_RscText
				{
					idc = -1;
					x = 0.237031 * safezoneW + safezoneX;
					y = 0.247 * safezoneH + safezoneY;
					w = 0.53625 * safezoneW;
					h = 0.528 * safezoneH;
					colorBackground[] = {0.149,0.149,0.149,1};
				};
				class bg_unten: life_RscText
				{
					idc = -1;
					x = 0.237031 * safezoneW + safezoneX;
					y = 0.764 * safezoneH + safezoneY;
					w = 0.53625 * safezoneW;
					h = 0.011 * safezoneH;
					colorBackground[] = {0.753,0.145,0.145,1};
				};
		};

		class controls {
				class namen_head: life_RscText
				{
					idc = -1;
					text = "Name:"; //--- ToDo: Localize;
					x = 0.242187 * safezoneW + safezoneX;
					y = 0.258 * safezoneH + safezoneY;
					w = 0.0825 * safezoneW;
					h = 0.022 * safezoneH;
				};
				class geburt_header: life_RscText
				{
					idc = -1;
					text = "Geburtsdaten:"; //--- ToDo: Localize;
					x = 0.242187 * safezoneW + safezoneX;
					y = 0.368 * safezoneH + safezoneY;
					w = 0.0767187 * safezoneW;
					h = 0.022 * safezoneH;
				};
				class vorname: life_RscEdit
				{
					idc = 1003;
					text = "Name"; //--- ToDo: Localize;
					x = 0.247344 * safezoneW + safezoneX;
					y = 0.291 * safezoneH + safezoneY;
					w = 0.154687 * safezoneW;
					h = 0.022 * safezoneH;
          canModify = 0;
				};
				class geburtsort: life_RscEdit
				{
					idc = 1402;
					text = "Geburtsort"; //--- ToDo: Localize;
					x = 0.2525 * safezoneW + safezoneX;
					y = 0.401 * safezoneH + safezoneY;
					w = 0.103125 * safezoneW;
					h = 0.022 * safezoneH;
				};
				class geburt_tag: life_RscCombo
				{
					idc = 2100;
					x = 0.412344 * safezoneW + safezoneX;
					y = 0.423 * safezoneH + safezoneY;
					w = 0.0309375 * safezoneW;
					h = 0.022 * safezoneH;
				};
				class geburt_monat: life_RscCombo
				{
					idc = 2101;
					x = 0.453594 * safezoneW + safezoneX;
					y = 0.423 * safezoneH + safezoneY;
					w = 0.0309375 * safezoneW;
					h = 0.022 * safezoneH;
				};
				class geburt_jahr: life_RscCombo
				{
					idc = 2102;
					x = 0.494844 * safezoneW + safezoneX;
					y = 0.423 * safezoneH + safezoneY;
					w = 0.0515625 * safezoneW;
					h = 0.022 * safezoneH;
				};
				class anschrift_header: life_RscText
				{
					idc = -1;
					text = "Anschrift:"; //--- ToDo: Localize;
					x = 0.432969 * safezoneW + safezoneX;
					y = 0.258 * safezoneH + safezoneY;
					w = 0.07125 * safezoneW;
					h = 0.022 * safezoneH;
				};
				class anschrift_strasse: life_RscEdit
				{
					idc = 1403;
					text = "Straße"; //--- ToDo: Localize;
					x = 0.438125 * safezoneW + safezoneX;
					y = 0.291 * safezoneH + safezoneY;
					w = 0.154687 * safezoneW;
					h = 0.022 * safezoneH;
				};
				class anschrift_ort: life_RscEdit
				{
					idc = 1404;
					text = "Stadt"; //--- ToDo: Localize;
					x = 0.438125 * safezoneW + safezoneX;
					y = 0.324 * safezoneH + safezoneY;
					w = 0.061875 * safezoneW;
					h = 0.022 * safezoneH;
				};
				class koerper_header: life_RscText
				{
					idc = -1;
					text = "Körperangaben:"; //--- ToDo: Localize;
					x = 0.242187 * safezoneW + safezoneX;
					y = 0.533 * safezoneH + safezoneY;
					w = 0.161875 * safezoneW;
					h = 0.022 * safezoneH;
				};
				class koerper_augenfarbe: life_RscEdit
				{
					idc = 1405;
					text = "Augenfarbe"; //--- ToDo: Localize;
					x = 0.247344 * safezoneW + safezoneX;
					y = 0.566 * safezoneH + safezoneY;
					w = 0.0825 * safezoneW;
					h = 0.022 * safezoneH;
				};
				class koerper_groesse: life_RscEdit
				{
					idc = 1406;
					text = "Größe"; //--- ToDo: Localize;
					x = 0.247344 * safezoneW + safezoneX;
					y = 0.599 * safezoneH + safezoneY;
					w = 0.0360937 * safezoneW;
					h = 0.022 * safezoneH;
				};
				class religion_header: life_RscText
				{
					idc = -1;
					text = "Staatsangehörigkeit:"; //--- ToDo: Localize;
					x = 0.371094 * safezoneW + safezoneX;
					y = 0.533 * safezoneH + safezoneY;
					w = 0.0864063 * safezoneW;
					h = 0.022 * safezoneH;
				};
				class religion_combo: life_RscCombo
				{
					idc = 2103;
					x = 0.37625 * safezoneW + safezoneX;
					y = 0.566 * safezoneH + safezoneY;
					w = 0.128906 * safezoneW;
					h = 0.022 * safezoneH;
				};
				class anschrift_plz: life_RscEdit
				{
					idc = 1401;
					text = "PLZ"; //--- ToDo: Localize;
					x = 0.505156 * safezoneW + safezoneX;
					y = 0.324 * safezoneH + safezoneY;
					w = 0.061875 * safezoneW;
					h = 0.022 * safezoneH;
				};
				class geburt_land: life_RscEdit
				{
					idc = 1407;
					text = "Geburtsland"; //--- ToDo: Localize;
					x = 0.2525 * safezoneW + safezoneX;
					y = 0.434 * safezoneH + safezoneY;
					w = 0.103125 * safezoneW;
					h = 0.022 * safezoneH;
				};
				class datum_header: life_RscText
				{
					idc = 1008;
					text = "Geburtsdatum"; //--- ToDo: Localize;
					x = 0.407187 * safezoneW + safezoneX;
					y = 0.39 * safezoneH + safezoneY;
					w = 0.0667187 * safezoneW;
					h = 0.033 * safezoneH;
				};
				class geschlecht_header: life_RscText
				{
					idc = -1;
					text = "Geschlecht:"; //--- ToDo: Localize;
					x = 0.536094 * safezoneW + safezoneX;
					y = 0.533 * safezoneH + safezoneY;
					w = 0.0615625 * safezoneW;
					h = 0.022 * safezoneH;
				};
				class geschlecht_combo: life_RscCombo
				{
					idc = 2104;
					x = 0.54125 * safezoneW + safezoneX;
					y = 0.566 * safezoneH + safezoneY;
					w = 0.0876563 * safezoneW;
					h = 0.022 * safezoneH;
				};
				class button_weiter: life_RscButtonMenu
				{
					idc = -1;
					text = "Ausweis beantragen!"; //--- ToDo: Localize;
					x = 0.412344 * safezoneW + safezoneX;
					y = 0.687 * safezoneH + safezoneY;
					w = 0.175313 * safezoneW;
					h = 0.055 * safezoneH;
					colorText[] = {1,0,0,1};
					onButtonClick = "[] spawn ESG_fnc_ausweis_get;";
					class Attributes
					{
						color = "#c02525";
						align = "center";
						font = "PuristaBold";
					};
				};
		};
};
