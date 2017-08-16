class lhm_weapon_shop
{
	idd = 38400;
	movingEnabled = false;
	enableSimulation = true;
	
	class controlsBackground
	{
		class RscTitleBackground : lhm_RscText
		{
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
			idc = -1;
			x = 0.1; y = 0.2;
			w = 0.32; h = (1 / 25);
		};
		
		class Mainbackground : lhm_RscText
		{
			colorBackground[] = {0,0,0,0.7};
			idc = -1;
			x = 0.1; y = 0.2 + (11 / 250);
			w = 0.32; h = 0.6 - (22 / 250);
		};
		
		class Title : lhm_RscTitle
		{
			colorBackground[] = {0,0,0,0};
			idc = 38401;
			text = "";
			x = 0.1; y = 0.2;
			w = 0.32; h = (1 / 25);
		};
		
		class itemInfo : lhm_RscStructuredText
		{
			idc = 38404;
			text = "";
			sizeEx = 0.035;
			x = 0.11; y = 0.68;
			w = 0.2; h = 0.2;
		};
		
		class FilterList : lhm_RscCombo
		{
			idc = 38402;
			onLBSelChanged = "_this call lhm_fnc_weaponShopFilter";
			x = 0.11; y = 0.64;
			w = 0.3; h = 0.035;
		};
	};
	
	class controls
	{
		class itemList : lhm_RscListBox
		{
			idc = 38403;
			onLBSelChanged = "_this call lhm_fnc_weaponShopSelection";
			sizeEx = 0.035;
			x = 0.11; y = 0.25;
			w = 0.3; h = 0.38;
		};
		
		class ButtonBuySell : lhm_RscButtonMenu
		{
			idc = 38405;
			text = "$STR_Global_Buy";
			onButtonClick = "[] spawn lhm_fnc_weaponShopBuySell; true";
			x = 0.1 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.8 - (1 / 25);
			w = (6.25 / 40);
			h = (1 / 25);
		};
		
		class ButtonClose : lhm_RscButtonMenu 
		{
			idc = -1;
			text = "$STR_Global_Close";
			onButtonClick = "closeDialog 0;";
			x = 0.1;
			y = 0.8 - (1 / 25);
			w = (6.25 / 40);
			h = (1 / 25);
		};
	};
};
