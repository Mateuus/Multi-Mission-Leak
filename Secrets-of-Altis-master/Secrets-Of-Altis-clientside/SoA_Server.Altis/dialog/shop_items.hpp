class shops_menu {
	idd = 2400;
	name= "shops_menu";
	movingEnable = false;
	enableSimulation = true;	
	class controlsBackground {

		class hintergrundbild: Life_RscPicture
		{
			idc = -1;
			text = "images\shop_neu_lap.paa";
			x = 0.17 * safezoneW + safezoneX;
			y = -0.039 * safezoneH + safezoneY;
			w = 0.654844 * safezoneW;
			h = 1.133 * safezoneH;
		};
	};
	
	class controls {
		
		class itemList : Life_RscListBox 
		{
			idc = 2401;
			text = "";
			sizeEx = 0.0250;
			x = 0.555157 * safezoneW + safezoneX;
			y = 0.324 * safezoneH + safezoneY;
			w = 0.166562 * safezoneW;
			h = 0.275 * safezoneH;
			colorBackground[] = {1,1,1,0};			
		};
		
		class pItemlist : Life_RscListBox 
		{
			idc = 2402;
			text = "";
			sizeEx = 0.0250;
			x = 0.27448 * safezoneW + safezoneX;
			y = 0.325 * safezoneH + safezoneY;
			w = 0.166562 * safezoneW;
			h = 0.275 * safezoneH;
			colorBackground[] = {1,1,1,0};			
		};

		class buyEdit : Life_RscEdit 
		{
			idc = 2404;
			text = "1";
			sizeEx = 0.0250;
			x = 0.458021 * safezoneW + safezoneX;
			y = 0.362482 * safezoneH + safezoneY;
			w = 0.0816146 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {1,1,1,0.1};
		};
		
		class ButtonAddbuy : Life_RscButtonMenu
		{
			idc = -1;
			text = "";
			onButtonClick = "[0,0] spawn life_fnc_addsubstract;";
			x = 0.511979 * safezoneW + safezoneX;
			y = 0.387963 * safezoneH + safezoneY;
			w = 0.0277084 * safezoneW;
			h = 0.0244445 * safezoneH;
			colorBackground[] = {-1,-1,-1,0};
			colorBackgroundFocused[] = {-1,-1,-1,0};
			colorBackground2[] = {-1,-1,-1,0};
			color[] = {1,1,1,0};
			colorFocused[] = {0,0,0,0};
			color2[] = {0,0,0,0};
			colorText[] = {1,1,1,1};
			colorDisabled[] = {0,0,0,0};
		};
		
		class ButtonSubbuy : ButtonAddbuy
		{
			idc = -1;
			text = "";
			onButtonClick = "[0,1] spawn life_fnc_addsubstract;";
			x = 0.457292 * safezoneW + safezoneX;
			y = 0.388889 * safezoneH + safezoneY;
			w = 0.0277084 * safezoneW;
			h = 0.0244445 * safezoneH;
		};
		
		class ButtonAddG : ButtonAddbuy
		{
			idc = -1;
			text = "";
			onButtonClick = "[] call life_fnc_virt_buy;";
			x = 0.457292 * safezoneW + safezoneX;
			y = 0.32963 * safezoneH + safezoneY;
			w = 0.0820312 * safezoneW;
			h = 0.0274445 * safezoneH;
		};
		
		class sellEdit : Life_RscEdit 
		{
			idc = 2405;
			text = "1";
			sizeEx = 0.0250;
			x = 0.457812 * safezoneW + safezoneX;
			y = 0.473148 * safezoneH + safezoneY;
			w = 0.0816146 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {1,1,1,0.1};
		};
		
		class ButtonRemoveG : ButtonAddbuy
		{
			idc = 2406;
			text = "";
			onButtonClick = "[] call life_fnc_virt_sell";
			x = 0.457292 * safezoneW + safezoneX;
			y = 0.44074 * safezoneH + safezoneY;
			w = 0.0820312 * safezoneW;
			h = 0.0274445 * safezoneH;
		};
		
		class ButtonAddSell : ButtonAddbuy
		{
			idc = 2407;
			text = "";
			onButtonClick = "[1,0] spawn life_fnc_addsubstract;";
			x = 0.511354 * safezoneW + safezoneX;
			y = 0.5 * safezoneH + safezoneY;
			w = 0.0277084 * safezoneW;
			h = 0.0244445 * safezoneH;
		};
		
		class ButtonSubSell : ButtonAddbuy
		{
			idc = 2408;
			text = "";
			onButtonClick = "[1,1] spawn life_fnc_addsubstract;";
			x = 0.457292 * safezoneW + safezoneX;
			y = 0.5 * safezoneH + safezoneY;
			w = 0.0277084 * safezoneW;
			h = 0.0244445 * safezoneH;
		};
		
		class ButtonClose : Life_RscButtonMenu {
			idc = -1;
			text = "HERUNTERFAHREN";
			onButtonClick = "closeDialog 0;";
			x = 0.262344 * safezoneW + safezoneX;
			y = 0.616482 * safezoneH + safezoneY;
			w = 0.0979687 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {-1,-1,-1,0};
			colorText[] = {1,1,1,1};
		};
	};
};

