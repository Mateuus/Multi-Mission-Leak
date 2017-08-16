class spawnMenu {
	idd = 666671;
	movingEnable = true;
	enableSimulation = true;
	name = "spawnMenu";

	class controlsBackground
	{
		class background: IGUIBack
		{
			idc = 2200;
			x = 0.5 * GUI_GRID_W + GUI_GRID_X;
			y = 0.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 39 * GUI_GRID_W;
			h = 24 * GUI_GRID_H;
			moving = true;
		};
	};

	class controls
	{
		class map: DS_RscMapControl
		{
			idc = 1800;
			x = 13.5 * GUI_GRID_W + GUI_GRID_X;
			y = 8 * GUI_GRID_H + GUI_GRID_Y;
			w = 25.5 * GUI_GRID_W;
			h = 13.5 * GUI_GRID_H;
			maxSatelliteAlpha = 0.75;
			alphaFadeStartScale = 1.15;
			alphaFadeEndScale = 1.29;
			lineWidthThin = 0;
		};
		class text: DS_RscStructuredText
		{
			idc = 1100;
			text = "";
			x = 1 * GUI_GRID_W + GUI_GRID_X;
			y = 22 * GUI_GRID_H + GUI_GRID_Y;
			w = 38 * GUI_GRID_W;
			h = 2 * GUI_GRID_H;
		};
		class listbox: DS_RscListNBox
		{
			idc = 1500;
			text = "";
			x = 1 * GUI_GRID_W + GUI_GRID_X;
			y = 8 * GUI_GRID_H + GUI_GRID_Y;
			w = 12 * GUI_GRID_W;
			h = 11 * GUI_GRID_H;
			drawSideArrows = true;
			sizeEx = 0.041;
			coloumns[] = {0,0,0.9};
			idcLeft = -1;
			idcRight = -1;
			rowHeight = 0.050;
			onLBSelChanged = "_this call DS_fnc_spawnLBChanged;";
		};
		class spawnButton : DS_RscButtonMenu
		{
			idc = 15666;
			text = "Spawn";
			onButtonClick = "[] call DS_fnc_spawnPlayer";
			x = 1 * GUI_GRID_W + GUI_GRID_X;
			y = 20.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 12 * GUI_GRID_W;
			h = 1.5 * GUI_GRID_H;
		};
		class header: DS_RscPicture
		{
			idc = 1200;
			text = "extras\textures\menus\altis.jpg";
			x = 1 * GUI_GRID_W + GUI_GRID_X;
			y = 1 * GUI_GRID_H + GUI_GRID_Y;
			w = 38 * GUI_GRID_W;
			h = 6.5 * GUI_GRID_H;
		};
	};
};