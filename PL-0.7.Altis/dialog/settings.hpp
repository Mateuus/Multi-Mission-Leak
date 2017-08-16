class SettingsMenu
{
	idd = 2900;
	name = "SettingsMenu";
	movingEnable = 1;
	enableSimulation = 1;

	class controlsBackground
	{

		class fondtablet: Life_RscPicture
		{
			idc = 9090909;
			text = "textures\HUD\menu.paa";
			x = 0;
			y = -0.12;
			w = 1;
			h = 1.28;
		};

		class RscTitleBackground : life_RscText
		{
			colorBackground[] = {0, 0, 0, 0.5};
			idc = -1;
			x = 0.25;
			y = 0.25;
			w = 0.5;
			h = (1 / 25);
		};

		class HerbeHeader : Life_RscText
		{
			idc = -1;
			text = "Affichage de l'herbe";
			colorBackground[] = {0, 0, 0, 0.5};

			x = 0.25;
			y = 0.53;
			w = 0.35;
			h = (1 / 25);
		};

		class RevealNearestHeader : Life_RscText
		{
			idc = -1;
			text = "Objets proches";
			colorBackground[] = {0, 0, 0, 0.5};
			x = 0.25;
			y = 0.58;
			w = 0.35;
			h = (1 / 25);
		};

		class Title : life_RscTitle
		{
			idc = -1;
			colorBackground[] = {0,0,0,0};
			text = "$STR_SM_Title";
			x = 0.25;
			y = 0.25;
			w = 0.5;
			h = (1 / 25);
		};
	};

	class controls
	{
		class VDonFoot : life_RscText
		{
			idc = -1;
			text = "$STR_SM_onFoot";

			x = 0.25; y = 0.358;
			w = 0.275; h = 0.04;
		};

		class VDinCar : life_RscText
		{
			idc = -1;
			text = "$STR_SM_inCar";

			x = 0.25; y = 0.405;
			w = 0.275; h = 0.04;
		};

		class VDinAir : life_RscText
		{
			idc = -1;
			text = "$STR_SM_inAir";

			x = 0.25; y = 0.455;
			w = 0.275; h = 0.04;
		};

		class VD_onfoot_slider : life_RscXSliderH
		{
			idc = 2901;
			text = "";
			onSliderPosChanged = "[0,_this select 1] call life_fnc_s_onSliderChange;";
			tooltip = "$STR_SM_ToolTip1";
			x = 0.38;
			y = 0.40 - (1 / 25);

			w = "9 * 			(			((safezoneW / safezoneH) min 1.2) / 40)";
			h = "1 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};

		class VD_onfoot_value : Life_RscEdit
		{
			idc = 2902;
			text = "";
			onChar = "[_this select 0, _this select 1,'ground',false] call life_fnc_s_onChar;";
			onKeyUp = "[_this select 0, _this select 1,'ground',true] call life_fnc_s_onChar;";

			x = .68; y = .358;
			w = .08; h = .04;
		};

		class VD_car_slider : life_RscXSliderH
		{
			idc = 2911;
			text = "";
			onSliderPosChanged = "[1,_this select 1] call life_fnc_s_onSliderChange;";
			tooltip = "$STR_SM_ToolTip2";
			x = 0.38;
			y = 0.45 - (1 / 25);

			w = "9 * 			(			((safezoneW / safezoneH) min 1.2) / 40)";
			h = "1 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};

		class VD_car_value : Life_RscEdit
		{
			idc = 2912;
			text = "";
			onChar = "[_this select 0, _this select 1,'vehicle',false] call life_fnc_s_onChar;";
			onKeyUp = "[_this select 0, _this select 1,'vehicle',true] call life_fnc_s_onChar;";

			x = .68; y = .41;
			w = .08; h = .04;
		};

		class VD_air_slider : life_RscXSliderH
		{
			idc = 2921;
			text = "";
			onSliderPosChanged = "[2,_this select 1] call life_fnc_s_onSliderChange;";
			tooltip = "$STR_SM_ToolTip3";
			x = 0.38;
			y = 0.50 - (1 / 25);

			w = "9 * 			(			((safezoneW / safezoneH) min 1.2) / 40)";
			h = "1 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};

		class VD_air_value : Life_RscEdit
		{
			idc = 2922;
			text = "";
			onChar = "[_this select 0, _this select 1,'air',false] call life_fnc_s_onChar;";
			onKeyUp = "[_this select 0, _this select 1,'air',true] call life_fnc_s_onChar;";

			x = 0.68; y = 0.46;
			w = .08; h = .04;
		};


		class RevealONOFF : Life_Checkbox
		{
			idc = 2971;
			tooltip = "$STR_GUI_PlayerReveal";
			onCheckedChanged = "['objects',_this select 1] call life_fnc_s_onCheckedChange;";
			x = 0.65;
			y = 0.58;
		};

		class ButtonBoostFpsON : Life_RscButtonMenu {
			idc = -1;
			text = "OFF";
			onButtonClick = "setTerrainGrid 50;";
			x = 0.71;
			y = 0.53;
			w = (3 / 40);
			h = (1 / 25);
		};


		class ButtonBoostFpsOFF : Life_RscButtonMenu {
			idc = -1;
			text = "ON";
			onButtonClick = "setTerrainGrid 25;";
			x = 0.63;
			y = 0.53;
			w = (3 / 40);
			h = (1 / 25);
		};

		class ButtonClose : life_RscButtonMenu {
			idc = -1;
			//shortcuts[] = {0x00050000 + 2};
			text = "$STR_Global_Close";
			onButtonClick = "closeDialog 0;";
			x = 0.1;
			y = 0.8 - (1 / 25);
			w = (6.25 / 40);
			h = (1 / 25);
		};
	};
};
