class Life_impound_menu {
	idd = 2800;
	name= "life_impound_menu";
	movingEnable = false;
	enableSimulation = true;
	onLoad = "ctrlShow [2830,false];";
	
	class controlsBackground {
		class Life_RscTitleBackground : Life_RscText
		{
			colorBackground[] = {0.4, 0, 0, 0.7};
			idc = -1;
			x = 0.1;
			y = 0.2;
			w = 0.8;
			h = (1 / 25);
		};
		
		class MainBackground : Life_RscText
		{
			colorBackground[] = {0,0,0,0.7};
			idc = -1;
			x = 0.1;
			y = 0.2 + (11 / 250);
			w = 0.8;
			h = 0.7 - (22 / 250);
		};
		
		class Title : Life_RscTitle
		{
			idc = -1;
			text = "Garage";
			x = 0.1;
			y = 0.2;
			w = 0.8;
			h = (1 / 25);
		};
		
		class VehicleTitleBox : Life_RscText
		{
			idc = -1;
			text = "Available";
			colorBackground[] = {0.4, 0, 0, 0.7};
			x = 0.11; y = 0.26;
			w = 0.3;
			h = (1 / 25);
		};
		
		class VehicleInfoHeader : Life_RscText
		{
			idc = 2830;
			text = "Vehicle Information";
			colorBackground[] = {0.4, 0, 0, 0.7};
			x = 0.42; y = 0.26;
			w = 0.46;
			h = (1 / 25);
		};
		
	};
	
	class controls {

		class VehicleList : Life_RscListBox
		{
			idc = 2801;
			text = "";
			sizeEx = 0.04;
			colorBackground[] = {0.1,0.1,0.1,0.9};
			onLBSelChanged = "_this call life_fnc_vehicleGarageLBChange";
			
			//Position & height
			x = 0.11; y = 0.302;
			w = 0.303; h = 0.49;
		};
		
		class vehicleInfomationList : Life_RscStructuredText
		{
			idc = 2803;
			text = "";
			sizeEx = 0.035;
			
			x = 0.43; y = 0.31;
			w = 0.5; h = 0.52;
		};
				
		class GetCar : life_RscButtonMenu {
			idc = -1;
			text = "Get Vehicle";
			onButtonClick = "[false] call life_fnc_unimpound";
			x = 0.26 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.9 - (1 / 25);
			w = (6.25 / 40);
			h = (1 / 25);
		};
		
		class SellCar : life_RscButtonMenu {
			idc = -1;
			text = "Sell Vehicle";
			onButtonClick = "[] spawn life_fnc_sellGarage";
			x = 0.1 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.9 - (1 / 25);
			w = (6.25 / 40);
			h = (1 / 25);
		};
		
		class ExchangeVehicle : life_RscButtonMenu 
		{
			idc = 1007;
			text = "List on Exchange";
			colorBackground[] = {0,0.2235294117647059,0.3725490196078431,1};
			onButtonClick = "[] spawn KBW_fnc_vehicleExchange;";
			x = 0.27 + (12.5 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.9 - (1 / 25);
			w = (11 / 40);
			h = (1 / 25);
		};
		
		class CloseBtn : Life_RscButtonMenu
		{
			idc = -1;
			text = "Close";
			onButtonClick = "closeDialog 0;";
			x = -0.06 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.9 - (1 / 25);
			w = (6.25 / 40);
			h = (1 / 25);
		};

	};
};