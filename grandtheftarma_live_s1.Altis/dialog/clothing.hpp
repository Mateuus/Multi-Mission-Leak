class Life_Clothing
{
	idd = 3100;

	class Controls 
	{

		class Title: GTA_RscTitle
		{
			idc = 3103;
			x = "7 * 					( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 ) + ( safezoneX )";
			y = "0 * 					( (	( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 ) + ( safezoneY + ( safezoneH - ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) ) / 2 )";
			w = "15 *	 				( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
			h = "1 * 					( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";

			text = "";
		};

		class Background: GTA_RscText
		{
			idc = -1;
			x = "7 * 					( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 ) + ( safezoneX )";
			y = "1.1 * 					( (	( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 ) + ( safezoneY + ( safezoneH - ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) ) / 2 )";
			w = "15 * 					( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
			h = "23 * 					( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";

			colorBackground[] = { 0, 0, 0, 0.7 };
		};

		class ListPlayers: GTA_RscListBox
		{
			idc = 3101;
			x = "7.5 * 					( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 ) + ( safezoneX )";
			y = "3.1 * 					( (	( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 ) + ( safezoneY + ( safezoneH - ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) ) / 2 )";
			w = "14 * 					( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
			h = "19 *	 				( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";

			colorBackground[] = { 1, 1, 1, 0.1 };
			colorPictureSelected[] = { 1, 1, 1, 1 };
			colorSelect[] = { 1, 1, 1, 1 };
			colorSelect2[] = { 1, 1, 1, 1 };
			colorSelectBackground[] = { 1, 1, 1, 0.5 };
			colorSelectBackground2[] = { 1, 1, 1, 0.5 };
			onLBSelChanged = "[_this] call life_fnc_changeClothes;";
			rowHeight = "1.4 * 			( (	( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
			sizeEx = "0.8 * 			( (	( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
		};

		class ComboFilter: GTA_RscCombo
		{
			idc = 3105;
			x = "7.5 * 					( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 ) + ( safezoneX )";
			y = "1.6 *					( (	( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 ) + ( safezoneY + ( safezoneH - ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) ) / 2 )";
			w = "14 * 					( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
			h = "1 *	 				( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";

			onLBSelChanged  = "_this call life_fnc_clothingFilter";
		};

		class TextPrice: GTA_RscStructuredText
		{
			idc = 3106;
			x = "7.5 * 					( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 ) + ( safezoneX )";
			y = "22.6 * 				( (	( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 ) + ( safezoneY + ( safezoneH - ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) ) / 2 )";
			w = "14 * 					( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
			h = "1 *	 				( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";

			colorBackground[] = { 1, 1, 1, 0.1 };
			text = "";
		};

		class ButtonClose: GTA_RscButtonMenuOK
		{
			x = "7 * 					( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 ) + ( safezoneX )";
			y = "24.2 *					( (	( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 ) + ( safezoneY + ( safezoneH - ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) ) / 2 )";
			w = "6 * 					( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
			h = "1 *	 				( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";

			text = "Close";
		};

		class ButtonBuy: GTA_RscButtonMenu
		{
			idc = 38405;
			x = "16 * 					( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 ) + ( safezoneX )";
			y = "24.2 *					( (	( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 ) + ( safezoneY + ( safezoneH - ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) ) / 2 )";
			w = "6 * 					( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
			h = "1 *	 				( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";

			onButtonClick = "[] call life_fnc_buyClothes;";
			text = "Buy";
		};

	};

};