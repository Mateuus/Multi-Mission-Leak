class Life_Pickup_Items {
	idd = 1520;
	name= "life_pickup_items";
	movingEnable = false;
	enableSimulation = true;
	onLoad = "[] spawn life_fnc_pickupItems";
	
	class controlsBackground {
	class Life_RscTitleBackground: Life_RscText
	{
		idc = -1;

		x = 4 * GUI_GRID_W + GUI_GRID_X;
		y = 5 * GUI_GRID_H + GUI_GRID_Y;
		w = 20 * GUI_GRID_W;
		h = 1 * GUI_GRID_H;
		colorBackground[] = {0.4,0,0,0.7};
	};
	class MainBackground: Life_RscText
	{
		idc = -1;

		x = 4 * GUI_GRID_W + GUI_GRID_X;
		y = 6.1 * GUI_GRID_H + GUI_GRID_Y;
		w = 20 * GUI_GRID_W;
		h = 12.8 * GUI_GRID_H;
		colorBackground[] = {0,0,0,0.7};
	};
	};
	
	class controls {
	class Title: Life_RscTitle
	{
		idc = -1;

		text = "Surrounding Items"; //--- ToDo: Localize;
		x = 4 * GUI_GRID_W + GUI_GRID_X;
		y = 5 * GUI_GRID_H + GUI_GRID_Y;
		w = 20 * GUI_GRID_W;
		h = 1 * GUI_GRID_H;
		colorText[] = {0.95,0.95,0.95,1};
	};
	class PickupList: Life_RscListBox
	{
		idc = 1521;

		x = 4.8 * GUI_GRID_W + GUI_GRID_X;
		y = 6.5 * GUI_GRID_H + GUI_GRID_Y;
		w = 18.4 * GUI_GRID_W;
		h = 9.25 * GUI_GRID_H;
	};
	class CloseLoadMenu: Life_RscButtonMenu
	{
		onButtonClick = "closeDialog 0;";

		idc = 1004;
		text = "Close"; //--- ToDo: Localize;
		x = 3.96 * GUI_GRID_W + GUI_GRID_X;
		y = 19 * GUI_GRID_H + GUI_GRID_Y;
		w = 5.25 * GUI_GRID_W;
		h = 1 * GUI_GRID_H;
		colorText[] = {1,1,1,1};
		colorBackground[] = {0,0,0,0.8};
	};
	class PickupJoin: Life_RscButtonMenu
	{
		idc = 1522;
		onButtonClick = "[] call life_fnc_pickupItem2";

		text = "Pick Up"; //--- ToDo: Localize;
		x = 18.5 * GUI_GRID_W + GUI_GRID_X;
		y = 19 * GUI_GRID_H + GUI_GRID_Y;
		w = 5.25 * GUI_GRID_W;
		h = 1 * GUI_GRID_H;
		colorText[] = {1,1,1,1};
		colorBackground[] = {0.5,0,0,0.5};
	};
	};
};