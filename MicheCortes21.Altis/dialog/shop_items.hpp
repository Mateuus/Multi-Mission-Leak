class shops_menu {
	idd = 2400;
	name= "shops_menu";
	movingEnable = false;
	enableSimulation = true;
	
	class controlsBackground {
		
		class Title : Life_RscTitle {
			colorBackground[] = {0, 0, 0.3 ,1};
			idc = 2403;
			text = "";
			x = 0.1;
			y = 0.2;
			w = 0.8;
			h = 0.04;
		};
		
		class MainBackground:Life_RscText {
			colorBackground[] = {0, 0, 0, 0.7};
			idc = -1;
			x = 0.1;
			y = 0.25;
			w = 0.8;
			h = 0.7;
		};
		
		class vasText : Life_RscText
		{
			idc = -1;
			colorBackground[] = {0, 0, 0.3 ,1};
			text = "Ladeninventar";
			sizeEx = 0.04;
			x = 0.11;
			y = 0.26;
			w = 0.38;
			h = 0.04;
		};
		
		class vasgText : Life_RscText
		{
			idc = -1;
			colorBackground[] = {0, 0, 0.3 ,1};
			text = "Eigenes Inventar";
			sizeEx = 0.04;
			x = 0.51;
			y = 0.26;
			w = 0.38;
			h = 0.04;
		};
	};
	
	class controls {

		class itemList : Life_RscListBox 
		{
			idc = 2401;
			text = "";
			sizeEx = 0.040;
			x = 0.11;
			y = 0.31;
			w = 0.38;
			h = 0.58;
		};
		
		class pItemlist : Life_RscListBox 
		{
			idc = 2402;
			text = "";
			sizeEx = 0.04;
			x = 0.51;
			y = 0.31;
			w = 0.38;
			h = 0.58;
		};
			
		class buyEdit : Life_RscEdit 
		{
			idc = 2404;
			text = "0";
			sizeEx = 0.04;
			x = 0.11;
			y = 0.9;
			w = 0.185;
			h = 0.04;
		};
	
		class ButtonAddG : Life_RscButtonMenu
		{
			idc = -1;
			text = "Kaufen";
			colorBackground[] = {0.2, 0.6, 1, 1};
			onButtonClick = "[] spawn life_fnc_virt_buy;";
			x = 0.305;
			y = 0.9;
			w = 0.185;
			h = 0.04;
		};
		
		class sellEdit : Life_RscEdit 
		{
			idc = 2405;
			text = "0";
			sizeEx = 0.04;
			x = 0.51;
			y = 0.9;
			w = 0.08;
			h = 0.04;
		};
		
		class MaxButt : Life_RscButtonMenu
		{
			idc = -1;
			text = "Max.";
			colorBackground[] = {0.2, 0.6, 1, 1};
			onButtonClick = "ctrlSetText[2405,str(missionNamespace getVariable [format[""life_inv_%1"",getText(missionConfigFile >> ""VirtualItems"" >> (lbData[2402,(lbCurSel 2402)]) >> ""variable"")],0])];";
			x = 0.60;
			y = 0.9;
			w = 0.095;
			h = 0.04;
		};
		
		class ButtonRemoveG : Life_RscButtonMenu
		{
			idc = -1;
			text = "Verkaufen";
			colorBackground[] = {0.2, 0.6, 1, 1};
			onButtonClick = "[] call life_fnc_virt_sell";
			x = 0.705;
			y = 0.9;
			w = 0.185;
			h = 0.04;
		};
		
		class ButtonClose : Life_RscButtonMenu {
			idc = -1;
			text = "Schließen";
			onButtonClick = "closeDialog 0;";
			x = 0.7;
			y = 0.96;
			w = 0.2;
			h = 0.04;
		};
	};
};