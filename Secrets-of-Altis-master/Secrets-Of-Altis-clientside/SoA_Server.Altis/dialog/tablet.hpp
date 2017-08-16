class tablet {
	idd = 3400;
	movingEnable = false;
	enableSimulation = true;

	class controlsBackground {
		
		class tabletbackground1: Life_RscPicture
		{
			idc = 3450;
			text = "images\tablet\defaultback.paa";
			x = -0.0875;
			y = 0;
			w = 1.175;
			h = 1;
		};
					
		class Background: Life_RscPicture
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
		
		class slotSettingsPic: Life_RscPicture
		{
			idc = 3401;
			text = "";
			x = 0.875;
			y = 0.82;
			w = 0.1375;
			h = 0.18;
		};
		
		class slotSavePic: Life_RscPicture
		{
			idc = 3402;
			text = "";
			x = 0.7625;
			y = 0.82;
			w = 0.1375;
			h = 0.18;
		};
		
		class slotAppStorePic: Life_RscPicture
		{
			idc = 3403;
			text = "";
			x = -0.0125;
			y = 0.02;
			w = 0.1375;
			h = 0.18;
		};
		
		class slotAchievementPic: Life_RscPicture
		{
			idc = 3404;
			text = "";
			x = 0.1375;
			y = 0.02;
			w = 0.1375;
			h = 0.18;
		};
		
		class slotKeysPic: Life_RscPicture
		{
			idc = 3405;
			text = "";
			x = 0.2875;
			y = 0.02;
			w = 0.1375;
			h = 0.18;
		};
		
		class slotGroupPic: Life_RscPicture
		{
			idc = 3406;
			text = "";
			x = 0.4375;
			y = 0.02;
			w = 0.1375;
			h = 0.18;
		};
		
		class slotMessagePic: Life_RscPicture
		{
			idc = 3407;
			text = "";
			x = 0.5875;
			y = 0.02;
			w = 0.1375;
			h = 0.18;
		};
		
		class slotPhonePic: Life_RscPicture
		{
			idc = 3408;
			text = "";
			x = 0.7375;
			y = 0.02;
			w = 0.1375;
			h = 0.18;
		};
		
		class slot7pic: Life_RscPicture
		{
			idc = 3409;
			text = "";
			x = -0.0125;
			y = 0.18;
			w = 0.1375;
			h = 0.18;
		};
		
		class slot8pic: Life_RscPicture
		{
			idc = 3410;
			text = "";
			x = 0.1375;
			y = 0.18;
			w = 0.1375;
			h = 0.18;
		};
		
		class slot9pic: Life_RscPicture
		{
			idc = 3411;
			text = "";
			x = 0.2875;
			y = 0.18;
			w = 0.1375;
			h = 0.18;
		};
		
		class slot10pic: Life_RscPicture
		{
			idc = 3412;
			text = "";
			x = 0.4375;
			y = 0.18;
			w = 0.1375;
			h = 0.18;
		};
		
		class slot11pic: Life_RscPicture
		{
			idc = 3413;
			text = "";
			x = 0.5875;
			y = 0.18;
			w = 0.1375;
			h = 0.18;
		};
		
		class slot12pic: Life_RscPicture
		{
			idc = 3414;
			text = "";
			x = 0.7375;
			y = 0.18;
			w = 0.1375;
			h = 0.18;
		};
		
		class slot13Pic: Life_RscPicture
		{
			idc = 3415;
			text = "";
			x = 0.8875;
			y = 0.02;
			w = 0.1375;
			h = 0.18;
		};
		
		class slot14Pic: Life_RscPicture
		{
			idc = 3416;
			text = "";
			x = 0.8875;
			y = 0.18;
			w = 0.1375;
			h = 0.18;
		};

		class slot15Pic: Life_RscPicture
		{
			idc = 3417;
			text = "";
			x = -0.0125;
			y = 0.34;
			w = 0.1375;
			h = 0.18;
		};
		
		//Fahndungsliste
		class slot16Pic: Life_RscPicture
		{
			idc = 3418;
			text = "";
			x = 0.65;
			y = 0.82;
			w = 0.1375;
			h = 0.18;
		};
		
		class slot17Pic: Life_RscPicture
		{
			idc = 3419;
			text = "";
			x = 0.5375;
			y = 0.82;
			w = 0.1375;
			h = 0.18;
		};

		//Kennzeichenabfrage
		class slot18Pic: Life_RscPicture
		{
			idc = 3420;
			text = "";
			x = 0.425;
			y = 0.82;
			w = 0.1375;
			h = 0.18;
		};

		class einsatzzentralepic: Life_RscPicture
		{
			idc = 4050;
			text = "";
			x = 0.469062 * safezoneW + safezoneX;
			y = 0.676 * safezoneH + safezoneY;
			w = 0.0567187 * safezoneW;
			h = 0.099 * safezoneH;
		};
						
		class batterypic: Life_RscPicture
		{
			idc = -1;
			text = "icons\battery.paa";
			x = 0.770076;
			y = -0.0103031;
			w = 0.05;
			h = 0.06;
		};
	};
	
	class controls {
		
		class slotSettingsButton: Life_RscButtonMenu
		{
			idc = 3421;
			tooltip = "Einstellungen";
			OnButtonClick = "";
			x = 0.9;
			y = 0.86;
			w = 0.0875;
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
		
		class slotSaveButton: slotSettingsButton
		{
			idc = 3422;
			tooltip = "Speichern";
			x = 0.7875;
			y = 0.86;
			w = 0.0875;
			h = 0.1;
		};
				
		class slotAppStoreButton: slotSettingsButton
		{
			idc = 3423;
			tooltip = "Appstore";
			x = 0.0125;
			y = 0.06;
			w = 0.0875;
			h = 0.1;
		};
		
		class slotAchievementButton: slotSettingsButton
		{
			idc = 3424;
			tooltip = "Erfolge";
			x = 0.1625;
			y = 0.06;
			w = 0.0875;
			h = 0.1;
		};
		
		class slotKeysButton: slotSettingsButton
		{
			idc = 3425;
			tooltip = "Schlüssel-Management24";
			x = 0.3125;
			y = 0.06;
			w = 0.0875;
			h = 0.1;
		};
		
		class slotGroupButton: slotSettingsButton
		{
			idc = 3426;
			tooltip = "Gangbook";
			x = 0.4625;
			y = 0.06;
			w = 0.0875;
			h = 0.1;
		};
		
		class slotMessageButton: slotSettingsButton
		{
			idc = 3427;
			tooltip = "Nachrichten";
			x = 0.6125;
			y = 0.06;
			w = 0.0875;
			h = 0.1;
		};
		
		class slotPhoneButton: slotSettingsButton
		{
			idc = 3428;
			tooltip = "Anrufen";
			x = 0.7625;
			y = 0.06;
			w = 0.0875;
			h = 0.1;
		};
		
		class slot7Button: slotSettingsButton
		{
			idc = 3429;
			tooltip = "Einsteigertipps";
			x = 0.0125;
			y = 0.22;
			w = 0.0875;
			h = 0.1;
		};
		
		class slot8Button: slotSettingsButton
		{
			idc = 3430;
			tooltip = "AltisMaps©";
			x = 0.1625;
			y = 0.22;
			w = 0.0875;
			h = 0.1;
		};
		
		class slot9Button: slotSettingsButton
		{
			idc = 3431;
			tooltip = "Online Banking";
			x = 0.3125;
			y = 0.22;
			w = 0.0875;
			h = 0.1;
		};
		
		class slot10Button: slotSettingsButton
		{
			idc = 3432;
			tooltip = "onLine Lizenzen";
			x = 0.4625;
			y = 0.22;
			w = 0.0875;
			h = 0.1;
		};
		
		class slot11Button: slotSettingsButton
		{
			idc = 3433;
			tooltip = "Selfie4U";
			x = 0.6125;
			y = 0.22;
			w = 0.0875;
			h = 0.1;
		};
		
		class slot12Button: slotSettingsButton
		{
			idc = 3434;
			tooltip = "Notizblock";
			x = 0.7625;
			y = 0.22;
			w = 0.0875;
			h = 0.1;
		};
		
		class slot13Button: slotSettingsButton
		{
			idc = 3435;
			tooltip = "WeCraft";
			x = 0.9125;
			y = 0.06;
			w = 0.0875;
			h = 0.1;
		};
		
		class slot14Button: slotSettingsButton
		{
			idc = 3436;
			tooltip = "EGO-Versicherungen";
			x = 0.9125;
			y = 0.22;
			w = 0.0875;
			h = 0.1;
		};
		
		class slot15Button: slotSettingsButton
		{
			idc = 3437;
			tooltip = "Altis Post";
			x = 0.0125;
			y = 0.38;
			w = 0.0875;
			h = 0.1;
		};
		
		//Fahndungsliste
		class slot16Button: slotSettingsButton
		{
			idc = 3438;
			tooltip = "Fahndungsliste";
			x = 0.675;
			y = 0.86;
			w = 0.0875;
			h = 0.1;
		};

		//Aktivitätsprotokoll
		class slot17Button: slotSettingsButton
		{
			idc = 3439;
			tooltip = "Aktivitätsprotokoll";
			x = 0.5625;
			y = 0.86;
			w = 0.0875;
			h = 0.1;
		};

		class kennzeichen_button: slotSettingsButton
		{
			idc = 3440;
			tooltip = "Kennzeichen überprüfen";
			x = 0.45;
			y = 0.86;
			w = 0.0875;
			h = 0.1;
		};
						
		class einsatzzentralebutton: slotSettingsButton
		{
			idc = 4000;
			tooltip = "Einsatzzentrale";
			x = 0.479375 * safezoneW + safezoneX;
			y = 0.698 * safezoneH + safezoneY;
			w = 0.0360937 * safezoneW;
			h = 0.055 * safezoneH;
		};

		class batterytext: Life_RscText
		{
			idc = 3480;
			text = "";
			x = 0.825;
			y = 0;
			w = 0.075;
			h = 0.04;
		};
		class time: Life_RscText
		{
			idc = 3481;
			text = "";
			x = 0.9;
			y = 0;
			w = 0.1125;
			h = 0.04;
		};
		class bargeld: Life_RscText
		{
			idc = 3482;
			text = "";
			x = -0.0125;
			y = 0;
			w = 0.35;
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