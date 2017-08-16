class fuelstation_Dialog {
	idd = 29000;
	name= "fuelstation_dialog";
	movingEnable = false;
	enableSimulation = true;
	onLoad = "";
	onKeyDown = "if ((_this select 1) == 1) then { closeDialog 0; lhm_action_inUse = false; }";
	
	class controlsBackground
	{
		class lhm_RscTitleBackground : lhm_RscText
		{
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
			idc = -1;
			x = 0.1;
			y = 0.3;
			w = 0.8;
			h = (1 / 25);
		};
		
		class MainBackground : lhm_RscText
		{
			colorBackground[] = {0,0,0,0.7};
			idc = -1;
			x = 0.1;
			y = 0.3 + (11 / 250);
			w = 0.8;
			h = 0.5 - (22 / 250);
		};
		
		class Title : lhm_RscTitle
		{
			idc = 29001;
			text = "Fuel Station";
			x = 0.1;
			y = 0.3;
			w = 0.8;
			h = (1 / 25);
		};
		
		class TextVehicleInfo : lhm_RscText
		{
			idc = -1;
			text = "Vehicles";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
			x = 0.11; y = 0.36;
			w = 0.485;
			h = (1 / 25);
		};
		
		class TextFuelstationGas : lhm_RscText
		{
			idc = 29002;
			text = "Gas Pump ($5.15 Litre)";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
			x = 0.605; y = 0.36;
			w = 0.285;
			h = (1 / 25);
		};
		
		class AmountFitIn : lhm_RscText
		{
			idc = 29003;
			text = "";
			
			style=1;
			
			x = 0.605; y = 0.47;
			w = 0.285; h = (1 / 25);
		};
		
		class AmountCash : lhm_RscText
		{
			idc = 29004;
			text = "";
			
			style=1;
			
			x = 0.605; y = 0.52;
			w = 0.285; h = (1 / 25);
		};
		
	};
	
	class controls
	{
		class VehicleList : lhm_RscListBox
		{
			idc = 29011;
			text = "";
			sizeEx = 0.04;
			colorBackground[] = {0.1,0.1,0.1,0.9};
			onLBSelChanged = "[_this] call lhm_fnc_fuelStationSelect;";
			
			//Position & height
			x = 0.11; y = 0.402;
			w = 0.485; h = 0.34;
		};
		
		class sliderAmount : lhm_RscXSliderH 
		{
			idc = 29012;
			text = "";
			onSliderPosChanged = "[_this] call lhm_fnc_fuelStationSliderChange;";
			tooltip = "Amount to be refueled";
			x = 0.605;
			y = 0.37 + (1 / 25);
			
			w = 0.285;
			h = (1 / 25);
		};
		
		class btnRefillVehicle : lhm_RscButtonMenu
		{
			idc = 29021;
			text = "refuel";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "[] spawn lhm_fnc_fuelstationFill;";
			
			x = 0.605;
			y = 0.74 - (1 / 25);
			w = 0.285;
			h = (1 / 25);
		};
		
		class ButtonClose : lhm_RscButtonMenu {
			idc = -1;
			text = "Close";
			onButtonClick = "closeDialog 0; lhm_action_inUse = false;";
			x = 0.1;
			y = 0.80 - (1 / 25);
			w = (6.25 / 40);
			h = (1 / 25);
		};
	};
};