class deathMenu {

	idd = 666670;
	movingEnable = true;
	enableSimulation = true;
	name = "deathMenu";
	
	class controlsBackground {
	
		class RscPicture_1200: DS_RscPicture
		{
			idc = 1200;
			text = "extras\textures\menus\death.jpg";
			x = 4 * GUI_GRID_W + GUI_GRID_X;
			y = 4 * GUI_GRID_H + GUI_GRID_Y;
			w = 31.5 * GUI_GRID_W;
			h = 8.5 * GUI_GRID_H;
			moving = 1;
		};
	};
	
	class controls {
		
		class respawnTime : DS_RscText
		{
			idc = 2403;
			x = 6 * GUI_GRID_W + GUI_GRID_X;
			y = 1 * GUI_GRID_H + GUI_GRID_Y;
			w = 31.5 * GUI_GRID_W;
			h = 8.5 * GUI_GRID_H;
			text = "";
		};
		class RscButtonMenu_2400: DS_RscButtonMenu
		{
			idc = 2400;
			x = 5 * GUI_GRID_W + GUI_GRID_X;
			y = 10.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 7 * GUI_GRID_W;
			h = 1.5 * GUI_GRID_H;
			text = "  Respawn";
			onButtonClick = "[] call DS_fnc_respawnMe";
		};
		class RscButtonMenu_2401: DS_RscButtonMenu
		{
			idc = 2401;
			x = 27 * GUI_GRID_W + GUI_GRID_X;
			y = 10.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 7 * GUI_GRID_W;
			h = 1.5 * GUI_GRID_H;
			text = "Request Medic";
			onButtonClick = "[] spawn DS_fnc_requestMedic";
		};
		class RscButtonMenu_2402: DS_RscButtonMenu
		{
			idc = 2402;
			x = 16 * GUI_GRID_W + GUI_GRID_X;
			y = 10.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 7 * GUI_GRID_W;
			h = 1.5 * GUI_GRID_H;
			text = " Report RDM";
			onButtonClick = "[] spawn DS_fnc_reportRDM";
		};
	};
};