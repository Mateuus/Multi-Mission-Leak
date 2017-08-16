class atmmenuhaupt {
	
	idd = 7900;
	movingEnable = 0;
	enableSimulation = 1;

	class controlsBackground {

		class hintergrund: Life_RscPicture
		{
			idc = -1;
			text = "images\atm_gui.paa";
			x = 0.005 * safezoneW + safezoneX;
			y = 0.016 * safezoneH + safezoneY;
			w = 0.99 * safezoneW;
			h = 0.924 * safezoneH;
		};
	};

	class controls {

		class buttonmenu_einzahlen: Life_RscButtonMenu
		{
			idc = -1;
			OnButtonClick = "['einzahlen'] call life_fnc_atm;";		
			x = 0.344271 * safezoneW + safezoneX;
			y = 0.270371 * safezoneH + safezoneY;
			w = 0.01625 * safezoneW;
			h = 0.0272223 * safezoneH;
			colorBackground[] = {-1,-1,-1,0};
			colorBackgroundFocused[] = {-1,-1,-1,0};
			colorBackground2[] = {-1,-1,-1,0};
			color[] = {1,1,1,0};
			colorFocused[] = {0,0,0,0};
			color2[] = {0,0,0,0};
			colorText[] = {1,1,1,1};
			colorDisabled[] = {0,0,0,0};
		};

		class buttonmenu_auszahlen: buttonmenu_einzahlen
		{
			idc = -1;
			OnButtonClick = "['auszahlen'] call life_fnc_atm;";
			x = 0.344843 * safezoneW + safezoneX;
			y = 0.214926 * safezoneH + safezoneY;
			w = 0.01625 * safezoneW;
			h = 0.0272223 * safezoneH;
		};

		class buttonmenu_gangkonto: buttonmenu_einzahlen
		{
			idc = -1;
			OnButtonClick = "['gangkonto'] call life_fnc_atm;";
			x = 0.641667 * safezoneW + safezoneX;
			y = 0.215741 * safezoneH + safezoneY;
			w = 0.01625 * safezoneW;
			h = 0.0272223 * safezoneH;
		};

		class buttonmenu_ueberweisen: buttonmenu_einzahlen
		{
			idc = -1;
			OnButtonClick = "['ueberweisen'] call life_fnc_atm;";
			x = 0.342708 * safezoneW + safezoneX;
			y = 0.384259 * safezoneH + safezoneY;
			w = 0.01625 * safezoneW;
			h = 0.0272223 * safezoneH;
		};

		class buttonmenu_kontostand: buttonmenu_einzahlen
		{
			idc = -1;
			OnButtonClick = "['kontostand'] call life_fnc_atm;";			
			x = 0.34375 * safezoneW + safezoneX;
			y = 0.325926 * safezoneH + safezoneY;
			w = 0.01625 * safezoneW;
			h = 0.0272223 * safezoneH;
		};

		class buttonmenu_beenden: buttonmenu_einzahlen
		{
			idc = -1;
			OnButtonClick = "closedialog 0";			
			x = 0.643333 * safezoneW + safezoneX;
			y = 0.384111 * safezoneH + safezoneY;
			w = 0.01625 * safezoneW;
			h = 0.0272223 * safezoneH;
		};
	};
};



class atmmenu {
	
	idd = 7910;
	movingEnable = 0;
	enableSimulation = 1;

	class controlsBackground {

		class hintergrund: Life_RscPicture 
		{
			idc = -1;
			text = "images\atm_gui_leer.paa";
			x = 0.005 * safezoneW + safezoneX;
			y = 0.016 * safezoneH + safezoneY;
			w = 0.99 * safezoneW;
			h = 0.924 * safezoneH;
		};
	};

	class controls {

		//Auszahlen/Einzahlen
		class eingabefeld_auszahlung: Life_RscEdit
		{
			idc = 7911;
			text = "";
			x = 0.407188 * safezoneW + safezoneX;
			y = 0.291 * safezoneH + safezoneY;
			w = 0.185625 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0,0,0,0.2};
		};

		class button_auszahlung: Life_RscButtonMenu
		{
			idc = 7912;
			OnButtonClick = "";
			text = "";
			x = 0.407187 * safezoneW + safezoneX;
			y = 0.313 * safezoneH + safezoneY;
			w = 0.185625 * safezoneW;
			h = 0.033 * safezoneH;
		};


