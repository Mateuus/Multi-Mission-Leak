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
			x = 0.628386 * safezoneW + safezoneX;
			y = 0.124963 * safezoneH + safezoneY;
			w = 0.335625 * safezoneW;
			h = 0.582185 * safezoneH;
		};
		class bild_person: Life_RscPicture
		{
			idc = 410001;

			text = "";
			x = 0.852687 * safezoneW + safezoneX;
			y = 0.40738 * safezoneH + safezoneY;
			w = 0.100104 * safezoneW;
			h = 0.199 * safezoneH;
		};
		/*
		class anzeige_ausblenden: Life_RscStructuredText
		{
			idc = 3;

			text = "# ? #";
			x = 0.628386 * safezoneW + safezoneX;
			y = 0.124963 * safezoneH + safezoneY;
			w = 0.335625 * safezoneW;
			h = 0.582185 * safezoneH;
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
		};*/
		class text_name: Life_RscStructuredText
		{
			idc = 410002;
			shadow = 0;
			x = 0.693385 * safezoneW + safezoneX;
			y = 0.41837 * safezoneH + safezoneY;
			w = 0.0876563 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class text_bday: Life_RscStructuredText
		{
			idc = 410003;
			shadow = 0;
			x = 0.69177 * safezoneW + safezoneX;
			y = 0.46237 * safezoneH + safezoneY;
			w = 0.04125 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class text_adresse: Life_RscStructuredText
		{
			idc = 410004;
			shadow = 0;
			x = 0.718594 * safezoneW + safezoneX;
			y = 0.582444 * safezoneH + safezoneY;
			w = 0.118594 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class text_cm: Life_RscStructuredText
		{
			idc = 410005;
			shadow = 0;
			x = 0.702136 * safezoneW + safezoneX;
			y = 0.524778 * safezoneH + safezoneY;
			w = 0.04125 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class text_gewicht: Life_RscStructuredText
		{
			idc = 410008;
			shadow = 0;
			x = 0.809375 * safezoneW + safezoneX;
			y = 0.523852 * safezoneH + safezoneY;
			w = 0.0360937 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class text_sex: Life_RscStructuredText
		{
			idc = 410006;
			shadow = 0;
			x = 0.785677 * safezoneW + safezoneX;
			y = 0.46237 * safezoneH + safezoneY;
			w = 0.04125 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class text_handynr: Life_RscStructuredText
		{
			idc = 410009;
			shadow = 0;
			x = 0.701094 * safezoneW + safezoneX;
			y = 0.643 * safezoneH + safezoneY;
			w = 0.0928125 * safezoneW;
			h = 0.022 * safezoneH;
		};
	};
};