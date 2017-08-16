class altistravel {

	idd = 7500;
	movingEnable = 0;
	EnableSimulation = 1;
	
	class controlsBackground {

		class altistravelwebsite: Life_RscPicture
		{
			idc = -1;
			text = "images\AltisTravelWebsite.jpg";
			x = -0.000158733 * safezoneW + safezoneX;
			y = -0.00600008 * safezoneH + safezoneY;
			w = 1.00031 * safezoneW;
			h = 1.012 * safezoneH;
		};
	};
	
	class controls {

		class spawnathira: Life_RscButtonMenu
		{
			idc = 7501;
			onButtonClick = "['athira'] spawn life_fnc_spawnSide";
			x = 0.273125 * safezoneW + safezoneX;
			y = 0.181 * safezoneH + safezoneY;
			w = 0.185625 * safezoneW;
			h = 0.198 * safezoneH;
			colorBackground[] = {-1,-1,-1,0};
			colorBackgroundFocused[] = {-1,-1,-1,0};
			colorBackground2[] = {-1,-1,-1,0};
			color[] = {1,1,1,0};
			colorFocused[] = {0,0,0,0};
			color2[] = {0,0,0,0};
			colorText[] = {1,1,1,1};
			colorDisabled[] = {0,0,0,0};
		};

		class spawnSofia: spawnathira
		{
			idc = 7502;
			onButtonClick = "['sofia'] spawn life_fnc_spawnSide";
			x = 0.273125 * safezoneW + safezoneX;
			y = 0.412 * safezoneH + safezoneY;
			w = 0.185625 * safezoneW;
			h = 0.198 * safezoneH;
		};

		class spawnPyrgos: spawnathira
		{
			idc = 7503;
			onButtonClick = "['pyrgos'] spawn life_fnc_spawnSide";
			x = 0.273125 * safezoneW + safezoneX;
			y = 0.665 * safezoneH + safezoneY;
			w = 0.185625 * safezoneW;
			h = 0.198 * safezoneH;
		};

		class spawnKavala: spawnathira
		{
			idc = 7504;
			onButtonClick = "['kavala'] spawn life_fnc_spawnSide";
			x = 0.525781 * safezoneW + safezoneX;
			y = 0.181 * safezoneH + safezoneY;
			w = 0.185625 * safezoneW;
			h = 0.198 * safezoneH;
		};

		class SpawnFlughafen: spawnathira
		{
			idc = 7505;
			onButtonClick = "['flughafen'] spawn life_fnc_spawnSide";
			x = 0.525781 * safezoneW + safezoneX;
			y = 0.412 * safezoneH + safezoneY;
			w = 0.185625 * safezoneW;
			h = 0.198 * safezoneH;
		};

		class buttonImmoScout: spawnathira
		{
			idc = 7506;
			onButtonClick = "closedialog 0; '' spawn life_fnc_immoScout";
			x = 0.0720312 * safezoneW + safezoneX;
			y = 0.027 * safezoneH + safezoneY;
			w = 0.061875 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class buttonwebsiteSOA: spawnathira
		{
			idc = -1;
			onButtonClick = "[parseText ""<br/><t>Zur Website: </t><a color='#ff1000' href='http://secretsofaltis.de'>http://secretsofaltis.de</a>"",""Website"",""Schließen"",false] spawn bis_fnc_GUImessage;";
			x = 0.00499997 * safezoneW + safezoneX;
			y = 0.027 * safezoneH + safezoneY;
			w = 0.061875 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class buttonexit: spawnathira
		{
			idc = -1;
			OnButtonClick = "closedialog 0";
			x = 0.979531 * safezoneW + safezoneX;
			y = -0.00599999 * safezoneH + safezoneY;
			w = 0.020625 * safezoneW;
			h = 0.044 * safezoneH;
		};
	};
};

class immoscout {
	
	idd = 7600;
	movingEnable = 0;
	EnableSimulation = 1;
	
	class controlsBackground {
	
		class immoScoutWebsite: Life_RscPicture
		{
			idc = -1;
			text = "images\immoscout.jpg";
			x = -0.000158733 * safezoneW + safezoneX;
			y = -0.00600008 * safezoneH + safezoneY;
			w = 1.00031 * safezoneW;
			h = 1.012 * safezoneH;
		};
	};
	
	class controls {
		
		class HouseList: Life_RscListNBox
		{
			idc = 7601;
			x = 0.273125 * safezoneW + safezoneX;
			y = 0.192 * safezoneH + safezoneY;
			w = 0.45375 * safezoneW;
			h = 0.539 * safezoneH;
			text = "";
			sizeEx = 0.045;
			coloumns[] = {0,0,0.9};
			drawSideArrows = false;
			idcLeft = -1;
			idcRight = -1;
			rowHeight = 0.050;
			onLBSelChanged = "_this spawn life_fnc_spawnPointSelected;";
		};
		
		class housebutton: Life_RscButtonMenu
		{
			idc = 7602;
			onButtonClick = "if(isNil 'life_spawn_point') then {hint 'Buche eine Reise bei Altis Travel solange du noch keine Immobilien besitzt!'} else {closedialog 0; ['house'] spawn life_fnc_spawnSide};";
			text = "Immobilie besuchen";
			x = 0.603125 * safezoneW + safezoneX;
			y = 0.764 * safezoneH + safezoneY;
			w = 0.12375 * safezoneW;
			h = 0.044 * safezoneH;
		};

		class buttonwebsiteSOA: Life_RscButtonMenu
		{
			idc = -1;
			onButtonClick = "[parseText ""<br/><t>Zur Website: </t><a color='#ff1000' href='http://secretsofaltis.de'>http://secretsofaltis.de</a>"",""Website"",""Schließen"",false] spawn bis_fnc_GUImessage;";
			x = 0.00499997 * safezoneW + safezoneX;
			y = 0.027 * safezoneH + safezoneY;
			w = 0.061875 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {-1,-1,-1,0};
			colorBackgroundFocused[] = {-1,-1,-1,0};
			colorBackground2[] = {-1,-1,-1,0};
			color[] = {1,1,1,0};
			colorFocused[] = {0,0,0,0};
			color2[] = {0,0,0,0};
			colorText[] = {1,1,1,1};
			colorDisabled[] = {0,0,0,0};
		};
		
		class buttonexit: buttonwebsiteSOA
		{
			idc = -1;
			OnButtonClick = "closedialog 0";
			x = 0.979531 * safezoneW + safezoneX;
			y = -0.00599999 * safezoneH + safezoneY;
			w = 0.020625 * safezoneW;
			h = 0.044 * safezoneH;
		};
	};	
};