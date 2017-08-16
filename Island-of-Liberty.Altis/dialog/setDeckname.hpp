////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT START (by Stanley Quinton, v1.063, #Putemi)
////////////////////////////////////////////////////////
class setDeckname_dialog
{
	name = "setDeckname_dialog";
	idd=100000;
	movingenable=false;
	enableSimulation = true;
	
	class controls
	{
		class setDeckname_frame: life_RscFrame
		{
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
			idc = 100001;
			text = "Bitte waehlen Sie Ihren Decknamen."; //--- ToDo: Localize;
			x = 0.3425 * safezoneW + safezoneX;
			y = 0.381875 * safezoneH + safezoneY;
			w = 0.3325 * safezoneW;
			h = 0.13125 * safezoneH;
		};
		class setDeckname_edit: Life_RscEdit
		{
			idc = 100002;
			text = "";
			x = 0.36 * safezoneW + safezoneX;
			y = 0.408125 * safezoneH + safezoneY;
			w = 0.2975 * safezoneW;
			h = 0.02625 * safezoneH;
		};
		class setDeckname_Cancel: Life_RscButtonMenu//RscButtonMenuCancel
		{
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			text = "Abbrechen"; //--- ToDo: Localize;
			x = 0.36 * safezoneW + safezoneX;
			y = 0.460625 * safezoneH + safezoneY;
			w = 0.1225 * safezoneW;
			h = 0.02625 * safezoneH;
			onButtonClick = "closeDialog 0;";
		};
		class setDeckname_accept: Life_RscButtonMenu//Life_RscButtonMenuCancel
		{
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			text = "Uebernehmen"; //--- ToDo: Localize;
			x = 0.535 * safezoneW + safezoneX;
			y = 0.460625 * safezoneH + safezoneY;
			w = 0.1225 * safezoneW;
			h = 0.02625 * safezoneH;
			onButtonClick = "[] call life_fnc_setDeckname;";
		};
	};
};
////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT END
////////////////////////////////////////////////////////
