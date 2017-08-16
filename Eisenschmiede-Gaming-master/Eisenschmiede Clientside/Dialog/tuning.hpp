class ES_Tuning
{
	idd = 122223;
	movingEnabled = 0;
	enableSimulation = 1;
	
	class controlsBackground
	{
		class Title: ES_RscStructuredText
		{
			idc = -1;
			text = "TUNINGWERKSTATT";
			x = 0.577344 * safezoneW + safezoneX;
			y = 0.016 * safezoneH + safezoneY;
			w = 0.4125 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0.00392157,0.721569,1,1};
		};
		class Background: ES_RscBackground
		{
			idc = -1;
			x = 0.577344 * safezoneW + safezoneX;
			y = 0.038 * safezoneH + safezoneY;
			w = 0.4125 * safezoneW;
			h = 0.308 * safezoneH;
			colorBackground[] = {0,0,0,0.7};
		};
		class Frame: ES_RscFrame
		{
			idc = -1;
			x = 0.585594 * safezoneW + safezoneX;
			y = 0.1678 * safezoneH + safezoneY;
			w = 0.20625 * safezoneW;
			h = 0.121 * safezoneH;
		};		
		class Title1: ES_RscText
		{
			idc = -1;
			text = "Hupe:";
			x = 0.5825 * safezoneW + safezoneX;
			y = 0.049 * safezoneH + safezoneY;
			w = 0.0670312 * safezoneW;
			h = 0.022 * safezoneH;
		};	
		class Title2: ES_RscText
		{
			idc = -1;
			text = "Lackierung:";
			x = 0.5825 * safezoneW + safezoneX;
			y = 0.082 * safezoneH + safezoneY;
			w = 0.0670312 * safezoneW;
			h = 0.022 * safezoneH;
		};	
		class Title3: ES_RscText
		{
			idc = -1;
			text = "Unterbodenbel.:";
			x = 0.5825 * safezoneW + safezoneX;
			y = 0.115 * safezoneH + safezoneY;
			w = 0.0670312 * safezoneW;
			h = 0.022 * safezoneH;
		};	
		class Title4: ES_RscText
		{
			idc = -1;
			text = "Nitro:";
			x = 0.793906 * safezoneW + safezoneX;
			y = 0.17 * safezoneH + safezoneY;
			w = 0.0670312 * safezoneW;
			h = 0.022 * safezoneH;
		};	
		class Title5: ES_RscText
		{
			idc = -1;
			text = "Repparieren:";
			x = 0.793906 * safezoneW + safezoneX;
			y = 0.203 * safezoneH + safezoneY;
			w = 0.0670312 * safezoneW;
			h = 0.022 * safezoneH;
		};	
		class Title6: ES_RscText
		{
			idc = -1;
			text = "Tubolader:";
			x = 0.793906 * safezoneW + safezoneX;
			y = 0.236 * safezoneH + safezoneY;
			w = 0.0670312 * safezoneW;
			h = 0.022 * safezoneH;
		};	
		class Title7: ES_RscText
		{
			idc = -1;
			text = "Fahrzeugteile:";
			x = 0.5825 * safezoneW + safezoneX;
			y = 0.148 * safezoneH + safezoneY;
			w = 0.20625 * safezoneW;
			h = 0.022 * safezoneH;
		};							
	};
	
	class controls
	{
		class Combo1: ES_RscCombo
		{
			idc = 1;
			x = 0.649531 * safezoneW + safezoneX;
			y = 0.049 * safezoneH + safezoneY;
			w = 0.211406 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class Combo2: ES_RscCombo
		{
			idc = 2;
			x = 0.649531 * safezoneW + safezoneX;
			y = 0.082 * safezoneH + safezoneY;
			w = 0.211406 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class Combo3: ES_RscCombo
		{
			idc = 3;
			x = 0.649531 * safezoneW + safezoneX;
			y = 0.115 * safezoneH + safezoneY;
			w = 0.211406 * safezoneW;
			h = 0.022 * safezoneH;
		};		
		class TileList: ES_RscListbox
		{
			idc = 4;
			sizeEx = 0.035;
			onLBDblClick = "[0]call ES_fnc_buyTiles";
			x = 0.586625 * safezoneW + safezoneX;
			y = 0.1678 * safezoneH + safezoneY;
			w = 0.204188 * safezoneW;
			h = 0.121 * safezoneH;
		};
		class Button1: ES_RscButtonMenu
		{
			idc = -1;
			text = "Vorschau";
			onButtonClick = "[0]call ES_fnc_buyHorn";
			x = 0.866094 * safezoneW + safezoneX;
			y = 0.049 * safezoneH + safezoneY;
			w = 0.0567187 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class Button2: ES_RscButtonMenu
		{
			idc = -1;
			text = "Kaufen";
			onButtonClick = "[1]call ES_fnc_buyHorn";
			x = 0.927969 * safezoneW + safezoneX;
			y = 0.049 * safezoneH + safezoneY;
			w = 0.0567187 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class Button3: ES_RscButtonMenu
		{
			idc = -1;
			text = "Vorschau";
			onButtonClick = "[0]call ES_fnc_buySkin";
			x = 0.866094 * safezoneW + safezoneX;
			y = 0.082 * safezoneH + safezoneY;
			w = 0.0567187 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class Button4: ES_RscButtonMenu
		{
			idc = -1;
			text = "Soon Kaufen";
			onButtonClick = "";
			x = 0.927969 * safezoneW + safezoneX;
			y = 0.082 * safezoneH + safezoneY;
			w = 0.0567187 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class Button5: ES_RscButtonMenu
		{
			idc = -1;
			text = "Vorschau";
			onButtonClick = "[0]spawn ES_fnc_buyLights";
			x = 0.866094 * safezoneW + safezoneX;
			y = 0.115 * safezoneH + safezoneY;
			w = 0.0567187 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class Button6: ES_RscButtonMenu
		{
			idc = -1;
			text = "Kaufen";
			onButtonClick = "[1,nil,true]spawn ES_fnc_buyLights";
			x = 0.927969 * safezoneW + safezoneX;
			y = 0.115 * safezoneH + safezoneY;
			w = 0.0567187 * safezoneW;
			h = 0.022 * safezoneH;
		};	
		class Button7: ES_RscButtonMenu
		{
			idc = -1;
			text = "Soon Kaufen";
			onButtonClick = "";
			x = 0.866094 * safezoneW + safezoneX;
			y = 0.17 * safezoneH + safezoneY;
			w = 0.0567187 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class Button8: ES_RscButtonMenu
		{
			idc = -1;
			text = "Enfernen";
			onButtonClick = "";
			x = 0.927969 * safezoneW + safezoneX;
			y = 0.17 * safezoneH + safezoneY;
			w = 0.0567187 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class Button9: ES_RscButtonMenu
		{
			idc = -1;
			text = "Rep Kaufen";
			onButtonClick = "";
			x = 0.866094 * safezoneW + safezoneX;
			y = 0.203 * safezoneH + safezoneY;
			w = 0.118594 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class Button10: ES_RscButtonMenu
		{
			idc = -1;
			text = "Kaufen";
			onButtonClick = "[0]call ES_fnc_buyTurbo";
			x = 0.866094 * safezoneW + safezoneX;
			y = 0.236 * safezoneH + safezoneY;
			w = 0.0567187 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class Button11: ES_RscButtonMenu
		{
			idc = -1;
			text = "Entfernen";
			onButtonClick = "[1]call ES_fnc_buyTurbo";
			x = 0.927969 * safezoneW + safezoneX;
			y = 0.236 * safezoneH + safezoneY;
			w = 0.0567187 * safezoneW;
			h = 0.022 * safezoneH;
		};	
		class Button12: ES_RscButtonMenu
		{
			idc = -1;
			text = "Fahrzeugteile kaufen";
			onButtonClick = "[1]call ES_fnc_buyTiles";
			x = 0.586625 * safezoneW + safezoneX;
			y = 0.302 * safezoneH + safezoneY;
			w = 0.205218 * safezoneW;
			h = 0.033 * safezoneH;
		};					
		class Button13: ES_RscButtonMenu
		{
			idc = -1;
			text = "Schließen";
			onButtonClick = "closeDialog 0";
			x = 0.577344 * safezoneW + safezoneX;
			y = 0.3482 * safezoneH + safezoneY;
			w = 0.0773437 * safezoneW;
			h = 0.033 * safezoneH;
		};		
	};
};