		//Kontostand
		class Life_Rscbutton_kontostand: Life_RscText
		{
			idc = 7913;
			text = "";
			style = 2;
			shadow = 0;
			sizeEx = 0.05;
			colorText[] = {0.55,0.8,0.4,1};
			x = 0.397917 * safezoneW + safezoneX;
			y = 0.296667 * safezoneH + safezoneY;
			w = 0.207813 * safezoneW;
			h = 0.0512963 * safezoneH;
		};

		class text_kontostand: Life_RscText
		{
			idc = 7914;
			text = "Aktueller Kontostand";
			style = 2;
			shadow = 0;
			sizeEx = 0.04;
			colorText[] = {0,0,0,1};
			x = 0.398438 * safezoneW + safezoneX;
			y = 0.247 * safezoneH + safezoneY;
			w = 0.207396 * safezoneW;
			h = 0.0348519 * safezoneH;
		};


		//Überweisung
		class ueberweisung_eingabe: Life_RscEdit
		{
			idc = 7915;
			text = "";
			x = 0.402031 * safezoneW + safezoneX;
			y = 0.269 * safezoneH + safezoneY;
			w = 0.0773437 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0,0,0,0.2};
		};

		class ueberweisen_button: Life_RscButtonMenu
		{
			idc = 7916;
			text = "Überweisung tätigen";
			OnButtonClick = "[] spawn life_fnc_bankTransfer;";
			sizeEx = 0.03;
			size = 0.03;
			x = 0.402031 * safezoneW + safezoneX;
			y = 0.302 * safezoneH + safezoneY;
			w = 0.0773437 * safezoneW;
			h = 0.033 * safezoneH;
		};

		class ueberweisung_listbox: Life_RscListbox
		{
			idc = 7917;
			text = "";
			size = 0.03;
			sizeEx = 0.03;
			colorText[] = {0,0,0,1};
			x = 0.494844 * safezoneW + safezoneX;
			y = 0.236 * safezoneH + safezoneY;
			w = 0.108281 * safezoneW;
			h = 0.132 * safezoneH;
		};


		//Gangkonto
		class gangeinzahleneingabe: Life_RscEdit
		{
			idc = 7918;
			text = "0";
			x = 0.407187 * safezoneW + safezoneX;
			y = 0.313 * safezoneH + safezoneY;
			w = 0.0773437 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0,0,0,0.2};
		};

		class gangeinzahlenbutton: Life_RscButtonMenu
		{
			idc = 7919;
			OnButtonClick = "[] call life_fnc_gangDeposit;";
			text = "Einzahlen";
			x = 0.407187 * safezoneW + safezoneX;
			y = 0.346 * safezoneH + safezoneY;
			w = 0.0773437 * safezoneW;
			h = 0.033 * safezoneH;
		};

		class gangauszahleneingabe: Life_RscEdit
		{
			idc = 7920;
			text = "0";
			x = 0.520625 * safezoneW + safezoneX;
			y = 0.313 * safezoneH + safezoneY;
			w = 0.0773437 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0,0,0,0.2};
		};

		class gangauszahlenbutton: Life_RscButtonMenu
		{
			idc = 7921;
			OnButtonClick = "[] call life_fnc_gangWithdraw;";
			text = "Abheben";
			x = 0.520625 * safezoneW + safezoneX;
			y = 0.346 * safezoneH + safezoneY;
			w = 0.0773437 * safezoneW;
			h = 0.033 * safezoneH;
		};

		class text_gangkontostand: Life_RscText
		{
			idc = 7922;
			text = "";
			style = 2;
			sizeEx = 0.045;
			colorText[] = {0.55,0.8,0.4,1};
			x = 0.407187 * safezoneW + safezoneX;
			y = 0.247 * safezoneH + safezoneY;
			w = 0.190781 * safezoneW;
			h = 0.044 * safezoneH;
		};

		class title_gangkontostand: Life_RscText
		{
			idc = 7923;
			sizeEx = 0.045;
			style = 2;
			shadow = 0;
			colorText[] = {0,0,0,1};
			text = "Aktueller Gangkontostand";
			x = 0.407187 * safezoneW + safezoneX;
			y = 0.225 * safezoneH + safezoneY;
			w = 0.190781 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class Life_Rscbutton_zurueck: Life_RscButtonMenu
		{
			idc = -1;
			OnButtonClick = "closedialog 0";
			x = 0.643386 * safezoneW + safezoneX;
			y = 0.384556 * safezoneH + safezoneY;
			w = 0.0164583 * safezoneW;
			h = 0.0274444 * safezoneH;
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