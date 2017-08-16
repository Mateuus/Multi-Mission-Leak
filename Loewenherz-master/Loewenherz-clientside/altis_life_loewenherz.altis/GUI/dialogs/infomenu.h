class InfoMenu
{
	idd = 2001;
	name = "InfoMenu";
	movingEnabled = 1;
	enableSimulation = 1;

	class controlsBackground
	{
		class MainBackground: lhm_RscText
		{
			colorBackground[] = {0, 0, 0, 0.7};
			idc = -1;
			x = 0.025;
			y = 0.2;
			w = 1.075;
			h = 0.64;
		};
		class MainHeaderred: lhm_RscText
		{
			idc = -1;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
			text = "Info Menue";
			x = 0.02775;
			y = 0.1512;
			w = 1.06844;
			h = 0.036431;
		};
	};

	class controls
	{
		class Listbox: lhm_RscListbox
		{
			idc = 1500;
			onLBSelChanged = "[_this] call lhm_fnc_infoLBchanged";
			sizeEx = 0.04;
			x = 0.025;
			y = 0.2;
			w = 0.2875;
			h = 0.64;
		};
		class text: lhm_RscStructuredText
		{
			idc = 1100;
			text = "";
			x = 0.325;
			y = 0.2;
			w = 0.775;
			h = 0.64;
		};
		class CloseBTN: lhm_RscButtonMenu
		{
			idc = -1;
			onButtonClick = "[] spawn {closeDialog 0; sleep 0.01; [] call lhm_fnc_p_openMenu;};";
			text = "$STR_Global_Close";
			x = 0.0275;
			y = 0.8528;
			w = 0.15;
			h = 0.04;
		};
	};
};