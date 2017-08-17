#define CB_CHECK "Custom\IDSystem\icons\haken_checked.paa"
#define CB_UNCHECK "Custom\IDSystem\icons\haken_unchecked.paa"
class personalausweis_60000
{
	idd = 60000;
	name = "personalausweis_60000";
	movingEnabled = false;
	enableSimulation = true;
	onLoad = "";

	class controlsBackground {
		class hintergrund: Life_RscText
		{
			idc = -1;

			x = 0.0124995;
			y = 0.02;
			w = 0.974999;
			h = 0.78;
			colorBackground[] = {-1,-1,-1,0.7};
		};
		class text_bestaetigen: Life_RscText
		{
			idc = -1;

			text = $STR_Info;
			x = 0.162499;
			y = 0.88;
			w = 0.674999;
			h = 0.04;
			colorText[] = {1,-1,-1,1};
			tooltip = $STR_Info;
		};
		class text_name: Life_RscText
		{
			idc = -1;
			sizeEx = 0.035;

			text = $STR_IDCard_Name;
			x = 0.0375007;
			y = 0.06;
			w = 0.125;
			h = 0.04;
			colorText[] = {-1,-1,-1,1};
			colorBackground[] = {0.7,0.7,0.7,1};
		};
		class text_alter: Life_RscText
		{
			idc = -1;
			sizeEx = 0.035;

			text = $STR_IDCard_Alter;
			x = 0.0375007;
			y = 0.18;
			w = 0.125;
			h = 0.04;
			colorText[] = {-1,-1,-1,1};
			colorBackground[] = {0.7,0.7,0.7,1};
		};
		class text_groesse: Life_RscText
		{
			idc = -1;
			sizeEx = 0.035;

			text = $STR_IDCard_Groesse;
			x = 0.287501;
			y = 0.12;
			w = 0.1625;
			h = 0.04;
			colorText[] = {-1,-1,-1,1};
			colorBackground[] = {0.7,0.7,0.7,1};
		};
		class text_gewicht: Life_RscText
		{
			idc = -1;
			sizeEx = 0.035;

			text = $STR_IDCard_Gewicht;
			x = 0.287501;
			y = 0.18;
			w = 0.1625;
			h = 0.04;
			colorText[] = {-1,-1,-1,1};
			colorBackground[] = {0.7,0.7,0.7,1};
		};
		class text_geschl: Life_RscText
		{
			idc = -1;
			sizeEx = 0.035;

			text = $STR_IDCard_Geschlecht;
			x = 0.0375007;
			y = 0.12;
			w = 0.125;
			h = 0.04;
			colorText[] = {-1,-1,-1,1};
			colorBackground[] = {0.7,0.7,0.7,1};
		};
		class text_blutgruppe: Life_RscText
		{
			idc = -1;
			sizeEx = 0.035;

			text = $STR_IDCard_Blutgr;
			x = 0.0375007;
			y = 0.24;
			w = 0.125;
			h = 0.04;
			colorText[] = {-1,-1,-1,1};
			colorBackground[] = {0.7,0.7,0.7,1};
		};
		class text_geburtsdatum: Life_RscText
		{
			idc = -1;
			sizeEx = 0.035;

			text = $STR_IDCard_bday;
			x = 0.0375007;
			y = 0.3;
			w = 0.262499;
			h = 0.04;
			colorText[] = {-1,-1,-1,1};
			colorBackground[] = {0.7,0.7,0.7,1};
			tooltip = $STR_IDCard_bdayttip;
		};
		class text_strasse: Life_RscText
		{
			idc = -1;
			sizeEx = 0.035;

			text = $STR_IDCard_Strasse;
			x = 0.0375007;
			y = 0.38;
			w = 0.1125;
			h = 0.04;
			colorText[] = {-1,-1,-1,1};
			colorBackground[] = {0.7,0.7,0.7,1};
		};
		class text_ort: Life_RscText
		{
			idc = -1;
			sizeEx = 0.035;

			text = $STR_IDCard_plz_ort;
			x = 0.0375007;
			y = 0.44;
			w = 0.1125;
			h = 0.04;
			colorText[] = {-1,-1,-1,1};
			colorBackground[] = {0.7,0.7,0.7,1};
			tooltip = $STR_IDCard_plz_ortttip;
		};
		class text_hausnr: Life_RscText
		{
			idc = -1;
			sizeEx = 0.035;

