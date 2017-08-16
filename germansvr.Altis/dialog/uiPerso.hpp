/*
	by Maxos && AustrianNoob
*/

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
		class persobackgroundc: Life_RscPictureKeepAspect
		{
			idc = 410000;
			text = "textures\persobilder\civ_perso.paa";
			x = -0.01 * safezoneW + safezoneX;
			y = 0.357 * safezoneH + safezoneY;
			w = 0.335156 * safezoneW;
			h = 0.55 * safezoneH;
		};
		class persobackgroundw: Life_RscPictureKeepAspect
		{
			idc = 411000;
			text = "textures\persobilder\cop_perso.paa";
			x = -0.01 * safezoneW + safezoneX;
			y = 0.357 * safezoneH + safezoneY;
			w = 0.335156 * safezoneW;
			h = 0.55 * safezoneH;
		};
		class persobackgrounde: Life_RscPictureKeepAspect
		{
			idc = 412000;
			text = "textures\persobilder\adac_perso.paa";
			x = -0.01 * safezoneW + safezoneX;
			y = 0.357 * safezoneH + safezoneY;
			w = 0.335156 * safezoneW;
			h = 0.55 * safezoneH;
		};
		class persobackgroundi: Life_RscPictureKeepAspect
		{
			idc = 413000;
			text = "textures\persobilder\ems_perso.paa";
			x = -0.01 * safezoneW + safezoneX;
			y = 0.357 * safezoneH + safezoneY;
			w = 0.335156 * safezoneW;
			h = 0.55 * safezoneH;
		};
		class persobild:Life_RscPicture
		{
			idc = 410001;
			text = "";
			x = 0.0245938 * safezoneW + safezoneX;
			y = 0.5748 * safezoneH + safezoneY;
			w = 0.0771876 * safezoneW;
			h = 0.150963 * safezoneH;
		};		
	};
	
	class controls
	{
		class vorname: Life_RscStructuredText_P
		{
			idc = 410002;
			text = "";
			x = 0.113282 * safezoneW + safezoneX;
			y = 0.5418 * safezoneH + safezoneY;
			w = 0.0577499 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class nachname: Life_RscStructuredText_P
		{
			idc = 410003;
			text = "";
			x = 0.113282 * safezoneW + safezoneX;
			y = 0.5682 * safezoneH + safezoneY;
			w = 0.0577499 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class geburtsdatum: Life_RscStructuredText_P
		{
			idc = 410004;
			text = "";
			x = 0.113282 * safezoneW + safezoneX;
			y = 0.5946 * safezoneH + safezoneY;
			w = 0.0577499 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class groesse: Life_RscStructuredText_P
		{
			idc = 410005;
			text = "";
			x = 0.113281 * safezoneW + safezoneX;
			y = 0.621 * safezoneH + safezoneY;
			w = 0.0577499 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class gewicht: Life_RscStructuredText_P
		{
			idc = 410006;
			text = "";
			x = 0.113282 * safezoneW + safezoneX;
			y = 0.6474 * safezoneH + safezoneY;
			w = 0.0577499 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class geschlecht: Life_RscStructuredText_P
		{
			idc = 410007;
			text = "";
			x = 0.113282 * safezoneW + safezoneX;
			y = 0.676 * safezoneH + safezoneY;
			w = 0.0577499 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class telefonnummer: Life_RscStructuredText_PL
		{
			idc = 410008;
			text = "";
			x = 0.113282 * safezoneW + safezoneX;
			y = 0.7024 * safezoneH + safezoneY;
			w = 0.1577499 * safezoneW;
			h = 0.022 * safezoneH;
		};
	};
};