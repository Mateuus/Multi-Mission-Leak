class ES_civinteractionsmenue {
	idd = 3301;
	name= "ES_civinteractionsmenue";
	movingEnable = 0;
	enableSimulation = 1;
	onLoad = "[] spawn ES_fnc_civinteractionsmenue";
	
	class controlsBackground {

		
		class EXphone : ES_RscPicture 
		{
			idc = 3001;
			text = "textures\Bilder\Menu\iPhone.paa";
			x = 0.384999;
			y = -0.00433818;
			w = 0.8125;
			h = 1.03676;
		};
	
	};
			
	class controls {		
	
		class gamemenue : ES_RscButtonMenu 
		{
			idc = 3302;
			text = "       Spiele Menue";
			colorBackground[] = {0,0.23,1,0.48};
			onButtonClick = "closeDialog 0;createDialog ""ES_gamemenu"";";
			
			x = 0.62;
			y = 0.4;
			w = 0.3;
			h = 0.05;
		};
		
		class animationsmenu : ES_RscButtonMenu 
		{
			idc = 3304;
			text = "       Animationen";
			colorBackground[] = {0,0.23,1,0.48};
			onButtonClick = "closeDialog 0;createDialog ""ES_gesten"";";
			
			x = 0.62;
			y = 0.48;
			w = 0.3;
			h = 0.05;
		};
		
		class farmzeug : ES_RscButtonMenu 
		{
			idc = 3305;
			text = "       Farm Menu";
			colorBackground[] = {0,0.23,1,0.48};
			onButtonClick = "closeDialog 0;createDialog ""ES_farming"";";
			
			x = 0.62;
			y = 0.56;
			w = 0.3;
			h = 0.05;
		};
	};
};
