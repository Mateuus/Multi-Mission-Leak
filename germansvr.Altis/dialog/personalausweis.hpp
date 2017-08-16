/*
	by AustrianNoob
*/
class personalausweis_60000
{
    idd = 60000;
	name = "personalausweis_60000";
    movingEnable = false;
    enableSimulation = true; //Default: true
	onLoad = "";
	class controlsBackground
	{
		class total_background: Life_RscText
		{
			idc = -1;
			x = 0.3 * safezoneW + safezoneX;
			y = 0.268 * safezoneH + safezoneY;
			w = 0.4 * safezoneW;
			h = 0.496 * safezoneH;
			colorBackground[] = {0,0,0,1};
			colorActive[] = {0,0,0,1};
		};
		class titel_leiste: Life_RscStructuredText
		{
			idc = -1;
			text = "Einbürgerungsamt"; 
			x = 0.3 * safezoneW + safezoneX;
			y = 0.24 * safezoneH + safezoneY;
			w = 0.4 * safezoneW;
			h = 0.024 * safezoneH;
			colorText[] = {255,255,255,1};
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
		};
		class text_gangname: Life_RscText
		{
			idc = -1;
			text = "Gangtag:"; 
			x = 0.326031 * safezoneW + safezoneX;
			y = 0.288 * safezoneH + safezoneY;
			w = 0.0625 * safezoneW;
			h = 0.02 * safezoneH;
			colorText[] = {255,255,255,1};
		};
		class text_vorname: Life_RscText
		{
			idc = -1;
			text = "Vorname:"; 
			x = 0.326031 * safezoneW + safezoneX;
			y = 0.328 * safezoneH + safezoneY;
			w = 0.0625 * safezoneW;
			h = 0.02 * safezoneH;
			colorText[] = {255,255,255,1};
		};
		class text_nachname: Life_RscText
		{
			idc = 1003;
			text = "Nachname:"; 
			x = 0.32 * safezoneW + safezoneX;
			y = 0.368 * safezoneH + safezoneY;
			w = 0.0625 * safezoneW;
			h = 0.02 * safezoneH;
			colorText[] = {255,255,255,1};
		};
		class text_geschlecht: Life_RscText
		{
			idc = -1;
			text = "Geschlecht:"; 
			x = 0.3175 * safezoneW + safezoneX;
			y = 0.492 * safezoneH + safezoneY;
			w = 0.0625 * safezoneW;
			h = 0.02 * safezoneH;
			colorText[] = {255,255,255,1};
		};
		class text_groesse: Life_RscText
		{
			idc = -1;
			text = "Größe:"; 
			x = 0.335 * safezoneW + safezoneX;
			y = 0.532 * safezoneH + safezoneY;
			w = 0.0625 * safezoneW;
			h = 0.02 * safezoneH;
			colorText[] = {255,255,255,1};
		};
		class text_gewicht: Life_RscText
		{
			idc = -1;
			text = "Gewicht:"; 
			x = 0.3275 * safezoneW + safezoneX;
			y = 0.568 * safezoneH + safezoneY;
			w = 0.0625 * safezoneW;
			h = 0.02 * safezoneH;
			colorText[] = {255,255,255,1};
		};
		class text_geburtsdatum: Life_RscText
		{
			idc = -1;
			text = "Geburtsdatum:"; 
			x = 0.3075 * safezoneW + safezoneX;
			y = 0.648 * safezoneH + safezoneY;
			w = 0.0625 * safezoneW;
			h = 0.02 * safezoneH;
			colorText[] = {255,255,255,1};
		};
		class text_telefon: Life_RscText
		{
			idc = -1;
			text = "Telefonnummer:"; 
			x = 0.3025 * safezoneW + safezoneX;
			y = 0.408 * safezoneH + safezoneY;
			w = 0.0625 * safezoneW;
			h = 0.02 * safezoneH;
			colorText[] = {255,255,255,1};
		};
	};
	class controls
	{
		class edit_gangname: Life_RscEdit
		{
			idc = 60002;
			text = "";
			x = 0.375 * safezoneW + safezoneX;
			y = 0.288 * safezoneH + safezoneY;
			w = 0.1 * safezoneW;
			h = 0.024 * safezoneH;
			colorText[] = {255,255,255,1};
			colorBackground[] = {0,0,0,0.6};
			colorActive[] = {0,0,0,0.6};
		};
		class edit_vorname: Life_RscEdit
		{
			idc = 60003;
			text = "";
			x = 0.375 * safezoneW + safezoneX;
			y = 0.328 * safezoneH + safezoneY;
			w = 0.1 * safezoneW;
			h = 0.024 * safezoneH;
			colorText[] = {255,255,255,1};
			colorBackground[] = {0,0,0,0.6};
			colorActive[] = {0,0,0,0.6};
		};
		class edit_nachname: Life_RscEdit
		{
			idc = 60004;
			text = "";
			x = 0.375 * safezoneW + safezoneX;
			y = 0.368 * safezoneH + safezoneY;
			w = 0.1 * safezoneW;
			h = 0.024 * safezoneH;
			colorText[] = {255,255,255,1};
			colorBackground[] = {0,0,0,0.6};
			colorActive[] = {0,0,0,0.6};
		};
		class Telefonnummer: Life_RscEdit
		{
			idc = 60011;
			text = "";
			x = 0.375 * safezoneW + safezoneX;
			y = 0.408 * safezoneH + safezoneY;
			w = 0.1 * safezoneW;
			h = 0.024 * safezoneH;
			colorText[] = {255,255,255,1};
			colorBackground[] = {0,0,0,0.6};
			colorActive[] = {0,0,0,0.6};
		};
		class edit_geschlecht: Life_RscCombo
		{
			idc = 60005;
			x = 0.375 * safezoneW + safezoneX;
			y = 0.488 * safezoneH + safezoneY;
			w = 0.1 * safezoneW;
			h = 0.024 * safezoneH;
			colorText[] = {255,255,255,1};
		};
		class edit_groesse: Life_RscCombo
		{
			idc = 60006;
			x = 0.375 * safezoneW + safezoneX;
			y = 0.528 * safezoneH + safezoneY;
			w = 0.1 * safezoneW;
			h = 0.024 * safezoneH;
			colorText[] = {255,255,255,1};
		};
		class edit_gewicht: Life_RscCombo
		{
			idc = 60007;
			x = 0.375 * safezoneW + safezoneX;
			y = 0.568 * safezoneH + safezoneY;
			w = 0.1 * safezoneW;
			h = 0.024 * safezoneH;
			colorText[] = {255,255,255,1};
		};
		class edit_tag_geburtsdatum: Life_RscCombo
		{
			idc = 60008;
			x = 0.375 * safezoneW + safezoneX;
			y = 0.648 * safezoneH + safezoneY;
			w = 0.0375 * safezoneW;
			h = 0.024 * safezoneH;
			colorText[] = {255,255,255,1};
		};
		class edit_monat_geburtsdatum: Life_RscCombo
		{
			idc = 60009;
			x = 0.42 * safezoneW + safezoneX;
			y = 0.648 * safezoneH + safezoneY;
			w = 0.0375 * safezoneW;
			h = 0.024 * safezoneH;
			colorText[] = {255,255,255,1};
			onLBSelChanged = "[] call life_fnc_updateTag";
		};
		class edit_jahr_geburtsdatum: Life_RscCombo
		{
			idc = 60010;
			x = 0.465 * safezoneW + safezoneX;
			y = 0.648 * safezoneH + safezoneY;
			w = 0.0575 * safezoneW;
			h = 0.024 * safezoneH;
			colorText[] = {255,255,255,1};
			onLBSelChanged = "[] call life_fnc_updateMonat";
		};
		class geburtsdatum_punkt1: Life_RscText
		{
			idc = -1;
			text = "."; 
			x = 0.4125 * safezoneW + safezoneX;
			y = 0.644 * safezoneH + safezoneY;
			w = 0.0125 * safezoneW;
			h = 0.04 * safezoneH;
			colorText[] = {255,255,255,1};
		};
		class geburtsdatum_punkt2: Life_RscText
		{
			idc = -1;
			text = "."; 
			x = 0.4575 * safezoneW + safezoneX;
			y = 0.644 * safezoneH + safezoneY;
			w = 0.0125 * safezoneW;
			h = 0.04 * safezoneH;
			colorText[] = {255,255,255,1};
		};
		class Life_RscPicture_1200: Life_RscPicture
		{
			idc = 60013;
			text = "";
			x = 0.59 * safezoneW + safezoneX;
			y = 0.288 * safezoneH + safezoneY;
			w = 0.225;
			h = 0.36;
		};
		class edit_picture: Life_RscCombo
		{
			idc = 60012;
			x = 0.59 * safezoneW + safezoneX;
			y = 0.5 * safezoneH + safezoneY;
			w = 0.1 * safezoneW;
			h = 0.02 * safezoneH;
			onLBSelChanged = "[] call life_fnc_updatePersoBild";
		};
		class checkbox1: Life_Checkbox
		{
			idc = 60100;
			x = 0.585 * safezoneW + safezoneX;
			y = 0.536 * safezoneH + safezoneY;
			w = 0.025 * safezoneW;
			h = 0.04 * safezoneH;
			onCheckedChanged    = "if(!life_hakenregeln) then {life_hakenregeln = true; systemChat localize 'STR_IDCard_check_rulesOK';} else {life_hakenregeln = false;systemChat localize 'STR_IDCard_check_rulesNOK';};";
			textureChecked = "icons\haken_checked.paa";        //Texture of checked CheckBox.
			textureUnchecked = "icons\haken_unchecked.paa";        //Texture of unchecked CheckBox.
			textureFocusedChecked = "icons\haken_checked.paa";    //Texture of checked focused CheckBox (Could be used for showing different texture when focused).
			textureFocusedUnchecked = "icons\haken_unchecked.paa";    //Texture of unchecked focused CheckBox.
			textureHoverChecked = "icons\haken_checked.paa";
			textureHoverUnchecked = "icons\haken_unchecked.paa";
			texturePressedChecked = "icons\haken_checked.paa";
			texturePressedUnchecked = "icons\haken_unchecked.paa";
			textureDisabledChecked = "icons\haken_checked.paa";
			textureDisabledUnchecked = "icons\haken_unchecked.paa";
			tooltip = "Ich akzeptiere die Serverregeln und habe diese gelesen und Missverstaendnisse aufgeklaert!";
		};
		class checkbox2: Life_Checkbox
		{
			idc = 60300;
			x = 0.6125 * safezoneW + safezoneX;
			y = 0.536 * safezoneH + safezoneY;
			w = 0.025 * safezoneW;
			h = 0.04 * safezoneH;
			onCheckedChanged    = "if(!life_hakenrichtig) then {life_hakenrichtig = true; systemChat localize 'STR_IDCard_check_richtig';} else {life_hakenrichtig = false; systemChat localize 'STR_IDCard_check_nrichtig';};";
			textureChecked = "icons\haken_checked.paa";        //Texture of checked CheckBox.
			textureUnchecked = "icons\haken_unchecked.paa";        //Texture of unchecked CheckBox.
			textureFocusedChecked = "icons\haken_checked.paa";    //Texture of checked focused CheckBox (Could be used for showing different texture when focused).
			textureFocusedUnchecked = "icons\haken_unchecked.paa";    //Texture of unchecked focused CheckBox.
			textureHoverChecked = "icons\haken_checked.paa";
			textureHoverUnchecked = "icons\haken_unchecked.paa";
			texturePressedChecked = "icons\haken_checked.paa";
			texturePressedUnchecked = "icons\haken_unchecked.paa";
			textureDisabledChecked = "icons\haken_checked.paa";
			textureDisabledUnchecked = "icons\haken_unchecked.paa";
			tooltip = "$STR_IDCard_check_ttip";
		};
		class checkbox3: Life_Checkbox
		{
			idc = 60200;
			x = 0.64 * safezoneW + safezoneX;
			y = 0.536 * safezoneH + safezoneY;
			w = 0.025 * safezoneW;
			h = 0.04 * safezoneH;
			onCheckedChanged    = "if(!life_hakendaten) then {life_hakendaten = true; systemChat localize 'STR_IDCard_check_persAngabenOK';} else {life_hakendaten = false; systemChat localize 'STR_IDCard_check_persAngabenNOK';};";
			textureChecked = "icons\haken_checked.paa";        //Texture of checked CheckBox.
			textureUnchecked = "icons\haken_unchecked.paa";        //Texture of unchecked CheckBox.
			textureFocusedChecked = "icons\haken_checked.paa";    //Texture of checked focused CheckBox (Could be used for showing different texture when focused).
			textureFocusedUnchecked = "icons\haken_unchecked.paa";    //Texture of unchecked focused CheckBox.
			textureHoverChecked = "icons\haken_checked.paa";
			textureHoverUnchecked = "icons\haken_unchecked.paa";
			texturePressedChecked = "icons\haken_checked.paa";
			texturePressedUnchecked = "icons\haken_unchecked.paa";
			textureDisabledChecked = "icons\haken_checked.paa";
			textureDisabledUnchecked = "icons\haken_unchecked.paa";
			tooltip = "$STR_IDCard_check_persAngabenttip";
		};
		class checkbox4: Life_Checkbox
		{
			idc = 60400;
			x = 0.6675 * safezoneW + safezoneX;
			y = 0.536 * safezoneH + safezoneY;
			w = 0.025 * safezoneW;
			h = 0.04 * safezoneH;
			onCheckedChanged  = "if(!life_namenInfo) then {life_namenInfo = true; systemChat localize 'STR_IDCard_check_persHinweisOK';} else {life_namenInfo = false;systemChat localize 'STR_IDCard_check_persHinweisNOK';};";
			textureChecked = "icons\haken_checked.paa";        //Texture of checked CheckBox.
			textureUnchecked = "icons\haken_unchecked.paa";        //Texture of unchecked CheckBox.
			textureFocusedChecked = "icons\haken_checked.paa";    //Texture of checked focused CheckBox (Could be used for showing different texture when focused).
			textureFocusedUnchecked = "icons\haken_unchecked.paa";    //Texture of unchecked focused CheckBox.
			textureHoverChecked = "icons\haken_checked.paa";
			textureHoverUnchecked = "icons\haken_unchecked.paa";
			texturePressedChecked = "icons\haken_checked.paa";
			texturePressedUnchecked = "icons\haken_unchecked.paa";
			textureDisabledChecked = "icons\haken_checked.paa";
			textureDisabledUnchecked = "icons\haken_unchecked.paa";
			tooltip = "Dein aktueller Profilname wird als RP-Name hinterlegt. Dieser Name kann nur im Buergerbuero geaendert werden, wenn du Zivilist bist. Solltest du dich mit der Zeit mit einem anderen Profilnamen einloggen, so wird die Mission vorerst beendet. Solltest du deinen Namen aendern wollen, wende dich bitte an das Buergerbuero in Pyrgos. Nach der Beantragung des Personalausweises musst du nach Pyrgos und dir die Einbuergerungslizenz abholen, um weitere Spawnstaedte freischalten zu koennen.";
		};
		class button_senden: Life_RscButton
		{
			idc = -1;
			text = "Senden"; 
			x = 0.59 * safezoneW + safezoneX;
			y = 0.596 * safezoneH + safezoneY;
			w = 0.1 * safezoneW;
			h = 0.04 * safezoneH;
			colorText[] = {255,255,255,1};
			colorBackground[] = {0,0,0,1};
			colorActive[] = {0,0,0,1};
			onButtonClick="[] call life_fnc_persoBeantragen;";
			colorShadow[] = {0,0,0,0};
			type = 1;access = 0;
		};
		class button_help: Life_RscButton
		{
			idc = -1;
			text = "Hilfe-Menü"; 
			x = 0.59 * safezoneW + safezoneX;
			y = 0.652 * safezoneH + safezoneY;
			w = 0.1 * safezoneW;
			h = 0.04 * safezoneH;
			colorText[] = {255,255,255,1};
			colorBackground[] = {0,0,0,1};
			colorActive[] = {0,0,0,1};
			action = "createDialog 'holy_help'";
			type = 1;access = 0;
			colorShadow[] = {0,0,0,0};
		};
		class button_abbruch: Life_RscButton
		{
			idc = -1;
			text = "Abbrechen"; 
			x = 0.59 * safezoneW + safezoneX;
			y = 0.708 * safezoneH + safezoneY;
			w = 0.1 * safezoneW;
			h = 0.04 * safezoneH;
			colorText[] = {255,255,255,1};
			colorBackground[] = {0,0,0,1};
			colorActive[] = {0,0,0,1};
			onButtonClick="endMission '-'";
			type = 1;access = 0;
			colorShadow[] = {0,0,0,0};
		};
		class Life_RscText_1011: Life_RscText
		{
			idc = -1;
			text = "?"; 
			x = 0.4775 * safezoneW + safezoneX;
			y = 0.288 * safezoneH + safezoneY;
			w = 0.0125 * safezoneW;
			h = 0.02 * safezoneH;
			colorText[] = {255,255,255,1};
			tooltip = "Bitte geben Sie ihren Gangtag ein! Bsp.: [AAF] oder [NATO-R] oder lasse ihn leer"; 
		};
		class Life_RscText_1012: Life_RscText
		{
			idc = -1;
			text = "?"; 
			x = 0.4775 * safezoneW + safezoneX;
			y = 0.328 * safezoneH + safezoneY;
			w = 0.0125 * safezoneW;
			h = 0.02 * safezoneH;
			colorText[] = {255,255,255,1};
			tooltip = "Bitte geben Sie einen Vornamen ein! Bsp.: Max oder Franz"; 
		};
		class Life_RscText_1013: Life_RscText
		{
			idc = -1;
			text = "?"; 
			x = 0.4775 * safezoneW + safezoneX;
			y = 0.368 * safezoneH + safezoneY;
			w = 0.0125 * safezoneW;
			h = 0.02 * safezoneH;
			colorText[] = {255,255,255,1};
			tooltip = "Bitte geben Sie einen Vornamen ein! Bsp.: Petrovic oder Maier"; 
		};
		class Life_RscText_1014: Life_RscText
		{
			idc = -1;
			text = "?"; 
			x = 0.4775 * safezoneW + safezoneX;
			y = 0.408 * safezoneH + safezoneY;
			w = 0.0125 * safezoneW;
			h = 0.02 * safezoneH;
			colorText[] = {255,255,255,1};
			tooltip = "Bitte geben Sie eine Telefonnummer ein! Bsp.: 06645135152 oder 067555622-01"; 
		};
		class Life_RscText_1015: Life_RscText
		{
			idc = -1;
			text = "?"; 
			x = 0.4775 * safezoneW + safezoneX;
			y = 0.492 * safezoneH + safezoneY;
			w = 0.0125 * safezoneW;
			h = 0.02 * safezoneH;
			colorText[] = {255,255,255,1};
			tooltip = "Bitte wählen Sie Ihr Geschlecht aus!"; 
		};
		class Life_RscText_1016: Life_RscText
		{
			idc = -1;
			text = "?"; 
			x = 0.477292 * safezoneW + safezoneX;
			y = 0.527815 * safezoneH + safezoneY;
			w = 0.0125 * safezoneW;
			h = 0.02 * safezoneH;
			colorText[] = {255,255,255,1};
			tooltip = "Bitte wählen Sie Ihre Größe aus!"; 
		};
		class Life_RscText_1017: Life_RscText
		{
			idc = -1;
			text = "?"; 
			x = 0.476458 * safezoneW + safezoneX;
			y = 0.567 * safezoneH + safezoneY;
			w = 0.0125 * safezoneW;
			h = 0.02 * safezoneH;
			colorText[] = {255,255,255,1};
			tooltip = "Bitte wählen Sie Ihr Gewicht aus!"; 
		};
		class Life_RscText_1018: Life_RscText
		{
			idc = -1;
			text = "?"; 
			x = 0.523229 * safezoneW + safezoneX;
			y = 0.646963 * safezoneH + safezoneY;
			w = 0.0125 * safezoneW;
			h = 0.02 * safezoneH;
			colorText[] = {255,255,255,1};
			tooltip = "Bitte wählen Sie Ihr Geburtsdatum aus!"; 
		};
	};
};