class personalausweis_60000
{
	idd = 60000;
	name = "personalausweis_60000";
	movingEnabled = false;
	enableSimulation = true;
	onLoad = "";

	class controlsBackground {
		class hintergrund: DWEV_RscText
		{
			idc = -1;

			x = 0.0124995;
			y = 0.02;
			w = 0.974999;
			h = 1.07;
			colorBackground[] = {-1,-1,-1,0.7};
		};
		class text_bestaetigen: DWEV_RscText
		{
			idc = -1;
			sizeEx = 0.030;
			x = 0.162499;
			y = 0.88;
			w = 0.674999;
			h = 0.04;
			colorText[] = {1,-1,-1,1};
		};
		class text_name: DWEV_RscText
		{
			idc = -1;

			text = "Name:";
			x = 0.0375007;
			y = 0.06;
			w = 0.125;
			h = 0.04;
			colorText[] = {-1,-1,-1,1};
			colorBackground[] = {0.7,0.7,0.7,1};
			sizeEx = 0.035;
		};
		class text_alter: DWEV_RscText
		{
			idc = -1;

			text = "Alter:";
			x = 0.0375007;
			y = 0.18;
			w = 0.125;
			h = 0.04;
			colorText[] = {-1,-1,-1,1};
			colorBackground[] = {0.7,0.7,0.7,1};
			sizeEx = 0.035;
		};
		class text_groesse: DWEV_RscText
		{
			idc = -1;

			text = "Körpergrösse:";
			x = 0.287501;
			y = 0.12;
			w = 0.1625;
			h = 0.04;
			colorText[] = {-1,-1,-1,1};
			colorBackground[] = {0.7,0.7,0.7,1};
			sizeEx = 0.035;
		};
		class text_gewicht: DWEV_RscText
		{
			idc = -1;

			text = "Gewicht:";
			x = 0.287501;
			y = 0.18;
			w = 0.159999;
			h = 0.04;
			colorText[] = {-1,-1,-1,1};
			colorBackground[] = {0.7,0.7,0.7,1};
			sizeEx = 0.035;
		};
		class text_geschl: DWEV_RscText
		{
			idc = -1;

			text = "Geschlecht:";
			x = 0.0375007;
			y = 0.12;
			w = 0.125;
			h = 0.04;
			colorText[] = {-1,-1,-1,1};
			colorBackground[] = {0.7,0.7,0.7,1};
			sizeEx = 0.035;
		};
		class text_blutgruppe: DWEV_RscText
		{
			idc = -1;

			text = "Blutgruppe:";
			x = 0.0375007;
			y = 0.24;
			w = 0.125;
			h = 0.04;
			colorText[] = {-1,-1,-1,1};
			colorBackground[] = {0.7,0.7,0.7,1};
			sizeEx = 0.035;
		};
		class text_geburtsdatum: DWEV_RscText
		{
			idc = -1;

			text = "Geburtsdatum:";
			x = 0.0375007;
			y = 0.3;
			w = 0.262499;
			h = 0.04;
			tooltip = "TT : MM : JJJJ";
			colorText[] = {-1,-1,-1,1};
			colorBackground[] = {0.7,0.7,0.7,1};
			sizeEx = 0.035;
		};
		class text_strasse: DWEV_RscText
		{
			idc = -1;

			text = "Strasse:";
			x = 0.0375007;
			y = 0.38;
			w = 0.1125;
			h = 0.04;
			colorText[] = {-1,-1,-1,1};
			colorBackground[] = {0.7,0.7,0.7,1};
			sizeEx = 0.035;
		};
		class text_ort: DWEV_RscText
		{
			idc = -1;

			text = "Plz-Ort:";
			tooltip = "Postleitzahl-Ort";
			x = 0.0375007;
			y = 0.44;
			w = 0.1125;
			h = 0.04;
			colorText[] = {-1,-1,-1,1};
			colorBackground[] = {0.7,0.7,0.7,1};
			sizeEx = 0.035;
		};
		class text_hausnr: DWEV_RscText
		{
			idc = -1;
			text = "Nr.:";
			x = 0.467499;
			y = 0.38;
			w = 0.0425006;
			h = 0.04;
			colorText[] = {-1,-1,-1,1};
			colorBackground[] = {0.7,0.7,0.7,1};
			sizeEx = 0.035;
		};
		class text_email: DWEV_RscText
		{
			idc = -1;

