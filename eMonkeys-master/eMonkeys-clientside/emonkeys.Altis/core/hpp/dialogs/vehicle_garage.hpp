class EMonkeys_vehicle_garage
{
	name = "EMonkeys_vehicle_garage";
	idd = 21000;
	fadein=0;
	duration = 99999999999;
	fadeout=0;
	movingEnable = 0;
	objects[]={};

	class controlsBackground 
	{	
		class background: EMonkeys_RscPicture
		{
			idc = -1;
			text = "core\textures\menu_background\bg_garageMenu.paa";
			x = 0.283437 * safezoneW + safezoneX;
			y = 0.104 * safezoneH + safezoneY;
			w = 0.43724 * safezoneW;
			h = 0.774074 * safezoneH;
		};
	};

	class controls
	{	
		class close: EMonkeys_RscPictureButton
		{
			idc = 1200;
			text = "core\textures\menu_icons\icon_close.paa";
			onButtonDown = "closeDialog 0;";
			x = 0.696875 * safezoneW + safezoneX;
			y = 0.20474 * safezoneH + safezoneY;
			w = 0.0227083 * safezoneW;
			h = 0.0376296 * safezoneH;
		};

		class vehicle_liste: EMonkeys_RscListBox 
		{
			idc = 1000;
			sizeEx = 0.035;
			onLBSelChanged = "[] call EMonkeys_fnc_switchVehicleGarage";
			colorBackground[] = {0,0,0,0}; 								//Hintergrund Farbe
			colorSelectBackground[] = {1,1,1,0}; 						//Ausgewählt: Hintergund Farbe
			colorSelectBackground2[] = {1,1,1,0}; 						//Ausgewählt: Hintergund Farbe (blinken)
			color[] = {1,1,1,1};
			colorPicture[] = {0.9,0.9,0.9,0.6};							//Normal: Picture Farbe 
			colorPictureSelected[] = {1,1,1,1}; 						//Ausgewählt: Picture Farbe
			colorSelect[] = {1,1,1,1}; 									//Ausgewählt: Text Farbe
			colorSelect2[] = {1,1,1,1}; 								//Ausgewählt: Text Farbe (blinken)
			colorText[] = {0.9,0.9,0.9,0.6}; 							//Normal: Text Farbe
			colorDisabled[] = {0,0,0,0.4};
			x = 0.358176 * safezoneW + safezoneX;
			y = 0.400518 * safezoneH + safezoneY;
			w = 0.146718 * safezoneW;
			h = 0.374852 * safezoneH;
		};

		class vehicle_infos: EMonkeys_RscStructuredText
		{
			idc = 1005;
			text = "";
			colorBackground[] = {-1,-1,-1,0};
			x = 0.515046 * safezoneW + safezoneX;
			y = 0.354974 * safezoneH + safezoneY;
			w = 0.141249 * safezoneW;
			h = 0.255926 * safezoneH;
		};	

		class parkout_price: EMonkeys_RscStructuredText
		{
			idc = 1010;
			text = "";
			colorBackground[] = {-1,-1,-1,0};
			x = 0.514948 * safezoneW + safezoneX;
			y = 0.612778 * safezoneH + safezoneY;
			w = 0.14125 * safezoneW;
			h = 0.0383333 * safezoneH;
		};

		class vehicle_types: EMonkeys_RscCombo
		{
			idc = 1100;
			sizeEx = 0.035;
			onLBSelChanged = "[] call EMonkeys_fnc_switchVehTypGarage";
			colorBackground[] = {0,0,0,0.6};
			colorSelectBackground[] = {0.8,0.8,0.8,0.5};
			colorSelectBackground2[] = {1,1,1,0};
			color[] = {1,1,1,1};
			color2[] = {0,0,0,1};
			colorText[] = {1,1,1,1};
			colorSelect[] = {1,1,1,1};
			colorSelect2[] = {1,1,1,1};
			colorDisabled[] = {0,0,0,0.4};
			x = 0.358542 * safezoneW + safezoneX;
			y = 0.354334 * safezoneH + safezoneY;
			w = 0.147449 * safezoneW;
			h = 0.0247775 * safezoneH;
		};

		class parkout_vehicle: EMonkeys_RscButtonMenu
		{
			idc = 1201;
			tooltip = "Du musst ein Fahrzeug auswählen";
			colorBackground[] = {-1,-1,-1,-1};
			colorBackgroundFocused[] = {1,1,1,0.09};
			colorBackground2[] = {0.75,0.75,0.75,0.12};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,1};
			color2[] = {0,0,0,1};
			colorText[] = {1,1,1,1};
			colorDisabled[] = {0,0,0,0.4};
			x = 0.615417 * safezoneW + safezoneX;
			y = 0.291815 * safezoneH + safezoneY;
			w = 0.0615625 * safezoneW;
			h = 0.0208518 * safezoneH;
		};
	};
};
