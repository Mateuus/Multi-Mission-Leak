

class Life_Charge_Menu {
	idd = 1337;
	name= "life_charge";
	movingEnable = false;
	enableSimulation = true;
	onLoad = "[] spawn life_fnc_chargeMenu;";
	
	class controlsBackground {
		class Life_RscTitleBackground:Life_RscText {
			colorBackground[] = {0,0.3294117647058824,0.5411764705882353,1};
			idc = -1;
			x = 0.1;
			y = 0.2;
			w = 0.8;
			h = (1 / 25);
		};
		
		class MainBackground:Life_RscText {
			colorBackground[] = {0.1058823529411765,0.1058823529411765,0.1058823529411765,0.93};
			idc = -1;
			x = 0.1;
			y = 0.2 + (11 / 250);
			w = 0.8;
			h = 0.6 - (2 / 250);
		};
	};
	
	class controls {

		
		class Title : Life_RscTitle {
			colorBackground[] = {0, 0, 0, 0};
			idc = 1336;
			text = "File Charges";
			
			x = 0.1;
			y = 0.2;
			w = 0.6;
			h = (1 / 25);
		};
		
		class PlayerList_Admin : Life_RscListBox 
		{
			idc = 1338;
			text = "";
			sizeEx = 0.035;

			
			x = 0.12; y = 0.26;
			w = 0.30; h = 0.4;
		};
		
		class PlayerBInfo : Life_RscStructuredText
		{
			idc = 1339;
			text = "";
			x = 0.42;
			y = 0.25;
			w = 0.35;
			h = 0.6;
		};

		class Scublord : Life_RscButtonMenu {
			idc = -1;
			text = "Charge";
			colorBackground[] = {0,0.2235294117647059,0.3725490196078431,1};
			onButtonClick = "[] spawn life_fnc_initCustomCharge;";
			x = -0.06 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.88 - (1 / 25);
			w = (6.25 / 40);
			h = (1 / 25);
		};
	};
};

class Life_customCharge_ui
{
	idd = 13371;
	name = "customCharge_ui";
	movingEnabled = false;
	enableSimulation = true;
	
	class controlsBackground {
		class Life_RscTitleBackground:Life_RscText {
			colorBackground[] = {0,0.3294117647058824,0.5411764705882353,1};
			idc = -1;
			x = 0.3;
			y = 0.2;
			w = 0.47;
			h = (1 / 25);
		};
		
		class MainBackground:Life_RscText {
			colorBackground[] = {0.1058823529411765,0.1058823529411765,0.1058823529411765,0.93};
			idc = -1;
			x = 0.3;
			y = 0.2 + (11 / 250);
			w = 0.47;
			h = 0.3 - (22 / 250);
		};
	};
	
	class controls 
	{
		class Title : Life_RscTitle {
			colorBackground[] = {0, 0, 0, 0};
			idc = 2651;
			text = "Custom Crime";
			x = 0.3;
			y = 0.2;
			w = 0.6;
			h = (1 / 25);
		};
		
		class DefaultText : Life_RscEdit 
		{
			idc = 7331;
			
			text = "Type the bounty value";
			sizeEx = 0.030;
			x = 0.40; y = 0.30;
			w = 0.25; h = 0.03;
		};
		
		class ReasonText : Life_RscEdit 
		{
			idc = 7332;
			
			text = "Type the charge";
			sizeEx = 0.030;
			x = 0.40; y = 0.34;
			w = 0.25; h = 0.03;
		};

		class MoneyEdit: Life_RscButtonMenu {
			idc = -1;
			text = "Charge";
			colorBackground[] = {0,0.2235294117647059,0.3725490196078431,1};
			onButtonClick = "life_charged = true;";
			x = 0.45;
			y = 0.39;
			w = (6.25 / 40);
			h = (1 / 25);
		};
	};
};