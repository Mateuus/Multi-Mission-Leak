class life_licenses_menu {
	name= "life_licenses_menu";
	idd = 84532;
	movingEnable = true;
	enableSimulation = true;
	onLoad = "[] spawn tanoarpg_fnc_p_updateLicenses;";
	
	class controlsBackground {
	
		class Background_Picture:Life_RscPicture {
			idc = -1;
			text = "textures\Lizenzen.paa";
			x = -0.3;
			y = -0.3;
			w = 1.6;
			h = 1.6;
		};
	};
	
	class controls {
		
		class Life_Licenses : life_RscListBox 
		{
			idc = 2014;
			sizeEx = 0.1;
			
			x = 0.189;
			y = 0.162;
			w = 1.086;
			h = 0.485;
		};
	};
};