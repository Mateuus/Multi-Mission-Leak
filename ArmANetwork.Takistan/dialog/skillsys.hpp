class life_skillMenu {
	idd = 170000;
	name= "life_skillMenu";
	movingEnable = false;
	enableSimulation = true;
	onLoad = "[] spawn life_fnc_skillMenu;";

	class controlsBackground
	{
		class MainBackground: Life_RscPicture
		{
			idc = -1;

			text = ""; //--- ToDo: Localize;
			x = 0.2712 * safezoneW + safezoneX;
			y = 0.224594 * safezoneH + safezoneY;
			w = 0.461136 * safezoneW;
			h = 0.601078 * safezoneH;
			colorBackground[] = {0,0,0,0.4};
		};

		class TitleLevel: Life_RscTitle
		{
			idc = 170001;

			sizeEx = 0.03;
			text = ""; //--- ToDo: Localize;
			x = 0.316053 * safezoneW + safezoneX;
			y = 0.309064 * safezoneH + safezoneY;
			w = 0.32995 * safezoneW;
			h = 0.0219973 * safezoneH;
			//colorText[] = {0.95,0.95,0.95,1};
		};

		class TitleSkill: Life_RscTitle
		{
			idc = 170007;

			style = 1;
			sizeEx = 0.03;
			text = ""; //--- ToDo: Localize;
			x = 0.316053 * safezoneW + safezoneX;
			y = 0.309064 * safezoneH + safezoneY;
			w = 0.32995 * safezoneW;
			h = 0.0219973 * safezoneH;
			//colorText[] = {0.95,0.95,0.95,1};
		};
	};

	class controls {
		class SkillList: RscListbox
		{
			idc = 170002;
			onLBSelChanged = "[_this] call life_fnc_skillInfo";
			x = 0.314403 * safezoneW + safezoneX;
			y = 0.346019 * safezoneH + safezoneY;
			w = 0.169819 * safezoneW;
			h = 0.340958 * safezoneH;
			colorBackground[] = {0,0,0,0.6};
			sizeEx = 0.035;
		};

		class SkillInfo: Life_RscStructuredText
		{
			idc = 170003;

			text = "Choose a Talent from the left List, for further information on the selected Talent. You need a minimum of 1 available Skillpoint. You receive at least one Skillpoint on each level up!"; //--- ToDo: Localize;
			x = 0.489378 * safezoneW + safezoneX;
			y = 0.346019 * safezoneH + safezoneY;
			w = 0.195908 * safezoneW;
			h = 0.340958 * safezoneH;
			size = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.9)";
			colorBackground[] = {0,0,0,0.6};
		};

		class learn_unlearn: RscButtonMenu
		{
			idc = 170004;
			text = "Learn"; //--- ToDo: Localize;

			onButtonClick = "[] spawn life_fnc_skillLearn";
			x = 0.314403 * safezoneW + safezoneX;
			y = 0.690975 * safezoneH + safezoneY;
			w = 0.0525547 * safezoneW;
			h = 0.0219973 * safezoneH;
			colorBackground[] = {0,0,0,0.3};
		};

		class legal: RscButtonMenu
		{
			idc = 170005;
			text = "Legal"; //--- ToDo: Localize;

			onButtonClick = "if(!life_skillLegal) then {life_skillLegal = true;};[] spawn life_fnc_skillMenu;";
			x = 0.433403 * safezoneW + safezoneX;
			y = 0.690975 * safezoneH + safezoneY;
			w = 0.0515547 * safezoneW;
			h = 0.0219973 * safezoneH;
			colorBackground[] = {0,0,0,0.3};
		};

		class illegal: RscButtonMenu
		{
			idc = 170006;
			text = "Illegal"; //--- ToDo: Localize;

			onButtonClick = "if(life_skillLegal) then {life_skillLegal = false;};[] spawn life_fnc_skillMenu;";
			x = 0.433403 * safezoneW + safezoneX;
			y = 0.690975 * safezoneH + safezoneY;
			w = 0.0515547 * safezoneW;
			h = 0.0219973 * safezoneH;
			colorBackground[] = {0,0,0,0.3};
		};

		class ButtonClose: Life_PictureButtonMenu
		{
			onButtonClick = "closeDialog 0;[] call life_fnc_p_updateMenu";

			idc = -1;
			text = "";
			x = 0.315559 * safezoneW + safezoneX;
			y = 0.725973 * safezoneH + safezoneY;
			w = 0.0124433 * safezoneW;
			h = 0.0159973 * safezoneH;
			colorBackground[] = {-1,-1,-1,-1};
			colorBackgroundFocused[] = {1,1,1,0.12};
			colorBackground2[] = {0.75,0.75,0.75,0.2};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,1};
			color2[] = {0,0,0,1};
			colorText[] = {1,1,1,1};
			colorDisabled[] = {0,0,0,0.4};
		};

		class ButtonColorEffects: Life_PictureButtonMenu
		{
			//onButtonClick = "[] call life_fnc_colorEffects";

			idc = -1;
			text = "";
			x = 0.487559 * safezoneW + safezoneX;
			y = 0.725973 * safezoneH + safezoneY;
			w = 0.0124433 * safezoneW;
			h = 0.0159973 * safezoneH;
			colorBackground[] = {-1,-1,-1,-1};
			colorBackgroundFocused[] = {1,1,1,0.12};
			colorBackground2[] = {0.75,0.75,0.75,0.2};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,1};
			color2[] = {0,0,0,1};
			colorText[] = {1,1,1,1};
			colorDisabled[] = {0,0,0,0.4};
		};

		class ButtonSettings: Life_PictureButtonMenu
		{
			onButtonClick = "[] call life_fnc_settingsMenu;";

			idc = -1;
			text = "";
			x = 0.36358 * safezoneW + safezoneX;
			y = 0.725973 * safezoneH + safezoneY;
			w = 0.0124433 * safezoneW;
			h = 0.0159973 * safezoneH;
			colorBackground[] = {-1,-1,-1,-1};
			colorBackgroundFocused[] = {1,1,1,0.12};
			colorBackground2[] = {0.75,0.75,0.75,0.2};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,1};
			color2[] = {0,0,0,1};
			colorText[] = {1,1,1,1};
			colorDisabled[] = {0,0,0,0.4};
		};
	};
};