			text = $STR_IDCard_hsnr;
			x = 0.472499;
			y = 0.38;
			w = 0.0425006;
			h = 0.04;
			colorText[] = {-1,-1,-1,1};
			colorBackground[] = {0.7,0.7,0.7,1};
		};
		class text_email: Life_RscText
		{
			idc = -1;
			sizeEx = 0.035;

			text = $STR_IDCard_mail;
			x = 0.0375007;
			y = 0.58;
			w = 0.1125;
			h = 0.04;
			colorText[] = {-1,-1,-1,1};
			colorBackground[] = {0.7,0.7,0.7,1};
		};
		class text_akzeptieren: Life_RscText
		{
			idc = -1;

			text = $STR_IDCard_ok;
			x = 0.0249988;
			y = 0.8;
			w = 0.1375;
			h = 0.04;
			colorText[] = {1,-1,-1,1};
		};
		class text_staatszueghoerigkeit: Life_RscText
		{
			idc = -1;
			sizeEx = 0.035;

			text = $STR_IDCard_staat;
			x = 0.0375;
			y = 0.508;
			w = 0.275;
			h = 0.04;
			colorText[] = {-1,-1,-1,1};
			colorBackground[] = {0.7,0.7,0.7,1};
			tooltip = $STR_IDCard_staat_ttp;
		};
		class text_handynr: Life_RscText
		{
			idc = -1;
			sizeEx = 0.035;

			text = $STR_IDCard_handynr;
			x = 0.0375007;
			y = 0.64;
			w = 0.1125;
			h = 0.04;
			colorText[] = {-1,-1,-1,1};
			colorBackground[] = {0.7,0.7,0.7,1};
		};
	};
	class controls {
		class knopf_abbrechen: Life_RscButtonMenu
		{
			idc = -1;
			onButtonClick="endMission ""-""";
			class Attributes { align = "center"; };

			text = $STR_IDCard_knopf_abbr;
			x = 0.412499;
			y = 1.04;
			w = 0.15;
			h = 0.04;
		};
		class knopf_beantragen: Life_RscButtonMenu
		{
			idc = 60015;
			class Attributes { align = "center"; };
			onButtonClick="[] call fvs_fnc_persoBeantragen;";

			text = $STR_IDCard_knopf_beantragen;
			x = 0.2;
			y = 0.94;
			w = 0.6;
			h = 0.08;
		};
		class haken_Regeln: Life_Checkbox
		{
			idc = 60100;
			onCheckedChanged = "if(!fvs_hakenregeln) then {fvs_hakenregeln = true; systemChat localize 'STR_IDCard_check_rulesOK';} else {fvs_hakenregeln = false;systemChat localize 'STR_IDCard_check_rulesNOK';};";
			textureChecked = CB_CHECK;
			textureUnchecked = CB_UNCHECK;
			textureFocusedChecked = CB_CHECK;
			textureFocusedUnchecked = CB_UNCHECK;
			textureHoverChecked = CB_CHECK;
			textureHoverUnchecked = CB_UNCHECK;
			texturePressedChecked = CB_CHECK;
			texturePressedUnchecked = CB_UNCHECK;
			textureDisabledChecked = CB_CHECK;
			textureDisabledUnchecked = CB_UNCHECK;

			x = 0.174999;
			y = 0.8;
			w = 0.0375001;
			h = 0.04;
			tooltip = $STR_ServerRegeln;
		};
		class haken_richtig: Life_Checkbox
		{
			idc = 60300;
			onCheckedChanged = "if(!fvs_hakenrichtig) then {fvs_hakenrichtig = true; systemChat localize 'STR_IDCard_check_richtig';} else {fvs_hakenrichtig = false; systemChat localize 'STR_IDCard_check_nrichtig';};";
			textureChecked = CB_CHECK; 
			textureUnchecked = CB_UNCHECK; 
			textureFocusedChecked = CB_CHECK;
			textureFocusedUnchecked = CB_UNCHECK;
			textureHoverChecked = CB_CHECK;
			textureHoverUnchecked = CB_UNCHECK;
			texturePressedChecked = CB_CHECK;
			texturePressedUnchecked = CB_UNCHECK;
			textureDisabledChecked = CB_CHECK;
			textureDisabledUnchecked = CB_UNCHECK;

