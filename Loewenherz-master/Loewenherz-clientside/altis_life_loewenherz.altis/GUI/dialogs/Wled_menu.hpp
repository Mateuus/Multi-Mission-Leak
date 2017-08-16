class Wled_menu {
	idd = 5888;
	name= "Wled_menu";
	movingEnable = false;
	enableSimulation = true;
	onLoad = "";
	
	class controlsBackground {
		class lhm_RscTitleBackground:lhm_RscText {
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
			text = "LHM Whitelist Menu powered by Blackd0g and Barney";
			idc = -1;
			x = 0.0875;
			y = 0.11;
			w = 0.6875;
			h = 0.04;
		};
		
		class MainBackground:lhm_RscText {
			colorBackground[] = {0, 0, 0, 0.7};
			idc = -1;
			x = 0.0875;
			y = 0.16;
			w = 0.6875;
			h = 0.74;
		};
	};
	
	class controls {
		class Listbox: lhm_RscListbox
		{
			idc = 1500;
			sizeEx = 0.035;
			x = 0.1015;
			y = 0.1764;
			w = 0.325;
			h = 0.7;
		};
		
		class EDIT: lhm_RscEdit
		{
			idc = 1400;
			text = "";
			x = 0.43625;
			y = 0.1844;
			w = 0.3375;
			h = 0.04;
		};
		
		class Combobox: lhm_RscCombo
		{
			idc = 2100;
			x = 0.4375;
			y = 0.24;
			w = 0.3375;
			h = 0.04;
		};
		
		class Button: lhm_RscButtonMenu
		{
			idc = 2400;
			text = "WHITELISTEN";
			onButtonClick = "[] spawn lhm_fnc_admin_wlist";
			x = 0.46825;
			y = 0.8136;
			w = 0.25;
			h = 0.06;
		};
		
		class ButtonClose: lhm_RscButtonMenu
		{
			idc = 2401;
			text = "Schließe";
			onButtonClick = "CloseDialog 0;";
			x = 0.0825;
			y = 0.9132;
			w = 0.15;
			h = 0.06;
		};
		
	};
};