			text = "Email:";
			x = 0.0375007;
			y = 0.54;
			w = 0.1125;
			h = 0.04;
			colorText[] = {-1,-1,-1,1};
			colorBackground[] = {0.7,0.7,0.7,1};
			sizeEx = 0.035;
		};
		class text_ok: DWEV_RscText
		{
			idc = -1;

			text = "Akzeptieren:";
			x = 0.025;
			y = 0.7;
			w = 0.1375;
			h = 0.04;
			colorText[] = {1,-1,-1,1};
			sizeEx = 0.035;
		};
		class text_handynr: DWEV_RscText
		{
			idc = -1;

			text = "Handy-Nr.:";
			x = 0.0375007;
			y = 0.6;
			w = 0.1125;
			h = 0.04;
			colorText[] = {-1,-1,-1,1};
			colorBackground[] = {0.7,0.7,0.7,1};
			sizeEx = 0.035;
		};

		class text_ok1: DWEV_RscText
		{
			idc = -1;

			text = "Regeln:";
			x = 0.17;
			y = 0.7;
			w = 0.3;
			h = 0.04;
			sizeEx = 0.035;
		};
		class text_ok2: DWEV_RscText
		{
			idc = -1;

			text = "Eingaben überprüft:";
			x = 0.17;
			y = 0.75;
			w = 0.3;
			h = 0.04;
			sizeEx = 0.035;
		};
		class text_ok3: DWEV_RscText
		{
			idc = -1;

			text = "fiktiive Daten:";
			x = 0.17;
			y = 0.8;
			w = 0.3;
			h = 0.04;
			sizeEx = 0.035;
		};
		class text_ok4: DWEV_RscText
		{
			idc = -1;

			text = "ausgewählter Name:";
			x = 0.17;
			y = 0.85;
			w = 0.3;
			h = 0.04;
			sizeEx = 0.035;
		};

		class text_info: DWEV_RscStructuredText
		{
			idc = -1;

			text = "Bitte wähle deinen Namen bedacht aus. Wir behalten uns vor, deinen Namen zu ändern, wenn er in jeglicher Weise gegen unsere Regeln verstößt. Wir bitten weiterhin darum, dir einen Namen auszudenken, der dein RP stärkt, am besten einen Vor- und Nachnamen!";
			x = 0.53;
			y = 0.54;
            w = 0.42;
            h = 0.42;

			sizeEx = 0.035;
		};
	};
	class controls {
		class knopf_beantragen: DWEV_RscButtonMenu
		{
			idc = 60015;
			class Attributes				{				align = "center";			 };
			onButtonClick="[] call DWEV_fnc_persoBeantragen;";

			text = "PERSONALAUSWEIS BEANTRAGEN";
			x = 0.2;
			y = 0.95;
			w = 0.6;
			h = 0.08;
		};
		class knopf_abbrechen: DWEV_RscButtonMenu
		{
			idc = -1;
			onButtonClick="closeDialog 0;";
			class Attributes				{				align = "center";			 };

			text = "ABBRECHEN";
			x = 0.412499;
			y = 1.04;
			w = 0.15;
			h = 0.04;
		};
		class haken_Regeln: DWEV_Checkbox
		{
			idc = 60100;
			onCheckedChanged	= "if(!DWEV_hakenregeln) then {DWEV_hakenregeln = true; systemChat 'Serverregeln akzeptiert';} else {DWEV_hakenregeln = false;systemChat 'Serverregeln nicht akzeptiert';};";

			//x = 0.174999;
			//y = 0.8;
			//w = 0.0375001;
			//h = 0.04;

			x = 0.4;
			y = 0.7;
			w = 0.04;
			h = 0.04;
			tooltip = "Ich akzeptiere die Serverregeln und habe diese gelesen und Missverständnisse bereits aufgeklärt!";
			
