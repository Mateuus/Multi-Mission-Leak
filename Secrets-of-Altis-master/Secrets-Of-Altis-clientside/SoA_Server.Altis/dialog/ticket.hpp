class bussgeld_erhalten {

	idd = 2650;
	movingEnable = 1;
	EnableSimulation = 1;

	class controlsBackground {

		class hintergrund: Life_RscPicture
		{
			idc = 2000;
			text = "images\strafzettel.paa";
			x = 0.336042 * safezoneW + safezoneX;
			y = 0.204852 * safezoneH + safezoneY;
			w = 0.328958 * safezoneW;
			h = 0.591222 * safezoneH;
		};
	};

	class controls {

		class rsc_text_Strafsumme: Life_RscText
		{
			idc = 2651;
			text = "";
			sizeEx = 0.05;
			shadow = 0;
			x = 0.498958 * safezoneW + safezoneX;
			y = 0.683297 * safezoneH + safezoneY;
			w = 0.0701562 * safezoneW;
			h = 0.033 * safezoneH;
			colorBackground[] = {-1,-1,-1,0};
			colorText[] = {0,0,0,1};
		};

		class text_namebeschuldigter: Life_RscText
		{
			idc = 2652;
			text = "";
			shadow = 0;
			x = 0.420833 * safezoneW + safezoneX;
			y = 0.336112 * safezoneH + safezoneY;
			w = 0.0805208 * safezoneW;
			h = 0.0172593 * safezoneH;
			colorBackground[] = {-1,-1,-1,0};
			colorText[] = {0,0,0,1};
		};

		class text_datum: Life_RscText
		{
			idc = 2653;
			text = "";
			shadow = 0;
			x = 0.531771 * safezoneW + safezoneX;
			y = 0.336111 * safezoneH + safezoneY;
			w = 0.07375 * safezoneW;
			h = 0.0163334 * safezoneH;
			colorBackground[] = {-1,-1,-1,0};
			colorText[] = {0,0,0,1};
		};

		class text_adresse: Life_RscText
		{
			idc = 2654;
			text = "";
			shadow = 0;
			x = 0.431249 * safezoneW + safezoneX;
			y = 0.361111 * safezoneH + safezoneY;
			w = 0.0701041 * safezoneW;
			h = 0.0172593 * safezoneH;
			colorBackground[] = {-1,-1,-1,0};
			colorText[] = {0,0,0,1};
		};

		class text_ortdesgeschehens: Life_RscText
		{
			idc = 2655;
			text = "";
			shadow = 0;
			x = 0.505729 * safezoneW + safezoneX;
			y = 0.387963 * safezoneH + safezoneY;
			w = 0.0997915 * safezoneW;
			h = 0.0163333 * safezoneH;
			colorBackground[] = {-1,-1,-1,0};
			colorText[] = {0,0,0,1};
		};

		class text_nationalitaet: Life_RscText
		{
			idc = 2656;
			text = "";
			shadow = 0;
			x = 0.447396 * safezoneW + safezoneX;
			y = 0.387963 * safezoneH + safezoneY;
			w = 0.0544791 * safezoneW;
			h = 0.0163334 * safezoneH;
			colorBackground[] = {-1,-1,-1,0};
			colorText[] = {0,0,0,1};
		};

		class texteingabe_uebermittlung: Life_RscStructuredText
		{
			idc = 2657;
			text = "";
			size = 0.04;
			sizeEx = 0.04;
			shadow = 0;
			x = 0.396875 * safezoneW + safezoneX;
			y = 0.467 * safezoneH + safezoneY;
			w = 0.211406 * safezoneW;
			h = 0.176 * safezoneH;
			colorBackground[] = {-1,-1,-1,0};
			colorText[] = {0,0,0,1};
			color[] = {0,0,0,1};
			colorFocused[] = {0,0,0,1};
			color2[] = {0,0,0,1};
			colorDisabled[] = {0,0,0,1};
		};

		class zahlen_button: Life_RscButtonMenu
		{
			idc = 2658;
			OnButtonClick = "";
			x = 0.544756 * safezoneW + safezoneX;
			y = 0.74024 * safezoneH + safezoneY;
			w = 0.0721354 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {-1,-1,-1,0};
			colorBackgroundFocused[] = {-1,-1,-1,0};
			colorBackground2[] = {-1,-1,-1,0};
			color[] = {1,1,1,0};
			colorFocused[] = {0,0,0,0};
			color2[] = {0,0,0,0};
			colorText[] = {1,1,1,1};
			colorDisabled[] = {0,0,0,0};
		};

		class verweigern_button: Life_RscButtonMenu
		{
			idc = 2659;
			OnButtonClick = "";
			x = 0.544791 * safezoneW + safezoneX;
			y = 0.769444 * safezoneH + safezoneY;
			w = 0.0721354 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {-1,-1,-1,0};
			colorBackgroundFocused[] = {-1,-1,-1,0};
			colorBackground2[] = {-1,-1,-1,0};
			color[] = {1,1,1,0};
			colorFocused[] = {0,0,0,0};
			color2[] = {0,0,0,0};
			colorText[] = {1,1,1,1};
			colorDisabled[] = {0,0,0,0};
		};
	};
};


