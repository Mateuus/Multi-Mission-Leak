class spawnMenu 
{
	idd = 700;
	name= "spawnMenu";
	movingEnable = 0;
	enableSimulation = 1;

	class controlsBackground 
	{
		class RscPicture_1200: Life_RscPicture
		{
			idc = 1200;
			text = "\sndimg\sahrani\icons\armanetworklogo.paa";
			x = 0.0565628 * safezoneW + safezoneX;
			y = 0.522 * safezoneH + safezoneY;
			w = 0.139219 * safezoneW;
			h = 0.121 * safezoneH;
		};
		class RscText_1000: Life_RscText
		{
			idc = 2000;
			x = 0.0410932 * safezoneW + safezoneX;
			y = 0.742 * safezoneH + safezoneY;
			w = 0.134062 * safezoneW;
			h = 0.165 * safezoneH;
			colorBackground[] = {0,0,0,0.7};
		};
		class RscText_1001: Life_RscText
		{
			idc = 2001;
			text = "Available Items";
			x = 0.0410937 * safezoneW + safezoneX;
			y = 0.709 * safezoneH + safezoneY;
			w = 0.134062 * safezoneW;
			h = 0.033 * safezoneH;
			colorBackground[] = {0,0,0,1};
			sizeEx = "1 * (((( safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
	};
	class controls 
	{
		class RscButtonMenu_2400: Life_RscButtonMenu
		{
			idc = 2400;
			text = "Citizen Stats";
			x = 0.0359375 * safezoneW + safezoneX;
			y = 0.72 * safezoneH + safezoneY;
			w = 0.180469 * safezoneW;
			h = 0.044 * safezoneH;
			sizeEx = "1 * (((( safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
		class RscButtonMenu_2401: Life_RscButtonMenu
		{
			idc = 2401;
			text = "Available Player Customisations";
			x = 0.0359375 * safezoneW + safezoneX;
			y = 0.775 * safezoneH + safezoneY;
			w = 0.180469 * safezoneW;
			h = 0.044 * safezoneH;
			onButtonClick = "[0] spawn life_fnc_memaphasucra";
			sizeEx = "1 * (((( safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
		class RscButtonMenu_2402: Life_RscButtonMenu
		{
			idc = 2402;
			text = "Leave Menu";
			x = 0.0359375 * safezoneW + safezoneX;
			y = 0.83 * safezoneH + safezoneY;
			w = 0.180469 * safezoneW;
			h = 0.044 * safezoneH;
			onButtonClick = "endMission 'EXIT';";
			sizeEx = "1 * (((( safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
		class RscText_1000: Life_RscText
		{
			idc = 1000;
			text = "ArmA.Network";
			x = -0.000156274 * safezoneW + safezoneX;
			y = 0.973 * safezoneH + safezoneY;
			w = 0.262969 * safezoneW;
			h = 0.022 * safezoneH;
			sizeEx = "1 * (((( safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
		class RscButtonMenu_2403: Life_RscButtonMenu
		{
			idc = 2403;
			text = "Enter Tanoa";
			x = 0.0359375 * safezoneW + safezoneX;
			y = 0.665 * safezoneH + safezoneY;
			w = 0.180469 * safezoneW;
			h = 0.044 * safezoneH;
			onButtonClick = "[] call life_fnc_wetruvat";
			sizeEx = "1 * (((( safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
		class RscStructuredText_1100: Life_RscStructuredText
		{
			idc = 1100;
			text = "<t align='right' size='0.95' valign='middle'>Update 2.0 -- </t><t align='right' size='1' valign='middle'>Build 27072016</t>"; //--- ToDo: Localize;
			x = 0.840312 * safezoneW + safezoneX;
			y = 0.973 * safezoneH + safezoneY;
			w = 0.159844 * safezoneW;
			h = 0.022 * safezoneH;
			size = "(((( safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
		//CUSTOMIZATION
		class RscListbox_1500: Life_RscListbox
		{
			idc = 2500;
			text = "";
			x = 0.04625 * safezoneW + safezoneX;
			y = 0.753 * safezoneH + safezoneY;
			w = 0.12375 * safezoneW;
			h = 0.11 * safezoneH;
			onLBSelChanged = "_this call life_fnc_xuwrephutruj;";
			sizeEx = "0.75 * (((( safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
		class RscCombo_2100: Life_RscCombo
		{
			idc = 2100;
			text = "";
			x = 0.04625 * safezoneW + safezoneX;
			y = 0.863 * safezoneH + safezoneY;
			w = 0.12375 * safezoneW;
			h = 0.033 * safezoneH;
			onLBSelChanged = "_this call life_fnc_vuchawrazacr;";
			sizeEx = "0.75 * (((( safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
		class adsfagasdfa: Life_RscButtonMenu
		{
			idc = 3400;
			text = "Save Item To Player";
			x = 0.0410937 * safezoneW + safezoneX;
			y = 0.907 * safezoneH + safezoneY;
			w = 0.134062 * safezoneW;
			h = 0.022 * safezoneH;
			onButtonClick = "[customization_type] call life_fnc_hepucephaxap";
			sizeEx = "1 * (((( safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
		class wrasdfgasdfas: Life_RscButtonMenu
		{
			idc = 3401;
			text = "Go Back"; //--- ToDo: Localize;
			x = 0.0410937 * safezoneW + safezoneX;
			y = 0.929 * safezoneH + safezoneY;
			w = 0.134062 * safezoneW;
			h = 0.022 * safezoneH;
			onButtonClick = "[1] spawn life_fnc_memaphasucra";
			sizeEx = "1 * (((( safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
	};
};
