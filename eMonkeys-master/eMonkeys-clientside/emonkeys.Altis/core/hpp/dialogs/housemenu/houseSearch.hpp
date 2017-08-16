class house_houseSearchDlg
{
	idd = 38400;
	movingEnabled = false;
	enableSimulation = true;
	
	class controlsBackground
	{
		class RscStructuredText_1100: EMonkeys_RscStructuredText
		{
			idc = 1100;
			text = "<t align='center'>Durchsuchungsergebnis</t>";
			x = 11 * GUI_GRID_W + GUI_GRID_X;
			y = 1 * GUI_GRID_H + GUI_GRID_Y;
			w = 18 * GUI_GRID_W;
			h = 1.1 * GUI_GRID_H;
			sizeEx = "0.02 / (getResolution select 5)";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
		};
		class IGUIBack_2200: EMonkeys_RscText
		{
			idc = 2200;
			x = 11 * GUI_GRID_W + GUI_GRID_X;
			y = 2.1 * GUI_GRID_H + GUI_GRID_Y;
			w = 18 * GUI_GRID_W;
			h = 21 * GUI_GRID_H;
		};
	};
	
	class controls
	{
		class bClose: EMonkeys_RscButtonMenu
		{
			idc = 2400;
			text = "Schließen";
			x = 11 * GUI_GRID_W + GUI_GRID_X;
			y = 23.2 * GUI_GRID_H + GUI_GRID_Y;
			w = 4 * GUI_GRID_W;
			h = 1.1 * GUI_GRID_H;
			onButtonClick="closeDialog 0;";
		};
		class itemlist: EMonkeys_RscListbox
		{
			idc = 1500;
			x = 11.5 * GUI_GRID_W + GUI_GRID_X;
			y = 2.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 17 * GUI_GRID_W;
			h = 11 * GUI_GRID_H;
			sizeEx = "0.02 / (getResolution select 5)";
		};
		class RscText_1000: EMonkeys_RscText
		{
			idc = 1000;
			text = "bMessage";
			x = 11.5 * GUI_GRID_W + GUI_GRID_X;
			y = 13.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 17 * GUI_GRID_W;
			h = 6.5 * GUI_GRID_H;
			colorBackground[] = {0,0,0,0.5};
		};
		class bImpound: EMonkeys_RscButtonMenu
		{
			idc = 2402;
			text = "Beschlagnahmen";
			x = 20 * GUI_GRID_W + GUI_GRID_X;
			y = 21 * GUI_GRID_H + GUI_GRID_Y;
			w = 8 * GUI_GRID_W;
			h = 1.1 * GUI_GRID_H;
			//onButtonClick="__impound_money = cbChecked [2800]; [__impound_money] spawn EMonkeys_fnc_houseImpound; closeDialog 0;";
			onButtonClick="[false] spawn EMonkeys_fnc_houseImpound; closeDialog 0;";
		};
		/*class cEnableImpoundMoney: RscCheckbox
		{
			idc = 2800;
			text = "Geld beschlagnahmen";
			x = 11.5 * GUI_GRID_W + GUI_GRID_X;
			y = 21 * GUI_GRID_H + GUI_GRID_Y;
			w = 1 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
		};*/
		/*class RscText_1001: RscText
		{
			idc = 1001;
			text = "Geld beschlagnahmen"; 
			x = 12.5 * GUI_GRID_W + GUI_GRID_X;
			y = 21 * GUI_GRID_H + GUI_GRID_Y;
			w = 7 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
		};*/
	};
};