			textureChecked = "icons\haken_checked.paa";		//Texture of checked CheckBox.
			textureUnchecked = "icons\haken_unchecked.paa";		//Texture of unchecked CheckBox.
			textureFocusedChecked = "icons\haken_checked.paa";	//Texture of checked focused CheckBox (Could be used for showing different texture when focused).
			textureFocusedUnchecked = "icons\haken_unchecked.paa";	//Texture of unchecked focused CheckBox.
			textureHoverChecked = "icons\haken_checked.paa";
			textureHoverUnchecked = "icons\haken_unchecked.paa";
			texturePressedChecked = "icons\haken_checked.paa";
			texturePressedUnchecked = "icons\haken_unchecked.paa";
			textureDisabledChecked = "icons\haken_checked.paa";
			textureDisabledUnchecked = "icons\haken_unchecked.paa";
		};
		class haken_richtig: DWEV_Checkbox
		{
			idc = 60300;
			onCheckedChanged	= "if(!DWEV_hakenrichtig) then {DWEV_hakenrichtig = true; systemChat 'Alle Felder ausgefüllt!';} else {DWEV_hakenrichtig = false; systemChat 'Doch nicht alle Felder ausgefüllt?';};";

			x = 0.4;
			y = 0.75;
			w = 0.04;
			h = 0.04;
			tooltip = "Die oben eingetragenen Angaben sind richtig und können nur im Einwohnermeldeamt geängert werden. Im Außnahmefall vom Support Support. Ausgeschlossen sind die Email-Adresse und die Handynummer.";
			
			textureChecked = "icons\haken_checked.paa";		//Texture of checked CheckBox.
			textureUnchecked = "icons\haken_unchecked.paa";		//Texture of unchecked CheckBox.
			textureFocusedChecked = "icons\haken_checked.paa";	//Texture of checked focused CheckBox (Could be used for showing different texture when focused).
			textureFocusedUnchecked = "icons\haken_unchecked.paa";	//Texture of unchecked focused CheckBox.
			textureHoverChecked = "icons\haken_checked.paa";
			textureHoverUnchecked = "icons\haken_unchecked.paa";
			texturePressedChecked = "icons\haken_checked.paa";
			texturePressedUnchecked = "icons\haken_unchecked.paa";
			textureDisabledChecked = "icons\haken_checked.paa";
			textureDisabledUnchecked = "icons\haken_unchecked.paa";
		};
		class haken_daten: DWEV_Checkbox
		{
			idc = 60200;
			onCheckedChanged	= "if(!DWEV_hakendaten) then {DWEV_hakendaten = true; systemChat 'Keine realen persönlichen Daten angegeben, welche auf Personen zurückzuführen sind!';} else {DWEV_hakendaten = false; systemChat 'Bitte überpruefe deine Eingaben!';};";

			x = 0.4;
			y = 0.8;
			w = 0.04;
			h = 0.04;
			tooltip = "Ich habe weder persönliche Daten von mir, noch von einer anderen realen Person angegeben!";
			
			textureChecked = "icons\haken_checked.paa";		//Texture of checked CheckBox.
			textureUnchecked = "icons\haken_unchecked.paa";		//Texture of unchecked CheckBox.
			textureFocusedChecked = "icons\haken_checked.paa";	//Texture of checked focused CheckBox (Could be used for showing different texture when focused).
			textureFocusedUnchecked = "icons\haken_unchecked.paa";	//Texture of unchecked focused CheckBox.
			textureHoverChecked = "icons\haken_checked.paa";
			textureHoverUnchecked = "icons\haken_unchecked.paa";
			texturePressedChecked = "icons\haken_checked.paa";
			texturePressedUnchecked = "icons\haken_unchecked.paa";
			textureDisabledChecked = "icons\haken_checked.paa";
			textureDisabledUnchecked = "icons\haken_unchecked.paa";
		};
		class haken_aendernderInfosundProfilhinweis: DWEV_Checkbox
		{
			idc = 60400;
			onCheckedChanged  = "if(!DWEV_namenInfo) then {DWEV_namenInfo = true; systemChat 'Information zum Profilnamen des Personalausweises zur Kenntnis genommen.';} else {DWEV_namenInfo = false;systemChat 'Bitte schaue dir die Informationen zu dem Personalausweis an.';};";

			x = 0.4;
			y = 0.85;
			w = 0.04;
			h = 0.04;
			tooltip = "Dein aktueller Profilname wird als RP-Name hinterlegt. Dieser Name kann nur als Zivilist im Einwohnermeldeamt geändert werden. Solltest du dich mit der Zeit mit einem anderen Profilnamen einloggen, so wird Serverbeitritt vorerst beendet. Solltest du deinen Namen ändern wollen, wende dich bitte an das Einwohnermeldeamt am Kavala Markt.";
			
