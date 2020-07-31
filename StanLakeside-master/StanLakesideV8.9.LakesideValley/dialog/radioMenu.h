#define BGX 0.35
#define BGY 0.2
#define BGW 0.82

class radioMenu
{
	idd = 37500;
	name = "radioMenu";
	movingEnabled = 1;
	enableSimulation = 1;
	onLoad = "[] spawn life_fnc_radioMenu";
	
	class controlsBackground
	{
		class Life_RscTitleBackground: Life_RscText 
		{
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
			idc = -1;
			x = BGX;
			y = BGY - 0.045;
			w = 0.26;
			h = (1 / 25);
		};
		class _Title : Life_RscTitle 
		{
			idc = -1;
			text = "Radio Settings";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
			x = BGX;
			y = BGY - 0.045;
			w = 0.26;
			h = (1 / 25);
		};	
		
		class MainBackground : life_RscText
		{
			idc = -1;
			colorBackground[] = {0,0,0,0.7};
			x = BGX;
			y = BGY;
			w = 0.26;
			h = 0.112;
		};
	};
	
	class controls
	{	
		class ButtonClose : life_RscButtonMenu 
		{
			idc = -1;
			text = "$STR_Global_Close";
			onButtonClick = "closeDialog 0;";
			x = BGX;
			y = BGY + 0.117;
			w = (6.25 / 40);
			h = 0.038;
		};
				
		class ButtonOne : life_RscButtonMenu
		{
			idc = 37551;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.8};
			text = "Save Settings";
			onButtonClick = "profileNamespace setVariable [""TFAR_savedSettings"",(call TFAR_fnc_activeSwRadio) call TFAR_fnc_getSWSettings]; closeDialog 0";
			sizeEx = 0.025;
			x = BGX + 0.01;
			y = BGY + 0.012;
			w = 0.24;
			h = 0.038;
		};
		
		class ButtonTwo : life_RscButtonMenu
		{
			idc = 37552;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.8};
			text = "Load Settings";
			onButtonClick = "[(call TFAR_fnc_activeSwRadio), profileNamespace getVariable 'TFAR_savedSettings'] call TFAR_fnc_setSwSettings; closeDialog 0;";			
			sizeEx = 0.025;
			x = BGX + 0.01;
			y = BGY + 0.062;
			w = 0.24;
			h = 0.038;
		};
	};
};
