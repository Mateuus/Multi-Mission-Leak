class ausweiserstellen
{
	
	idd = 7200;
	movingEnable = false;
	enableSimulation = true;
	onLoad = "";
	
	class controlsBackground {};

	class controls {
	
		class ausweisbackground: Life_RscPicture
		{
			idc = 7201;
			text = "";
			x = -0.2125;
			y = -4.84288e-008;
			w = 1.4375;
			h = 1;
		};
		
		class feldnachname: Life_RscEdit
		{
			idc = 7202;
			text = "Dein Nachname"; 
			x = 0.45;
			y = 0.18;
			w = 0.275;
			h = 0.04;
			colorBackground[] = {0,0,0,0.5};
		};
		
		class feldvorname: Life_RscEdit
		{
			idc = 7203;
			text = "Dein Vorname"; 
			x = 0.45;
			y = 0.34;
			w = 0.275;
			h = 0.04;
			colorBackground[] = {0,0,0,0.5};
		};
		
		class feldgeburtort: Life_RscCombo
		{
			idc = 7204;
			text = ""; 
			x = 0.45;
			y = 0.58;
			w = 0.3625;
			h = 0.04;
			colorBackground[] = {0,0,0,0.5};
		};
		
		class feldtag: Life_RscCombo
		{
			idc = 7205;
			text = ""; 
			x = 0.45;
			y = 0.48;
			w = 0.075;
			h = 0.04;
			colorBackground[] = {0,0,0,0.5};
		};
		
		class feldmonat: Life_RscCombo
		{
			idc = 7206;
			text = ""; 
			x = 0.5375;
			y = 0.48;
			w = 0.075;
			h = 0.04;
			colorBackground[] = {0,0,0,0.5};
		};
		
		class feldjahr: Life_RscCombo
		{
			idc = 7207;
			text = ""; 
			x = 0.625;
			y = 0.48;
			w = 0.1;
			h = 0.04;
			colorBackground[] = {0,0,0,0.5};
		};
		
		class feldnational: Life_RscCombo
		{
			idc = 7208;
			text = ""; 
			x = 0.75;
			y = 0.48;
			w = 0.2;
			h = 0.04;
			colorBackground[] = {0,0,0,0.5};
		};
		
		class buttonclose: Life_RscButtonMenu
		{
			idc = 7209;
			text = "Beantragen";
			OnbuttonClick = "[0,0,0,1] spawn life_fnc_ausweis";
			x = 0.825;
			y = 1;
			w = 0.1625;
			h = 0.04;
		};
	};
};