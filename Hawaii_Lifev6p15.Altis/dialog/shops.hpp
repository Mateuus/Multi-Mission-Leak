#define BREIT 0.4
#define HOCH 0.5
class life_weapon_shop
{
	idd = 38400;
	movingEnable = 0;
	enableSimulation = 1;

	class controlsBackground
	{
		class RscTitleBackground : Life_RscText
		{
			colorBackground[] = {1,0.537,0,0.5};
			idc = -1;
			x = 0.1 ;
			y = 0.2 - (HOCH / 2);
			w = 0.32 + BREIT;
			h = (1 / 25);
		};

		class Mainbackground : Life_RscText
		{
			colorBackground[] = {0,0,0,0.7};
			idc = -1;
			x = 0.1 ; 
			y = 0.2 + (11 / 250) - (HOCH / 2);
			w = 0.32 + BREIT;
			h = 0.6 - (22 / 250) + HOCH;
		};

		class Title : Life_RscTitle
		{
			colorBackground[] = {0,0,0,0};
			idc = 38401;
			text = "";
			x = 0.1 ;
			y = 0.2 - (HOCH / 2);
			w = 0.32 + BREIT; 
			h = (1 / 25);
		};

		class itemInfo : Life_RscStructuredText
		{
			idc = 38404;
			text = "";
			sizeEx = 0.035;
			x = 0.11 ;
			y = 0.68 + HOCH - (HOCH / 2);
			w = 0.2+ BREIT;
			h = 0.2 ;
		};

		class FilterList : Life_RscCombo
		{
			idc = 38402;
			onLBSelChanged = "_this call life_fnc_weaponShopFilter";
			x = 0.11 ;
			y = 0.64 +HOCH - (HOCH / 2);
			w = 0.3+ BREIT;
			h = 0.035;
		};
	};

	class controls
	{
		class itemList : Life_RscListBox
		{
			idc = 38403;
			onLBSelChanged = "_this call life_fnc_weaponShopSelection";
			sizeEx = 0.035;
			x = 0.11 ;
			y = 0.25 - (HOCH / 2);
			w = 0.3 + BREIT; 
			h = 0.38 +HOCH;
		};

		class ButtonBuySell : Life_RscButtonMenu
		{
			idc = 38405;
			text = "$STR_Global_Buy";
			onButtonClick = "[] spawn life_fnc_weaponShopBuySell; true";
			x = 0.1 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH)) + BREIT ;
			y = 0.8 - (1 / 25) +HOCH - (HOCH / 2);
			w = (6.25 / 40);
			h = (1 / 25);
		};

		class ButtonClose : life_RscButtonMenu
		{
			idc = -1;
			text = "$STR_Global_Close";
			onButtonClick = "closeDialog 0;";
			x = 0.1 ;
			y = 0.8 - (1 / 25) + HOCH - (HOCH / 2);
			w = (6.25 / 40);
			h = (1 / 25);
		};

		class ButtonMags : life_RscButtonMenu
		{
			idc = 38406;
			text = "$STR_Global_Mags";
			onButtonClick = "_this call life_fnc_weaponShopMags; _this call life_fnc_weaponShopFilter";
			x = 0.1 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH)) + BREIT ;
			y = 0.85 - (1 / 25) +HOCH - (HOCH / 2);
			w = (6.25 / 40);
			h = (1 / 25);
		};
	};
};