			x = 0.324999;
			y = 0.8;
			w = 0.0375001;
			h = 0.04;
			tooltip = $STR_IDCard_check_ttip;
		};
		class haken_daten: Life_Checkbox
		{
			idc = 60200;
			onCheckedChanged = "if(!fvs_hakendaten) then {fvs_hakendaten = true; systemChat localize 'STR_IDCard_check_persAngabenOK';} else {fvs_hakendaten = false; systemChat localize 'STR_IDCard_check_persAngabenNOK';};";
			textureChecked = CB_CHECK;
			textureUnchecked = CB_UNCHECK; 
			textureFocusedChecked = CB_CHECK;
			textureFocusedUnchecked = CB_UNCHECK;
			textureHoverChecked = CB_CHECK;
			textureHoverUnchecked = CB_UNCHECK;
			texturePressedChecked = CB_CHECK;
			texturePressedUnchecked = CB_UNCHECK;
			textureDisabledChecked = CB_CHECK;
			textureDisabledUnchecked = CB_UNCHECK;

			x = 0.25;
			y = 0.8;
			w = 0.0375001;
			h = 0.04;
			tooltip = $STR_IDCard_check_persAngabenttip;
		};
		class haken_aendernderInfosundProfilhinweis: Life_Checkbox
		{
			idc = 60400;
			onCheckedChanged	= "if(!fvs_namenInfo) then {fvs_namenInfo = true; systemChat localize 'STR_IDCard_check_persHinweisOK';} else {fvs_namenInfo = false;systemChat localize 'STR_IDCard_check_persHinweisNOK';};";
			textureChecked = CB_CHECK; 
			textureUnchecked = CB_UNCHECK;
			textureFocusedChecked = CB_CHECK;
			textureFocusedUnchecked = CB_UNCHECK;
			textureHoverChecked = CB_CHECK;
			textureHoverUnchecked = CB_UNCHECK;
			texturePressedChecked = CB_CHECK;
			texturePressedUnchecked = CB_UNCHECK;
			textureDisabledChecked = CB_CHECK;
			textureDisabledUnchecked = CB_UNCHECK;

			x = 0.400581;
			y = 0.801549;
			w = 0.0375001;
			h = 0.04;
			tooltip = $STR_IDCard_check_persHinweisttip;
		};
		class anzeige_spielername: Life_RscStructuredText
		{
			idc = 60001;

			text = "# ? #"; //--- ToDo: Localize;
			x = 0.162497;
			y = 0.06;
			w = 0.412504;
			h = 0.04;
			tooltip = $STR_IDCard_profilenamettip;
		};
		class lb_sex: Life_RscCombo
		{
			idc = 60002;

			x = 0.167499;
			y = 0.12;
			w = 0.1;
			h = 0.04;
			colorBackground[] = {0.3,0.3,0.3,1};
		};
		class lb_groesse: Life_RscCombo
		{
			idc = 60004;

			x = 0.455;
			y = 0.12;
			w = 0.1;
			h = 0.04;
			colorBackground[] = {0.3,0.3,0.3,1};
			tooltip = $STR_IDCard_Angabencmttip;
		};
		class lb_gewicht: Life_RscCombo
		{
			idc = 60005;

			x = 0.455005;
			y = 0.18;
			w = 0.1;
			h = 0.04;
			colorBackground[] = {0.3,0.3,0.3,1};
			tooltip = $STR_IDCard_Angabenkgttip;
		};
		class lb_blutgruppe: Life_RscCombo
		{
			idc = 60006;

			x = 0.167497;
			y = 0.24;
			w = 0.1;
			h = 0.04;
			colorBackground[] = {0.3,0.3,0.3,1};
			tooltip = $STR_IDCard_Blutgrttip;
		};
		class lb_tag: Life_RscCombo
		{
			idc = 60007;

			x = 0.3125;
			y = 0.3;
			w = 0.075;
			h = 0.04;
			colorBackground[] = {0.3,0.3,0.3,1};
			tooltip = $STR_IDCard_Geburtstagttip;
		};
		class lb_monat: Life_RscCombo
		{
			idc = 60008;
			onLBSelChanged = "[] call fvs_fnc_updateTag";

			x = 0.4;
			y = 0.3;
			w = 0.075;
			h = 0.04;
			colorBackground[] = {0.3,0.3,0.3,1};
			tooltip = $STR_IDCard_Geburtsmonatttip;
		};
		class lb_jahr: Life_RscCombo
		{
			idc = 60009;
			onLBSelChanged = "[] call fvs_fnc_updateMonat";

			x = 0.487501;
			y = 0.3;
			w = 0.1;
			h = 0.04;
			colorBackground[] = {0.3,0.3,0.3,1};
			tooltip = $STR_IDCard_Geburtsjahrttip;
		};
		class lb_stadt_plz: Life_RscCombo
		{
			idc = 60012;
			onLBSelChanged = "[] call fvs_fnc_updateStrasse";

