class EMonkeys_vehicle_shop
{
	name = "EMonkeys_vehicle_shop";
	idd = 20000;
	fadein=0;
	duration = 99999999999;
	fadeout=0;
	movingEnable = 0;
	objects[]={};

	class controlsBackground 
	{	
		class background1 : EMonkeys_RscPicture
		{
			idc = -1;
			text = "core\textures\menu_background\bg_carShop_1.paa";
			x = -0.000156274 * safezoneW + safezoneX;
			y = 0.0666 * safezoneH + safezoneY;
			w = 0.505313 * safezoneW;
			h = 0.935 * safezoneH;
		};
		
		class background2 : EMonkeys_RscPicture
		{
			idc = -1;
			text = "core\textures\menu_background\bg_carShop_2.paa";
			x = 0.458749 * safezoneW + safezoneX;
			y = 0.0666 * safezoneH + safezoneY;
			w = 0.541406 * safezoneW;
			h = 0.935 * safezoneH;
		};
		
		class background3 : EMonkeys_RscPicture
		{
			idc = -1;
			text = "core\textures\menu_background\bg_carShop_3.paa";
			x = 0.278282 * safezoneW + safezoneX;
			y = -0.0016 * safezoneH + safezoneY;
			w = 0.448542 * safezoneW;
			h = 0.821296 * safezoneH;
		};
	};

	class controls
	{
		class shop_titel : EMonkeys_RscStructuredText
		{
			idc = 0900;
			x = 0.356146 * safezoneW + safezoneX;
			y = 0.027 * safezoneH + safezoneY;
			w = 0.318854 * safezoneW;
			h = 0.0457407 * safezoneH;
			colorBackground[] = {-1,-1,-1,0};
		};
		
		class vehicle_liste : EMonkeys_RscListBox 
		{
			idc = 1000;
			sizeEx = 0.039;
			font="PuristaSemiBold";
			onLBSelChanged = "[] spawn EMonkeys_fnc_switchVehicleShop";
			colorBackground[] = {0,0,0,0}; 								//Hintergrund Farbe
			colorSelectBackground[] = {1,1,1,0}; 						//Ausgewählt: Hintergund Farbe
			colorSelectBackground2[] = {1,1,1,0}; 						//Ausgewählt: Hintergund Farbe (blinken)
			color[] = {1,1,1,1};
			colorPicture[] = {0.9,0.9,0.9,0.7};							//Normal: Picture Farbe 
			colorPictureSelected[] = {1,1,1,1}; 						//Ausgewählt: Picture Farbe
			colorSelect[] = {1,1,1,1}; 									//Ausgewählt: Text Farbe
			colorSelect2[] = {1,1,1,1}; 								//Ausgewählt: Text Farbe (blinken)
			colorText[] = {0.9,0.9,0.9,0.7}; 							//Normal: Text Farbe
			colorDisabled[] = {0,0,0,0.4};
			x = 0.00134372 * safezoneW + safezoneX;
			y = 0.159689 * safezoneH + safezoneY;
			w = 0.164948 * safezoneW;
			h = 0.445222 * safezoneH;
		};
		
		class vehicle_infos : EMonkeys_RscStructuredText
		{
			idc = 1005;
			text = "";
			colorBackground[] = {-1,-1,-1,0};
			x = 0.00138542 * safezoneW + safezoneX;
			y = 0.656207 * safezoneH + safezoneY;
			w = 0.164531 * safezoneW;
			h = 0.229037 * safezoneH;
		};
		
		class color_liste : EMonkeys_RscListBox 
		{
			idc = 1100;
			sizeEx = 0.039;
			font="PuristaSemiBold";
			onLBSelChanged = "[] call EMonkeys_fnc_switchVehColorShop";
			colorBackground[] = {0,0,0,0}; 								//Hintergrund Farbe
			colorSelectBackground[] = {1,1,1,0}; 						//Ausgewählt: Hintergund Farbe
			colorSelectBackground2[] = {1,1,1,0}; 						//Ausgewählt: Hintergund Farbe (blinken)
			color[] = {1,1,1,1};
			colorPicture[] = {0.9,0.9,0.9,0.7};							//Normal: Picture Farbe 
			colorPictureSelected[] = {1,1,1,1}; 						//Ausgewählt: Picture Farbe
			colorSelect[] = {1,1,1,1}; 									//Ausgewählt: Text Farbe
			colorSelect2[] = {1,1,1,1}; 								//Ausgewählt: Text Farbe (blinken)
			colorText[] = {0.9,0.9,0.9,0.7}; 							//Normal: Text Farbe
			colorDisabled[] = {0,0,0,0.4};
			x = 0.898354 * safezoneW + safezoneX;
			y = 0.156208 * safezoneH + safezoneY;
			w = 0.100104 * safezoneW;
			h = 0.423704 * safezoneH;
		};
		
		class Zoom : EMonkeys_RscXSliderH
		{
			idc = 1200;
			text = "";
			onSliderPosChanged = "[_this select 1] spawn EMonkeys_fnc_zoomVehicleShop;";
			tooltip = "Entfernung zum Fahrzeug";
			color[] = {1,1,1,0.4};
			colorActive[] = {1,1,1,0.4};
			arrowFull = "\A3\ui_f\data\gui\cfg\slider\arrowEmpty_ca.paa";
			arrowEmpty = "\A3\ui_f\data\gui\cfg\slider\arrowFull_ca.paa";
			x = 0.899481 * safezoneW + safezoneX;
			y = 0.838311 * safezoneH + safezoneY;
			w = 0.0985414 * safezoneW;
			h = 0.0244445 * safezoneH;
		};
		
		class buy_price : EMonkeys_RscStructuredText
		{
			idc = 1010;
			text = "";
			colorBackground[] = {-1,-1,-1,0};
			x = 0.898385 * safezoneW + safezoneX;
			y = 0.636407 * safezoneH + safezoneY;
			w = 0.100521 * safezoneW;
			h = 0.0393703 * safezoneH;
		};
		
		class rent_price : EMonkeys_RscStructuredText
		{
			idc = 1015;
			text = "";
			colorBackground[] = {-1,-1,-1,0};
			x = 0.898438 * safezoneW + safezoneX;
			y = 0.737038 * safezoneH + safezoneY;
			w = 0.100104 * safezoneW;
			h = 0.0392594 * safezoneH;
		};
		
		class buy_vehicle : EMonkeys_RscPictureButton
		{
			idc = 1201;
			text = "core\textures\menu_icons\icon_carBuy.paa";
			tooltip = "Du musst ein Fahrzeug auswählen";
			x = 0.298906 * safezoneW + safezoneX;
			y = 0.9576 * safezoneH + safezoneY;
			w = 0.128906 * safezoneW;
			h = 0.231 * safezoneH;
		};
		
		class rent_vehicle : EMonkeys_RscPictureButton
		{
			idc = 1202;
			text = "core\textures\menu_icons\icon_carRent.paa";
			tooltip = "Du musst ein Fahrzeug auswählen";
			x = 0.432969 * safezoneW + safezoneX;
			y = 0.9532 * safezoneH + safezoneY;
			w = 0.128906 * safezoneW;
			h = 0.231 * safezoneH;
		};
		
		class close : EMonkeys_RscPictureButton
		{
			idc = 1203;
			text = "core\textures\menu_icons\icon_carClose.paa";
			onButtonDown = "[] spawn EMonkeys_fnc_closeVehicleShop";
			x = 0.567031 * safezoneW + safezoneX;
			y = 0.9576 * safezoneH + safezoneY;
			w = 0.128906 * safezoneW;
			h = 0.231 * safezoneH;
		};
	};
};