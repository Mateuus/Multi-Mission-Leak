class DeathScreen
{
	idd = 7300;
	name = "lhm_Death_Screen";
	movingEnabled = false;
	enableSimulation = true;

	class controlsBackground
	{
	};

	class Controls
	{
		class MedicsOnline : lhm_RscText
		{
			idc = 7304;
			colorBackground[] = {0,0,0,0};
			text = "$STR_DEATH_MedOn";
			x = 0.000874975 * safezoneW + safezoneX;
			y = 0.0556 * safezoneH + safezoneY;
			w = 0.8;
			h = (1 / 25);
		};

		class MedicsNearby : lhm_RscText
		{
			idc = 7305;
			colorBackground[] = {0,0,0,0};
			text = "$STR_DEATH_MedNear";
			x = 0.00190622 * safezoneW + safezoneX;
			y = 0.0776 * safezoneH + safezoneY;
			w = 0.8;
			h = (1 / 25);
		};

		class RespawnBtn : lhm_RscButtonMenu
		{
			idc = 7302;
			x = 0.9 * safezoneW + safezoneX;
			y = 0.00500001 * safezoneH + safezoneY;
			w = (9 / 40);
			h = (1 / 25);
			text = "$STR_DEATH_RESPAWN";
			onButtonClick = "if(playerside == civilian && lhm_is_arrested != 1) then {lhm_is_arrested = 0; [5] call SOCK_fnc_updatePartial;}; closeDialog 0; lhm_respawned = true; [] call lhm_fnc_spawnMenu; ";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.7};
			class Attributes
			{
				align = "center";
			};
		};

		class MedicBtn : lhm_RscButtonMenu
		{
			idc = 7303;
			x = 0.9 * safezoneW + safezoneX;
			y = 0.0292 * safezoneH + safezoneY;
			w = (9 / 40);
			h = (1 / 25);
			onButtonClick = "[] call lhm_fnc_requestMedic;";
			text = "$STR_DEATH_REQUESTMED";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.7};
			class Attributes
			{
				align = "center";
			};
		};

		class respawnTime : lhm_RscText
		{
			idc = 7301;
			colorBackground[] = {0,0,0,0};
			text = "";
			x = 0.422656 * safezoneW + safezoneX;
			y = 0.918 * safezoneH + safezoneY;
			w = 0.8;
			h = (1 / 25);
		};
	};
};