			textureChecked = "icons\haken_checked.paa";		//Texture of checked CheckBox.
			textureUnchecked = "icons\haken_unchecked.paa";		//Texture of unchecked CheckBox.
			textureFocusedChecked = "icons\haken_checked.paa";	//Texture of checked focused CheckBox (Could be used for showing different texture when focused).
			textureFocusedUnchecked = "icons\haken_unchecked.paa";	//Texture of unchecked focused CheckBox.
			textureHoverChecked = "icons\haken_checked.paa";
			textureHoverUnchecked = "icons\haken_unchecked.paa";
			texturePressedChecked = "icons\haken_checked.paa";
			texturePressedUnchecked = "icons\haken_unchecked.paa";
			textureDisabledChecked = "icons\haken_checked.paa";
			textureDisabledUnchecked = "icons\haken_unchecked.paa";
		};


		class eingabe_Name: DWEV_RscEdit
		{
			idc = 60001;
			text = "";

			x = 0.45;
			y = 0.06;
			w = 0.22;
			h = 0.04;
			colorText[] = {1,1,1,1};
			tooltip = "Namen hier eingeben. Mindestens 4 Zeichen und maximal 16 Zeichen. Clantags und Sonderzeichen sind nicht erlaubt!";
		};
		class eingabe_VorName: DWEV_RscEdit
		{
			idc = 60018;
			text = "";

			x = 0.16;
			y = 0.06;
			w = 0.25;
			h = 0.04;
			colorText[] = {1,1,1,1};
			tooltip = "Vornamen hier eingeben. Mindestens 4 Zeichen und maximal 16 Zeichen. Clantags und Sonderzeichen sind nicht erlaubt!";
		};
		class lb_sex: DWEV_RscCombo
		{
			idc = 60002;

			x = 0.162499;
			y = 0.12;
			w = 0.1;
			h = 0.04;
			tooltip = "";
			colorBackground[] = {0.3,0.3,0.3,1};
		};
		class lb_groesse: DWEV_RscCombo
		{
			idc = 60004;

			x = 0.45;
			y = 0.12;
			w = 0.1;
			h = 0.04;
			tooltip = "Angaben in cm";
			colorBackground[] = {0.3,0.3,0.3,1};
		};
		class lb_gewicht: DWEV_RscCombo
		{
			idc = 60005;

			tooltip = "Angaben in kg";
			x = 0.450005;
			y = 0.18;
			w = 0.1;
			h = 0.04;
			colorBackground[] = {0.3,0.3,0.3,1};
		};
		class lb_blutgruppe: DWEV_RscCombo
		{
			idc = 60006;

			x = 0.162497;
			y = 0.24;
			w = 0.1;
			h = 0.04;
			tooltip = "Blutgruppe angeben. Diese Angabe könnte für einen Ersthelfer oder Sanitäter hilfreich sein!";
			colorBackground[] = {0.3,0.3,0.3,1};
		};
		class lb_tag: DWEV_RscCombo
		{
			idc = 60007;

			x = 0.312499;
			y = 0.3;
			w = 0.075;
			h = 0.04;
			tooltip = "Geburtstag";
			colorBackground[] = {0.3,0.3,0.3,1};
		};
		class lb_monat: DWEV_RscCombo
		{
			idc = 60008;

			x = 0.4;
			y = 0.3;
			w = 0.075;
			h = 0.04;
			tooltip = "Geburtsmonat";
			onLBSelChanged = "[] call DWEV_fnc_updateTag";
			colorBackground[] = {0.3,0.3,0.3,1};
		};
		class lb_jahr: DWEV_RscCombo
		{
			idc = 60009;

			x = 0.487501;
			y = 0.3;
			w = 0.1;
			h = 0.04;
			tooltip = "Geburtsjahr";
			onLBSelChanged = "[] call DWEV_fnc_updateMonat";
			colorBackground[] = {0.3,0.3,0.3,1};
		};
		class lb_stadt_plz: DWEV_RscCombo
		{
			idc = 60012;

