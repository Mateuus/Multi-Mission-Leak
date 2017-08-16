class ES_medSkinSwitch
{
	idd = 1234564;
	movingEnable = true;
	enableSimulation = 1;
	onLoad = "[0] spawn ES_fnc_medSkinSwitch;";


	class controlsBackground
	{
		class BG: ES_RscText
		{
			idc = -1;
			x = 0.293993 * safezoneW + safezoneX;
			y = 0.214 * safezoneH + safezoneY;
			w = 0.412014 * safezoneW;
			h = 0.561 * safezoneH;
			colorBackground[] = {0,0,0,0.4};
		};

		class Text: ES_RscTitle
		{
			idc = 1015;
			text = "Police Skin Switch Menu WOOOT La Seniore Goosi";
			x = 0.293993 * safezoneW + safezoneX;
			y = 0.214 * safezoneH + safezoneY;
			w = 0.412014 * safezoneW;
			h = 0.022 * safezoneH;
		};
	};
	class controls
	{
		class medLvlBtn1: ES_RscButtonMenu
		{
			idc = 1600;
			text = "Adac Skin";
			x = 0.299143 * safezoneW + safezoneX;
			y = 0.247 * safezoneH + safezoneY;
			w = 0.0721024 * safezoneW;
			h = 0.022 * safezoneH;
			onButtonClick = "[1] spawn ES_fnc_medSkinSwitch;";
		};

		class medLvlBtn2: ES_RscButtonMenu
		{
			idc = 1601;
			text = "Medic Skin";
			x = 0.299143 * safezoneW + safezoneX;
			y = 0.28 * safezoneH + safezoneY;
			w = 0.0721024 * safezoneW;
			h = 0.022 * safezoneH;
			onButtonClick = "[2] spawn ES_fnc_medSkinSwitch;";
		};

		class medLvlBtn3: ES_RscButtonMenu
		{
			idc = 1602;
			text = "Firefighter Skin";
			x = 0.299143 * safezoneW + safezoneX;
			y = 0.313 * safezoneH + safezoneY;
			w = 0.0721024 * safezoneW;
			h = 0.022 * safezoneH;
			onButtonClick = "[3] spawn ES_fnc_medSkinSwitch;";
		};

		class medLvlBtn4: ES_RscButtonMenu
		{
			idc = 1603;
			text = "Fire Fighter Skin";
			x = 0.299143 * safezoneW + safezoneX;
			y = 0.346 * safezoneH + safezoneY;
			w = 0.0721024 * safezoneW;
			h = 0.022 * safezoneH;
			onButtonClick = "[4] spawn ES_fnc_medSkinSwitch;";
		};

		class medLvlBtn5: ES_RscButtonMenu
		{
			idc = 1604;
			text = "Kuestenrettungwache Skin";
			x = 0.299143 * safezoneW + safezoneX;
			y = 0.379 * safezoneH + safezoneY;
			w = 0.0721024 * safezoneW;
			h = 0.022 * safezoneH;
			onButtonClick = "[5] spawn ES_fnc_medSkinSwitch;";
		};

		class copLvlBtn6: ES_RscButtonMenu
		{
			idc = 1605;
			text = "Commissioner Skin";
			x = 0.299143 * safezoneW + safezoneX;
			y = 0.412 * safezoneH + safezoneY;
			w = 0.0721024 * safezoneW;
			h = 0.022 * safezoneH;
			onButtonClick = "[6] spawn ES_fnc_medSkinSwitch;";
		};

		class medLvlBtn7: ES_RscButtonMenu
		{
			idc = 1606;
			text = "Major Skin";
			x = 0.299143 * safezoneW + safezoneX;
			y = 0.445 * safezoneH + safezoneY;
			w = 0.0721024 * safezoneW;
			h = 0.022 * safezoneH;
			onButtonClick = "[7] spawn ES_fnc_medSkinSwitch;";
		};

		class medLvlBtn8: ES_RscButtonMenu
		{
			idc = 1607;
			text = "FBI Skin";
			x = 0.299143 * safezoneW + safezoneX;
			y = 0.478 * safezoneH + safezoneY;
			w = 0.0721024 * safezoneW;
			h = 0.022 * safezoneH;
			onButtonClick = "[8] spawn ES_fnc_medSkinSwitch;";
		};

		class medLvlBtn9: ES_RscButtonMenu
		{
			idc = 1608;
			text = "SWAT / NCIS";
			x = 0.299143 * safezoneW + safezoneX;
			y = 0.511 * safezoneH + safezoneY;
			w = 0.0721024 * safezoneW;
			h = 0.022 * safezoneH;
			onButtonClick = "[9] spawn ES_fnc_medSkinSwitch;";
		};

		class medLvlBtn10: ES_RscButtonMenu
		{
			idc = 1609;
			text = "Marshal Skin";
			x = 0.299143 * safezoneW + safezoneX;
			y = 0.544 * safezoneH + safezoneY;
			w = 0.0721024 * safezoneW;
			h = 0.022 * safezoneH;
			onButtonClick = "[10] spawn ES_fnc_medSkinSwitch;";
		};

		class medLvlBtn11: ES_RscButtonMenu
		{
			idc = 1610;
			text = "Secretary Skin";
			x = 0.299143 * safezoneW + safezoneX;
			y = 0.577 * safezoneH + safezoneY;
			w = 0.0721024 * safezoneW;
			h = 0.022 * safezoneH;
			onButtonClick = "[11] spawn ES_fnc_medSkinSwitch;";
		};

		class medLvlBtn12: ES_RscButtonMenu
		{
			idc = 1611;
			text = "Police Chief Skin";
			x = 0.299143 * safezoneW + safezoneX;
			y = 0.61 * safezoneH + safezoneY;
			w = 0.0721024 * safezoneW;
			h = 0.022 * safezoneH;
			onButtonClick = "[12] spawn ES_fnc_medSkinSwitch;";
		};

		class lvl1: ES_RscText
		{
			idc = 1000;
			text = "Cadet Skin";
			x = 0.371246 * safezoneW + safezoneX;
			y = 0.247 * safezoneH + safezoneY;
			w = 0.118454 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class lvl2: ES_RscText
		{
			idc = 1001;
			text = "Deputy Skin";
			x = 0.371246 * safezoneW + safezoneX;
			y = 0.28 * safezoneH + safezoneY;
			w = 0.118454 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class lvl3: ES_RscText
		{
			idc = 1002;
			text = "Officer Skin";
			x = 0.371246 * safezoneW + safezoneX;
			y = 0.313 * safezoneH + safezoneY;
			w = 0.118454 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class lvl4: ES_RscText
		{
			idc = 1003;
			text = "Detective Skin";
			x = 0.371246 * safezoneW + safezoneX;
			y = 0.346 * safezoneH + safezoneY;
			w = 0.118454 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class lvl5: ES_RscText
		{
			idc = 1004;
			text = "Inspector Skin";
			x = 0.371246 * safezoneW + safezoneX;
			y = 0.379 * safezoneH + safezoneY;
			w = 0.118454 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class lvl6: ES_RscText
		{
			idc = 1005;
			text = "Commissioner Skin";
			x = 0.371246 * safezoneW + safezoneX;
			y = 0.412 * safezoneH + safezoneY;
			w = 0.118454 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class lvl7: ES_RscText
		{
			idc = 1006;
			text = "Major Skin";
			x = 0.371246 * safezoneW + safezoneX;
			y = 0.445 * safezoneH + safezoneY;
			w = 0.118454 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class lvl8: ES_RscText
		{
			idc = 1007;
			text = "FBI Skin";
			x = 0.371246 * safezoneW + safezoneX;
			y = 0.478 * safezoneH + safezoneY;
			w = 0.118454 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class lvl9: ES_RscText
		{
			idc = 1008;
			text = "S.W.A.T. und N.C.I.S. Skin";
			x = 0.371246 * safezoneW + safezoneX;
			y = 0.511 * safezoneH + safezoneY;
			w = 0.118454 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class lvl10: ES_RscText
		{
			idc = 1009;
			text = "Marshal Skin";
			x = 0.371246 * safezoneW + safezoneX;
			y = 0.544 * safezoneH + safezoneY;
			w = 0.118454 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class lvl11: ES_RscText
		{
			idc = 1010;
			text = "Secretary Skin";
			x = 0.371246 * safezoneW + safezoneX;
			y = 0.577 * safezoneH + safezoneY;
			w = 0.118454 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class lvl12: ES_RscText
		{
			idc = 1011;
			text = "Police Chief Skin";
			x = 0.371246 * safezoneW + safezoneX;
			y = 0.61 * safezoneH + safezoneY;
			w = 0.118454 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class OrdnBtn: ES_RscButtonMenu
		{
			idc = 16122;
			text = "Orden Skin";
			x = 0.299143 * safezoneW + safezoneX;
			y = 0.6408 * safezoneH + safezoneY;
			w = 0.0721024 * safezoneW;
			h = 0.022 * safezoneH;
			onButtonClick = "[13] spawn ES_fnc_medSkinSwitch;";
		};

		class Orden: ES_RscText
		{
			idc = 10122;
			text = "Orden Skin";
			x = 0.371246 * safezoneW + safezoneX;
			y = 0.6408 * safezoneH + safezoneY;
			w = 0.118454 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class STANDARTBtn: ES_RscButtonMenu
		{
			idc = 1612;
			text = "STANDART";
			x = 0.299143 * safezoneW + safezoneX;
			y = 0.6716 * safezoneH + safezoneY;
			w = 0.0721024 * safezoneW;
			h = 0.022 * safezoneH;
			onButtonClick = "[14] spawn ES_fnc_medSkinSwitch;";
		};

		class STANDART: ES_RscText
		{
			idc = 1012;
			text = "STANDART";
			x = 0.371246 * safezoneW + safezoneX;
			y = 0.6716 * safezoneH + safezoneY;
			w = 0.118454 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class NAME: ES_RscText
		{
			idc = 1013;
			text = "";
			x = 0.520601 * safezoneW + safezoneX;
			y = 0.247 * safezoneH + safezoneY;
			w = 0.118454 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class GUID: ES_RscText
		{
			idc = 1014;
			text = "";
			x = 0.520601 * safezoneW + safezoneX;
			y = 0.28 * safezoneH + safezoneY;
			w = 0.118454 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class LvL: ES_RscText
		{
			idc = 1016;
			text = "";
			x = 0.520601 * safezoneW + safezoneX;
			y = 0.313 * safezoneH + safezoneY;
			w = 0.118454 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class Server: ES_RscText
		{
			idc = 1017;
			text = "";
			x = 0.299143 * safezoneW + safezoneX;
			y = 0.731 * safezoneH + safezoneY;
			w = 0.401714 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class ButtonClose: ES_RscButtonMenu
		{
			idc = 1212;
			text = "Schliessen";
			onButtonClick = "closeDialog 0;";
			x = 0.628754 * safezoneW + safezoneX;
			y = 0.665 * safezoneH + safezoneY;
			w = 0.0721024 * safezoneW;
			h = 0.022 * safezoneH;
			tooltip = "Schliessen";
		};
	};
};
