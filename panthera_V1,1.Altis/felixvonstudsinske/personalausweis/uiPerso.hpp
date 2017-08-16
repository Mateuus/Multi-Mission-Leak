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
	
	class controlsBackground {};
	class controls {
		class perso_bild: Life_RscPicture
		{
			idc = 2;

			text = "";
			x = 0.700063 * safezoneW + safezoneX;
			y = 0.3636 * safezoneH + safezoneY;
			w = 0.294936 * safezoneW;
			h = 0.5346 * safezoneH;
		};
		class bild_person: Life_RscPicture
		{
			idc = 410001;

			text = "";
			x = 0.709322 * safezoneW + safezoneX;
			y = 0.576074 * safezoneH + safezoneY;
			w = 0.0771876 * safezoneW;
			h = 0.167963 * safezoneH;
		};
		class bild_frakt: Life_RscPicture
		{
			idc = 410011;
			text = "";
			x = 0.718625 * safezoneW + safezoneX;
			y = 0.7904 * safezoneH + safezoneY;
			w = 0.05775 * safezoneW;
			h = 0.0946 * safezoneH;
		};
		class anzeige_ausblenden: Life_RscStructuredText
		{
			idc = 3;

			text = "# ? #";
			x = 0.700063 * safezoneW + safezoneX;
			y = 0.907 * safezoneH + safezoneY;
			w = 0.294936 * safezoneW;
			h = 0.044 * safezoneH;
			colorBackground[] = {-1,-1,-1,0.7};
		};
		class text_status: Life_RscStructuredText
		{
			idc = 410010;
			shadow = 0;

			x = 0.70625 * safezoneW + safezoneX;
			y = 0.7464 * safezoneH + safezoneY;
			w = 0.0835313 * safezoneW;
			h = 0.0418 * safezoneH;
		};
		class text_name: Life_RscStructuredText
		{
			idc = 410002;
			shadow = 0;

			x = 0.804219 * safezoneW + safezoneX;
			y = 0.6034 * safezoneH + safezoneY;
			w = 0.155187 * safezoneW;
			h = 0.0266297 * safezoneH;
		};
		class text_bday: Life_RscStructuredText
		{
			idc = 410003;
			shadow = 0;

			x = 0.804219 * safezoneW + safezoneX;
			y = 0.6452 * safezoneH + safezoneY;
			w = 0.153125 * safezoneW;
			h = 0.0266297 * safezoneH;
		};
		class text_adresse: Life_RscStructuredText
		{
			idc = 410004;
			shadow = 0;

			x = 0.804219 * safezoneW + safezoneX;
			y = 0.6936 * safezoneH + safezoneY;
			w = 0.156218 * safezoneW;
			h = 0.0442297 * safezoneH;
		};
		class text_cm: Life_RscStructuredText
		{
			idc = 410005;
			shadow = 0;

			x = 0.804219 * safezoneW + safezoneX;
			y = 0.7508 * safezoneH + safezoneY;
			w = 0.0407318 * safezoneW;
			h = 0.0266297 * safezoneH;
		};
		class text_gewicht: Life_RscStructuredText
		{
			idc = 410008;
			shadow = 0;

			x = 0.860937 * safezoneW + safezoneX;
			y = 0.7508 * safezoneH + safezoneY;
			w = 0.0407318 * safezoneW;
			h = 0.0266297 * safezoneH;
		};
		class text_sex: Life_RscStructuredText
		{
			idc = 410006;
			shadow = 0;

			x = 0.919718 * safezoneW + safezoneX;
			y = 0.7508 * safezoneH + safezoneY;
			w = 0.0407318 * safezoneW;
			h = 0.0266297 * safezoneH;
		};
		class text_mail: Life_RscStructuredText
		{
			idc = 410007;
			shadow = 0;

			x = 0.804219 * safezoneW + safezoneX;
			y = 0.7926 * safezoneH + safezoneY;
			w = 0.156218 * safezoneW;
			h = 0.0266297 * safezoneH;
		};
		class text_handynr: Life_RscStructuredText
		{
			idc = 410009;
			shadow = 0;

			x = 0.804219 * safezoneW + safezoneX;
			y = 0.8366 * safezoneH + safezoneY;
			w = 0.124257 * safezoneW;
			h = 0.0266297 * safezoneH;
		};
	};
};