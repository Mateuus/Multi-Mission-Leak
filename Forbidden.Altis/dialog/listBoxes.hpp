class life_listboxframe {
	idd = 7100;
	name= "life_listboxframe";
	movingEnable = false;
	enableSimulation = true;
	
	class controlsBackground {
	};
	
	class controls {
		class RscFrame_1800: Life_RscText
		{
			idc = -1;
			x = 0.276563 * safezoneW + safezoneX;
			y = 0.290043 * safezoneH + safezoneY;
			w = 0.446875 * safezoneW;
			h = 0.419914 * safezoneH;
			colorBackground[] = {0,0,0,1};
		};
		
		class RscListbox_1500: Life_RscListBox
		{
			idc = 7055;
			x = 0.282292 * safezoneW + safezoneX;
			y = 0.338839 * safezoneH + safezoneY;
			w = 0.211979 * safezoneW;
			h = 0.362321 * safezoneH;
			sizeEx = 0.0260;
		};
		
		class RscText_Search: Life_RscText
		{
			idc = 7080;

			text = "Sök:"; 
			x = 0.282292 * safezoneW + safezoneX;
			y = 0.306039 * safezoneH + safezoneY;
			w = 0.03 * safezoneW;
			h = 0.0219914 * safezoneH;
		};
		
		class RscEdit_SearchField : Life_RscEdit
		{
			idc = 7081;
			text = ""; 
			onChar = "[-1] spawn life_fnc_srbdfueanvagnubeyqhkfmvjdoqmgvhysqdvicgwqfftvydqbbezas;";
			x = 0.312292 * safezoneW + safezoneX;
			y = 0.301039 * safezoneH + safezoneY;
			w = 0.181979 * safezoneW;
			h = 0.03 * safezoneH;
			sizeEx = 0.04;
		};
		
		class RscText_1000: Life_RscText
		{
			idc = 7054;

			text = "Antal:"; 
			x = 0.5 * safezoneW + safezoneX;
			y = 0.301039 * safezoneH + safezoneY;
			w = 0.217708 * safezoneW;
			h = 0.0219914 * safezoneH;
		};
		
		class RscText_1001: Life_RscEdit
		{
			idc = 7056;
			text = ""; 
			x = 0.5 * safezoneW + safezoneX;
			y = 0.33 * safezoneH + safezoneY;
			w = 0.20625 * safezoneW;
			h = 0.04 * safezoneH;
			sizeEx = 0.055;
		};
		
		
		class RscButtonMenu_2400: Life_RscButtonMenu
		{
			idc = 1006;
			text = "Spawn"; 
			x = 0.5 * safezoneW + safezoneX;
			y = 0.67697 * safezoneH + safezoneY;
			w = 0.217708 * safezoneW;
			h = 0.0219914 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0.52,0.03,0.7};
		};
	};
};