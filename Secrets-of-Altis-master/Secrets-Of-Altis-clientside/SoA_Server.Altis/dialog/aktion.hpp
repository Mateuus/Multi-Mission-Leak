class aktion {

	idd = 6666;
	movingEnabled = false;
	enableSimulation = true;
	
	class controlsBackground {
		
		class aktion: life_RscText {
			idc = -1;
			text = "";
			x = 0;
			y = 0;
			w = 1;
			h = 1;
			colorBackground[] = {0,0,0,0.5};
		};
		
		class aktionbild: Life_RscPicture {
			idc = 6667;
			text = "images\eurologo.paa";
			x = 0.0125;
			y = 0.02;
			w = 0.2875;
			h = 0.36;
		};
		
		class aktiontitel: Life_RscText {
			idc = 6668;
			text = "EM 2016!";
			x = 0.325;
			y = 0.1;
			w = 0.625;
			h = 0.28;
			colorText[] = {1,0.6,-1,1};
			sizeEx = 0.1;
		};
		
		class aktiontext: Life_RscStructuredText {
			idc = 6669;
			text = "<b>Secrets of Altis ist im Fußballrausch!</b>";
			x = 0.0125;
			y = 0.4;
			w = 0.8375;
			h = 0.06;
			colorText[] = {1,0.6,-1,1};
		};
		
		class aktiontext2: Life_RscStructuredText {
			idc = 6670;
			text = "Besuche das EM-Stadion bei Kavala und gebe folgenden Code ein: EURO2016.";
			x = 0.0125;
			y = 0.48;
			w = 0.8375;
			h = 0.12;
			colorText[] = {1,0.6,-1,1};
		};
		
		class aktiontext3: Life_RscStructuredText {
			idc = 6671;
			text = "Mehr Infos zum Event findest du in unserem <a color='#ff1000' href='https://www.secretsofaltis.de/index.php/forum/em-2016/1235-die-europameisterschaft-2016'>Forum</a> auf Secrets of Altis!";
			x = 0.0124999;
			y = 0.66;
			w = 0.8375;
			h = 0.1;
			colorText[] = {1,0.6,-1,1};
		};
		
		class aktionunterschrift: Life_RscText {
			idc = 6672;
			text = "Euer SoA-Team!";
			x = 0.0125;
			y = 0.76;
			w = 0.3875;
			h = 0.12;
			colorText[] = {1,0.6,-1,1};
			sizeEx = 0.08;
		};
		
			class aktionclose: Life_RscButtonMenu {
			idc = 6673;
			text = "Weiter!";
			onButtonClick = "closeDialog 0;"; 
			x = 0.875;
			y = 0.86;
			w = 0.1;
			h = 0.1;
			colorBackground[] = {-1,-1,-1,-1};
		};
	};
};