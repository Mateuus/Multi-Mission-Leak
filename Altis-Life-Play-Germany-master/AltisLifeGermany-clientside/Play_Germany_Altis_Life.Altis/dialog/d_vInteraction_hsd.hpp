//Grid macros
#define GUI_GRID_X	(0)
#define GUI_GRID_Y	(0)
#define GUI_GRID_W	(0.025)
#define GUI_GRID_H	(0.04)
#define GUI_GRID_WAbs	(1)
#define GUI_GRID_HAbs	(1)

class d_vInteraction_hsd
{
	idd = 37400;
	movingEnabled = false;
	enableSimulation = true;
	
	class controlsBackground
	{
		
		class RscStructuredText_1100: Life_RscStructuredText
		{
			idc = 1100;
			text = "<t size='1.2' align='center'>Aktion ...</t>";
			x = 11 * GUI_GRID_W + GUI_GRID_X;
			y = 3 * GUI_GRID_H + GUI_GRID_Y;
			w = 21 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
		};
		class IGUIBack_2200: IGUIBack
		{
			idc = 2200;
			x = 11 * GUI_GRID_W + GUI_GRID_X;
			y = 4 * GUI_GRID_H + GUI_GRID_Y;
			w = 21 * GUI_GRID_W;
			h = 13 * GUI_GRID_H;
		};
		
		//////////Pictures
		class picRepair: RscPicture
		{
			idc = 1200;
			text = "icons\interaction\repair.paa";
			x = 12 * GUI_GRID_W + GUI_GRID_X;
			y = 5 * GUI_GRID_H + GUI_GRID_Y;
			w = 4 * GUI_GRID_W;
			h = 3 * GUI_GRID_H;
			tooltip = "$STR_vInAct_Repair";
		};
		class picFlip: RscPicture
		{
			idc = 1201;
			text = "icons\interaction\flip.paa";
			x = 17 * GUI_GRID_W + GUI_GRID_X;
			y = 5 * GUI_GRID_H + GUI_GRID_Y;
			w = 4 * GUI_GRID_W;
			h = 3 * GUI_GRID_H;
			tooltip = "$STR_vInAct_Unflip";
		};
		class PicTowning: RscPicture
		{
			idc = 1202;
			text = "icons\interaction\towing.paa";
			x = 12 * GUI_GRID_W + GUI_GRID_X;
			y = 9 * GUI_GRID_H + GUI_GRID_Y;
			w = 4 * GUI_GRID_W;
			h = 3 * GUI_GRID_H;
		};
		class picPullOut: RscPicture
		{
			idc = 1203;
			text = "icons\interaction\pullout.paa";
			x = 17 * GUI_GRID_W + GUI_GRID_X;
			y = 9 * GUI_GRID_H + GUI_GRID_Y;
			w = 4 * GUI_GRID_W;
			h = 3 * GUI_GRID_H;
		};
		class PicTowningON: RscPicture
		{
			idc = 1204;
			text = "icons\interaction\towing.paa";
			x = 12 * GUI_GRID_W + GUI_GRID_X;
			y = 9 * GUI_GRID_H + GUI_GRID_Y;
			w = 4 * GUI_GRID_W;
			h = 3 * GUI_GRID_H;
		};
		class PicTowningOFF: RscPicture
		{
			idc = 1205;
			text = "icons\interaction\notowing.paa";
			x = 12 * GUI_GRID_W + GUI_GRID_X;
			y = 9 * GUI_GRID_H + GUI_GRID_Y;
			w = 4 * GUI_GRID_W;
			h = 3 * GUI_GRID_H;
		};
		class PicLockpick: RscPicture
		{
			idc = 1206;
			text = "icons\interaction\lockpick.paa";
			x = 12 * GUI_GRID_W + GUI_GRID_X;
			y = 13 * GUI_GRID_H + GUI_GRID_Y;
			w = 4 * GUI_GRID_W;
			h = 3 * GUI_GRID_H;
			tooltip = "Fahrzeug knacken";
		};
		class PicBoatPush: RscPicture
		{
			idc = 1207;
			text = "icons\interaction\pushback.paa";
			x = 17 * GUI_GRID_W + GUI_GRID_X;
			y = 13 * GUI_GRID_H + GUI_GRID_Y;
			w = 4 * GUI_GRID_W;
			h = 3 * GUI_GRID_H;
			tooltip = "Fahrzeug knacken";
		};
	};
	
	class controls
	{
		class bClose: RscButtonMenu
		{
			idc = 2400;
			text = "Schliessen";
			x = 11 * GUI_GRID_W + GUI_GRID_X;
			y = 17 * GUI_GRID_H + GUI_GRID_Y;
			w = 21 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
			onButtonClick="closeDialog 0;";
		};
		class bRepair: Life_PictureButtonMenu
		{
			idc = 2401;
			text = "";
			x = 12 * GUI_GRID_W + GUI_GRID_X;
			y = 5 * GUI_GRID_H + GUI_GRID_Y;
			w = 4 * GUI_GRID_W;
			h = 3 * GUI_GRID_H;
			tooltip = "$STR_vInAct_Repair";
			onButtonClick="closeDialog 0; [cursorTarget] spawn life_fnc_repairTruck;";
			
		};
		class bFlip: Life_PictureButtonMenu
		{
			idc = 2402;
			text = "";
			x = 17 * GUI_GRID_W + GUI_GRID_X;
			y = 5 * GUI_GRID_H + GUI_GRID_Y;
			w = 4 * GUI_GRID_W;
			h = 3 * GUI_GRID_H;
			tooltip = "$STR_vInAct_Unflip";
			onButtonClick="cursorTarget setPos [getPos cursorTarget select 0, getPos cursorTarget select 1, (getPos cursorTarget select 2)+0.5]; closeDialog 0;";
		};	
		class bTowning: Life_PictureButtonMenu
		{
			idc = 2404;
			text = "";
			x = 12 * GUI_GRID_W + GUI_GRID_X;
			y = 9 * GUI_GRID_H + GUI_GRID_Y;
			w = 4 * GUI_GRID_W;
			h = 3 * GUI_GRID_H;			
		};
		class bPullOut: Life_PictureButtonMenu
		{
			idc = 2403;
			text = "";
			x = 17 * GUI_GRID_W + GUI_GRID_X;
			y = 9 * GUI_GRID_H + GUI_GRID_Y;
			w = 4 * GUI_GRID_W;
			h = 3 * GUI_GRID_H;		
			tooltip = "Aus dem Fahrzeug ziehen";
			onButtonClick= "closeDialog 0; [cursorTarget] spawn life_fnc_pulloutAction;";		
		};
		class bLockpick: Life_PictureButtonMenu
		{
			idc = 2406;
			text = "";
			x = 12 * GUI_GRID_W + GUI_GRID_X;
			y = 13 * GUI_GRID_H + GUI_GRID_Y;
			w = 4 * GUI_GRID_W;
			h = 3 * GUI_GRID_H;
			tooltip = "Fahrzeug knacken";
			onButtonClick="[]spawn life_fnc_lockpick; closeDialog 0;";
		};
		class bBoatPush: Life_PictureButtonMenu
		{
			idc = 2407;
			text = "";
			x = 17 * GUI_GRID_W + GUI_GRID_X;
			y = 13 * GUI_GRID_H + GUI_GRID_Y;
			w = 4 * GUI_GRID_W;
			h = 3 * GUI_GRID_H;
			tooltip = "Boot schieben";
			onButtonClick="[cursorTarget] spawn PG_fnc_pushBoat; closeDialog 0;";
		};
	};
};