			x = 0.149993;
			y = 0.44;
			w = 0.337501;
			h = 0.04;
			colorBackground[] = {0.3,0.3,0.3,1};
			onLBSelChanged = "[] call DWEV_fnc_updateStrasse";
		};
		class lb_strasse: DWEV_RscCombo
		{
			idc = 60010;

			x = 0.152499;
			y = 0.38;
			w = 0.312499;
			h = 0.04;
			colorBackground[] = {0.3,0.3,0.3,1};
			onLBSelChanged = "[] call DWEV_fnc_updateHsnr";
		};
		class lb_bildID: DWEV_RscCombo
		{
			idc = 60017;

			x = 0.7375;
			y = 0.424;
			w = 0.225;
			h = 0.04;
			colorBackground[] = {0.3,0.3,0.3,1};
			onLBSelChanged = "[] call DWEV_fnc_updatePersoBild";
		};
		class lb_hausnummer: DWEV_RscCombo
		{
			idc = 60011;

			x = 0.5125;
			y = 0.38;
			w = 0.0749999;
			h = 0.04;
			colorBackground[] = {0.3,0.3,0.3,1};
		};
		class anzeige_email: DWEV_RscStructuredText
		{
			idc = 60013;

			x = 0.15;
			y = 0.54;
			w = 0.425001;
			h = 0.04;
			tooltip = "Die Emailadresse setzt sich aus deinem Profilnamen und deiner Arma zufälligen Zahl zusammen und kann daher nicht geändert werden.";
		};
		class anzeige_handynr: DWEV_RscStructuredText
		{
			idc = 60014;

			x = 0.15;
			y = 0.6;
			w = 0.425001;
			h = 0.04;
			tooltip = "Deine Handynummer setzt sich aus Zufallszahlen und deiner Arma 3 SpielerID zusammen und kann daher nicht geändert werden.";
		};
		class anzeige_alter: DWEV_RscStructuredText
		{
			idc = 60003;
			text = "";
			class Attributes				{				align = "center";			 };

			x = 0.162499;
			y = 0.18;
			w = 0.1;
			h = 0.04;
		};
		class bild_perso: DWEV_RscPicture
		{
			idc = 60016;
			text = "";

			x = 0.737501;
			y = 0.06;
			w = 0.225;
			h = 0.36;
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
		class hintergrund: DWEV_RscText
		{
			idc = -1;

			x = 0.0124995;
			y = 0.02;
			w = 0.974999;
			h = 0.78;
			colorBackground[] = {-1,-1,-1,0.7};
		};
		class text_name: DWEV_RscText
		{
			idc = -1;

			text = "Name:";
			x = 0.0375007;
			y = 0.06;
			w = 0.125;
			h = 0.04;
			colorText[] = {-1,-1,-1,1};
			colorBackground[] = {0.7,0.7,0.7,1};
		};
		class text_alter: DWEV_RscText
		{
			idc = -1;

			text = "Alter:";
			x = 0.0375007;
			y = 0.18;
			w = 0.125;
			h = 0.04;
			colorText[] = {-1,-1,-1,1};
			colorBackground[] = {0.7,0.7,0.7,1};
		};
		class text_groesse: DWEV_RscText
		{
			idc = -1;

			text = "Körpergrösse:";
			x = 0.287501;
			y = 0.12;
			w = 0.1625;
			h = 0.04;
			colorText[] = {-1,-1,-1,1};
			colorBackground[] = {0.7,0.7,0.7,1};
		};
		class text_gewicht: DWEV_RscText
		{
			idc = -1;

			text = "Gewicht:";
			x = 0.287501;
			y = 0.18;
			w = 0.159999;
			h = 0.04;
			colorText[] = {-1,-1,-1,1};
			colorBackground[] = {0.7,0.7,0.7,1};
		};
		class text_geschl: DWEV_RscText
		{
			idc = -1;

			text = "Geschlecht:";
			x = 0.0375007;
			y = 0.12;
			w = 0.125;
			h = 0.04;
			colorText[] = {-1,-1,-1,1};
			colorBackground[] = {0.7,0.7,0.7,1};
		};
		class text_blutgruppe: DWEV_RscText
		{
			idc = -1;

