class playerPerso
{
	idd = -1;
	movingEnable = 0;
	fadein = 0;
	duration = 999999999999999999999999999999999;
	fadeout = 0;
	name = "playerPerso";
	onLoad = "uiNamespace setVariable ['playerPerso',_this select 0];";
	objects[] = {};
	
	class controlsBackground {
		class perso_bild: DWEV_RscPicture
		{
			idc = -1;

			text = "textures\persobilder\personalausweis.paa";
			x = 0.700063 * safezoneW + safezoneX;
			y = 0.3636 * safezoneH + safezoneY;
			w = 0.294936 * safezoneW;
			h = 0.5346 * safezoneH;
		};
	};
	class controls {
		class bild_person: DWEV_RscPicture
		{
			idc = 410001;

			text = "";
			x = 0.709322 * safezoneW + safezoneX;
			y = 0.576074 * safezoneH + safezoneY;
			w = 0.0771876 * safezoneW;
			h = 0.167963 * safezoneH;
		};
		class text_name: DWEV_RscStructuredText
		{
			idc = 410002;
			shadow = 0;

			x = 0.804219 * safezoneW + safezoneX;
			y = 0.6034 * safezoneH + safezoneY;
			w = 0.155187 * safezoneW;
			h = 0.0266297 * safezoneH;
		};
		class text_bday: DWEV_RscStructuredText
		{
			idc = 410003;
			shadow = 0;

			x = 0.804219 * safezoneW + safezoneX;
			y = 0.6452 * safezoneH + safezoneY;
			w = 0.153125 * safezoneW;
			h = 0.0266297 * safezoneH;
		};
		class text_adresse: DWEV_RscStructuredText
		{
			idc = 410004;
			shadow = 0;

			x = 0.804219 * safezoneW + safezoneX;
			y = 0.6936 * safezoneH + safezoneY;
			w = 0.156218 * safezoneW;
			h = 0.0442297 * safezoneH;
		};
		class text_cm: DWEV_RscStructuredText
		{
			idc = 410005;
			shadow = 0;

			x = 0.804219 * safezoneW + safezoneX;
			y = 0.7508 * safezoneH + safezoneY;
			w = 0.0407318 * safezoneW;
			h = 0.0266297 * safezoneH;
		};
		class text_mail: DWEV_RscStructuredText
		{
			idc = 410007;
			shadow = 0;

			x = 0.804219 * safezoneW + safezoneX;
			y = 0.7926 * safezoneH + safezoneY;
			w = 0.156218 * safezoneW;
			h = 0.0266297 * safezoneH;
		};
		class text_gewicht: DWEV_RscStructuredText
		{
			idc = 410008;
			shadow = 0;

			x = 0.866094 * safezoneW + safezoneX;
			y = 0.7508 * safezoneH + safezoneY;
			w = 0.0407318 * safezoneW;
			h = 0.0266297 * safezoneH;
		};
		class text_handynr: DWEV_RscStructuredText
		{
			idc = 410009;
			shadow = 0;

			x = 0.804219 * safezoneW + safezoneX;
			y = 0.8366 * safezoneH + safezoneY;
			w = 0.124257 * safezoneW;
			h = 0.0266297 * safezoneH;
		};
		class text_status: DWEV_RscStructuredText
		{
			idc = 410010;
			shadow = 0;

			x = 0.70625 * safezoneW + safezoneX;
			y = 0.7464 * safezoneH + safezoneY;
			w = 0.0835313 * safezoneW;
			h = 0.0418 * safezoneH;
		};
		class text_sex: DWEV_RscStructuredText
		{
			idc = 410006;
			shadow = 0;

			x = 0.919718 * safezoneW + safezoneX;
			y = 0.7508 * safezoneH + safezoneY;
			w = 0.0407318 * safezoneW;
			h = 0.0266297 * safezoneH;
		};
		class bild_frakt: DWEV_RscPicture
		{
			idc = 410011;
			text = "";

			x = 0.718625 * safezoneW + safezoneX;
			y = 0.7804 * safezoneH + safezoneY;
			w = 0.05775 * safezoneW;
			h = 0.0946 * safezoneH;
		};
	};
};