class authenticator {
	idd = 7000;
	movingEnable = false;
	enableSimulation = true;

	class controlsBackground {
		
		class authenticator_mainbackground: Life_RscText
		{
			idc = -1;
			x = 0.25;
			y = 0.18;
			w = 0.5;
			h = 0.24;
			colorBackground[] = {0,0,0,0.7};
		};
		class authenticator_zahlbackground: Life_RscText
		{
			idc = -1;
			x = 0.4125;
			y = 0.28;
			w = 0.175;
			h = 0.04;
			colorBackground[] = {0.4,0,0,0.5};
		};
		class authenticator_title: Life_RscText
		{
			idc = -1;
			text = "Authenticator-Code"; //--- ToDo: Localize;
			x = 0.4;
			y = 0.18;
			w = 0.225;
			h = 0.08;
		};
		class authenticator_playidBackground: Life_RscText
		{
			idc = -1;
			x = 0.25;
			y = 0.38;
			w = 0.3375;
			h = 0.04;
			colorBackground[] = {0.4,0,0,0.5};
		};
		class authenticator_zahl: Life_RscText
		{
			idc = 7001;
			text = "8947"; //--- ToDo: Localize;
			x = 0.467424;
			y = 0.291583;
			w = 0.1;
			h = 0.02;
		};
		class authenticator_playid: Life_RscText
		{
			idc = 7002;
			text = "PID: 76561198061058414"; //--- ToDo: Localize;
			x = 0.25;
			y = 0.38;
			w = 0.3375;
			h = 0.04;
		};
		class cancel: Life_RscButtonMenu
		{
			idc = -1;
			text = "Zurück";
			OnButtonClick = "closedialog 0;";
			x = 0.65;
			y = 0.38;
			w = 0.1;
			h = 0.04;
		};
	};
};