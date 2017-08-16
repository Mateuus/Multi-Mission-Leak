class eventcode {

	idd = 7400;
	movingEnable = 0;
	EnableSimulation = 1;

	class controlsbackground {

		class background: Life_RscText
		{
			idc = -1;
			x = 0.29375 * safezoneW + safezoneX;
			y = 0.225 * safezoneH + safezoneY;
			w = 0.4125 * safezoneW;
			h = 0.55 * safezoneH;
			colorBackground[] = {0,0,0,0.7};
		};

		class backgroundframe: Life_RscFrame
		{
			idc = -1;
			x = 0.29375 * safezoneW + safezoneX;
			y = 0.225 * safezoneH + safezoneY;
			w = 0.4125 * safezoneW;
			h = 0.55 * safezoneH;
		};

		class title: Life_RscText
		{
			idc = -1;
			text = "Code einlösen";
			style = 2;
			x = 0.309219 * safezoneW + safezoneX;
			y = 0.258 * safezoneH + safezoneY;
			w = 0.381563 * safezoneW;
			h = 0.066 * safezoneH;
			sizeEx = 3 * GUI_GRID_H;
		};

		class description: Life_RscText
		{
			idc = -1;
			text = "Du Glückspilz! - Trage den Code unten in das Feld ein um deine Belohnung zu erhalten.";
			style = 2;
			x = 0.309219 * safezoneW + safezoneX;
			y = 0.511 * safezoneH + safezoneY;
			w = 0.381563 * safezoneW;
			h = 0.055 * safezoneH;
		};
	};

	class controls {

		class absendenbutton: Life_RscButtonMenu
		{
			idc = 7401;
			text = "Code einlösen";
			style = 2;
			onButtonClick = "if((ctrlText 7402) != '') then {[player,(ctrlText 7402)] remoteExecCall ['SOA_fnc_eventcodes',2]} else {hint 'Du musst einen gültigen Code eingeben!'}";
			x = 0.54125 * safezoneW + safezoneX;
			y = 0.577 * safezoneH + safezoneY;
			w = 0.134062 * safezoneW;
			h = 0.044 * safezoneH;
		};

		class eingabe: Life_RscEdit
		{
			idc = 7402;
			text = "Hier Code eingeben...";
			style = 2;
			x = 0.324687 * safezoneW + safezoneX;
			y = 0.577 * safezoneH + safezoneY;
			w = 0.195937 * safezoneW;
			h = 0.044 * safezoneH;
			colorBackground[] = {0,0,0,0.6};
		};
	};
};

class EMeventcode {

	idd = 7450;
	movingEnable = 0;
	EnableSimulation = 1;

	class controlsbackground {

		class backgroundimage: Life_RscPicture
		{
			idc = -1;
			text = "images\emshop.paa";
			x = 0.242187 * safezoneW + safezoneX;
			y = 0.247 * safezoneH + safezoneY;
			w = 0.510469 * safezoneW;
			h = 0.506 * safezoneH;
			colorText[] = {1,1,1,1};
		};
		class title: Life_RscText
		{
			idc = -1;
			text = "EM-Code 2016";
			x = 0.242187 * safezoneW + safezoneX;
			y = 0.17 * safezoneH + safezoneY;
			w = 0.510469 * safezoneW;
			h = 0.077 * safezoneH;
			sizeEx = 3 * GUI_GRID_H;
		};
	};

	class controls {

		class eingabe: Life_RscEdit
		{
			idc = 7451;
			text = "EM-Code eingeben...";
			x = 0.505156 * safezoneW + safezoneX;
			y = 0.621 * safezoneH + safezoneY;
			w = 0.195937 * safezoneW;
			h = 0.044 * safezoneH;
			colorBackground[] = {0,0,0,0.6};
		};

		class abschickenbutton: Life_RscButtonMenu
		{
			idc = -1;
			onButtonClick = "if((ctrlText 7451) != '') then {[] spawn life_fnc_em;} else {hint 'Du musst einen gültigen Code eingeben!';}";
			x = 0.695937 * safezoneW + safezoneX;
			y = 0.665 * safezoneH + safezoneY;
			w = 0.0257812 * safezoneW;
			h = 0.033 * safezoneH;
			colorBackground[] = {-1,-1,-1,0};
			colorBackgroundFocused[] = {-1,-1,-1,0};
			colorBackground2[] = {-1,-1,-1,0};
			color[] = {1,1,1,0};
			colorFocused[] = {0,0,0,0};
			color2[] = {0,0,0,0};
			colorText[] = {1,1,1,1};
			colorDisabled[] = {0,0,0,0};
		};
	};
};