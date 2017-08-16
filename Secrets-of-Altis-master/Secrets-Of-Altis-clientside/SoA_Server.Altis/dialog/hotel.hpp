class hotel {

	idd = 8500;
	enableSimulation = 1;
	movingEnabled = 0;

	class controlsBackground {

		class background: Life_RscText
		{
			idc = -1;
			x = 0.29375 * safezoneW + safezoneX;
			y = 0.225 * safezoneH + safezoneY;
			w = 0.4125 * safezoneW;
			h = 0.55 * safezoneH;
			colorBackground[] = {0,0,0,0.5};
		};

		class titlebackground: Life_RscText
		{
			idc = -1;
			text = "Hotel - Check In";
			x = 0.29375 * safezoneW + safezoneX;
			y = 0.225 * safezoneH + safezoneY;
			w = 0.4125 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {1,1,1,0.5};
		};


		class textbox: Life_RscStructuredText
		{
			idc = -1;
			text = "<br/>Willkommen im Hotel Casablanca, ein Spitzenhotel der 'Siegbert und Schnösel' Gruppe. <br/><br/>Wir bieten Ihnen eine kostenlose Übernachtungsmöglichkeit, bei der wir Ihnen finanziell unter die Arme greifen.<br/><br/>In den Hotels der Insel Altis kannst du einchecken, wenn du einmal abwesend sein solltest. Als Belohnung für deine indirekte Treue und Aktivität erhältst du alle 10 Minuten eine kleine Geldprämie in Höhe von 2.500€ zusätzlich zu deinem normalen Gehaltscheck.<br/><br/><br/>Leider können wir die Zimmer nur für maximal 60* Minuten vermieten, da die Nachfrage zu hoch ist. Solltest du länger als 60* Minuten abwesend sein, so bucht dir das Hotel einen automatischen Rückflug.<br/><br/>*(30 Minuten bei All Inclusive)";
			x = 0.298906 * safezoneW + safezoneX;
			y = 0.258 * safezoneH + safezoneY;
			w = 0.402187 * safezoneW;
			h = 0.319 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,0};
		};

		class allinctext: Life_RscStructuredText
		{
			idc = -1;
			text = "Getränke, Speisen, medizinische Versorgung, Nutzung der Sanitäranlagen sind mit inbegriffen.";
			x = 0.438125 * safezoneW + safezoneX;
			y = 0.632 * safezoneH + safezoneY;
			w = 0.134062 * safezoneW;
			h = 0.099 * safezoneH;
			sizeEx = 0.03;
			size = 0.03;
			colorText[] = {0,0,0,1};
			colorBackground[] = {0,0,0,0.3};
		};

		class normaltext: RscStructuredText
		{
			idc = -1;
			text = "Diese Übernachtungsvariante enthält ausschließlich die Nutzung der Sanitäranlagen und Betten.";
			x = 0.298906 * safezoneW + safezoneX;
			y = 0.632 * safezoneH + safezoneY;
			w = 0.134062 * safezoneW;
			h = 0.099 * safezoneH;
			sizeEx = 0.03;
			size = 0.03;
			colorText[] = {0,0,0,1};
			colorBackground[] = {0,0,0,0.3};
		};

		class hotelpic: Life_RscPicture
		{
			idc = -1;
			text = "images\hotel.paa";
			x = 0.587656 * safezoneW + safezoneX;
			y = 0.632 * safezoneH + safezoneY;
			w = 0.108281 * safezoneW;
			h = 0.099 * safezoneH;
		};
	};

	class controls {

		class allinclusivebutton: Life_RscButtonMenu
		{
			idc = 8501;
			text = "All Inclusive";
			OnButtonClick = "[1] spawn life_fnc_hotel";
			style = 2;
			x = 0.438125 * safezoneW + safezoneX;
			y = 0.731 * safezoneH + safezoneY;
			w = 0.134062 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class normalbutton: Life_RscButtonMenu
		{
			idc = 8502;
			text = "Einfache Übernachtung";
			OnButtonClick = "[0] spawn life_fnc_hotel";
			style = 2;
			x = 0.298906 * safezoneW + safezoneX;
			y = 0.731 * safezoneH + safezoneY;
			w = 0.134062 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class closebtn: Life_RscButtonMenu
		{
			idc = -1;
			text = "X";
			OnButtonClick = "closedialog 0";
			x = 0.690781 * safezoneW + safezoneX;
			y = 0.225 * safezoneH + safezoneY;
			w = 0.0154688 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {1,0,0,1};
		};
	};
};

class hotelaufstehen {

	idd = 8510;
	enableSimulation = 1;
	movingEnabled = 0;

	class controlsBackground {};

	class controls {

		class closebtn: Life_RscButtonMenu
		{
			idc = -1;
			text = "Aufstehen";
			OnButtonClick = "[2] call life_fnc_hotel";
			x = 0.89703 * safezoneW + safezoneX;
			y = 0.929 * safezoneH + safezoneY;
			w = 0.0876563 * safezoneW;
			h = 0.044 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {1,0,0,0.5};
		};
	};
};