			x = 0.154993;
			y = 0.44;
			w = 0.337501;
			h = 0.04;
			colorBackground[] = {0.3,0.3,0.3,1};
			tooltip = $STR_plz_stadt;
		};
		class lb_bildID: Life_RscCombo
		{
			idc = 60017;
			onLBSelChanged = "[] call fvs_fnc_updatePersoBild";

			x = 0.7375;
			y = 0.424;
			w = 0.225;
			h = 0.04;
			colorBackground[] = {0.3,0.3,0.3,1};
		};
		class lb_strasse: Life_RscCombo
		{
			idc = 60010;
			onLBSelChanged = "[] call fvs_fnc_updateHsnr";

			x = 0.154999;
			y = 0.38;
			w = 0.312499;
			h = 0.04;
			colorBackground[] = {0.3,0.3,0.3,1};
		};
		class lb_hausnummer: Life_RscCombo
		{
			idc = 60011;

			x = 0.52;
			y = 0.38;
			w = 0.0749999;
			h = 0.04;
			colorBackground[] = {0.3,0.3,0.3,1};
		};
		class lb_staat: Life_RscCombo
		{
			idc = 60018;

			x = 0.3175;
			y = 0.508;
			w = 0.337501;
			h = 0.04;
			colorBackground[] = {0.3,0.3,0.3,1};
			tooltip = $STR_plz_stadt;
		};
		class anzeige_email: Life_RscStructuredText
		{
			idc = 60013;

			x = 0.15;
			y = 0.58;
			w = 0.425001;
			h = 0.04;
			tooltip = $STR_IDCard_emailttip;
		};
		class anzeige_handynr: Life_RscStructuredText
		{
			idc = 60014;

			x = 0.15;
			y = 0.64;
			w = 0.425001;
			h = 0.04;
			tooltip = $STR_IDCard_handyttip;
		};
		class anzeige_alter: Life_RscStructuredText
		{
			idc = 60003;
			text = "";
			class Attributes { align = "center"; };

			x = 0.162499;
			y = 0.18;
			w = 0.1;
			h = 0.04;
		};
		class bild_perso: Life_RscPicture
		{
			idc = 60016;

			text = "#(argb,8,8,3)color(1,1,1,1)";
			x = 0.597969 * safezoneW + safezoneX;
			y = 0.258 * safezoneH + safezoneY;
			w = 0.0928125 * safezoneW;
			h = 0.198 * safezoneH;
		};
	};
};

class personalausweis_70000a
{
	idd = 70000;
	name = "personalausweis_70000a";
	movingEnabled = false;
	enableSimulation = true;
	onLoad = "";

	class controlsBackground {
		class hintergrund: Life_RscText
		{
			idc = -1;

			x = 0.0124995;
			y = 0.02;
			w = 0.974999;
			h = 0.78;
			colorBackground[] = {-1,-1,-1,0.7};
		};
		class text_name: Life_RscText
		{
			idc = -1;
			sizeEx = 0.035;

			text = $STR_IDCard_Name;
			x = 0.0375007;
			y = 0.06;
			w = 0.125;
			h = 0.04;
			colorText[] = {-1,-1,-1,1};
			colorBackground[] = {0.7,0.7,0.7,1};
		};
		class text_alter: Life_RscText
		{
			idc = -1;
			sizeEx = 0.035;

			text = $STR_IDCard_Alter;
			x = 0.0375007;
			y = 0.18;
			w = 0.125;
			h = 0.04;
			colorText[] = {-1,-1,-1,1};
			colorBackground[] = {0.7,0.7,0.7,1};
		};
		class text_groesse: Life_RscText
		{
			idc = -1;
			sizeEx = 0.035;

			text = $STR_IDCard_Groesse;
			x = 0.287501;
			y = 0.12;
			w = 0.1625;
			h = 0.04;
			colorText[] = {-1,-1,-1,1};
			colorBackground[] = {0.7,0.7,0.7,1};
		};
		class text_gewicht: Life_RscText
		{
			idc = -1;
			sizeEx = 0.035;

			text = $STR_IDCard_Gewicht;
			x = 0.287501;
			y = 0.18;
			w = 0.159999;
			h = 0.04;
			colorText[] = {-1,-1,-1,1};
			colorBackground[] = {0.7,0.7,0.7,1};
		};
		class text_geschl: Life_RscText
		{
			idc = -1;
			sizeEx = 0.035;

