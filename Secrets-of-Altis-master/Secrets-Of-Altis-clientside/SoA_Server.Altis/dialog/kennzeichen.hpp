class kennzeichen {

	idd = 7700;
	movingEnable = 0;
	enableSimulation = 1;

	class controlsBackground {

		class title: Life_RscText
		{
			idc = -1;
			text = "Kennzeichen beantragen";
			x = 0.29375 * safezoneW + safezoneX;
			y = 0.225 * safezoneH + safezoneY;
			w = 0.4125 * safezoneW;
			h = 0.044 * safezoneH;
			colorBackground[] = {1,1,1,0.5};
		};

		class kepplerlogo: Life_RscPicture
		{
			idc = -1;
			text = "images\automobile_blur.paa";
			x = 0.29375 * safezoneW + safezoneX;
			y = 0.357 * safezoneH + safezoneY;
			w = 0.4125 * safezoneW;
			h = 0.418 * safezoneH;
			colorText[] = {0.5,0.5,0.5,0.5};
		};

		class hilfetext: Life_RscStructuredText
		{
			idc = -1;
			text = "Vielen Dank für den Kauf deines Fahrzeugs. <br/>Wir benötigen noch dein Kennzeichen, bitte trage dies in folgendem Format (ohne Bindestrich) ein. (XX-123).<br/><br/>Vielen Dank, Ihr Wolfgang Keppler";
			x = 0.29375 * safezoneW + safezoneX;
			y = 0.269 * safezoneH + safezoneY;
			w = 0.4125 * safezoneW;
			h = 0.088 * safezoneH;
			colorBackground[] = {0,0,0,0.7};
		};
	};

	class controls {

		class cityauswahl: Life_RscCombo
		{
			idc = 7701;
			text = "XX";
			x = 0.438125 * safezoneW + safezoneX;
			y = 0.731 * safezoneH + safezoneY;
			w = 0.0464063 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0,0,0,0.6};
		};

		class eingabefeld: Life_RscEdit
		{
			idc = 7702;
			text = "XX123";
			x = 0.484531 * safezoneW + safezoneX;
			y = 0.731 * safezoneH + safezoneY;
			w = 0.0773437 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0,0,0,0.6};
		};

		class beantragenbutton: Life_RscButtonMenu
		{
			idc = -1;
			text = "Beantragen";
			onButtonClick = "[1] spawn life_fnc_kfzproof";
			x = 0.5825 * safezoneW + safezoneX;
			y = 0.731 * safezoneH + safezoneY;
			w = 0.113437 * safezoneW;
			h = 0.022 * safezoneH;
		};
	};
};

class kennzeichen_abfrage {

	idd = 7710;
	movingEnable = 0;
	enableSimulation = 1;

	class controlsbackground {

		class tabletbackground1: Life_RscPicture
		{
			idc = -1;
			text = "#(argb,8,8,3)color(0.1,0.1,0.1,1)";
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
		};
		
		class title: Life_RscText
		{
			idc = -1;
			text = "Kennzeichen überprüfen";
			//style = 2;
			x = 0.0125;
			y = 0.02;
			w = 0.975;
			h = 0.06;
			colorBackground[] = {1,1,1,0.5};
		};

		class texttitle: Life_RscText
		{
			idc = -1;
			text = "Kennzeicheneingabe"; 
			x = 0.298906 * safezoneW + safezoneX;
			y = 0.698 * safezoneH + safezoneY;
			w = 0.304219 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {1,1,1,0.5};
		};
	};

	class controls {

		class textfield: Life_RscEdit
		{
			idc = 7711;
			text = "";
			x = 0.0125;
			y = 0.92;
			w = 0.7375;
			h = 0.04;
		};

		class absendebutton: Life_RscButtonMenu
		{
			idc = -1;
			text = "Abfragen"; 
			OnButtonClick = "[2] call life_fnc_kfzproof";
			x = 0.618594 * safezoneW + safezoneX;
			y = 0.731 * safezoneH + safezoneY;
			w = 0.0825 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class Ausgabekennzeichen: Life_RscText
		{
			idc = 7712;
			text = "Kennzeichen:";
			style = 2;
			x = 0.365937 * safezoneW + safezoneX;
			y = 0.379 * safezoneH + safezoneY;
			w = 0.268125 * safezoneW;
			h = 0.055 * safezoneH;
			colorBackground[] = {1,1,1,0.5};
			sizeEx = 0.06;
		};

		class halterausgabe: Life_RscText
		{
			idc = 7713;
			text = "Halter:";
			style = 2;
			x = 0.365937 * safezoneW + safezoneX;
			y = 0.467 * safezoneH + safezoneY;
			w = 0.268125 * safezoneW;
			h = 0.055 * safezoneH;
			colorBackground[] = {1,1,1,0.5};
			sizeEx = 0.06;
		};

		class ButtonCancel: Life_RscButtonMenu
		{
			idc = -1;
			OnButtonClick = "closedialog 0; closedialog 0;";
			tooltip = "Schließen";
			x = 0.464646;
			y = 1.02188;
			w = 0.05;
			h = 0.06;
			colorBackground[] = {-1,-1,-1,0};
			colorBackgroundFocused[] = {-1,-1,-1,0};
			colorBackground2[] = {-1,-1,-1,0};
			color[] = {1,1,1,0};
			colorFocused[] = {0,0,0,0};
			color2[] = {0,0,0,0};
			colorText[] = {1,1,1,1};
			colorDisabled[] = {0,0,0,0};
		};
		
		class ButtonReturn: ButtonCancel
		{
			idc = -1;
			OnButtonClick = "closedialog 0;";
			tooltip = "Zurück";
			x = 0.54798;
			y = 1.02188;
			w = 0.05;
			h = 0.06;
		};
		
		class ButtonOhrstoepsel: ButtonCancel
		{
			idc = -1;
			OnButtonClick = "[] spawn life_fnc_fadeSound;";
			tooltip = "Ohrstöpsel verwenden";
			x = 0.616162;
			y = 1.02188;
			w = 0.05;
			h = 0.06;
		};
		
		class ButtonHome: ButtonCancel
		{
			idc = -1;
			OnButtonClick = "[0] spawn life_fnc_closedialog;";
			tooltip = "Home";
			x = 0.311364;
			y = 1.02674;
			w = 0.05;
			h = 0.06;
		};
		
		class ButtonInventory: ButtonCancel
		{
			idc = -1;
			OnButtonClick = "[] call life_fnc_inventory;";
			tooltip = "Inventar";
			x = 0.386364;
			y = 1.02357;
			w = 0.05;
			h = 0.06;
		};
	};
};