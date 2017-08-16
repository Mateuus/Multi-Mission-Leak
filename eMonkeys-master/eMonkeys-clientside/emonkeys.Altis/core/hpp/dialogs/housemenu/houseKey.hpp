class house_keyDialog
{
	idd = 38700;
	movingEnabled = false;
	enableSimulation = true;
	
	class controlsBackground
	{
		class RscStructuredText_1100: EMonkeys_RscStructuredText
		{
			idc = 1100;
			text = "<t align='center' size='0.8'>Hausschlüssel geben</t>";
			x = 12 * GUI_GRID_W + GUI_GRID_X;
			y = 3 * GUI_GRID_H + GUI_GRID_Y;
			w = 16 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
			colorBackground[] = {0,0,0,0.8};
			sizeEx = "0.02 / (getResolution select 5)";
		};
		class IGUIBack_2200: EMonkeys_RscText
		{
			idc = 2200;
			colorBackground[] = {0,0,0,0.8};
			x = 12 * GUI_GRID_W + GUI_GRID_X;
			y = 4 * GUI_GRID_H + GUI_GRID_Y;
			w = 16 * GUI_GRID_W;
			h = 17 * GUI_GRID_H;
		};
		class RscStructuredText_1101: EMonkeys_RscStructuredText
		{
			idc = 1101;
			text = "<t align='center' size='0.75'>Du kannst einem Spieler den Hausschlüssel geben, sodass dieser auf einige Haus-Funktionen zugreifen kann.<br /> (Er kann das Haus aber nicht verkaufen!)<br/>Wenn du einem Spieler nicht mehr traust, dann kannst du das Schloss austauschen und musst aber vertrauenswürdigen Spielern wieder neue Schlüssel geben!</t>";
			x = 12.5 * GUI_GRID_W + GUI_GRID_X;
			y = 4.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 15 * GUI_GRID_W;
			h = 6.5 * GUI_GRID_H;
			colorBackground[] = {0,0,0,0};

		};
		class IGUIBack_2201: EMonkeys_RscText
		{
			idc = 2201;
			x = 13 * GUI_GRID_W + GUI_GRID_X;
			y = 11.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 14 * GUI_GRID_W;
			h = 3.5 * GUI_GRID_H;
		};
		class IGUIBack_2202: EMonkeys_RscText
		{
			idc = 2202;
			x = 13 * GUI_GRID_W + GUI_GRID_X;
			y = 15.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 14 * GUI_GRID_W;
			h = 5 * GUI_GRID_H;
		};
	};
	
	class controls
	{
		class bClose: EMonkeys_RscButtonMenu
		{
			idc = 2400;
			text = "Schliessen";
			x = 12 * GUI_GRID_W + GUI_GRID_X;
			y = 21 * GUI_GRID_H + GUI_GRID_Y;
			w = 16 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
			onButtonClick="closeDialog 0;";
		};
		class cmbPlayers: EMonkeys_RscCombo
		{
			idc = 2100;
			x = 13.5 * GUI_GRID_W + GUI_GRID_X;
			y = 12 * GUI_GRID_H + GUI_GRID_Y;
			w = 13 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
		};
		class bGiveKey: EMonkeys_RscButtonMenu
		{
			idc = 2401;
			text = "Schlüssel geben";
			x = 20 * GUI_GRID_W + GUI_GRID_X;
			y = 13.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 6.5 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
			onButtonClick="[] spawn EMonkeys_fnc_houseGiveKey;";
		};
		class bResetKeys: EMonkeys_RscButtonMenu
		{
			idc = 2402;
			text = "Schloss austauschen";
			x = 13.5 * GUI_GRID_W + GUI_GRID_X;
			y = 19 * GUI_GRID_H + GUI_GRID_Y;
			w = 13 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
			onButtonClick="[] spawn EMonkeys_fnc_houseResetKeys;";
		};
	};
};
