class sms {
	
	idd = 3900;
	movingEnable = false;
	enableSimulation = true;
	onLoad = "[0] spawn life_fnc_sms";

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
		
		class maintitle: Life_RscText
		{
			idc = 3999;
			text = "Nachrichten";
			x = 0.0125;
			y = 0.02;
			w = 0.975;
			h = 0.06;
			colorBackground[] = {1,1,1,0.5};
		};
		
		class nachrichtvortitle: Life_RscText
		{
			idc = -1;
			text = "Betreff:";
			x = 0.525;
			y = 0.16;
			w = 0.4625;
			h = 0.04;
			colorBackground[] = {1,1,1,0.5};
		};
				
		class vontitle: Life_RscText
		{
			idc = -1;
			text = "Von:";
			x = 0.275;
			y = 0.16;
			w = 0.25;
			h = 0.04;
			colorBackground[] = {1,1,1,0.5};
		};
		
		class nachrichttitle: Life_RscText
		{
			idc = 3907;
			text = "Vollständige Nachricht (Zum lesen auswählen)";
			x = 0.275;
			y = 0.44;
			w = 0.7125;
			h = 0.04;
			colorBackground[] = {1,1,1,0.5};
		};

		class kontaktliste: Life_RscText
		{
			idc = -1;
			text = "Kontakte";
			x = 0.0125;
			y = 0.16;
			w = 0.25;
			h = 0.04;
			colorBackground[] = {1,1,1,0.5};
		};
	};
	
	class controls {

		class listboxkontakte: Life_RscListbox
		{
			idc = 3901;
			sizeEx = 0.032;
			OnLBSelChanged = "[2] call life_fnc_sms";
			x = 0.0125;
			y = 0.22;
			w = 0.25;
			h = 0.6;
		};

		class listboxpreview: Life_RscListNBox
		{
			idc = 3902;
			onLBSelChanged = "[(lbCurSel 3902)] call life_fnc_showMsg;";
			sizeEx = 0.04;
			columns[] = {0,0.3};
			x = 0.275;
			y = 0.22;
			w = 0.7125;
			h = 0.18;
			colorBackground[] = {0,0,0,0.5};
		};

		class listboxnachrichtganzgr: Life_RscControlsGroup {
			x = 0.275;
			y = 0.5;
			w = 0.7125;
			h = 0.32;
			class controls {
				class listboxnachrichtganz: Life_RscStructuredText {
					idc = 3903;
					text = "";
					size = 0.04;
					shadow = 0;
					x = 0;
					y = 0;
					w = 0.7125;
					h = 0.64;
					colorBackground[] = {0,0,0,0.5};
				};
			};
		};
		
		class smsbutton: Life_RscButtonMenu
		{
			idc = 3904;
			text = "SMS schreiben";
			onButtonClick = "[4] call life_fnc_sms";
			x = 0.0125;
			y = 0.92;
			w = 0.25;
			h = 0.04;
		};

		class notrufbutton: Life_RscButtonMenu
		{
			idc = 3905;
			text = "Notruf";
			onButtonClick = "createDialog 'smsnotruf'";
			x = 0.825;
			y = 0.92;
			w = 0.1625;
			h = 0.04;
			colorBackground[] = {0.6,0,0,0.5};
		};

		class deletebutton: Life_RscButtonMenu
		{
			idc = 3906;
			text = "Alle Nachrichten löschen";
			onButtonClick = "[3] call life_fnc_sms";
			x = 0.475;
			y = 0.92;
			w = 0.325;
			h = 0.04;
		};
		
		class unterwegsbutton: Life_RscButtonMenu
		{
			idc = 3908;
			text = "Unterwegs";
			OnButtonClick = "";
			x = 0.2875;
			y = 0.92;
			w = 0.1625;
			h = 0.04;
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

class smsschreiben {

	idd = 3930;
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

		class maintitle: Life_RscText
		{
			idc = -1;
			text = "SMS versenden";
			x = 0.0125;
			y = 0.02;
			w = 0.975;
			h = 0.06;
			colorBackground[] = {1,1,1,0.5};
		};

		class background: Life_RscText
		{
			idc = -1;
			x = 0.0125;
			y = 0.34;
			w = 0.975;
			h = 0.44;
			colorBackground[] = {0,0,0,0.5};
		};
		
		class nachrichtantitle: Life_RscText
		{
			idc = 3933;
			text = "";
			x = 0.0125;
			y = 0.28;
			w = 0.975;
			h = 0.04;
			colorBackground[] = {1,1,1,0.5};
		};
	};

	class controls {
	
		class schreibfeld: Life_RscEdit
		{
			idc = 3931;
			text = "";
			sizeEx = 0.03;
			x = 0.02575;
			y = 0.36;
			w = 0.925;
			h = 0.4;
		};

		class sendbutton: Life_RscButtonMenu
		{
			idc = 3932;
			text = "Senden";
			onButtonClick = "[1,-1,(ctrlText 3931)] call life_fnc_newMsg;";
			x = 0.8875;
			y = 0.84;
			w = 0.1;
			h = 0.04;
		};

		class sendsupportbutton: Life_RscButtonMenu
		{
			idc = 3934;
			text = "Als Supportnachricht senden";
			onButtonClick = "[5,-1,(ctrlText 3931)] call life_fnc_newMsg;";
			x = 0.0125;
			y = 0.84;
			w = 0.3875;
			h = 0.04;
			colorBackground[] = {0.2,0.2,0.2,1};
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

class smsnotruf {

	idd = 3960;
	movingEnable = false;
	enableSimulation = true;
	onLoad = "[0] spawn life_fnc_notrufcheck;";
	
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

		class maintitle: Life_RscText
		{
			idc = -1;
			text = "Notruf absetzen";
			x = 0.0125;
			y = 0.02;
			w = 0.975;
			h = 0.06;
			colorBackground[] = {1,1,1,0.5};
		};

		class background: Life_RscText
		{
			idc = -1;
			x = 0.0125;
			y = 0.34;
			w = 0.975;
			h = 0.44;
			colorBackground[] = {0,0,0,0.5};
		};

		class nachrichtantitle: Life_RscText
		{
			idc = -1;
			text = "Notruf an:";
			x = 0.0125;
			y = 0.28;
			w = 0.1375;
			h = 0.04;
			colorBackground[] = {0.7,0,0,0.5};
		};

		class infotext: Life_RscStructuredText
		{
			idc = -1;
			text = "Hinweis: Notrufe ohne Ortsangabe können nicht wahrgenommen werden!";
			x = 0.0125;
			y = 0.84;
			w = 0.875;
			h = 0.04;
			colorBackground[] = {0,0,0,0.5};
		};
	};
		
	class controls {

		class schreibfeld: Life_RscEdit
		{
			idc = 3961;
			text = "";
			sizeEx = 0.032;
			x = 0.02575;
			y = 0.38;
			w = 0.925;
			h = 0.36;
		};

		class sendbutton: Life_RscButtonMenu
		{
			idc = 3962;
			text = "Senden";
			OnButtonClick = "[(lbValue [3963,(lbCurSel 3963)]),-1,(ctrlText 3961)] call life_fnc_newMsg";
			x = 0.8875;
			y = 0.84;
			w = 0.1;
			h = 0.04;
			colorBackground[] = {0.7,0,0,0.5};
		};

		class Fraktionswahl: Life_RscCombo
		{
			idc = 3963;
			OnLbSelChanged = "ctrlEnable[3962,true]";
			x = 0.15;
			y = 0.28;
			w = 0.275;
			h = 0.04;
		};
		
		class gpsbutton: Life_RscButtonMenu
		{
			idc = 3964;
			text = "GPS-Daten einfügen";
			OnButtonClick = "[1] call life_fnc_notrufcheck";
			x = 0.75;
			y = 0.28;
			w = 0.2375;
			h = 0.04;
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