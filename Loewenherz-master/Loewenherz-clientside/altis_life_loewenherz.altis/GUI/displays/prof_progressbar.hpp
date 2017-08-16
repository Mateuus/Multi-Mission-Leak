class ProfProgressBar_Dialog
{
	name = "ProfProgressBar_Dialog";
	idd = 9000;
	movingenable=false;
	fadeIn = 0;
	duration = 5;
	fadeout = 0;
	onLoad="uiNamespace setVariable ['ProfProgressBar_Dialog',_this select 0]";
	objects[]={};	
	
	class controlsBackground
	{	
		class Prof_NameText: lhm_RscText
		{
			idc = 9002;
			style = 2;
			text = "Prof_Name"; //--- ToDo: Localize;
			colorText[] = {0.0,0.7,1,0.9};
			x = 0.0624879 * safezoneW + safezoneX;
			y = 0.359993 * safezoneH + safezoneY;
			w = 0.0928056 * safezoneW;
			h = 0.0140006 * safezoneH;
			sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.7)";	
		
            class Attributes {
                align = "center";
				valign = "middle";
				shadow = true;
				shadowColor = "#000000";
            };			
		};	
		
        class ProfBarInside : lhm_RscProgress
        {
			idc = 9003;
			//type = 8;
            //style = 0;
            colorFrame[] = {1, 1, 1, 1};
            colorBar[] = {1, 1, 0, 0.9};
			x = 0.0558589 * safezoneW + safezoneX;
			y = 0.373994 * safezoneH + safezoneY;
			w = 0.119321 * safezoneW;
			h = 0.0140006 * safezoneH;				
        };		
		
		class Prof_ExpText: lhm_RscText
		{
			idc = 9004;
			style = 2;
			text = "999/1000"; //--- ToDo: Localize;
			colorText[] = {1,0,0,0.9};
			x = 0.0558589 * safezoneW + safezoneX;
			y = 0.373994 * safezoneH + safezoneY;
			w = 0.119321 * safezoneW;
			h = 0.0140006 * safezoneH;
			sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.6)";	
		
            class Attributes {
                align = "center";
				valign = "middle";
				shadow = true;
				shadowColor = "#000000";
            };			
		};		
		
		
	}
}