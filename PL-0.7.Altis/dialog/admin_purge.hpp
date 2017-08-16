class life_purge
{
	idd = 2801;
	name="life_purge";
	movingEnable = 0;
	enableSimulation = 1;

	class controlsBackground {
		class Life_RscTitleBackground : Life_RscText {
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
			idc = -1;
			x = 0.1;
			y = 0.2;
			w = 0.5;
			h = (1 / 25);
		};

		class MainBackground : Life_RscText {
			colorBackground[] = {0, 0, 0, 0.7};
			idc = -1;
			x = 0.1;
			y = 0.2 + (11 / 250);
			w = 0.5;
			h = 0.3 - (22 / 250);
		};
	};

	class controls {
		class Title : Life_RscTitle {
			colorBackground[] = {0, 0, 0, 0};
			idc = -1;
			text = "Fenetre de comfirmation";
			x = 0.1;
			y = 0.2;
			w = 0.5;
			h = (1 / 25);
		};

		class Confirm : Life_RscText {
			colorBackground[] = {0, 0, 0, 0};
			idc = -1;
			text = "Tu es sur de vouloir lancer une Purge ?";
			x = 0.12;
			y = 0.24;
			w = 0.45;
			h = 0.12;
		};

		class AdminPurgeNow : Life_RscButtonMenu {
			idc = -1;
			text = "Maintenant";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "[player] remoteExec [""life_fnc_adminPurge2"",-2]; closeDialog 0;";
			x = 0.15;
			y = 0.34;
			w = (6.25 / 40);
			h = (1 / 25);
		};

		class AdminPurge : Life_RscButtonMenu {
			idc = -1;
			text = "Dans 1h";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "[player] remoteExec [""life_fnc_adminPurge"",-2]; closeDialog 0;";
			x = 0.35;
			y = 0.34;
			w = (6.25 / 40);
			h = (1 / 25);
		};
	};
};
