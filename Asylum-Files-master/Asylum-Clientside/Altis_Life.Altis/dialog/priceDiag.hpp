class STS_KBW_price_diag
{
	idd = 13371;
	name = "price_diag";
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
			text = "Type offer price";
			x = 0.3;
			y = 0.2;
			w = 0.6;
			h = (1 / 25);
		};
		
		class DefaultText : Life_RscEdit 
		{
			idc = 7331;
			
			text = "";
			sizeEx = 0.030;
			x = 0.40; y = 0.30;
			w = 0.25; h = 0.03;
		};

		class MoneyEdit: Life_RscButtonMenu {
			idc = -1;
			text = "Confirm";
			colorBackground[] = {0,0.2235294117647059,0.3725490196078431,1};
			onButtonClick = "life_priced = true";
			x = 0.45;
			y = 0.39;
			w = (6.25 / 40);
			h = (1 / 25);
		};
	};
};