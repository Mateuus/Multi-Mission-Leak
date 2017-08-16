class LH_NewsFlash {
	idd = 9000;
	name= "LH_NewsFlash";
	movingEnable = false;
	enableSimulation = true;

	class controlsBackground {



		class Background: lhm_RscBackground
		{
			colorBackground[] = {0.8,0.1,0.1,0.3};
			idc = -1;
			x = -4.47035e-008;
			y = 0.28;
			w = 1;
			h = 0.48;
		};

		class Title: lhm_RscTitle
		{
			idc = -1;
			text = "Lowenherz-News Channel7 Broadcast";
			x = 0;
			y = 0.24;
			w = 1;
			h = 0.04;
		};

		class MessageHeader: lhm_RscText
		{
			idc = -1;
			text = "Nachricht:";
			x = 0.025;
			y = 0.3;
			w = 0.1875;
			h = 0.04;
		};
	};

	class controls {
		class Infotext: lhm_RscStructuredText
		{
			idc = -1;
			text = "Schicke eine Nachricht an alle Spieler. Dieser Vorgang kann nicht rückgängig gemacht werden!";
			x = 0.025;
			y = 0.56;
			w = 0.95;
			h = 0.16;
		};
		class Message: lhm_RscEdit
		{
			idc = 1400;
			type = 2;
			style = 16;
			text = "";
			sizeEx = 0.035;
			x = 0.025;
			y = 0.36;
			w = 0.95;
			h = 0.16;
		};
		class Send: lhm_RscButtonMenu
		{
			idc = -1;
			text = "Senden";
			onButtonDown = "[] call lhm_fnc_lhNews_send;";
			x = 0.8375;
			y = 0.76505;
			w = 0.1625;
			h = 0.04;
		};
		class Close: lhm_RscButtonMenu
		{
			text = "Close";
			onButtonClick = "closeDialog 0;";
			x = 0;
			y = 0.76505;
			w = 0.15;
			h = 0.04;
		};
	};
};