			text = $STR_IDCard_Geschlecht;
			x = 0.0375007;
			y = 0.12;
			w = 0.125;
			h = 0.04;
			colorText[] = {-1,-1,-1,1};
			colorBackground[] = {0.7,0.7,0.7,1};
		};
		class text_blutgruppe: Life_RscText
		{
			idc = -1;
			sizeEx = 0.035;

			text = $STR_IDCard_Blutgr;
			x = 0.0375007;
			y = 0.24;
			w = 0.125;
			h = 0.04;
			colorText[] = {-1,-1,-1,1};
			colorBackground[] = {0.7,0.7,0.7,1};
		};
		class text_geburtsdatum: Life_RscText
		{
			idc = -1;
			sizeEx = 0.035;

			text = $STR_IDCard_bday;
			x = 0.0375007;
			y = 0.3;
			w = 0.262499;
			h = 0.04;
			colorText[] = {-1,-1,-1,1};
			colorBackground[] = {0.7,0.7,0.7,1};
			tooltip = $STR_IDCard_bdayttip;
		};
		class text_strasse: Life_RscText
		{
			idc = -1;
			sizeEx = 0.035;

			text = $STR_IDCard_Strasse;
			x = 0.0375007;
			y = 0.38;
			w = 0.1125;
			h = 0.04;
			colorText[] = {-1,-1,-1,1};
			colorBackground[] = {0.7,0.7,0.7,1};
		};
		class text_ort: Life_RscText
		{
			idc = -1;
			sizeEx = 0.035;

			text = $STR_IDCard_plz_ort;
			x = 0.0375007;
			y = 0.44;
			w = 0.1125;
			h = 0.04;
			colorText[] = {-1,-1,-1,1};
			colorBackground[] = {0.7,0.7,0.7,1};
			tooltip = $STR_IDCard_plz_ortttip;
		};
		class text_hausnr: Life_RscText
		{
			idc = -1;
			sizeEx = 0.035;

			text = $STR_IDCard_hsnr;
			x = 0.477499;
			y = 0.38;
			w = 0.0425006;
			h = 0.04;
			colorText[] = {-1,-1,-1,1};
			colorBackground[] = {0.7,0.7,0.7,1};
		};
		class text_email: Life_RscText
		{
			idc = -1;
			sizeEx = 0.035;

			text = $STR_IDCard_mail;
			x = 0.0375007;
			y = 0.54;
			w = 0.1125;
			h = 0.04;
			colorText[] = {-1,-1,-1,1};
			colorBackground[] = {0.7,0.7,0.7,1};
		};
		class text_handynr: Life_RscText
		{
			idc = -1;
			sizeEx = 0.035;

			text = $STR_IDCard_handynr;
			x = 0.0375007;
			y = 0.6;
			w = 0.1125;
			h = 0.04;
			colorText[] = {-1,-1,-1,1};
			colorBackground[] = {0.7,0.7,0.7,1};
		};
	};
	class controls {
		class knopf_beantragen: Life_RscButtonMenu
		{
			idc = 70016;
			class Attributes { align = "center"; };
			onButtonClick="[] spawn fvs_fnc_persoBeantragenAenderung;";

			text = $STR_IDCard_knopf_beantragenAenderung;
			x = 0.2;
			y = 0.804;
			w = 0.6;
			h = 0.08;
		};
		class knopf_abbrechen: Life_RscButtonMenu
		{
			idc = -1;
			onButtonClick="closeDialog 0;";
			class Attributes { align = "center"; };

			text = $STR_IDCard_knopf_abbr;
			x = 0.412499;
			y = 0.888;
			w = 0.15;
			h = 0.04;
		};
		class lb_sex: Life_RscCombo
		{
			idc = 70003;

			x = 0.167499;
			y = 0.12;
			w = 0.1;
			h = 0.04;
			colorBackground[] = {0.3,0.3,0.3,1};
		};
		class lb_groesse: Life_RscCombo
		{
			idc = 70004;

			x = 0.455;
			y = 0.12;
			w = 0.1;
			h = 0.04;
			colorBackground[] = {0.3,0.3,0.3,1};
			tooltip = $STR_IDCard_Angabencmttip;
		};
		class lb_gewicht: Life_RscCombo
		{
			idc = 70006;

			x = 0.455005;
			y = 0.18;
			w = 0.1;
			h = 0.04;
			colorBackground[] = {0.3,0.3,0.3,1};
			tooltip = $STR_IDCard_Angabenkgttip;
		};
		class lb_blutgruppe: Life_RscCombo
		{
			idc = 70007;

