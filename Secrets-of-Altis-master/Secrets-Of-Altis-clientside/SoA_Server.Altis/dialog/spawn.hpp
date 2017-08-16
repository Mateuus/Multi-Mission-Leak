class spawn {

	idd = 38500;
	movingEnabled = false;
	enableSimulation = true;
	
	class controlsBackground {
		
		class background : Life_RscPicture {
			idc = -1;
			text = "images\background.jpg";
			x = -0.015625 * safezoneW + safezoneX;
			y = -0.05 * safezoneH + safezoneY;
			w = 1.03125 * safezoneW;
			h = 1.1 * safezoneH;
		};
	
		class backgroundandere : Life_RscText {
			idc = -1;
			text = "";
			colorBackground[] = {0,0,0,0.7};
			shadow=1;
			x = 1.15;
			y = 0.58;
			w = 0.4375;
			h = 0.64;
		};
		
		class Titleandere : Life_RscText {
			idc = -1;
			text = "Weitere Startpunkte";
			colorText[] = {1,1,0,1};
			colorBackground[] = {0,0,0,0.7};
			shadow=1;
			x = 1.15025;
			y = 0.508418;
			w = 0.363636;
			h = 0.0727273;
		};
	};
	class controls
	{
		class SpawnPointList : Life_RscListNBox
		{
			idc = 38510;
			text = "";
			sizeEx = 0.041;
			coloumns[] = {0,0,0.9};
			drawSideArrows = false;
			idcLeft = -1;
			idcRight = -1;
			rowHeight = 0.050;
			x = 1.15;
			y = 0.58;
			w = 0.4375;
			h = 0.64;
			onLBSelChanged = "_this call life_fnc_spawnPointSelected;";
		};
		
		class buttonspawn : Life_RscButtonMenu
		{
			idc = 38520;
			colorBackground[] = {0.4,0,0,0.5};
			shadow = 1;
			text = "Los!";
			onButtonClick = "if(isNil 'life_spawn_point') then {hint 'Verwende die Städtemarkierung auf der Karte, solang du noch keine besonderen Startpunkte besitzt!'} else {[] spawn life_fnc_spawnConfirm};";
			x = 1.51389;
			y = 0.507744;
			w = 0.074;
			h = 0.0727273;
		};
		
		class spawnButton_kavala : Life_RscButtonMenu
		{
			idc = 8000;
			text = "";
			onButtonClick = "life_spawn_point = ['civ_spawn_1']; [] spawn life_fnc_spawnConfirm";
			tooltip = "Klicke hier um dein Abenteuer in Kavala, der neuen Hauptstadt von Altis, zu starten!";
			x = -0.5;
			y = 0.68;
			w = 0.2125;
			h = 0.16;

			colorBackground[] = {-1,-1,-1,0};
			colorBackgroundFocused[] = {-1,-1,-1,0};
			colorBackground2[] = {-1,-1,-1,0};
			color[] = {1,1,1,0};
			colorFocused[] = {0,0,0,0};
			color2[] = {0,0,0,0};
			colorText[] = {1,1,1,1};
			colorDisabled[] = {0,0,0,0};
		};
		
		class spawnButton_athira : Life_RscButtonMenu
		{
			idc = 8001;
			text = "";
			onButtonClick = "life_spawn_point = ['civ_spawn_3']; [] spawn life_fnc_spawnConfirm";
			tooltip = "Klicke hier um dein Abenteuer in Athira zu starten und stürze dich in ein aufregendes Erlebnis!";
			x = 0.0875;
			y = 0.32;
			w = 0.2125;
			h = 0.16;
			
			colorBackground[] = {-1,-1,-1,0};
			colorBackgroundFocused[] = {-1,-1,-1,0};
			colorBackground2[] = {-1,-1,-1,0};
			color[] = {1,1,1,0};
			colorFocused[] = {0,0,0,0};
			color2[] = {0,0,0,0};
			colorText[] = {1,1,1,1};
			colorDisabled[] = {0,0,0,0};
		};
		
		class spawnButton_pyrgos : Life_RscButtonMenu
		{
			idc = 8002;
			text = "";
			onButtonClick = "life_spawn_point = ['civ_spawn_2']; [] spawn life_fnc_spawnConfirm";
			tooltip = "Klicke hier um dein Abenteuer in der alten Hauptstadt Pyrgos zu starten!";
			x = 0.2625;
			y = 0.7;
			w = 0.2125;
			h = 0.16;
			
			colorBackground[] = {-1,-1,-1,0};
			colorBackgroundFocused[] = {-1,-1,-1,0};
			colorBackground2[] = {-1,-1,-1,0};
			color[] = {1,1,1,0};
			colorFocused[] = {0,0,0,0};
			color2[] = {0,0,0,0};
			colorText[] = {1,1,1,1};
			colorDisabled[] = {0,0,0,0};
		};
		
		class spawnButton_sofia : Life_RscButtonMenu
		{
			idc = 8003;
			text = "";
			onButtonClick = "life_spawn_point = ['civ_spawn_4']; [] spawn life_fnc_spawnConfirm";
			tooltip = "Klicke hier um dein Abenteuer in Sofia, der kleinen Wirtschaftsmetropole, zu starten!";
			x = 0.725;
			y = 0.1;
			w = 0.2125;
			h = 0.16;
			
			colorBackground[] = {-1,-1,-1,0};
			colorBackgroundFocused[] = {-1,-1,-1,0};
			colorBackground2[] = {-1,-1,-1,0};
			color[] = {1,1,1,0};
			colorFocused[] = {0,0,0,0};
			color2[] = {0,0,0,0};
			colorText[] = {1,1,1,1};
			colorDisabled[] = {0,0,0,0};
		};
	};
};