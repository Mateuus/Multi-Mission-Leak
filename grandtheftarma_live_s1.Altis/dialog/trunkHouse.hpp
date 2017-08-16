class TrunkHouseMenu
{
	idd = 8500;
	name = "TrunkHouseMenu";
	movingEnable = 0;
	enableSimulation = 1;

	class controlsBackground
	{
		class RscTitleBackground : Life_RscText
		{
			colorBackground[] = { 0.902, 0.451, 0.102, 0.8 };
			idc = -1;
			x = 0.1;
			y = 0.2;
			w = 0.7;
			h = (1 / 25);
		};

		class RscBackground : Life_RscText
		{
			colorBackground[] = {0, 0, 0, 0.7};
			idc = -1;
			x = 0.1;
			y = 0.2 + (11 / 250);
			w = 0.7;
			h = 0.7 - (22 / 250);
		};

		class RscTitleText : Life_RscTitle
		{
			colorBackground[] = {0, 0, 0, 0};
			idc = 8501;
			text = "";
			x = 0.1;
			y = 0.2;
			w = 0.7;
			h = (1 / 25);
		};

		class VehicleWeight : RscTitleText
		{
			idc = 8504;
			style = 1;
			text = "";
		};

		class RscTrunkText : Life_RscText
		{
			idc = -1;
			colorBackground[] = { 0, 0, 0, 0.8 };
			text = "House Inventory";
			sizeEx = 0.04;

			x = 0.11; y = 0.25;
			w = 0.3; h = 0.04;
		};

		class RscPlayerText : Life_RscText
		{
			idc = -1;
			colorBackground[] = { 0, 0, 0, 0.8 };
			text = "Player Inventory";
			sizeEx = 0.04;

			x = 0.49; y = 0.25;
			w = 0.3; h = 0.04;
		};
	};

	class Controls
	{
		class TrunkGear : GTA_RscListBox
		{
			idc = 8502;
			text = "";
			sizeEx = 0.030;

			x = 0.11; y = 0.29;
			w = 0.3; h = 0.42;
		};

		class PlayerGear : GTA_RscListBox
		{
			idc = 8503;
			text = "";
			sizeEx = 0.030;

			x = 0.49; y = 0.29;
			w = 0.3; h = 0.42;
		};

		class TrunkEdit : Life_RscEdit
		{
			idc = 8505;
			text = "1";
			sizeEx = 0.030;
			x = 0.11; y = 0.72;
			w = 0.3; h = 0.03;
		};

		class PlayerEdit : Life_RscEdit
		{
			idc = 8506;
			text = "1";
			sizeEx = 0.030;
			x = 0.49; y = 0.72;
			w = 0.3; h = 0.03;
		};

		class TakeItem : Life_RscButtonMenu
		{
			idc = -1;
			text = "Take";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "[] call life_fnc_houseTakeItem;";
			x = 0.19; y = 0.78;
			w = (6.25 / 40);
			h = (1 / 25);
		};

		class StoreItem : Life_RscButtonMenu
		{
			idc = -1;
			text = "Store";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "[] call life_fnc_houseStoreItem;";
			x = 0.57; y = 0.78;
			w = (6.25 / 40);
			h = (1 / 25);
		};

		class ButtonClose : Life_RscButtonMenu {
			idc = -1;
			//shortcuts[] = {0x00050000 + 2};
			text = "Close";
			onButtonClick = "[] call life_fnc_preCloseHouseStorage; closeDialog 0;";
			x = 0.1;
			y = 0.9 - (1 / 25);
			w = (6.25 / 40);
			h = (1 / 25);
		};
	};
};
