class nanoEMPConsole {
	idd = 3494;
	name= "nanoEMPConsole";
	movingEnable = false;
	enableSimulation = true;
	onLoad = "[] spawn life_fnc_openEmpMenu;";
	
	class controlsBackground {
		
		class Life_RscTitleBackground:Life_RscText {
			colorBackground[] = {0.4,0,0,0.5};
			idc = -1;
			x = 0.1;
			y = 0.2;
			w = 0.8;
			h = (1 / 25);
		};
		
		class MainBackground:Life_RscText {
			colorBackground[] = {0, 0, 0, 0.7};
			idc = -1;
			x = 0.1;
			y = 0.2 + (11 / 250);
			w = 0.8;
			h = 0.6 - (2 / 250);
		};
	};
	
	class controls {
		class Title : Life_RscTitle {
			colorBackground[] = {0, 0, 0, 0};
			idc = 2901;
			text = "Stromfrequenzbrecher-3000 Konsole";
			x = 0.1;
			y = 0.2;
			w = 0.6;
			h = (1 / 25);
		};
		
		class PlayerList_Admin : Life_RscListBox 
		{
			idc = 2902;
			text = "";
			sizeEx = 0.0255;
			//colorBackground[] = {0,0,0,0};
			//onLBSelChanged = "hint format [""%1"",_this select 1];";
			
			x = 0.12; y = 0.26;
			w = 0.30; h = 0.4;
		};
		
		class PlayerBInfo : Life_RscStructuredText
		{
			idc = 2903;
			text = "";
			x = 0.42;
			y = 0.25;
			w = 0.35;
			h = 0.6;
		};

		class ButtonClose : life_RscButtonMenu
		{
			idc = -1;
			onButtonClick = "closeDialog 0;";
			x = 0.71 * safezoneW + safezoneX;
			y = 0.045 * safezoneH - safezoneY;
			w = 0.025 * safezoneW;
			h = 0.05 * safezoneH;
			tooltip = "Schliessen";

			colorBackground[] = {-1,-1,-1,0};
			colorBackgroundFocused[] = {-1,-1,-1,0};
			colorBackground2[] = {-1,-1,-1,0};
			color[] = {1,1,1,0};
			colorFocused[] = {0,0,0,0};
			color2[] = {0,0,0,0};
			colorText[] = {1,1,1,1};
			colorDisabled[] = {0,0,0,0};
		};
		
		class Refresh : Life_RscButtonMenu {
			idc = -1;
			text = "Scan";
			onButtonClick = "[] spawn life_fnc_scanVehicles;";
			x = 0.1 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.88 - (1 / 25);
			w = (6.25 / 40);
			h = (1 / 25);
		};

		/*class WarnEMP : Life_RscButtonMenu {
			idc = 2030;
			text = "Warnen";
			onButtonClick = "";
			x = 0.26 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.88 - (1 / 25);
			w = (6.25 / 40);
			h = (1 / 25);
		};*/

		class ExecEMP : Life_RscButtonMenu {
			idc = 2070;
			text = "Ausschalten";
			onButtonClick = "[] spawn life_fnc_empVehicle;";
			x = 0.58 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.88 - (1 / 25);
			w = (6.25 / 35);
			h = (1 / 25);
		};

		class WarnEMP : Life_RscButtonMenu {
			idc = 2060;
			text = "Warnen";
			onButtonClick = "[] spawn life_fnc_warnVehicle;";
			x = 0.42 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.88 - (1 / 25);
			w = (6.25 / 40);
			h = (1 / 25);
		};
	};
};