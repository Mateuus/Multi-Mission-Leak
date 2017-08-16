class Life_vehicle_repaint {
	idd = 2300;
	name= "life_vehrepaint_menu";
	movingEnable = false;
	enableSimulation = true;
	
	class controlsBackground 
	{	
		class Life_RscTitleBackground:Life_RscText {
			idc = -1;
			
			x = 0.1375;
			y = 0.16;
			w = 0.7;
			h = 0.04;
			colorBackground[] = {0,0,0,0.8};
		};
	};
	
	class controls {

		
		class Title : Life_RscTitle {
			idc = 2301;
			text = "Lackierer";
			
			x = 0.3875;
			y = 0.16;
			w = 0.175;
			h = 0.04;
			colorText[] = {0.95,0.95,0.95,1};
		};
		
		class VehicleList : Life_RscListBox 
		{
			idc = 2302;
			text = "";
			sizeEx = 0.035;
			onLBSelChanged = "[_this] call life_fnc_Repaintcolor";
			
			x = 0.1375;
			y = 0.2;
			w = 0.2375;
			h = 0.62;
			colorBackground[] = {0,0,0,0.8};
		};
		
		class ColorList : Life_RscListBox
		{
			idc = 2303;
			
			x = 0.575;
			y = 0.2;
			w = 0.2625;
			h = 0.62;
			colorBackground[] = {0,0,0,0.8};
		};

		class CloseButtonKey : Life_RscButtonMenu {
			idc = -1;
			text = "$STR_Global_Close";
			onButtonClick = "closeDialog 0;";
			
			x = 0.375;
			y = 0.78;
			w = 0.2;
			h = 0.04;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,0.8};
		};		
	
		class RepaintCar : life_RscButtonMenu {
			idc = 2304;
			text = "Umlackieren";
			onButtonClick = "[] spawn life_fnc_RepaintVehicle;";
			
			x = 0.375;
			y = 0.46;
			w = 0.2;
			h = 0.04;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,0.8};
		};

	};
};