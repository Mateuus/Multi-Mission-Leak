class bank_group_mode {
	idd = 9500;
	name= "bank_group_mode";
	movingEnable = false;
	enableSimulation = true;
	//onLoad = "[] spawn lhm_fnc_bankGroupMenu;";

	class controlsBackground {
		class TabletBCKGRND: lhm_RscPicture
		{
			idc = -1;
			text = "core\textures\icons\Menu\tablet.paa";
			x = -0.0203282;
			y = -0.104377;
			w = 1.08561;
			h = 1.18545;

		};
		class PictureClose: lhm_RscPicture
		{
			idc = -1;
			text = "core\textures\icons\Menu\close.paa";
			x = 0.123737;
			y = 0.745791;
			w = 0.0875;
			h = 0.1;
		};
	};

	class controls {



		class BTNClose: lhm_RscButtonSilent
		{
			idc = -1;
			tooltip = "$STR_Global_Close";
			onButtonClick = "closeDialog 0;";
			x = 0.11995;
			y = 0.746262;
			w = 0.1;
			h = 0.1;
		};

		class WelcherModeHeader: lhm_RscText
		{
			idc = 1000;
			x = 0.328935;
			y = 0.158229;
			w = 0.425;
			h = 0.04;
		};


		class Weg1Header: lhm_RscText
		{
			idc = 1001;
			text = "Sicherheitsluecke";
			x = 0.25505;
			y = 0.222223;
			w = 0.214647;
			h = 0.0248485;
		};

		class Weg2Header: lhm_RscText
		{
			idc = 1002;
			text = "Stromausfall";
			x = 0.608585;
			y = 0.225589;
			w = 0.214647;
			h = 0.0248485;
		};

		class WaehleWEG1BTN: lhm_RscButtonMenu
		{
			idc = 2402;
			text = "Sicherhetislücke"; //--- ToDo: Localize;
			onButtonClick = " LHM_BANK_Way = ""Way1""; [""Way1""] spawn lhm_fnc_bankChatDialogMiddle;";
			x = 0.251263;
			y = 0.759259;
			w = 0.225;
			h = 0.0410774;
		};

		class Weg1Beschreibung: lhm_RscStructuredText
		{
			idc = 1100;
			x = 0.249874;
			y = 0.256431;
			w = 0.225;
			h = 0.48;
		};

		class Weg2Beschreibung: lhm_RscStructuredText
		{
			idc = 1101;
			x = 0.602273;
			y = 0.259259;
			w = 0.225;
			h = 0.48;
		};

		class WaehleWEG2BTN: RscButtonMenu
		{
			idc = 2400;
			text = "Stromausfall"; //--- ToDo: Localize;
			onButtonClick = " LHM_BANK_Way = ""Way2""; [""Way2""] spawn lhm_fnc_bankChatDialogMiddle;";
			x = 0.60101;
			y = 0.75926;
			w = 0.225;
			h = 0.0427607;
		};
		class TimeText: lhm_RscText
		{
			idc = 7858;
			SizeEx = 0.027;
			text = "";
			x = 0.930556;
			y = 0.127946;
			w = 0.0534085;
			h = 0.033266;
		};
	};
};