			x = 0.167497;
			y = 0.24;
			w = 0.1;
			h = 0.04;
			colorBackground[] = {0.3,0.3,0.3,1};
			tooltip = $STR_IDCard_Blutgrttip;
		};
		class lb_tag: Life_RscCombo
		{
			idc = 70008;

			x = 0.312499;
			y = 0.3;
			w = 0.075;
			h = 0.04;
			colorBackground[] = {0.3,0.3,0.3,1};
			tooltip = $STR_IDCard_Geburtstagttip;
		};
		class lb_monat: Life_RscCombo
		{
			idc = 70009;
			onLBSelChanged = "[] call fvs_fnc_updateTagA";

			x = 0.4;
			y = 0.3;
			w = 0.075;
			h = 0.04;
			colorBackground[] = {0.3,0.3,0.3,1};
			tooltip = $STR_IDCard_Geburtsmonatttip;
		};
		class lb_jahr: Life_RscCombo
		{
			idc = 70010;
			onLBSelChanged = "[] call fvs_fnc_updateMonatA";

			x = 0.487501;
			y = 0.3;
			w = 0.1;
			h = 0.04;
			colorBackground[] = {0.3,0.3,0.3,1};
			tooltip = $STR_IDCard_Geburtsjahrttip;
		};
		class lb_stadt_plz: Life_RscCombo
		{
			idc = 70013;
			onLBSelChanged = "[] call fvs_fnc_updateStrasseA";

			x = 0.154993;
			y = 0.44;
			w = 0.337501;
			h = 0.04;
			colorBackground[] = {0.3,0.3,0.3,1};
			tooltip = $STR_plz_stadt;
		};
		class lb_bildID: Life_RscCombo
		{
			idc = 70018;
			onLBSelChanged = "[] call fvs_fnc_updatePersoBildA";

			x = 0.7375;
			y = 0.424;
			w = 0.225;
			h = 0.04;
			colorBackground[] = {0.3,0.3,0.3,1};
		};
		class lb_strasse: Life_RscCombo
		{
			idc = 70011;
			onLBSelChanged = "[] call fvs_fnc_updateHsnrA";

			x = 0.154999;
			y = 0.38;
			w = 0.312499;
			h = 0.04;
			colorBackground[] = {0.3,0.3,0.3,1};
		};
		class lb_hausnummer: Life_RscCombo
		{
			idc = 70012;

			x = 0.5225;
			y = 0.38;
			w = 0.0749999;
			h = 0.04;
			colorBackground[] = {0.3,0.3,0.3,1};
		};
		class anzeige_email: Life_RscStructuredText
		{
			idc = 70014;

			x = 0.15;
			y = 0.54;
			w = 0.425001;
			h = 0.04;
			tooltip = $STR_IDCard_emailttip;
		};
		class anzeige_handynr: Life_RscStructuredText
		{
			idc = 70015;

			x = 0.15;
			y = 0.6;
			w = 0.425001;
			h = 0.04;
			tooltip = $STR_IDCard_handyttip;
		};
		class anzeige_alter: Life_RscStructuredText
		{
			idc = 70005;
			text = "";
			class Attributes { align = "center"; };

			x = 0.162499;
			y = 0.18;
			w = 0.1;
			h = 0.04;
		};
		class bild_perso: Life_RscPicture
		{
			idc = 70017;

			text = "#(argb,8,8,3)color(1,1,1,1)";
			x = 0.597969 * safezoneW + safezoneX;
			y = 0.258 * safezoneH + safezoneY;
			w = 0.0928125 * safezoneW;
			h = 0.198 * safezoneH;
		};
		class eingabe_neuerName: Life_RscEdit
		{
			idc = 70002;
			text = "";

			x = 0.197497;
			y = 0.06;
			w = 0.412504;
			h = 0.04;
			colorText[] = {1,1,1,1};
			tooltip = $STR_IDCard_newnamettip;
		};
		class haken_profilnameAendern: Life_Checkbox
		{
			idc = 70001;
			onCheckedChanged = "if(!fvs_namen_a) then {fvs_namen_a = true; systemChat localize 'STR_IDCard_check_newnameChange';} else {fvs_namen_a = false;systemChat localize 'STR_IDCard_check_newnameNotChange';};";

			x = 0.16;
			y = 0.06;
			w = 0.0375;
			h = 0.04;
			tooltip = $STR_IDCard_check_newnamettip;
		};
	};
};