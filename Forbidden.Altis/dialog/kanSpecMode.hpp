class kanSpecModeFrame {
	idd = 7500;
	name= "kanSpecModeFrame";
	movingEnable = false;
	enableSimulation = true;
	
	class controlsBackground {
	};
	
	class controls {
		class RscFrame_1800: Life_RscText
		{
			idc = -1; 
			x = safeZoneX+safeZoneW - (0.13 * safezoneW); 
			y = 0.25 * safezoneH + safezoneY; 
			w = 0.13 * safezoneW;
			h = 0.635 * safezoneH;
			colorBackground[] = {0,0,0,1};
		};
		
		class RscEdit_SearchField : Life_RscEdit
		{
			idc = 7081;
			text = ""; 
			onChar = "((findDisplay 7500) displayCtrl 7055) lbSetCurSel -1; [true] spawn ADP_fnc_mamjhsmxzowbovnweugxquapdoiogtxhekfppmvmuuqvcuxpoxtblrkl;";
			x = safeZoneX+safeZoneW - (0.095 * safezoneW);
			
			y = 0.26 * safezoneH + safezoneY;
			w = 0.09 * safezoneW;
			h = 0.03 * safezoneH;
			sizeEx = 0.04;
		};
		
		class RscText_Search: Life_RscText
		{
			idc = 7080;

			text = "Sök:"; 
			x = safeZoneX+safeZoneW - (0.125 * safezoneW);
			y = 0.265 * safezoneH + safezoneY;
			w = 0.03 * safezoneW;
			h = 0.0219914 * safezoneH;
		};
		
		class RscListbox_1500: Life_RscListBox
		{
			idc = 7055;
			x = safeZoneX+safeZoneW - (0.125 * safezoneW);
			y = 0.30 * safezoneH + safezoneY;
			w = 0.12 * safezoneW;
			h = 0.36 * safezoneH;
			sizeEx = 0.0260;
			onLbSelChanged = "_this call ADP_fnc_bascqyunfhtyggxixryvmcqimzvfhhnwevcuvkrapgfwezcgbf";
		};
		
		class kanSpecButton1: Life_RscButtonMenu
		{
			idc = 1870;
			text = "Map"; 
			onButtonClick = "[1] spawn ADP_fnc_mozxymgnbkufknrshvfxwukxorgydlvvswzrwuhtrmktesnmeeqvzugbvzf;";
			x = safeZoneX+safeZoneW - (0.125 * safezoneW);
			y = (0.67 + (0 * 0.035)) * safezoneH + safezoneY;
			w = 0.12 * safezoneW;
			h = 0.03 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0.52,0.03,0.7};
		};
		
		class kanSpecButton2: Life_RscButtonMenu
		{
			idc = 1871;
			text = "Spelarinfo"; 
			onButtonClick = "[0,player,'balance'] remoteExec ['life_fnc_huvrcaooegbvaapijvaaqlrkcfcwnoncaawfydkniugnnrbkftrjsrpf',kanSpecCurrent]";
			x = safeZoneX+safeZoneW - (0.125 * safezoneW);
			y = (0.67 + (1 * 0.035)) * safezoneH + safezoneY;
			w = 0.12 * safezoneW;
			h = 0.03 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0.52,0.03,0.7};
		};
		
		class kanSpecButton2a234: Life_RscButtonMenu
		{
			idc = 1872;
			text = "Admin Restrain"; 
			onButtonClick = "[3] spawn ADP_fnc_mozxymgnbkufknrshvfxwukxorgydlvvswzrwuhtrmktesnmeeqvzugbvzf;";
			Tooltip = "Restraina personen (OBS: Om personen sitter i en helikopter eller flygplan kommer du fånga tag om fordonet";
			x = safeZoneX+safeZoneW - (0.125 * safezoneW);
			y = (0.67 + (2 * 0.035)) * safezoneH + safezoneY;
			w = 0.12 * safezoneW;
			h = 0.03 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0.52,0.03,0.7};
		};
		
		class kanSpecButton3: Life_RscButtonMenu
		{
			idc = 1873;
			text = "Admin jail"; 
			onButtonClick = "life_pInact_curTarget = kanSpecCurrent; createDialog 'jailTimeAdmin'";
			x = safeZoneX+safeZoneW - (0.125 * safezoneW);
			y = (0.67 + (3 * 0.035)) * safezoneH + safezoneY;
			w = 0.12 * safezoneW;
			h = 0.03 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0.52,0.03,0.7};
		};
		
		class kanSpecButton3123: Life_RscButtonMenu
		{
			idc = 1874;
			text = "TP och Exit"; 
			onButtonClick = "[2] spawn ADP_fnc_mozxymgnbkufknrshvfxwukxorgydlvvswzrwuhtrmktesnmeeqvzugbvzf;";
			Tooltip = "Stäng spectate-menyn och TPa dig själv till spelaren som du speccar (du kommer dit som osynlig)";
			x = safeZoneX+safeZoneW - (0.125 * safezoneW);
			y = (0.67 + (4 * 0.035)) * safezoneH + safezoneY;
			w = 0.12 * safezoneW;
			h = 0.03 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0.52,0.03,0.7};
		};
		
		class kanSpecButton4: Life_RscButtonMenu
		{
			idc = 1875;
			text = "Exit"; 
			onButtonClick = "closeDialog 7500;";
			x = safeZoneX+safeZoneW - (0.125 * safezoneW);
			y = (0.67 + (5 * 0.035)) * safezoneH + safezoneY;
			w = 0.12 * safezoneW;
			h = 0.03 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0.52,0.03,0.7};
		};
	};
};