			text = "Blutgruppe:";
			x = 0.0375007;
			y = 0.24;
			w = 0.125;
			h = 0.04;
			colorText[] = {-1,-1,-1,1};
			colorBackground[] = {0.7,0.7,0.7,1};
		};
		class text_geburtsdatum: DWEV_RscText
		{
			idc = -1;

			text = "Geburtsdatum:";
			x = 0.0375007;
			y = 0.3;
			w = 0.262499;
			h = 0.04;
			tooltip = "TT : MM : JJJJ";
			colorText[] = {-1,-1,-1,1};
			colorBackground[] = {0.7,0.7,0.7,1};
		};
		class text_strasse: DWEV_RscText
		{
			idc = -1;

			text = "Strasse:";
			x = 0.0375007;
			y = 0.38;
			w = 0.1125;
			h = 0.04;
			colorText[] = {-1,-1,-1,1};
			colorBackground[] = {0.7,0.7,0.7,1};
		};
		class text_ort: DWEV_RscText
		{
			idc = -1;

			text = "Plz-Ort:";
			tooltip = "Postleitzahl-Ort";
			x = 0.0375007;
			y = 0.44;
			w = 0.1125;
			h = 0.04;
			colorText[] = {-1,-1,-1,1};
			colorBackground[] = {0.7,0.7,0.7,1};
		};
		class text_hausnr: DWEV_RscText
		{
			idc = -1;

			text = "Nr.:";
			x = 0.467499;
			y = 0.38;
			w = 0.0425006;
			h = 0.04;
			colorText[] = {-1,-1,-1,1};
			colorBackground[] = {0.7,0.7,0.7,1};
		};
		class text_email: DWEV_RscText
		{
			idc = -1;

			text = "Email:";
			x = 0.0375007;
			y = 0.54;
			w = 0.1125;
			h = 0.04;
			colorText[] = {-1,-1,-1,1};
			colorBackground[] = {0.7,0.7,0.7,1};
		};
		class text_handynr: DWEV_RscText
		{
			idc = -1;

			text = "Handy-Nr.:";
			x = 0.0375007;
			y = 0.6;
			w = 0.1125;
			h = 0.04;
			colorText[] = {-1,-1,-1,1};
			colorBackground[] = {0.7,0.7,0.7,1};
		};
	};
	class controls {
		class knopf_beantragen: DWEV_RscButtonMenu
		{
			idc = 70016;
			class Attributes				{				align = "center";			 };
			onButtonClick="[] spawn DWEV_fnc_persoBeantragenAenderung;";
			text = "PERSONALAUSWEIS BEANTRAGEN";
			x = 0.2;
			y = 0.804;
			w = 0.6;
			h = 0.08;
		};
		class knopf_abbrechen: DWEV_RscButtonMenu
		{
			idc = -1;
			onButtonClick="closeDialog 0; DWEV_namen_a = false; DWEV_checking_a = false;";
			class Attributes				{				align = "center";			 };

			text = "ABBRECHEN";
			x = 0.412499;
			y = 0.888;
			w = 0.15;
			h = 0.04;
		};
		class lb_sex: DWEV_RscCombo
		{
			idc = 70003;

			x = 0.162499;
			y = 0.12;
			w = 0.1;
			h = 0.04;
		};
		class lb_groesse: DWEV_RscCombo
		{
			idc = 70004;

			x = 0.45;
			y = 0.12;
			w = 0.1;
			h = 0.04;
			tooltip = "Angaben in cm";
		};
		class lb_gewicht: DWEV_RscCombo
		{
			idc = 70006;

			text = "Angaben in kg";
			x = 0.450005;
			y = 0.18;
			w = 0.1;
			h = 0.04;
		};
		class lb_blutgruppe: DWEV_RscCombo
		{
			idc = 70007;

			x = 0.162497;
			y = 0.24;
			w = 0.1;
			h = 0.04;
			tooltip = "Blutgruppe angeben. Diese Angabe könnte für einen Ersthelfer oder Sanitäter hilfreich sein!";
		};
		class lb_tag: DWEV_RscCombo
		{
			idc = 70008;
			tooltip = "Geburtstag";
			x = 0.312499;
			y = 0.3;
			w = 0.075;
			h = 0.04;
		};
		class lb_monat: DWEV_RscCombo
		{
			idc = 70009;
			onLBSelChanged = "[] call DWEV_fnc_updateTagA";
			tooltip = "Geburtsmonat";

