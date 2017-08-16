class DeathScreen
{
	idd = 7300;
	name = "Life_Death_Screen";
	movingEnable = 0;
	enableSimulation = 1;
	
	class controlsBackground
	{
	};
	
	class Controls
	{
		class MedicsOnline : Life_RscText
		{
			idc = 7304;
			colorBackground[] = {0, 0, 0, 0.7};
			text = "Medics Online: 1";
			x = 0.000874975 * safezoneW + safezoneX;
			y = 0.0556 * safezoneH + safezoneY;
			w = (20 / 40);
			h = (1 / 25);
		};
		
		class MedicsNearby : Life_RscText
		{
			idc = 7305;
			colorBackground[] = {0, 0, 0, 0.7};
			text = "Medics Nearby: No";
			x = 0.000874975 * safezoneW + safezoneX;
			y = 0.0776 * safezoneH + safezoneY;
			w = (20 / 40);
			h = (1 / 25);
		};
		
		class RespawnBtn : Life_RscButtonMenu
		{
			idc = 7302;
			x = 0.000874975 * safezoneW + safezoneX;
			y = 0.0996 * safezoneH + safezoneY;
			w = (20 / 40);
			h = (1 / 25);
			text = "Respawn";
			onButtonClick = "closeDialog 0; life_respawned = true; [] call life_fnc_spawnMenu;";
			colorBackground[] = {0.5, 0, 0, 0.5};
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
			text = "Request Medic";
			colorBackground[] = {0.5, 0, 0, 0.5};
			class Attributes 
			{
				align = "center";
			};
		};
		
		class respawnTime : Life_RscText
		{
			idc = 7301;
			colorBackground[] = {0,0,0,1};
			text = "";
			x = 0.000874975 * safezoneW + safezoneX;
			y = 0.0226 * safezoneH + safezoneY;
			w = (20 / 40);
			h = (1 / 25);
		};
	};
};