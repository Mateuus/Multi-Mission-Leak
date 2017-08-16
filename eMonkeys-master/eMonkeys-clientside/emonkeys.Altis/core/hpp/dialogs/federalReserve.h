class Federal_Safe
{
	idd = 3500;
	name = "Federal_Safe";
	movingEnable = false;
	enableSimulation = true;
	
	class controlsBackground
	{
		class RscTitleBackground : EMonkeys_RscText
		{
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
			idc = -1;
			x = 0.1;
			y = 0.2;
			w = 0.33;
			h = (1 / 25);
		};
		
		class RscBackground : EMonkeys_RscText
		{
			colorBackground[] = {0, 0, 0, 0.7};
			idc = -1;
			x = 0.1;
			y = 0.2 + (11 / 250);
			w = 0.33;
			h = 0.7 - (22 / 250);
		};
		
		class RscTitleText : EMonkeys_RscTitle
		{
			colorBackground[] = {0, 0, 0, 0};
			idc = 3501;
			text = "";
			x = 0.1;
			y = 0.2;
			w = 0.33;
			h = (1 / 25);
		};
		
		class VehicleWeight : RscTitleText
		{
			idc = 3504;
			style = 1;
			text = "";
		};
		
		class RscTrunkText : EMonkeys_RscText
		{
			idc = -1;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			text = "Kofferraum";
			sizeEx = 0.04;
			
			x = 0.11; y = 0.25;
			w = 0.3; h = 0.04;
		};
	};
	
	class Controls
	{
		class TrunkGear : EMonkeys_RscListBox
		{
			idc = 3502;
			text = "";
			sizeEx = 0.030;
			
			x = 0.11; y = 0.29;
			w = 0.3; h = 0.42;
		};
		
		class TrunkEdit : EMonkeys_RscEdit
		{
			idc = 3505;
			text = "1";
			sizeEx = 0.030;
			x = 0.11; y = 0.72;
			w = 0.3; h = 0.03;
		};
		
		class TakeItem : EMonkeys_RscButtonMenu
		{
			idc = -1;
			text = "Nehmen";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "[] call EMonkeys_fnc_safeTake;";
			x = 0.19; y = 0.78;
			w = (6.25 / 40);
			h = (1 / 25);
		};
		
		class ButtonClose : EMonkeys_RscButtonMenu {
			idc = -1;
			//shortcuts[] = {0x00050000 + 2};
			text = "Schliessen";
			onButtonClick = "closeDialog 0;";
			x = 0.1;
			y = 0.9 - (1 / 25);
			w = (6.25 / 40);
			h = (1 / 25);
		};
	};
};