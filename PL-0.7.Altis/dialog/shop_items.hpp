class shops_menu {
	idd = 2400;
	name= "shops_menu";
	movingEnable = 0;
	enableSimulation = 1;
	//onLoad = "['guns'] execVM 'gear\switch.sqf'";

	class controlsBackground {
		class Life_RscTitleBackground:Life_RscText {
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
			idc = -1;
			x = 0;
			y = 0.1;
			w = 0.925;
			h = (1 / 25);
		};

		class MainBackground:Life_RscText {
			colorBackground[] = {0, 0, 0, 0.7};
			idc = -1;
			x = 0;
			y = 0.1 + (11 / 250);
			w = 0.925;
			h = 0.8 - (22 / 250);
		};

		class vasText : Life_RscText
		{
			idc = -1;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			text = "$STR_VS_SI";
			sizeEx = 0.04;
			x = 0; y = 0.17;
			w = 0.4; h = 0.04;
		};

		class vasgText : Life_RscText
		{
			idc = -1;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			text = "$STR_VS_PI";
			sizeEx = 0.04;

			x = 0.50; y = 0.17;
			w = 0.4; h = 0.04;
		};
	};

	class controls {

		class itemList : Life_RscListBox
		{
			idc = 2401;
			text = "";
			sizeEx = 0.030;
			//onLBSelChanged = "[] call fnc_selection";

			x = 0; y = 0.21;
			w = 0.4; h = 0.540;
		};

		class pItemlist : Life_RscListBox
		{
			idc = 2402;
			text = "";
			sizeEx = 0.030;
			//onLBSelChanged = "[2502] execVM 'gear\selection.sqf'";

			x = 0.50; y = 0.21;
			w = 0.4; h = 0.540 - ( 1 / 25 ) - 0.01;
		};

		class Title : Life_RscTitle {
			colorBackground[] = {0, 0, 0, 0};
			idc = 2403;
			text = "";
			x = 0;
			y = 0.1;
			w = 0.8;
			h = (1 / 25);
		};

		class PlayersName : Title {
			idc = 601;
			style = 1;
			text = "";
		};

		class buyEdit : Life_RscEdit
		{
			idc = 2404;

			text = "1";
			sizeEx = 0.030;
			x = 0; y = 0.76;
			w = 0.4; h = 0.03;
		};

		class ButtonAddG : Life_RscButtonMenu
		{
			idc = -1;
			text = "$STR_VS_BuyItem";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "[] spawn life_fnc_virt_buy;";

			x = 0.1;
			y = 0.80;
			w = (6.25 / 40);
			h = (1 / 25);
		};
		class ButtonAddbuy : Life_RscButtonMenu
		{
			idc = -1;
			text = "+1";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "[0,0] spawn life_fnc_addsubstract;";

			x = 0.26;
			y = 0.80;
			w = (1.75 / 40);
			h = (1 / 25);
		};
		class ButtonSubbuy : Life_RscButtonMenu
		{
			idc = -1;
			text = "-1";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "[0,1] spawn life_fnc_addsubstract;";

			x = 0.05;
			y = 0.80;
			w = (1.75 / 40);
			h = (1 / 25);
		};

		class sellEdit : Life_RscEdit
		{
			idc = 2405;

			text = "1";
			sizeEx = 0.030;
			x = 0.50; y = 0.76;
			w = 0.4; h = 0.03;
		};
		class ButtonRemoveG : Life_RscButtonMenu
		{
			idc = -1;
			text = "$STR_VS_SellItem";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "[] call life_fnc_virt_sell";

			x = 0.6;
			y = 0.80;
			w = (6.25 / 40);
			h = (1 / 25);
		};
		class ButtonRemoveAllG : Life_RscButtonMenu
		{
			idc = -1;
			text = "$STR_VS_SellAllItem";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "[true] call life_fnc_virt_sell";

			x = 0.50; y = 0.72;
			w = 0.4; h = ( 1 / 25 );
		};
		class ButtonAddSell : Life_RscButtonMenu
		{
			idc = -1;
			text = "+1";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "[1,0] spawn life_fnc_addsubstract;";

			x = 0.76;
			y = 0.80;
			w = (1.75 / 40);
			h = (1 / 25);
		};
		class ButtonSubSell : Life_RscButtonMenu
		{
			idc = -1;
			text = "-1";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "[1,1] spawn life_fnc_addsubstract;";

			x = 0.55;
			y = 0.80;
			w = (1.75 / 40);
			h = (1 / 25);
		};

		class ButtonClose : Life_RscButtonMenu {
			idc = -1;
			//shortcuts[] = {0x00050000 + 2};
			text = "$STR_Global_Close";
			onButtonClick = "closeDialog 0;";
			x = 0;
			y = 0.9 - (1 / 25);
			w = (6.25 / 40);
			h = (1 / 25);
		};
	};
};
