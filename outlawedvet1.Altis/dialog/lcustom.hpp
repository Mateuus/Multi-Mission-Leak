class life_lcustom {
	idd = 3000;
	name= "life_lcustom";
	movingEnable = 0;
	enableSimulation = 1;
	
	class controlsBackground {		
        class MainBackground: Life_RscText {
            idc = -1;
            colorBackground[] = {0,0,0,0.7};
			x = 0.2;
            y = 0.313 * safezoneH + safezoneY;
            w = 0.4;
            h = 0.6 * safezoneH;
        };
		
		class Life_RscTitleBackground: Life_RscText {
            idc = -1;
            colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
            text = "Custom Loadout Menu";
			x = 0.2;
            y = 0.291 * safezoneH + safezoneY;
            w = 0.4;
            h = 0.022 * safezoneH;
        };
		
		class watermark : life_RscPicture 
		{
				idc = -1;
				text = "images\outlawed.paa";
				x = 0.275;
				y = 0.285 * safezoneH + safezoneY;
				w = 0.10 * safezoneW;
				h = 0.148 * safezoneH;
		};
	};
	
	class controls {
		
		class LoadoutList : Life_RscListBox 
		{
			colorBackground[] = {0, 0, 0, 0.7};
			idc = 3001;
			sizeEx = 0.03;
			rowHeight=0;
			x = 0.21;
            y = 0.35;
			w = 0.38;
			h = 0.5;
		};
		
		class LoadButton : Life_RscButtonMenu {
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
			idc = 3002;
			text = "Load loadout";
			onButtonClick = "[0,1] call life_fnc_lactions;";
			x = 0.25;
			y = 1.05;
			w = 0.3;
			h = 0.04;
			class Attributes 
            {
                align = "center";
            };
		};	
		
		class DeleteButton : Life_RscButtonMenu {
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
			idc = 3003;
			text = "Delete loadout";
			onButtonClick = "[0,3] call life_fnc_lactions;";
			x = 0.25;
			y = 1.10;
			w = 0.3;
			h = 0.04;
			class Attributes 
            {
                align = "center";
            };
		};	
		
		class SaveButton : Life_RscButtonMenu {
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
			idc = 3004;
			text = "Save loadout";
			onButtonClick = "[0,2] call life_fnc_lactions;";
			x = 0.25;
			y = 0.97;
			w = 0.3;
			h = 0.04;
			class Attributes 
            {
                align = "center";
            };
		};
	
		class TitleName : Life_RscTitle {
			colorBackground[] = {0, 0, 0, 0};
			idc = -1;
			text = "Loadout Name(Length MAX 20)";
			x = 0.21;
			y = 0.87;
			w = safezoneW / 2;
			h = 0.04;
		};
		
		class Text : Life_RscEdit {
			idc = 3005;
			text = "";
			x = 0.21;
			y = 0.92;
			w = 0.38;
			h = 0.04;
		};	
		
		
		class CloseButton : Life_RscButtonMenu {
			colorBackground[] = { 0.6, 0, 0, 1 };
			idc = 3006;
			text = "Close";
			onButtonClick = "closeDialog 0;";
			x = 0.21;
			y = 1.20;
			w = 0.38;
			h = 0.04;
			class Attributes 
            {
                align = "center";
            };
		};	
	};
};