			x = 0.4;
			y = 0.3;
			w = 0.075;
			h = 0.04;
		};
		class lb_jahr: DWEV_RscCombo
		{
			idc = 70010;
			onLBSelChanged = "[] call DWEV_fnc_updateMonatA";
			tooltip = "Geburtsjahr";

			x = 0.487501;
			y = 0.3;
			w = 0.1;
			h = 0.04;
		};
		class lb_stadt_plz: DWEV_RscCombo
		{
			idc = 70013;
			onLBSelChanged = "[] call DWEV_fnc_updateStrasseA";

			x = 0.149993;
			y = 0.44;
			w = 0.337501;
			h = 0.04;
			tooltip = "Postleitzahl-Ort";
		};
		class lb_bildID: DWEV_RscCombo
		{
			idc = 70018;
			onLBSelChanged = "[] call DWEV_fnc_updatePersoBildA";

			x = 0.7375;
			y = 0.424;
			w = 0.225;
			h = 0.04;
			tooltip = "Angaben in cm";
		};
		class lb_strasse: DWEV_RscCombo
		{
			idc = 70011;
			onLBSelChanged = "[] call DWEV_fnc_updateHsnrA";

			x = 0.152499;
			y = 0.38;
			w = 0.312499;
			h = 0.04;
		};
		class lb_hausnummer: DWEV_RscCombo
		{
			idc = 70012;

			x = 0.5125;
			y = 0.38;
			w = 0.0749999;
			h = 0.04;
		};
		class anzeige_email: DWEV_RscStructuredText
		{
			idc = 70014;

			x = 0.15;
			y = 0.54;
			w = 0.425001;
			h = 0.04;
			tooltip = "Die Emailadresse setzt sich aus deinem Profilnamen und deiner Arma zufälligen Zahl zusammen und kann daher nicht geändert werden.";
		};
		class anzeige_handynr: DWEV_RscStructuredText
		{
			idc = 70015;

			x = 0.15;
			y = 0.6;
			w = 0.425001;
			h = 0.04;
			tooltip = "Deine Handynummer setzt sich aus Zufallszahlen und deiner Arma 3 SpielerID zusammen und kann daher nicht geändert werden.";
		};
		class anzeige_alter: DWEV_RscStructuredText
		{
			idc = 70005;
			text = "";
			class Attributes				{				align = "center";			 };

			x = 0.162499;
			y = 0.18;
			w = 0.1;
			h = 0.04;
		};
		class bild_perso: DWEV_RscPicture
		{
			idc = 70017;

			text = "#(argb,8,8,3)color(1,1,1,1)";
			x = 0.597969 * safezoneW + safezoneX;
			y = 0.258 * safezoneH + safezoneY;
			w = 0.0928125 * safezoneW;
			h = 0.198 * safezoneH;
		};
		class eingabe_neuerName: DWEV_RscEdit
		{
			idc = 70002;
			text = "";

			x = 0.45;
			y = 0.06;
			w = 0.22;
			h = 0.04;
			colorText[] = {1,1,1,1};
			tooltip = "Neuen Namen hier eingeben. Mindestens 4 Zeichen und maximal 16 Zeichen.";
		};
		class eingabe_neuerVorName: DWEV_RscEdit
		{
			idc = 70019;
			text = "";

			x = 0.20;
			y = 0.06;
			w = 0.22;
			h = 0.04;
			colorText[] = {1,1,1,1};
			tooltip = "Vornamen hier eingeben. Mindestens 4 Zeichen und maximal 16 Zeichen. Clantags und Sonderzeichen sind nicht erlaubt!";
		};
		class haken_profilnameAendern: DWEV_Checkbox
		{
			idc = 70001;

			x = 0.16;
			y = 0.06;
			w = 0.0375;
			h = 0.04;
			tooltip = "Haken setzen, wenn du dein Profilnamen im Anschluss selbst mit ändern möchtest.";
			onCheckedChanged	= "if(!DWEV_namen_a) then {DWEV_namen_a = true; systemChat 'Du möchtest also deinen Spielernamen ändern.';} else {DWEV_namen_a = false;systemChat 'Spielername doch nicht ändern.';};";
		};
	};
};