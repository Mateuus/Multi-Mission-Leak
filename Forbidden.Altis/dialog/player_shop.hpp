class player_shop {
	idd = 89453;
	name= "player_shop";
	movingEnable = false;
	enableSimulation = true;
	onLoad = "";
	
	class controlsBackground {
		
		class MainBackground:Life_RscText {
			colorBackground[] = {0, 0, 0, 0.7};
			idc = -1;
			x = -0.1;
			y = -0.1 + (11 / 250);
			w = 1.04;
			h = 0.7 - (5 / 250);
		};
	};
	
	class controls {
		
		class CloseButtonKey : Life_RscButtonMenu {
			idc = -1;
			text = "$STR_Global_Close";
			onButtonClick = "closeDialog 0;";
			x = -0.1;
			y = 0.63;
			w = (6.25 / 40);
			h = (1 / 25);
		};
		
		class SaveButtonKey : Life_RscButtonMenu {
			idc = 2000;
			text = "Spara";
			onButtonClick = "";
			x = -0.1 + (6.60 / 40);
			y = 6.23;
			w = (6.25 / 40);
			h = (1 / 25);
		};
		
		class shopTitleText : Life_RscTitle {
			colorBackground[] = {0, 0, 0, 0};
			idc = 2012;
			sizeEx = 0.06;
			text = "Tom butik";
			x = -0.1;
			y = -0.042;
			w = 1.04;
			h = (1 / 25);
		};
		
		
		class itemIcon0 : Life_RscButtonPerks {
			idc = 2209;
			x = 0.25;
			y = 0.53 + (25 / 250);
			w = 0.08; h = 0.08;
			onButtonClick = "";
		};
		
		class itemIcon1 : Life_RscButtonPerks {
			idc = 2210;
			x = 0.40;
			y = 0.53 + (25 / 250);
			w = 0.08; h = 0.08;
			onButtonClick = "";
		};
		
		class itemIcon2 : Life_RscButtonPerks {
			idc = 2211;
			x = 0.55;
			y = 0.53 + (25 / 250);
			w = 0.08; h = 0.08;
			onButtonClick = "";
		};
	};
};