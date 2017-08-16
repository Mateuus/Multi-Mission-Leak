class DeathScreen 
{
	idd = 7300;
	name = "Life_Death_Screen";
	movingEnable = 0;
	enableSimulation = 1;

	class controlsBackground 
	{
		class DeathScreen_HGLinks: RscText
		{
			idc = -1;
			x = -0.000774906 * safezoneW + safezoneX;
			y = 0.00775004 * safezoneH + safezoneY;
			w = 0.0050205 * safezoneW;
			h = 0.9592 * safezoneH;
			colorBackground[] = {0,0,0,0.8};
		};
		class DeathScreen_HGO1: RscText
		{
			idc = -1;
			x = -0.00281183 * safezoneW + safezoneX;
			y = -0.0115 * safezoneH + safezoneY;
			w = 1.00662 * safezoneW;
			h = 0.01925 * safezoneH;
			colorBackground[] = {0,0,0,0.8};
		};
		class DeathScreen_HGRechts: RscText
		{
			idc = -1;
			x = 0.996224 * safezoneW + safezoneX;
			y = 0.00830004 * safezoneH + safezoneY;
			w = 0.005433 * safezoneW;
			h = 0.95865 * safezoneH;
			colorBackground[] = {0,0,0,0.8};
		};
		class DeathScreen_HGOben: RscPicture
		{
			idc = -1;
			text = "MINEFACTORY\textures\deathScreen.paa";
			x = 0.00438114 * safezoneW + safezoneX;
			y = 0.00719985 * safezoneH + safezoneY;
			w = 0.992311 * safezoneW;
			h = 0.96085 * safezoneH;
		};
		class DeathScreen_HGUnten: RscText
		{
			idc = -1;
			x = -0.000156274 * safezoneW + safezoneX;
			y = 0.9664 * safezoneH + safezoneY;
			w = 1.00031 * safezoneW;
			h = 0.0352 * safezoneH;
			colorBackground[] = {0,0,0,0.8};
		};
		class DeathScreen_MedicIcon: RscPicture
		{
			idc = -1;
			text = "MINEFACTORY\textures\arzt.paa";
			x = 0.000874999 * safezoneW + safezoneX;
			y = 0.9697 * safezoneH + safezoneY;
			w = 0.017325 * safezoneW;
			h = 0.0297 * safezoneH;
		};
	};
	
	class controls 
	{
		class DeathScreen_RespawnBTN: RscButtonMenu
		{
			idc = 7302;
			text = "Respawn"; //--- ToDo: ;
			x = 0.900124 * safezoneW + safezoneX;
			y = 0.9741 * safezoneH + safezoneY;
			w = 0.0979687 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0.23,0.23,0.23,0.8};
			onButtonClick = "closeDialog 0; life_respawned = true; [] call life_fnc_spawnMenu;";
		};
		class DeathScreen_MedicRufBTN: RscButtonMenu
		{
			idc = 7303;
			text = "Arzt rufen"; //--- ToDo: ;
			x = 0.287981 * safezoneW + safezoneX;
			y = 0.973731 * safezoneH + safezoneY;
			w = 0.0979862 * safezoneW;
			h = 0.0220084 * safezoneH;
			colorBackground[] = {0.23,0.23,0.23,0.8};
			onButtonClick = "[] call life_fnc_requestMedic;";
		};
		class DeathScreen_RespawnInfo: RscText
		{
			idc = 7301;
			text = ""; //--- ToDo: ;
			x = 0.625005 * safezoneW + safezoneX;
			y = 0.973731 * safezoneH + safezoneY;
			w = 0.267354 * safezoneW;
			h = 0.0220084 * safezoneH;
		};
		class DeathScreen_MedicOnlineAnzahl: RscText
		{
			idc = 7304;
			text = ""; //--- ToDo: ;
			x = 0.0189393 * safezoneW + safezoneX;
			y = 0.96988 * safezoneH + safezoneY;
			w = 0.0598234 * safezoneW;
			h = 0.0275105 * safezoneH;
		};
		class DeathScreen_MedicKommt: RscText
		{
			idc = 7305;
			text = "Arzt ist unterwegs zu dir: Nein"; //--- ToDo: ;
			x = 0.117976 * safezoneW + safezoneX;
			y = 0.973181 * safezoneH + safezoneY;
			w = 0.167122 * safezoneW;
			h = 0.0220084 * safezoneH;
		};
	};
};