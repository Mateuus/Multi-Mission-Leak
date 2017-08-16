class cop_build_dialog
{
	idd = 2222;
	name="cop_build_dialog";
	movingEnabled = 0;
	enableSimulation = 1;
	
	
	class controlsBackground
	{
	
		
		class Title : lhm_RscTitle
		{
			idc = 2301;
			text = "Baumoeglichkeiten";
			x = 0.110677 * safezoneW + safezoneX;
			y = 0.32063 * safezoneH + safezoneY;
			w = 0.211406 * safezoneW;
			h = 0.033 * safezoneH;
		};
		
		
		class CloseBTN : lhm_RscButtonMenu
		{
			idc = -1;
			text = "$STR_Global_Close";
			onButtonClick = "closeDialog 0;";
			x = 0.111719 * safezoneW + safezoneX;
			y = 0.691407 * safezoneH + safezoneY;
			w = 0.170156 * safezoneW;
			h = 0.022 * safezoneH;
		};
		
		class BuildBTN : lhm_RscButtonMenu 
		{
			idc = 2309;
			text = "Bauen";
			onButtonClick = "[] spawn lhm_fnc_cop_build_dialog_buy;";
			x = 0.11125 * safezoneW + safezoneX;
			y = 0.661407 * safezoneH + safezoneY;
			w = 0.170156 * safezoneW;
			h = 0.022 * safezoneH;
		};
	};
	
	class controls
	{
		class ObjectList : lhm_RscListBox
		{
			idc = 2302;
			text = "";
			sizeEx = 0.04;
			colorBackground[] = {0.1,0.1,0.1,0.9};
			onLBSelChanged = "_this call lhm_fnc_cop_build_dialog_demo;";
			
			//Position & height
			x = 0.108652 * safezoneW + safezoneX;
			y = 0.362389 * safezoneH + safezoneY;
			w = 0.175313 * safezoneW;
			h = 0.253 * safezoneH;
		};
		
		class ObjectSide : lhm_RscCombo
		{
			onLBSelChanged ="[] call lhm_fnc_cop_build_dialog_update;";
			idc = 2304;
			x = 0.111144 * safezoneW + safezoneX;
			y = 0.622741 * safezoneH + safezoneY;
			w = 0.172709 * safezoneW;
			h = 0.0274445 * safezoneH;
		};
		
		
		class SpeedMoving: lhm_RscXSliderH
		{	
			idc = 1910;
			text = "";
			onSliderPosChanged = "LHM_shop_Rotate_speed = (_this select 1) ;";
			tooltip = "Drehgeschwindigkeit einstellen";
			x = 0.415437 * safezoneW + safezoneX;
			y = 0.76488 * safezoneH + safezoneY;
			w = 0.170156 * safezoneW;
			h = 0.033 * safezoneH;
		};
	};
};