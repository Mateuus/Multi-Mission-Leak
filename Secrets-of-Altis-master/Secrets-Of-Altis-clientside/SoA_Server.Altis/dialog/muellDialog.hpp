class Muell_menue 
{
	idd = 99991;
	name = "muelldialog";
	movingEnabled = false;
	enableSimulation = true;
	
	class controlsBackground {
		
		class tabletbackground1: Life_RscPicture
		{
			idc = -1;
			text = "#(argb,8,8,3)color(0.8,0.4,0,1)";
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

		class background: Life_RscText
		{
			idc = -1;
			x = 0.29375 * safezoneW + safezoneX;
			y = 0.302 * safezoneH + safezoneY;
			w = 0.4125 * safezoneW;
			h = 0.451 * safezoneH;
			colorBackground[] = {0,0,0,0.5};
		};

		class maintitle: Life_RscText
		{
			idc = -1;
			text = "Müllabfuhr Altis";
			x = 0.29375 * safezoneW + safezoneX;
			y = 0.247 * safezoneH + safezoneY;
			w = 0.4125 * safezoneW;
			h = 0.044 * safezoneH;
			colorBackground[] = {1,1,1,0.5};
		};

		class infotext: Life_RscStructuredText
		{
			idc = -1;
			text = "Dies ist das Müllabfuhr-System der Insel Altis. <br/><br/>Du benötigst eine Mülltonne und ein dafür zuständiges Fahrzeug: <br/><br/>• Geländewagen <br/>• Zamak Abgedeckt <br/><br/>Eine Müllmission startest du bei den örtlichen Müllinformationen auf Altis.<br/><br/>Wir wünschen angenehme Fahrt.";
			x = 0.438125 * safezoneW + safezoneX;
			y = 0.313 * safezoneH + safezoneY;
			w = 0.262969 * safezoneW;
			h = 0.429 * safezoneH;
			colorBackground[] = {1,1,1,0.3};
		};
	};
	
	class controls {
		class muellbtn1: life_RscButtonMenu 
		{
			idc = 99982;
			text = "Zu weit weg";
			onButtonClick="";
			x = 0.304062 * safezoneW + safezoneX;
			y = 0.313 * safezoneH + safezoneY;
			w = 0.12375 * safezoneW;
			h = 0.044 * safezoneH;
			size = 0.0255;
		};
		class muellbtn2: life_RscButtonMenu 
		{
			idc = 99983;
			text = "Zu weit weg";
			onButtonClick="";
			x = 0.304062 * safezoneW + safezoneX;
			y = 0.379 * safezoneH + safezoneY;
			w = 0.12375 * safezoneW;
			h = 0.044 * safezoneH;
			size = 0.0255;
		};
		class muelbtn3: life_RscButtonMenu 
		{
			idc = -1;
			text = "Schliessen"; //--- ToDo: Localize;
			onButtonClick="closedialog 0;";
			x = 0.304062 * safezoneW + safezoneX;
			y = 0.698 * safezoneH + safezoneY;
			w = 0.12375 * safezoneW;
			h = 0.044 * safezoneH;
			size = 0.025;
		};
	};
};


class Muell_Infomenue {
	idd = 99992;
	name = "muellinfodialog";
	movingEnabled = false;
	enableSimulation = true;
	
	class controlsBackground {
		class life_RscTitleBackground:life_RscText {
			idc = -1;
			colorBackground[] = {0.4,0,0,0.5};
			x = 0.396904 * safezoneW + safezoneX;
			y = 0.357018 * safezoneH + safezoneY;
			w = 0.175263 * safezoneW;
			h = 0.274965 * safezoneH;
		};
		class muellinfo_oben: life_RscText
		{
			idc = -1;
			text = "Informationsstelle für Müllsammlung"; //--- ToDo: Localize;
			x = 0.407214 * safezoneW + safezoneX;
			y = 0.368017 * safezoneH + safezoneY;
			w = 0.159798 * safezoneW;
			h = 0.0219972 * safezoneH;
		};
		class muellinfo_text1: life_RscText
		{
			idc = -1;
			text = "Wähle deine Stadt:";
			x = 0.412369 * safezoneW + safezoneX;
			y = 0.412011 * safezoneH + safezoneY;
			w = 0.108251 * safezoneW;
			h = 0.0219972 * safezoneH;
		};
		class muellinfo_text2: life_RscText
		{
			idc = -1;
			text = "Wähle den Umkreis:"; //--- ToDo: Localize;
			x = 0.412369 * safezoneW + safezoneX;
			y = 0.467004 * safezoneH + safezoneY;
			w = 0.108251 * safezoneW;
			h = 0.0219972 * safezoneH;
		};
		class muellinfo_text3: life_RscText
		{
			idc = -1;
			text = "Wähle Farbe für Markierung:"; //--- ToDo: Localize;
			x = 0.412369 * safezoneW + safezoneX;
			y = 0.521997 * safezoneH + safezoneY;
			w = 0.134024 * safezoneW;
			h = 0.0219972 * safezoneH;
		};
		class muellinfo_lineunten: life_RscText
		{
			idc = -1;
			colorBackground[] = {0.4,0,0,0.5};
			x = 0.396904 * safezoneW + safezoneX;
			y = 0.587989 * safezoneH + safezoneY;
			w = 0.175263 * safezoneW;
			h = 0.0439943 * safezoneH;
		};
		class muellinfo_summe: life_RscText
		{
			idc = -1;
			text = "Endsumme:"; //--- ToDo: Localize;
			colorText[] = {1,1,1,1};
			sizeEx = 0.045;
			x = 0.412369 * safezoneW + safezoneX;
			y = 0.600987 * safezoneH + safezoneY;
			w = 0.0618574 * safezoneW;
			h = 0.0219972 * safezoneH;
		};
	};
	
	class controls {
		class muellinfo_dropdownStadt: life_RscCombo
		{
			idc = 99993;
			onLBSelChanged = "[] spawn life_fnc_MuellInfoChange;";
			colorBackground[] = {0,0,0,0.7};
			x = 0.412369 * safezoneW + safezoneX;
			y = 0.434009 * safezoneH + safezoneY;
			w = 0.144334 * safezoneW;
			h = 0.0219972 * safezoneH;
		};
		class muellinfo_dropdownDistance: life_RscCombo
		{
			idc = 99994;
			onLBSelChanged = "[] spawn life_fnc_MuellInfoChange;";
			colorBackground[] = {0,0,0,0.7};
			x = 0.412369 * safezoneW + safezoneX;
			y = 0.489001 * safezoneH + safezoneY;
			w = 0.144334 * safezoneW;
			h = 0.0219972 * safezoneH;
		};
		class muellinfo_dropdownFarbe: life_RscCombo
		{
			idc = 99995;
			onLBSelChanged = "[] spawn life_fnc_MuellInfoChange;";
			colorBackground[] = {0,0,0,0.7};
			x = 0.412369 * safezoneW + safezoneX;
			y = 0.543994 * safezoneH + safezoneY;
			w = 0.144334 * safezoneW;
			h = 0.0219972 * safezoneH;
		};
		class muellinfo_summeText: life_RscText
		{
			idc = 99996;
			text = ""; //--- ToDo: Localize;
			colorText[] = {0.98,0.2,0.1,1};
			sizeEx = 0.045;
			x = 0.479381 * safezoneW + safezoneX;
			y = 0.600987 * safezoneH + safezoneY;
			w = 0.0670122 * safezoneW;
			h = 0.0219972 * safezoneH;
		};
		class muellinfo_fertigbutton: life_RscButtonMenu
		{
			idc = -1;
			text = "Fertig"; //--- ToDo: Localize;
			onButtonClick = "[] spawn life_fnc_MuellInfoFinish;";
			x = 0.396904 * safezoneW + safezoneX;
			y = 0.631984 * safezoneH + safezoneY;
			w = 0.175263 * safezoneW;
			h = 0.0219972 * safezoneH;
		};
		class muellinfo_closebutton: life_RscButtonMenu
		{
			idc = -1;
			text = "Schliessen"; //--- ToDo: Localize;
			onButtonClick = "closedialog 0;";
			x = 0.396904 * safezoneW + safezoneX;
			y = 0.653982 * safezoneH + safezoneY;
			w = 0.175263 * safezoneW;
			h = 0.0219972 * safezoneH;
		};
	};
};