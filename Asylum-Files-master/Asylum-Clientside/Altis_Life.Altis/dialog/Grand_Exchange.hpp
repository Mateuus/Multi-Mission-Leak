class STS_Grand_Exchange
{
	idd = 2800;
	name="Grand_Exchange";
	movingEnabled = 0;
	enableSimulation = 1;
	onLoad = "";
	
	class controlsBackground
	{
		class Life_RscTitleBackground : Life_RscText
		{
			colorBackground[] = {0,0.3294117647058824,0.5411764705882353,1};
			idc = -1;
			x = -0.001;
			y = 0.2;
			w = 0.901;
			h = (1 / 25);
		};
		
		class MainBackground : Life_RscText
		{
			colorBackground[] = {0.1058823529411765,0.1058823529411765,0.1058823529411765,0.93};
			idc = -1;
			x = -0.001;
			y = 0.2 + (11 / 250);
			w = 0.901;
			h = 0.7 - (22 / 250);
		};
		
		class Title : Life_RscTitle
		{
			idc = 2801;
			text = "The Asylum Exchange ™";
			x = -0.001;
			y = 0.2;
			w = 0.901;
			h = (1 / 25);
		};
		
		class VehicleTitleBox : Life_RscText
		{
			idc = 32;
			text = "Your Active Offers";
			colorBackground[] = {0,0.3294117647058824,0.5411764705882353,1};
			x = 0.009; y = 0.26;
			w = 0.891;
			h = (1 / 25);
		};
		
		class VehicleInfoHeader : Life_RscText
		{
			idc = 2830;
			text = "Offer Information";
			colorBackground[] = {0,0.3294117647058824,0.5411764705882353,1};
			x = 0.42; y = 0.31;
			w = 0.46;
			h = (1 / 25);
		};
		
		class CloseBtn : Life_RscButtonMenu
		{
			idc = -1;
			text = "Close";
			colorBackground[] = {0,0.2235294117647059,0.3725490196078431,1};
			onButtonClick = "closeDialog 0;";
			x = -0.06 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.9 - (1 / 25);
			w = (6.25 / 40);
			h = (1 / 25);
		};
		
		class AllOffer : Life_RscButtonMenu
		{
			idc = -1;
			text = "All B. Offers";
			colorBackground[] = {0,0.2235294117647059,0.3725490196078431,1};
			onButtonClick = "[3] call KBW_fnc_checkOffer";
			x = -0.08 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.95 - (1 / 25);
			w = (7 / 40);
			h = (1 / 25);
		};
		
		class AllOffers : Life_RscButtonMenu
		{
			idc = -1;
			text = "All S. Offers";
			colorBackground[] = {0,0.2235294117647059,0.3725490196078431,1};
			onButtonClick = "[2] call KBW_fnc_checkOffer";
			x = -0.08 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 1 - (1 / 25);
			w = (7 / 40);
			h = (1 / 25);
		};
		
		class RentCar : Life_RscButtonMenu
		{
			idc = -1;
			text = "New Offer";
			colorBackground[] = {0,0.2235294117647059,0.3725490196078431,1};
			onButtonClick = "[] spawn KBW_fnc_buyOffer";
			x = 0.1 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.9 - (1 / 25);
			w = (6.25 / 40);
			h = (1 / 25);
		};
		
		class Checkbuy : Life_RscButtonMenu
		{
			idc = -1;
			text = "See offers to buy this item";
			colorBackground[] = {0,0.2235294117647059,0.3725490196078431,1};
			onButtonClick = "[1] call KBW_fnc_checkOffer";
			x = 0.1 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.95 - (1 / 25);
			w = (16 / 40);
			h = (1 / 25);
		};
		
		class Checksell : Life_RscButtonMenu
		{
			idc = -1;
			text = "Check availability of this item";
			colorBackground[] = {0,0.2235294117647059,0.3725490196078431,1};
			onButtonClick = "[0] call KBW_fnc_checkOffer";
			x = 0.1 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 1 - (1 / 25);
			w = (16 / 40);
			h = (1 / 25);
		};
		
		class BuyCar : life_RscButtonMenu 
		{
			idc = 1901;
			text = "Retract Offer";
			colorBackground[] = {0,0.2235294117647059,0.3725490196078431,1};
			onButtonClick = "[] call KBW_fnc_removeOffer";
			x = 0.26 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.9 - (1 / 25);
			w = (11 / 40);
			h = (1 / 25);
		};
		class Oblige : life_RscButtonMenu 
		{
			idc = 1902;
			text = "Match Offer";
			colorBackground[] = {0,0.2235294117647059,0.3725490196078431,1};
			onButtonClick = "[] spawn KBW_fnc_obligeOffer";
			x = 0.26 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.9 - (1 / 25);
			w = (11 / 40);
			h = (1 / 25);
		};
		class ItemsList: Life_RscCombo
		{
			idc = 39403;
			x = -0.5 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = .88 - (1 / 25);
			w = 0.1282 * safezoneW;
			h = 0.033 * safezoneH;
			colorText[] = {0,0,0,1};
			colorBackground[] = {1,1,1,1};
			onLBSelChanged = "switch(lbValue[39403,lbCurSel 39403]) do {case 0: {call fnc_addWeapons}; case 1: {call fnc_addVehicles}; case 2: {call fnc_addResources}; }";
		};
		class Header : Life_RscTitle
		{
			colorBackground[] = {0,0.3294117647058824,0.5411764705882353,1};
			idc = -1;
			text = "Products";
			x = -0.5 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.2;
			w = 0.113437 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class itemList : Life_RscListBox
		{
			idc = 44004;
			onLBSelChanged = "";
			x = -0.5 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.357 * safezoneH + safezoneY;
			w = 0.113437 * safezoneW;
			h = 0.201 * safezoneH;
		};

	};
	
	class controls
	{
		class VehicleList : Life_RscListBox
		{
			idc = 2802;
			text = "";
			sizeEx = 0.04;
			colorBackground[] = {0.1,0.1,0.1,0.9};
			onLBSelChanged = "_this call KBW_fnc_GELBChange;";
			x = 0.009; y = 0.302;
			w = 0.404; h = 0.49;
		};
		
		class vehicleInfomationList : Life_RscStructuredText
		{
			idc = 2803;
			text = "";
			sizeEx = 0.035;
			
			x = 0.41; y = 0.35;
			w = 0.5; h = 0.5;
		};
		
		class MainBackgroundHider : Life_RscText
		{
			colorBackground[] = {0,0,0,1};
			idc = 2810;
			x = -0.001;
			y = 0.2 + (11 / 250);
			w = 0.901;
			h = 0.7 - (22 / 250);
		};
		
		class MainHideText : Life_RscText
		{
			idc = 2811;
			text = "Retrieving Offers...";
			sizeEx = 0.06;
			x = 0.139; y = 0.5;
			w = 0.701;
			h = (1 / 15);
		};
	};
};