class VIPshops_menu {
	idd = 2440;
	movingEnable = false;
	enableSimulation = true;	
	class controlsBackground {

		class hintergrundbild: Life_RscPicture
		{
			idc = -1;
			text = "images\shop_neu_lap.paa";
			x = 0.17 * safezoneW + safezoneX;
			y = -0.039 * safezoneH + safezoneY;
			w = 0.654844 * safezoneW;
			h = 1.133 * safezoneH;
		};
	};
	
	class controls {
		
		class itemList : Life_RscListBox 
		{
			idc = 2445;
			text = "";
			sizeEx = 0.0250;
			x = 0.555157 * safezoneW + safezoneX;
			y = 0.324 * safezoneH + safezoneY;
			w = 0.166562 * safezoneW;
			h = 0.209 * safezoneH;
			colorBackground[] = {1,1,1,0};			
		};
		
		class pItemlist : Life_RscListBox 
		{
			idc = 2447;
			text = "";
			sizeEx = 0.0250;
			x = 0.27448 * safezoneW + safezoneX;
			y = 0.325 * safezoneH + safezoneY;
			w = 0.166562 * safezoneW;
			h = 0.209 * safezoneH;
			colorBackground[] = {1,1,1,0};
		};

		class buyEdit : Life_RscEdit 
		{
			idc = 2446;
			text = "1";
			sizeEx = 0.0250;
			x = 0.458021 * safezoneW + safezoneX;
			y = 0.362482 * safezoneH + safezoneY;
			w = 0.0816146 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {1,1,1,0.1};
		};
		
		class ButtonAddbuy : Life_RscButtonMenu
		{
			idc = -1;
			text = "";
			onButtonClick = "[0,0] spawn life_fnc_addsubstract;";
			x = 0.511979 * safezoneW + safezoneX;
			y = 0.387963 * safezoneH + safezoneY;
			w = 0.0277084 * safezoneW;
			h = 0.0244445 * safezoneH;
			colorBackground[] = {-1,-1,-1,0};
			colorBackgroundFocused[] = {-1,-1,-1,0};
			colorBackground2[] = {-1,-1,-1,0};
			color[] = {1,1,1,0};
			colorFocused[] = {0,0,0,0};
			color2[] = {0,0,0,0};
			colorText[] = {1,1,1,1};
			colorDisabled[] = {0,0,0,0};
		};
		
		class ButtonSubbuy : ButtonAddbuy
		{
			idc = -1;
			text = "";
			onButtonClick = "[0,1] spawn life_fnc_addsubstract;";
			x = 0.457292 * safezoneW + safezoneX;
			y = 0.388889 * safezoneH + safezoneY;
			w = 0.0277084 * safezoneW;
			h = 0.0244445 * safezoneH;
		};
		
		class ButtonAddG : ButtonAddbuy
		{
			idc = -1;
			text = "";
			onButtonClick = "[] call life_fnc_virtVIP_buy;";
			x = 0.457292 * safezoneW + safezoneX;
			y = 0.32963 * safezoneH + safezoneY;
			w = 0.0820312 * safezoneW;
			h = 0.0274445 * safezoneH;
		};
		
		class sellEdit : Life_RscEdit 
		{
			idc = 2448;
			text = "1";
			sizeEx = 0.0250;
			x = 0.457812 * safezoneW + safezoneX;
			y = 0.473148 * safezoneH + safezoneY;
			w = 0.0816146 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {1,1,1,0.1};
		};
		
		class ButtonRemoveG : ButtonAddbuy
		{
			idc = 2449;
			text = "";
			onButtonClick = "[] call life_fnc_virtVIP_sell";
			x = 0.457292 * safezoneW + safezoneX;
			y = 0.44074 * safezoneH + safezoneY;
			w = 0.0820312 * safezoneW;
			h = 0.0274445 * safezoneH;
		};
		
		class ButtonAddSell : ButtonAddbuy
		{
			idc = 2450;
			text = "";
			onButtonClick = "[1,0] spawn life_fnc_addsubstract;";
			x = 0.511354 * safezoneW + safezoneX;
			y = 0.5 * safezoneH + safezoneY;
			w = 0.0277084 * safezoneW;
			h = 0.0244445 * safezoneH;
		};
		
		class ButtonSubSell : ButtonAddbuy
		{
			idc = 2451;
			text = "";
			onButtonClick = "[1,1] spawn life_fnc_addsubstract;";
			x = 0.457292 * safezoneW + safezoneX;
			y = 0.5 * safezoneH + safezoneY;
			w = 0.0277084 * safezoneW;
			h = 0.0244445 * safezoneH;
		};
		
		class ButtonClose : Life_RscButtonMenu {
			idc = -1;
			text = "HERUNTERFAHREN";
			onButtonClick = "closeDialog 0;";
			x = 0.262344 * safezoneW + safezoneX;
			y = 0.616482 * safezoneH + safezoneY;
			w = 0.0979687 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {-1,-1,-1,0};
			colorText[] = {1,1,1,1};
		};
	};
};