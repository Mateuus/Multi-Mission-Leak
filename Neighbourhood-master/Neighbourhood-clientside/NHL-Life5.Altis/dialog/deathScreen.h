class DeathScreen
{
	idd = 7300;
	name = "Life_Death_Screen";
	movingEnabled = false;
	enableSimulation = true;
	
	class controlsBackground
	{
	};
	
	class Controls
	{		
		class RespawnBtn : Life_RscButtonMenu
		{
			idc = 7302;
			x = 0.845469 * safezoneW + safezoneX;
			y = 0.137 * safezoneH + safezoneY;
			w = 0.0928125 * safezoneW;
			h = 0.022 * safezoneH;
			text = "Respawn";
			onButtonClick = "closeDialog 0; life_respawned = true; [] call life_fnc_spawnMenu;";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.7};
			class Attributes 
			{
				align = "center";
			};
		};
		
		class MedicBtn : Life_RscButtonMenu
		{
			idc = 7303;
			x = 0.840312 * safezoneW + safezoneX;
			y = 0.522 * safezoneH + safezoneY;
			w = 0.0928125 * safezoneW;
			h = 0.022 * safezoneH;
			onButtonClick = "[] call life_fnc_requestMedic;";
			text = "SanitÃ¤ter rufen";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.7};
			class Attributes 
			{
				align = "center";
			};
		};

		class respawnTime : Life_RscText
		{
			idc = 7301;
			colorBackground[] = {0,0,0,0};
			text = "";
			x = 0.422656 * safezoneW + safezoneX;
			y = 0.918 * safezoneH + safezoneY;
			w = 0.8;
			h = (1 / 25);
		};
		
		class LSMapView : Life_RscMapControl 
		{
			idc = 7306;
			x = 0.799062 * safezoneW + safezoneX;
			y = 0.17 * safezoneH + safezoneY;
			w = 0.18975 * safezoneW;
			h = 0.2695 * safezoneH;
			maxSatelliteAlpha = 0.75;//0.75;
			alphaFadeStartScale = 1.15;//0.15;
			alphaFadeEndScale = 1.29;//0.29;
			
		};
		
		class LSMapInfo : Life_RscStructuredText
		{
			idc = 7307;
			text = "";
			x = 0.799062 * safezoneW + safezoneX;
			y = 0.456 * safezoneH + safezoneY;
			w = 0.18975 * safezoneW;
			h = 0.055 * safezoneH;
			colorBackground[] = {0,0,0,1};
		};
	};
};