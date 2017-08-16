class life_Rechnung_give
{
	idd = 2650;
	name = "life_rechnung_give";
	movingEnabled = false;
	enableSimulation = true;
	
	class controlsBackground {
		
		class Life_RscTitleBackground:Life_RscText {
			colorBackground[] = {0.4,0,0,0.5};
			idc = -1;
			x = 0.3;
			y = 0.2;
			w = 0.47;
			h = (1 / 25);
		};
		
		class MainBackground:Life_RscText {
			colorBackground[] = {0, 0, 0, 0.7};
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
			text = "";
			x = 0.3;
			y = 0.2;
			w = 0.6;
			h = (1 / 25);
		};
		
		class moneyEdit : Life_RscEdit 
		{
			idc = 2652;
			
			text = "100";
			sizeEx = 0.0250;
			x = 0.40; y = 0.30;
			w = 0.25; h = 0.025;
		};

		class payTicket: Life_RscButtonMenu {
			idc = -1;
			text = "Rechnung";
			colorBackground[] = {0.4,0,0,0.5};
			onButtonClick = "[] call life_fnc_rechnungGive";
			x = 0.45;
			y = 0.35;
			w = (6.25 / 40);
			h = (1 / 25);
		};
	};
};

class Life_rechnung_pay
{
	idd = 2600;
	name = "life_rechnung_pay";
	movingEnabled = false;
	enableSimulation = true;
	
	class controlsBackground {
		class Life_RscTitleBackground:Life_RscText {
			colorBackground[] = {0.4,0,0,0.5};
			idc = -1;
			x = 0.3;
			y = 0.2;
			w = 0.47;
			h = (1 / 25);
		};
		
		class MainBackground:Life_RscText {
			colorBackground[] = {0, 0, 0, 0.7};
			idc = -1;
			x = 0.3;
			y = 0.2 + (11 / 250);
			w = 0.47;
			h = 0.3 - (22 / 250);
		};
	};
	
	class controls 
	{
		class InfoMsg : Life_RscStructuredText
		{
			idc = 2601;
			sizeEx = 0.020;
			text = "";
			x = 0.287;
			y = 0.2 + (11 / 250);
			w = 0.5; h = 0.12;
		};

		class payTicket: Life_RscButtonMenu {
			idc = -1;
			text = "Bezahlen";
			colorBackground[] = {0.4,0,0,0.5};
			onButtonClick = "[] call life_fnc_rechnungPay;";
			x = 0.2 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.42 - (1 / 25);
			w = (6.25 / 40);
			h = (1 / 25);
		};
		
		class refuseTicket : Life_RscButtonMenu {
			idc = -1;
			text = "Verweigern";
			colorBackground[] = {0.4,0,0,0.5};
			onButtonClick = "closeDialog 0;";
			x = 0.4 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.42 - (1 / 25);
			w = (6.25 / 40);
			h = (1 / 25);
		};
	};
};