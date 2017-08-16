class phone {
	
	idd = 3700;
	movingEnable = false;
	enableSimulation = true;

	class controlsBackground {
		
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
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,0.4};
		};
		
		class kontaktetitle: Life_RscText
		{
			idc = 3712;
			text = "Kontakte";
			x = 0.0125;
			y = 0.14;
			w = 0.2625;
			h = 0.04;
			colorBackground[] = {1,1,1,0.5};
		};
		
		class maintitle: Life_RscText
		{
			idc = 3710;
			text = "Anrufen";
			x = 0.0125;
			y = 0.02;
			w = 0.975;
			h = 0.06;
			colorBackground[] = {1,1,1,0.5};
		};
		
		class CallTitle: Life_RscText
		{
			idc = 3707;
			text = "Anrufen";
			x = 0.3375;
			y = 0.14;
			w = 0.325;
			h = 0.04;
			colorBackground[] = {1,1,1,0.5};
		};
		
		class infotitle: Life_RscText
		{
			idc = 3711;
			text = "Infos";
			x = 0.725;
			y = 0.14;
			w = 0.2625;
			h = 0.04;
			colorBackground[] = {1,1,1,0.5};
		};
	};
	
	class controls {
				
		class anrufpic: Life_RscPicture
		{
			idc = 3701;
			text = "images\tablet\anrufen.paa";
			x = 0.3625;
			y = 0.76;
			w = 0.275;
			h = 0.1;
		};
		
		class auflegepic: Life_RscPicture
		{
			idc = 3708;
			text = "images\tablet\auflegen.paa";
			x = 0.3625;
			y = 0.76;
			w = 0.275;
			h = 0.1;
		};
		
		class flugpic: Life_RscPicture
		{
			idc = 3713;
			text = "images\tablet\flugmodusaus.paa";
			x = 0.4625;
			y = 0.86;
			w = 0.075;
			h = 0.1;
		};

		class kontaktelist: Life_RscListbox
		{
			idc = 3703;
			sizeEx = 0.032;
			onLBDblClick = "[5] call life_fnc_phone";
			x = 0.0125;
			y = 0.2;
			w = 0.2625;
			h = 0.68;
		};

		class eingabefeld: Life_RscEdit
		{
			idc = 3704;
			text = "";
			x = 0.3375;
			y = 0.2;
			w = 0.2625;
			h = 0.06;
			colorBackground[] = {0,0,0,0.5};
		};

		class addkontakt: Life_RscButtonMenu
		{
			idc = 3705;
			text = "Kontakt hinzufügen";
			OnButtonClick = "[1] spawn life_fnc_phone;";
			x = 0.0125;
			y = 0.9;
			w = 0.2625;
			h = 0.04;
		};
		
		/*class guthabenbutton: Life_RscButtonMenu
		{
			idc = 3714;
			text = "Guthaben aufladen";
			OnButtonClick = "[1] spawn life_fnc_guthaben;";
			x = 0.725;
			y = 0.9;
			w = 0.2625;
			h = 0.04;
		};*/
				
		class anrufbutton: Life_RscButtonMenu
		{
			idc = 3706;
			text = "";
			OnButtonClick = "[2] spawn life_fnc_phone;";
			x = 0.3625;
			y = 0.76;
			w = 0.275;
			h = 0.1;
			colorBackground[] = {-1,-1,-1,0};
			colorBackgroundFocused[] = {-1,-1,-1,0};
			colorBackground2[] = {-1,-1,-1,0};
			color[] = {1,1,1,0};
			colorFocused[] = {0,0,0,0};
			color2[] = {0,0,0,0};
			colorText[] = {1,1,1,1};
			colorDisabled[] = {0,0,0,0};
		};
		
		class auflegebutton: Life_RscButtonMenu
		{
			idc = 3709;
			text = "";
			OnButtonClick = "[] spawn life_fnc_hangup;";
			x = 0.3625;
			y = 0.76;
			w = 0.275;
			h = 0.1;
			colorBackground[] = {-1,-1,-1,0};
			colorBackgroundFocused[] = {-1,-1,-1,0};
			colorBackground2[] = {-1,-1,-1,0};
			color[] = {1,1,1,0};
			colorFocused[] = {0,0,0,0};
			color2[] = {0,0,0,0};
			colorText[] = {1,1,1,1};
			colorDisabled[] = {0,0,0,0};
		};
		
		class flugbutton: Life_RscButtonMenu
		{
			idc = 3715;
			text = "";
			onButtonClick = "if(player getvariable 'life_callflug') then {[4,1] call life_fnc_phone} else {[4,0] call life_fnc_phone}";
			x = 0.4625;
			y = 0.86;
			w = 0.075;
			h = 0.1;
			colorBackground[] = {-1,-1,-1,0};
			colorBackgroundFocused[] = {-1,-1,-1,0};
			colorBackground2[] = {-1,-1,-1,0};
			color[] = {1,1,1,0};
			colorFocused[] = {0,0,0,0};
			color2[] = {0,0,0,0};
			colorText[] = {1,1,1,1};
			colorDisabled[] = {0,0,0,0};
		};

		class eins: Life_RscButtonMenu
		{
			idc = -1;
			text = "1";
			OnButtonClick = "[3,1] call life_fnc_phone;";
			onMouseButtonDown = "";
			x = 0.3375;
			y = 0.28;
			w = 0.1;
			h = 0.1;
		};

		class zwei: eins
		{
			idc = -1;
			text = "2";
			OnButtonClick = "[3,2] call life_fnc_phone;";
			x = 0.45;
			y = 0.28;
			w = 0.1;
			h = 0.1;
		};
		
		class drei: eins
		{
			idc = -1;
			text = "3";
			OnButtonClick = "[3,3] call life_fnc_phone;";
			x = 0.5625;
			y = 0.28;
			w = 0.1;
			h = 0.1;
		};
		
		class vier: eins
		{
			idc = -1;
			text = "4";
			OnButtonClick = "[3,4] call life_fnc_phone;";
			x = 0.3375;
			y = 0.4;
			w = 0.1;
			h = 0.1;
		};
		
		class fuenf: eins
		{
			idc = -1;
			text = "5";
			OnButtonClick = "[3,5] call life_fnc_phone;";
			x = 0.45;
			y = 0.4;
			w = 0.1;
			h = 0.1;
		};
		
		class sechs: eins
		{
			idc = -1;
			text = "6";
			OnButtonClick = "[3,6] call life_fnc_phone;";
			x = 0.5625;
			y = 0.4;
			w = 0.1;
			h = 0.1;
		};
		
		class sieben: eins
		{
			idc = -1;
			text = "7";
			OnButtonClick = "[3,7] call life_fnc_phone;";
			x = 0.3375;
			y = 0.52;
			w = 0.1;
			h = 0.1;
		};
		
		class acht: eins
		{
			idc = -1;
			text = "8";
			OnButtonClick = "[3,8] call life_fnc_phone;";
			x = 0.45;
			y = 0.52;
			w = 0.1;
			h = 0.1;
		};
		
		class neun: eins
		{
			idc = -1;
			text = "9";
			OnButtonClick = "[3,9] call life_fnc_phone;";
			x = 0.5625;
			y = 0.52;
			w = 0.1;
			h = 0.1;
		};
		
		class null: eins
		{
			idc = -1;
			text = "0";
			OnButtonClick = "[3,0] call life_fnc_phone;";
			x = 0.45;
			y = 0.64;
			w = 0.1;
			h = 0.1;
		};

		class raute: eins
		{
			idc = -1;
			text = "#";
			OnButtonClick = "[3,'#'] call life_fnc_phone;";
			x = 0.5625;
			y = 0.64;
			w = 0.1;
			h = 0.1;
		};

		class stern: eins
		{
			idc = -1;
			text = "*";
			OnButtonClick = "[3,'*'] call life_fnc_phone;";
			x = 0.3375;
			y = 0.64;
			w = 0.1;
			h = 0.1;
		};
		
		class deletebutton: eins
		{
			idc = -1;
			text = "←";
			OnButtonClick = "[3,'DEL'] call life_fnc_phone;";
			x = 0.6;
			y = 0.2;
			w = 0.0625;
			h = 0.06;
		};
		
		class infobox: Life_RscStructuredText
		{
			idc = 3716;
			text = "Benutze <t color='#fb1000'>*100#</t> um dein Guthaben abzurufen.<br/><br/>Füge deine Kontakte hinzu, indem du eine gültige Handynummer eingibst und auf <t color='#fb1000'>Kontakt hinzufügen</t> klickst. Mit Doppelklick fügst du die Nummer hinzu!<br/><br/>Hinweis: Ein Anruf kostet 1.000€ und wird von deinem Guthaben abgerechnet.";
			sizeEx = 0.035;
			size = 0.035;
			x = 0.725;
			y = 0.2;
			w = 0.2625;
			h = 0.68;
			colorBackground[] = {0,0,0,0.5};
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
		
		class ButtonReturn: Life_RscButtonMenu
		{
			idc = -1;
			OnButtonClick = "closedialog 0;";
			tooltip = "Zurück";
			x = 0.54798;
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
		
		class ButtonOhrstoepsel: Life_RscButtonMenu
		{
			idc = -1;
			OnButtonClick = "[] spawn life_fnc_fadeSound;";
			tooltip = "Ohrstöpsel verwenden";
			x = 0.616162;
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
		
		class ButtonHome: Life_RscButtonMenu
		{
			idc = -1;
			OnButtonClick = "[0] spawn life_fnc_closedialog;";
			tooltip = "Home";
			x = 0.311364;
			y = 1.02674;
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
		
		class ButtonInventory: Life_RscButtonMenu
		{
			idc = -1;
			OnButtonClick = "[] call life_fnc_inventory;";
			tooltip = "Inventar";
			x = 0.386364;
			y = 1.02357;
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
	};
};