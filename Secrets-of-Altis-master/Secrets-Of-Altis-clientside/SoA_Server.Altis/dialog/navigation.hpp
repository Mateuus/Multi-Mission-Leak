class navigation {

	idd = 5000;
	movingEnable = 1;
	enableSimulation = 1;
	OnLoad = "[] spawn life_fnc_legend";
	
	class controlsBackground {

		class navibackground: Life_RscText
		{
			idc = -1;
			x = 0.0101562 * safezoneW + safezoneX;
			y = 0.225 * safezoneH + safezoneY;
			w = 0.185625 * safezoneW;
			h = 0.539 * safezoneH;
			colorBackground[] = {0,0,0,0.5};
		};
		
		class legalinfo: Life_RscText
		{
			idc = -1;
			text = "Legal";
			x = 0.123594 * safezoneW + safezoneX;
			y = 0.203 * safezoneH + safezoneY;
			w = 0.0257812 * safezoneW;
			h = 0.022 * safezoneH;
			colorText[] = {0,1,0,1};
			colorBackground[] = {0,0,0,0.5};
		};
		
		class illegalinfo: Life_RscText
		{
			idc = -1;
			text = "Illegal";
			x = 0.164844 * safezoneW + safezoneX;
			y = 0.203 * safezoneH + safezoneY;
			w = 0.0257812 * safezoneW;
			h = 0.022 * safezoneH;
			colorText[] = {1,0,0,1};
			colorBackground[] = {0,0,0,0.5};
		};
		
		class legendinfo: Life_RscText
		{
			idc = -1;
			text = "Legende";
			x = 0.0153125 * safezoneW + safezoneX;
			y = 0.203 * safezoneH + safezoneY;
			w = 0.0979687 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0,0,0,0.5};
		};

		class geschafte: Life_RscText
		{
			idc = -1;
			text = "Geschäfte";
			x = 0.0153125 * safezoneW + safezoneX;
			y = 0.236 * safezoneH + safezoneY;
			w = 0.0979687 * safezoneW;
			h = 0.022 * safezoneH;
		};
		
		class vehikelgarage: Life_RscText
		{
			idc = -1;
			text = "Vehikelhändler & Garagen";
			x = 0.0153125 * safezoneW + safezoneX;
			y = 0.269 * safezoneH + safezoneY;
			w = 0.097971 * safezoneW;
			h = 0.022 * safezoneH;
		};
		
		class lizenzen: Life_RscText
		{
			idc = -1;
			text = "Lizenzämter";
			x = 0.0153125 * safezoneW + safezoneX;
			y = 0.302 * safezoneH + safezoneY;
			w = 0.0979687 * safezoneW;
			h = 0.022 * safezoneH;
		};
		
		class vehikelservice: Life_RscText
		{
			idc = -1;
			text = "Vehikel-Servicestationen";
			x = 0.0153125 * safezoneW + safezoneX;
			y = 0.335 * safezoneH + safezoneY;
			w = 0.0979687 * safezoneW;
			h = 0.022 * safezoneH;
		};
		
		class infrastruktur: Life_RscText
		{
			idc = -1;
			text = "Infrastruktur";
			x = 0.0153125 * safezoneW + safezoneX;
			y = 0.368 * safezoneH + safezoneY;
			w = 0.0979687 * safezoneW;
			h = 0.022 * safezoneH;
		};
		
		class muell: Life_RscText
		{
			idc = -1;
			text = "Müllinformationen";
			x = 0.0153125 * safezoneW + safezoneX;
			y = 0.401 * safezoneH + safezoneY;
			w = 0.0979687 * safezoneW;
			h = 0.022 * safezoneH;
		};
		
		class waffenladen: Life_RscText
		{
			idc = -1;
			text = "Waffen & Jagdhändler";
			x = 0.0153125 * safezoneW + safezoneX;
			y = 0.566 * safezoneH + safezoneY;
			w = 0.0979687 * safezoneW;
			h = 0.022 * safezoneH;
		};
		
		class farming: Life_RscText
		{
			idc = -1;
			text = "Farm & Abbaugebiete";
			x = 0.0153125 * safezoneW + safezoneX;
			y = 0.467 * safezoneH + safezoneY;
			w = 0.0825 * safezoneW;
			h = 0.022 * safezoneH;
		};
		
		class verarbeitung: Life_RscText
		{
			idc = -1;
			text = "Verarbeitung";
			x = 0.0153125 * safezoneW + safezoneX;
			y = 0.5 * safezoneH + safezoneY;
			w = 0.0979687 * safezoneW;
			h = 0.022 * safezoneH;
		};
		
		class haendler: Life_RscText
		{
			idc = -1;
			text = "Händler & Ankäufe";
			x = 0.0153125 * safezoneW + safezoneX;
			y = 0.533 * safezoneH + safezoneY;
			w = 0.0979687 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class rebellen: Life_RscText
		{
			idc = -1;
			text = "Rebellengebiete";
			x = 0.0153125 * safezoneW + safezoneX;
			y = 0.599 * safezoneH + safezoneY;
			w = 0.0979687 * safezoneW;
			h = 0.022 * safezoneH;
		};
		
		class gruppierung: Life_RscText
		{
			idc = -1;
			text = "Gruppierungsgebiete";
			x = 0.0153125 * safezoneW + safezoneX;
			y = 0.632 * safezoneH + safezoneY;
			w = 0.0979687 * safezoneW;
			h = 0.022 * safezoneH;
		};
		
		class atms: Life_RscText
		{
			idc = -1;
			text = "Bankautomaten";
			x = 0.0153125 * safezoneW + safezoneX;
			y = 0.665 * safezoneH + safezoneY;
			w = 0.0979687 * safezoneW;
			h = 0.022 * safezoneH;
		};
		
		class phone: Life_RscText
		{
			idc = -1;
			text = "Telefonzellen";
			x = 0.0153125 * safezoneW + safezoneX;
			y = 0.698 * safezoneH + safezoneY;
			w = 0.0979687 * safezoneW;
			h = 0.022 * safezoneH;
		};
		
		class toiletten: Life_RscText
		{
			idc = -1;
			text = "Toilettenhäuschen";
			x = 0.0153125 * safezoneW + safezoneX;
			y = 0.731 * safezoneH + safezoneY;
			w = 0.0979687 * safezoneW;
			h = 0.022 * safezoneH;
		};
		
		class notdienste: Life_RscText
		{
			idc = -1;
			text = "Notdienste";
			x = 0.0153125 * safezoneW + safezoneX;
			y = 0.434 * safezoneH + safezoneY;
			w = 0.0979687 * safezoneW;
			h = 0.022 * safezoneH;
		};
		
	};
	
	class controls {
		
		class geschaftebox: Life_RscActiveText
		{
			idc = 5001;
			colorDisabled[] = {1,1,1,0.25};
			sizeEx = 0.03;
			x = 0.149375 * safezoneW + safezoneX;
			y = 0.236 * safezoneH + safezoneY;
			w = 0.0154688 * safezoneW;
			h = 0.022 * safezoneH;
		};
		
		class vehikelbox: geschaftebox
		{
			idc = 5002;
			x = 0.149375 * safezoneW + safezoneX;
			y = 0.269 * safezoneH + safezoneY;
			w = 0.0154688 * safezoneW;
			h = 0.022 * safezoneH;
		};
		
		class lizenzbox: geschaftebox
		{
			idc = 5003;
			x = 0.149375 * safezoneW + safezoneX;
			y = 0.302 * safezoneH + safezoneY;
			w = 0.0154688 * safezoneW;
			h = 0.022 * safezoneH;
		};
		
		class vehikelservicebox: geschaftebox
		{
			idc = 5004;
			x = 0.149375 * safezoneW + safezoneX;
			y = 0.335 * safezoneH + safezoneY;
			w = 0.0154688 * safezoneW;
			h = 0.022 * safezoneH;
		};
		
		class infrastrukturbox: geschaftebox
		{
			idc = 5005;
			x = 0.149375 * safezoneW + safezoneX;
			y = 0.368 * safezoneH + safezoneY;
			w = 0.0154688 * safezoneW;
			h = 0.022 * safezoneH;
		};
		
		class muellbox: geschaftebox
		{
			idc = 5006;
			x = 0.149375 * safezoneW + safezoneX;
			y = 0.401 * safezoneH + safezoneY;
			w = 0.0154688 * safezoneW;
			h = 0.022 * safezoneH;
		};
		
		class notdienstebox: geschaftebox
		{
			idc = 5008;
			x = 0.149375 * safezoneW + safezoneX;
			y = 0.434 * safezoneH + safezoneY;
			w = 0.0154688 * safezoneW;
			h = 0.022 * safezoneH;
		};
		
		class farmboxlegal: geschaftebox
		{
			idc = 5009;
			x = 0.12875 * safezoneW + safezoneX;
			y = 0.467 * safezoneH + safezoneY;
			w = 0.0154688 * safezoneW;
			h = 0.022 * safezoneH;
		};
		
		class farmboxillegal: geschaftebox
		{
			idc = 5010;
			x = 0.17 * safezoneW + safezoneX;
			y = 0.467 * safezoneH + safezoneY;
			w = 0.0154688 * safezoneW;
			h = 0.022 * safezoneH;
		};
		
		class verarbeitungboxlegal: geschaftebox
		{
			idc = 5011;
			x = 0.12875 * safezoneW + safezoneX;
			y = 0.5 * safezoneH + safezoneY;
			w = 0.0154688 * safezoneW;
			h = 0.022 * safezoneH;
		};
		
		class verarbeitungboxillegal: geschaftebox
		{
			idc = 5012;
			x = 0.17 * safezoneW + safezoneX;
			y = 0.5 * safezoneH + safezoneY;
			w = 0.0154688 * safezoneW;
			h = 0.022 * safezoneH;
		};
		
		class haendlerboxlegal: geschaftebox
		{
			idc = 5013;
			x = 0.12875 * safezoneW + safezoneX;
			y = 0.533 * safezoneH + safezoneY;
			w = 0.0154688 * safezoneW;
			h = 0.022 * safezoneH;
		};
		
		class haendlerboxillegal: geschaftebox
		{
			idc = 5014;
			x = 0.17 * safezoneW + safezoneX;
			y = 0.533 * safezoneH + safezoneY;
			w = 0.0154688 * safezoneW;
			h = 0.022 * safezoneH;
		};
		
		class waffenbox: geschaftebox
		{
			idc = 5015;
			x = 0.149375 * safezoneW + safezoneX;
			y = 0.566 * safezoneH + safezoneY;
			w = 0.0154688 * safezoneW;
			h = 0.022 * safezoneH;
		};
		
		class rebellenbox: geschaftebox
		{
			idc = 5016;
			x = 0.149375 * safezoneW + safezoneX;
			y = 0.599 * safezoneH + safezoneY;
			w = 0.0154688 * safezoneW;
			h = 0.022 * safezoneH;
		};
		
		class gruppierungsbox: geschaftebox
		{
			idc = 5017;
			x = 0.149375 * safezoneW + safezoneX;
			y = 0.632 * safezoneH + safezoneY;
			w = 0.0154688 * safezoneW;
			h = 0.022 * safezoneH;
		};
		
		class atmsbox: geschaftebox
		{
			idc = 5018;
			x = 0.149375 * safezoneW + safezoneX;
			y = 0.665 * safezoneH + safezoneY;
			w = 0.0154688 * safezoneW;
			h = 0.022 * safezoneH;
		};
		
		class phonebox: geschaftebox
		{
			idc = 5019;
			x = 0.149375 * safezoneW + safezoneX;
			y = 0.698 * safezoneH + safezoneY;
			w = 0.0154688 * safezoneW;
			h = 0.022 * safezoneH;
		};
		
		class toilettenbox: geschaftebox
		{
			idc = 5020;
			x = 0.149375 * safezoneW + safezoneX;
			y = 0.731 * safezoneH + safezoneY;
			w = 0.0154688 * safezoneW;
			h = 0.022 * safezoneH;
		};
	};
};