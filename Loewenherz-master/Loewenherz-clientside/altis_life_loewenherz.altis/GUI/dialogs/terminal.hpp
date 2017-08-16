class terminal {
	idd = 2799;
	name= "terminal";
	movingEnable = false;
	enableSimulation = true;

	class controlsBackground {
		class MainBackground: lhm_RscText
		{
			idc = 1000;
			colorBackground[] = {0,0,0,1};
			x = -0.0788541 * safezoneW + safezoneX;
			y = -0.060445 * safezoneH + safezoneY;
			w = 1.38188 * safezoneW;
			h = 1.133 * safezoneH;
		};
		class Main_Header: lhm_RscText
		{
			idc = 1001;
			colorBackground[] = {0,0,0,1};
			colorText[] = {0.016,0.706,0.016,1};
			text = "**** COMMODORE 64 BASIC V2 ****"; //--- ToDo: Localize;
			x = 0.00757579;
			y = -0.020202;
			w = 0.988894;
			h = 0.0393939;
		};

	};

	class controls {
		class structured_text: BA_RscStructuredText
		{
			idc = 1100;
			colorText[] = {0.016,0.706,0.016,1};
			x = 0.00226261;
			y = 0.0225267;
			w = 0.999368;
			h = 1.00653;
		};
		class eingabe: lhm_RscEdit
		{
			idc = 1400;
			text = "Input your Commands here";
			onMouseButtonDown = "disableSerialization; _display = findDisplay 2799; _eingabe = _display displayCtrl 1400;_eingabe ctrlSetText """";";
			colorText[] = {0.016,0.706,0.016,1};
			x = 0.00251269;
			y = 1.03893;
			w = 1.00013;
			h = 0.046734;
		};

	};
};