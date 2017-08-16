class jhmedsys_mainscreen
{
	idd = 1000;
	name="jhmedsys_mainscreen";
	movingEnabled = 0;
	enableSimulation = 1;
	class controlsBackground
	{
		class background: EMonkeys_RscText
		{
			idc = -1;
			x = 0.298906 * safezoneW + safezoneX;
			y = 0.346 * safezoneH + safezoneY;
			w = 0.402187 * safezoneW;
			h = 0.187 * safezoneH;
			colorBackground[] = {0.1,0.1,0.1,0.9};
		};
		class header : EMonkeys_RscText
		{
			text = "Medic";
			idc = -1;
			x = 0.298906 * safezoneW + safezoneX;
			y = 0.3218 * safezoneH + safezoneY;
			w = 0.402187 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
		};
	};
	class controls
	{
		class image_defi : EMonkeys_RscPicture
		{
			text = "core\eMonkeys\jhmedsys\images\defibrillator.paa";
			idc = -1;
			x = 0.309219 * safezoneW + safezoneX;
			y = 0.3636 * safezoneH + safezoneY;
			w = 0.103125 * safezoneW;
			h = 0.121 * safezoneH;
		};
		class defibrillator : EMonkeys_RscButtonMenu
		{
			text = "DEFIBRILLATOR";
			onButtonClick = "[] spawn jhmedsys_use_defi;";
			idc = -1;
			x = 0.309219 * safezoneW + safezoneX;
			y = 0.489 * safezoneH + safezoneY;
			w = 0.103125 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class image_morphium : EMonkeys_RscPicture
		{
			text = "core\eMonkeys\jhmedsys\images\morphine.paa";
			idc = -1;
			x = 0.448438 * safezoneW + safezoneX;
			y = 0.3636 * safezoneH + safezoneY;
			w = 0.103125 * safezoneW;
			h = 0.121 * safezoneH;
		};
		class morphium : EMonkeys_RscButtonMenu
		{
			text = "MORPHIUM";
			onButtonClick = "[] spawn jhmedsys_use_morphine;";
			idc = -1;
			x = 0.448438 * safezoneW + safezoneX;
			y = 0.489 * safezoneH + safezoneY;
			w = 0.103125 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class image_bandage : EMonkeys_RscPicture
		{
			text = "core\eMonkeys\jhmedsys\images\bandage.paa";
			idc = -1;
			x = 0.587656 * safezoneW + safezoneX;
			y = 0.3658 * safezoneH + safezoneY;
			w = 0.103125 * safezoneW;
			h = 0.121 * safezoneH;
		};
		class bandage : EMonkeys_RscButtonMenu
		{
			text = "BANDAGE";
			onButtonClick = "[] spawn jhmedsys_use_bandage;";
			idc = -1;
			x = 0.587656 * safezoneW + safezoneX;
			y = 0.489 * safezoneH + safezoneY;
			w = 0.103125 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class close : EMonkeys_RscButtonMenu
		{
			text = "Schliessen";
			onButtonClick = "closeDialog 0;";
			idc = -1;
			x = 0.618594 * safezoneW + safezoneX;
			y = 0.5352 * safezoneH + safezoneY;
			w = 0.0825 * safezoneW;
			h = 0.022 * safezoneH;
		};
	};
};