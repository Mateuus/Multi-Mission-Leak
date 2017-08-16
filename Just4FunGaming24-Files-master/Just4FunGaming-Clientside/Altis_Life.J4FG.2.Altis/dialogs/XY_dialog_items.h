class XY_dialog_items {
	idd = 2400;
	name= "XY_dialog_items";
	movingEnable = false;
	enableSimulation = true;
	
	class controlsBackground {
		class XY_RscTitleBackground:XY_RscText {
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
			idc = -1;
			x = 0.1;
			y = 0.2;
			w = 0.8;
			h = (1 / 25);
		};
		
		class MainBackground:XY_RscText {
			colorBackground[] = {0, 0, 0, 0.7};
			idc = -1;
			x = 0.1;
			y = 0.2 + (11 / 250);
			w = 0.8;
			h = 0.6 - (22 / 250);
		};
		
		class vasText : XY_RscText
		{
			idc = -1;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			text = "$STR_VS_SI";
			sizeEx = 0.04;
			x = 0.12; y = 0.27;
			w = 0.275; h = 0.04;
		};
		
		class vasgText : XY_RscText
		{
			idc = -1;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			text = "$STR_VS_PI";
			sizeEx = 0.04;
			
			x = 0.60; y = 0.27;
			w = 0.275; h = 0.04;
		};
	};
	
	class controls {

		class itemList : XY_RscListBox 
		{
			idc = 2401;
			text = "";
			sizeEx = 0.030;
			
			x = 0.12; y = 0.31;
			w = 0.275; h = 0.340;
		};
		
		class pItemlist : XY_RscListBox 
		{
			idc = 2402;
			text = "";
			sizeEx = 0.030;
			
			x = 0.60; y = 0.31;
			w = 0.275; h = 0.340;
		};
			
		class Title : XY_RscTitle {
			colorBackground[] = {0, 0, 0, 0};
			idc = 2403;
			text = "";
			x = 0.1;
			y = 0.2;
			w = 0.8;
			h = (1 / 25);
		};

		class PlayersName : Title {
			idc = 601;
			style = 1;
			text = "";
		};
		
		class buyEdit : XY_RscEdit 
		{
			idc = 2404;
			
			text = "1";
			sizeEx = 0.030;
			x = 0.12; y = 0.66;
			w = 0.27; h = 0.03;
		};
	
		class ButtonAddG : XY_RscButtonMenu
		{
			idc = -1;
			text = "$STR_VS_BuyItem";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "(_this select 0) ctrlEnable false; call XY_fnc_virtualShopBuy; (_this select 0) ctrlEnable true;";
			
			x = 0.16;
			y = 0.70;
			w = (6.25 / 40);
			h = (1 / 25);
		};
		
		class sellEdit : XY_RscEdit 
		{
			idc = 2405;
			
			text = "1";
			sizeEx = 0.030;
			x = 0.60; y = 0.66;
			w = 0.27; h = 0.03;
		};
		class ButtonRemoveG : XY_RscButtonMenu
		{
			idc = -1;
			text = "$STR_VS_SellItem";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "(_this select 0) ctrlEnable false; call XY_fnc_virtualShopSell; (_this select 0) ctrlEnable true;";
			
			x = 0.67;
			y = 0.70;
			w = (6.25 / 40);
			h = (1 / 25);
		};
		
		class ButtonClose : XY_RscButtonMenu {
			idc = -1;
			//shortcuts[] = {0x00050000 + 2};
			text = "$STR_Global_Close";
			onButtonClick = "closeDialog 0;";
			x = 0.1;
			y = 0.8 - (1 / 25);
			w = (6.25 / 40);
			h = (1 / 25);
		};
	};
};