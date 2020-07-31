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
		class MedicsOnline : Life_RscButtonMenu
		{
			idc = 7304;
			text = "Medycy: 1";
			x = 0.000874975 * safezoneW + safezoneX;
			y = 0.0556 * safezoneH + safezoneY;
			w = (20 / 40);
			h = (1 / 25);
			onButtonClick = "";
			colorBackground[] = {0, 0, 0, 0.7};
			class Attributes 
			{
				align = "center";
			};
		};
		
		class MedicsNearby : Life_RscButtonMenu
		{
			idc = 7305;
			text = "W poblizu: Brak";
			x = 0.000874975 * safezoneW + safezoneX;
			y = 0.0776 * safezoneH + safezoneY;
			w = (20 / 40);
			h = (1 / 25);
			onButtonClick = "";
			colorBackground[] = {0, 0, 0, 0.7};
			class Attributes 
			{
				align = "center";
			};
		};
		
		class RespawnBtn : Life_RscButtonMenu
		{
			idc = 7302;
			x = 0.000874975 * safezoneW + safezoneX;
			y = 0.0996 * safezoneH + safezoneY;
			w = (20 / 40);
			h = (1 / 25);
			text = "Odrodz sie";
			onButtonClick = "closeDialog 0; life_respawned = true; [] call life_fnc_spawnMenu;";
			colorBackground[] = {0, 0, 0, 1};
			class Attributes 
			{
				align = "center";
			};
		};
		
		class MedicBtn : Life_RscButtonMenu
		{
			idc = 7303;
			x = 0.000874975 * safezoneW + safezoneX;
			y = 0.1216 * safezoneH + safezoneY;
			w = (20 / 40);
			h = (1 / 25);
			onButtonClick = "[] call life_fnc_requestMedic;";
			text = "Wezwij medyka";
			colorBackground[] = {0, 0, 0, 1};
			class Attributes 
			{
				align = "center";
			};
		};
		
		class respawnTime : Life_RscButtonMenu
		{
			idc = 7301;
			text = "";
			x = 0.000874975 * safezoneW + safezoneX;
			y = 0.0226 * safezoneH + safezoneY;
			w = (20 / 40);
			h = (1 / 25);
			onButtonClick = "";
			colorBackground[] = {0, 0, 0, 1};
		};
	};
};