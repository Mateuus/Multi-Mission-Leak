class mailbox {
	
	idd = 7100;
	movingEnable = false;
	enableSimulation = true;
	onLoad="[0] spawn life_fnc_mailbox;";
	
	class controlsBackground {
	
		class background: Life_RscText
		{
			idc = -1;
			x = 0.0625;
			y = 0.2;
			w = 0.875;
			h = 0.68;
			colorBackground[] = {0,0,0,0.5};
		};
		
		class title: Life_RscText
		{
			idc = -1;
			text = "Briefkasten";
			x = 0.0625;
			y = 0.16;
			w = 0.875;
			h = 0.04;
			colorBackground[] = {0.4,0,0,0.5};
		};
	};
	
	class controls {
	
		class listbox: Life_RscListbox
		{
			idc = 7101;
			x = 0.0875;
			y = 0.22;
			w = 0.825;
			h = 0.58;
			sizeEx = 0.04;
			colorBackground[] = {0.3,0.3,0,0.5};
		};
		
		class takepost: Life_RscButtonMenu
		{
			idc = 7102;
			text = "Post nehmen";
			onButtonClick="[1] spawn life_fnc_mailbox;";
			x = 0.0875;
			y = 0.82;
			w = 0.1625;
			h = 0.04;
		};
		
		class close: Life_RscButtonMenu
		{
			idc = -1;
			text = "Schließen";
			onButtonClick="closedialog 0;";
			x = 0.775;
			y = 0.82;
			w = 0.1375;
			h = 0.04;
		};
	};
};