class life_factory_menu {
	idd = 1800;
	name= "life_factory_menu";
	movingEnable = false;
	enableSimulation = true;
	
	class controlsBackground {
		class Life_RscTitleBackground:Life_RscText {
			colorBackground[] = {0.4, 0, 0, 0.7};
			idc = -1;
			x = 0.350469 * safezoneW + safezoneX;
			y = (0.324 * safezoneH + safezoneY) - (1 / 23);
			w = 0.299062 * safezoneW;
			h = (1 / 25);
		};
		
		class MainBackground:Life_RscText {
			colorBackground[] = {0, 0, 0, 0.7};
			idc = -1;
			x = 0.350469 * safezoneW + safezoneX;
			y = 0.324 * safezoneH + safezoneY;
			w = 0.299062 * safezoneW;
			h = 0.363 * safezoneH;
		};
	};
	
	class controls {
		
		class Title : Life_RscTitle {
			colorBackground[] = {0, 0, 0, 0};
			idc = 1835;
			text = "Factory Systems";
			x = 0.350469 * safezoneW + safezoneX;
			y = (0.324 * safezoneH + safezoneY) - (1 / 23);
			w = 0.299062 * safezoneW;
			h = (1 / 25);
		};
		class OK_Button: Life_RscButtonMenu
		{
			idc = 1830;
			text = "Keep";
			x = 0.510703 * safezoneW + safezoneX;
			y = 0.691167 * safezoneH + safezoneY;
			w = 0.0670312 * safezoneW;
			h = 0.022 * safezoneH;
			onButtonClick = "[false] spawn life_fnc_craftRecipe";
		};
		class Sell_Button: Life_RscButtonMenu
		{
			idc = 1832;
			text = "Sell";
			x = 0.438906 * safezoneW + safezoneX;
			y = 0.691167 * safezoneH + safezoneY;
			w = 0.0670312 * safezoneW;
			h = 0.022 * safezoneH;
			onButtonClick = "[true] spawn life_fnc_craftRecipe";
		};
		class RecipeList : Life_RscListBox 
		{
			idc = 1850;
			x = 0.355625 * safezoneW + safezoneX;
			y = 0.335 * safezoneH + safezoneY;
			w = 0.0979687 * safezoneW;
			h = 0.311 * safezoneH;
			onLBSelChanged = "[] spawn life_fnc_getRecipe;";
		};
		class ColorList : Life_RscCombo
		{
			idc = 1804;
			x = 0.355625 * safezoneW + safezoneX;
			y = 0.646 * safezoneH + safezoneY;
			w = 0.0979687 * safezoneW;
			h = 0.03 * safezoneH;
		};
		class Cancel_Button: Life_RscButtonMenu
		{
			x = 0.5825 * safezoneW + safezoneX;
			text = "Close";
			y = 0.691861 * safezoneH + safezoneY;
			w = 0.0670312 * safezoneW;
			h = 0.022 * safezoneH;
			onButtonClick = "closeDialog 0;";
		};
		class IngredientList : Life_RscListBox 
		{
			idc = 1860;
			x = 0.45875 * safezoneW + safezoneX;
			y = 0.577 * safezoneH + safezoneY;
			w = 0.185625 * safezoneW;
			h = 0.099 * safezoneH;
		};
		class RscFrame_1800: Life_RscFrame
		{
			idc = -1;
			x = 0.45875 * safezoneW + safezoneX;
			y = 0.379 * safezoneH + safezoneY;
			w = 0.185625 * safezoneW;
			h = 0.187 * safezoneH;
		};
		class RscStructuredText_1100: Life_RscStructuredText
		{
			idc = 1855;
			text = "Description is here.";
			x = 0.463906 * safezoneW + safezoneX;
			y = 0.39 * safezoneH + safezoneY;
			w = 0.175313 * safezoneW;
			h = 0.165 * safezoneH;
			sizeEx = 0.03;
		};
		class RscText_1001: Life_RscStructuredText
		{
			idc = 1865;
			text = "Select a recipe";
			x = 0.45875 * safezoneW + safezoneX;
			y = 0.324 * safezoneH + safezoneY;
			w = 0.185625 * safezoneW;
			h = 0.055 * safezoneH;
			sizeEx = 0.045;
		};
	};
};