class lhm_vehicle_shop {
	idd = 2300;
	name= "lhm_impound_menu";
	movingEnable = false;
	enableSimulation = true;
	//onLoad = "[] execVM 'core\client\keychain\init.sqf'";
	
	class controlsBackground {
		class lhm_RscTitleBackground:lhm_RscText {
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
			idc = -1;
			x = 0.1;
			y = 0.2;
			w = 0.8;
			h = (1 / 25);
		};
		
		class MainBackground:lhm_RscText {
			colorBackground[] = {0, 0, 0, 0.7};
			idc = -1;
			x = 0.1;
			y = 0.2 + (11 / 250);
			w = 0.8;
			h = 0.6 - (22 / 250);
		};
	};
	
	class controls {

		
		class Title : lhm_RscTitle {
			colorBackground[] = {0, 0, 0, 0};
			idc = 2301;
			text = "";
			x = 0.1;
			y = 0.2;
			w = 0.8;
			h = (1 / 25);
		};
		
		class VehicleList : lhm_RscListBox 
		{
			idc = 2302;
			text = "";
			sizeEx = 0.035;
			colorBackground[] = {0,0,0,0};
			onLBSelChanged = "[_this] call lhm_fnc_vehicleColorList";
			
			x = 0.12; y = 0.26;
			w = 0.76; h = 0.4;
		};
		
		class ColorList : lhm_RscCombo
		{
			idc = 2303;
			x = 0.42; y = 0.68;
			w = 0.275; h = 0.03;
		};

		class CloseButtonKey : lhm_RscButtonMenu {
			idc = -1;
			text = "$STR_Global_Close";
			onButtonClick = "closeDialog 0;";
			x = -0.06 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.8 - (1 / 25);
			w = (6.25 / 40);
			h = (1 / 25);
		};
		
		class GetCar : lhm_RscButtonMenu {
			idc = -1;
			text = "$STR_Global_Buy";
			onButtonClick = "[] spawn lhm_fnc_vehicleShopBuy";
			x = 0.1 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.8 - (1 / 25);
			w = (6.25 / 40);
			h = (1 / 25);
		};
		
		class GetCarGarage : lhm_RscButtonMenu {
			idc = -1;
			text = "$STR_Global_BuyPerm";
			onButtonClick = "[] spawn lhm_fnc_vehicleShopBuySave";
			x = 0.26 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.8 - (1 / 25);
			w = (10 / 40);
			h = (1 / 25);
		};

	};
};