class bussgeld_schreiben {

	idd = 2651;
	movingEnable = 1;
	EnableSimulation = 1;

	class controlsBackground {

		class hintergrund: Life_RscPicture
		{
			idc = 2000;
			text = "images\strafzettel.paa";
			x = 0.336042 * safezoneW + safezoneX;
			y = 0.204852 * safezoneH + safezoneY;
			w = 0.328958 * safezoneW;
			h = 0.591222 * safezoneH;
		};
	};

	class controls {

		class rsc_text_Strafsumme: Life_RscEdit
		{
			idc = 2651;
			text = "";
			x = 0.498958 * safezoneW + safezoneX;
			y = 0.683297 * safezoneH + safezoneY;
			w = 0.0701562 * safezoneW;
			h = 0.033 * safezoneH;
			colorBackground[] = {-1,-1,-1,0};
			colorText[] = {0,0,0,1};
		};

		class text_namebeschuldigter: Life_RscText
		{
			idc = 2652;
			text = "";
			x = 0.420833 * safezoneW + safezoneX;
			y = 0.336112 * safezoneH + safezoneY;
			w = 0.0805208 * safezoneW;
			h = 0.0172593 * safezoneH;
			colorBackground[] = {-1,-1,-1,0};
			colorText[] = {0,0,0,1};
		};

		class text_datum: Life_RscText
		{
			idc = 2653;
			text = "";
			x = 0.531771 * safezoneW + safezoneX;
			y = 0.336111 * safezoneH + safezoneY;
			w = 0.07375 * safezoneW;
			h = 0.0163334 * safezoneH;
			colorBackground[] = {-1,-1,-1,0};
			colorText[] = {0,0,0,1};
		};

		class text_ortdesgeschehens: Life_RscText
		{
			idc = 2654;
			text = "";
			x = 0.505729 * safezoneW + safezoneX;
			y = 0.387963 * safezoneH + safezoneY;
			w = 0.0997915 * safezoneW;
			h = 0.0163333 * safezoneH;
			colorBackground[] = {-1,-1,-1,0};
			colorText[] = {0,0,0,1};
		};

		class texteingabe_uebermittlung: Life_RscEdit
		{
			idc = 2655;
			text = "";
			size = 0.03;
			style = 16;
			htmlControl = 1;
			lineSpacing = 1;
			x = 0.396875 * safezoneW + safezoneX;
			y = 0.467 * safezoneH + safezoneY;
			w = 0.211406 * safezoneW;
			h = 0.176 * safezoneH;
			colorBackground[] = {-1,-1,-1,0};
			colorText[] = {0,0,0,1};
		};

		class uebergeben_btn: Life_RscButtonMenu
		{
			idc = 2001;
			OnButtonClick = "[1] call life_fnc_ticketAction; closedialog 0;";
			x = 0.448438 * safezoneW + safezoneX;
			y = 0.742 * safezoneH + safezoneY;
			w = 0.0721875 * safezoneW;
			h = 0.044 * safezoneH;
			colorBackground[] = {-1,-1,-1,0};
			colorBackgroundFocused[] = {-1,-1,-1,0};
			colorBackground2[] = {-1,-1,-1,0};
			color[] = {1,1,1,0};
			colorFocused[] = {0,0,0,0};
			color2[] = {0,0,0,0};
			colorText[] = {1,1,1,1};
			colorDisabled[] = {0,0,0,0};
		};
	};
};