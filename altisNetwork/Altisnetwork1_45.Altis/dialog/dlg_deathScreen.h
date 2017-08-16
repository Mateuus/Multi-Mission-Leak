class DeathScreen
{
	idd = 7300;
	name = "Life_Death_Screen";
	movingEnabled = false;
	enableSimulation = true;
	
	class controlsBackground
	{
		class backgroundTest : Life_RscText
		{
			idc = -1;
			x = 0.345312 * safezoneW + safezoneX;
			y = 0.885 * safezoneH + safezoneY;
			w = 0.299062 * safezoneW;
			h = 0.121 * safezoneH;
			colorBackground[] = {-1,-1,-1,0.7};
		};
	};
	
	class Controls
	{
		
		class MedicsOnline: Life_RscText
		{
			idc = 7304;

			text = "Medics Online: "; //--- ToDo: Localize;
			x = 0.350469 * safezoneW + safezoneX;
			y = 0.962 * safezoneH + safezoneY;
			w = 0.304219 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class MedicsNearby: Life_RscText
		{
			idc = 7305;

			text = "Medics Nearby: "; //--- ToDo: Localize;
			x = 0.350469 * safezoneW + safezoneX;
			y = 0.929 * safezoneH + safezoneY;
			w = 0.33 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class RespawnBtn: Life_RscButtonMenu
		{
			idc = 7302;
			onButtonClick = "closeDialog 0; life_respawned = true; [] call life_fnc_spawnMenu;";

			text = "Respawn"; //--- ToDo: Localize;
			x = 0.345312 * safezoneW + safezoneX;
			y = 0.861148 * safezoneH + safezoneY;
			w = 0.144375 * safezoneW;
			h = 0.022 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0.1,0.1,0.1,0.7};
		};
		class MedicBtn: Life_RscButtonMenu
		{
			idc = 7303;
			onButtonClick = "[] call life_fnc_requestMedic;";

			text = "Request Medic"; //--- ToDo: Localize;
			x = 0.499479 * safezoneW + safezoneX;
			y = 0.859296 * safezoneH + safezoneY;
			w = 0.144375 * safezoneW;
			h = 0.022 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0.1,0.1,0.1,0.7};
		};
		class respawnTime: Life_RscText
		{
			idc = 7301;

			text = "00:00:00"; //--- ToDo: Localize;
			x = 0.350469 * safezoneW + safezoneX;
			y = 0.896 * safezoneH + safezoneY;
			w = 0.33 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class bleedoutStatusBG : Life_RscText
		{
			idc = -1;
			text = ""; //--- ToDo: Localize;
			x = 0.396875 * safezoneW + safezoneX;
			y = 0.758556 * safezoneH + safezoneY;
			w = 0.201094 * safezoneW;
			h = 0.033 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0.1,0.1,0.1,0.7};
		};
		
		class bleedoutStatus : Life_RscProgress
		{
			idc = 7310;
			text = "Bleeding out";
			x = 0.402031 * safezoneW + safezoneX;
			y = 0.764 * safezoneH + safezoneY;
			w = 0.190781 * safezoneW;
			h = 0.022 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {1,0.1,0.1,0.7};
		};	
	};
};