class licenses_dialog
 {
	idd = 2900;
	name= "licenses_dialog";
	movingEnable = false;
	enableSimulation = true;	
	
	class controlsBackground 
	{
		class emonkeys_RscTitleBackground: emonkeys_RscPicture
		{
			idc = -1;
			text = "core\textures\menu_background\bg_licensesMenu.paa";
			x = 0.314316 * safezoneW + safezoneX;
			y = 0.125969 * safezoneH + safezoneY;
			w = 0.381684 * safezoneW;
			h = 0.726059 * safezoneH;
		};
	};
	
	class controls 
	{
		class licenseList: emonkeys_RscListbox
		{
			idc = 1500;
			colorBackground[] = {0,0,0,0}; 								//Hintergrund Farbe
			colorSelectBackground[] = {0,0,0,0.2}; 						//Ausgewählt: Hintergund Farbe
			colorSelectBackground2[] = {0,0,0,0.2}; 					//Ausgewählt: Hintergund Farbe (blinken)
			color[] = {1,1,1,1};
			colorPicture[] = {0.9,0.9,0.9,0.6};							//Normal: Picture Farbe 
			colorPictureSelected[] = {1,1,1,1}; 						//Ausgewählt: Picture Farbe
			colorSelect[] = {0,0,0,1}; 									//Ausgewählt: Text Farbe
			colorSelect2[] = {0,0,0,1}; 								//Ausgewählt: Text Farbe (blinken)
			colorText[] = {0,0,0,0.8}; 									//Normal: Text Farbe
			x = 0.376407 * safezoneW + safezoneX;
			y = 0.34167 * safezoneH + safezoneY;
			w = 0.252161 * safezoneW;
			h = 0.376674 * safezoneH;
			sizeEx = 0.04;
		};
		
		class b_buy: emonkeys_RscButtonMenu
		{
			idc = 2401;
			text = "";
			colorBackground[] = {-1,-1,-1,-1};
			colorBackgroundFocused[] = {1,1,1,0.12};
			colorBackground2[] = {0.75,0.75,0.75,0.2};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,1};
			color2[] = {0,0,0,1};
			colorText[] = {0,0,0,1};
			colorDisabled[] = {0,0,0,0.4};
			x = 0.551579 * safezoneW + safezoneX;
			y = 0.731019 * safezoneH + safezoneY;
			w = 0.07913 * safezoneW;
			h = 0.0299524 * safezoneH;
			onButtonClick = "if( (lbData[1500,lbCurSel (1500)] != """") ) then { [false, false, false, lbData[1500,lbCurSel (1500)]] call EMonkeys_fnc_buyLicense; closeDialog 0; };";
		};
		
		class closebutton: emonkeys_RscPictureButton
		{
			idc = -1;
			text = "core\textures\menu_icons\icon_close.paa";
			onButtonClick = "closeDialog 0;";
			x = 0.355579 * safezoneW + safezoneX;
			y = 0.213977 * safezoneH + safezoneY;
			w = 0.0257895 * safezoneW;
			h = 0.0440036 * safezoneH;
		};
	};
};