class XY_dialog_deathScreen {

	idd = 7300;
	movingEnabled = false;
	enableSimulation = true;
	
	class Controls {
		class MedicsOnline : XY_RscText {
			idc = 7304;
			colorBackground[] = {0,0,0,0};
			text = "Sanitäter online: 0";
			x = 0.000874975 * safezoneW + safezoneX;
			y = 0.0556 * safezoneH + safezoneY;
			w = 0.8;
			h = (1 / 25);
		};
		
		class MedicsNearby : XY_RscText {
			idc = 7305;
			colorBackground[] = {0,0,0,0};
			text = "Sanitäter in der Nähe: Nein";
			x = 0.00190622 * safezoneW + safezoneX;
			y = 0.0776 * safezoneH + safezoneY;
			w = 0.8;
			h = (1 / 25);
		};
		
		class RespawnBtn : XY_RscButtonMenu {
			idc = 7302;

			x = 0.89 * safezoneW + safezoneX;
			y = 0.005 * safezoneH + safezoneY;
			w = 0.1 * safezoneW;
			h = 0.05 * safezoneH;
			text = "RESPAWN";

			onButtonClick = "closeDialog 0; XY_respawned = true; [] call XY_fnc_spawnMenu;";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.7};
			class Attributes {
				align = "center";
			};
		};
		
		class MedicBtn : XY_RscButtonMenu {
			idc = 7303;

			x = 0.89 * safezoneW + safezoneX;
			y = 0.06 * safezoneH + safezoneY;
			w = 0.1 * safezoneW;
			h = 0.05 * safezoneH;
			onButtonClick = "[] call XY_fnc_requestMedic;";
			text = "SANITÄTER";

			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.7};

			class Attributes {
				align = "center";
			};
		};
		
		class respawnTime : XY_RscText {
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