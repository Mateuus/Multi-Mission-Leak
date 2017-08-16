class life_spawn_selection
{
	idd = 38500;
	movingEnabled = false;
	enableSimulation = true;
	
	class controlsBackground
	{
		class life_RscTitleBackground : Life_RscText
		{
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
			idc = -1;
			x = 0.1 - 0.5; y = 0.2 - 0.5;
			w = 0.8 + 1; h = (1 / 25);
		};
		
		class MainBackground : Life_RscText
		{
			colorBackground[] = {0.1,0.1,0.1,0.7};
			idc = -1;
			x = 0.1 - 0.5; 
			
			y = 0.2 - 0.5 + (11 / 250);
			w = 0.8 + 1; 
			h = 0.56 - (22 / 250) + 1 + (11 / 250);
		};
		
		class Title : Life_RscTitle
		{
			colorBackground[] = {0,0,0,0};
			idc = -1;
			text = "Välj spawnpunkt";
			x = 0.1 - 0.5; y = 0.2 - 0.5;
			w = 0.8 + 1; h = (1 / 25);
		};
		
		
		
		class MapView : Life_RscMapControl 
		{
			idc = 38502;
			x = 0.328 - 0.2; y = 0.26 - 0.5;
			w = 0.56 + 0.7;
			h = 0.56 - (22 / 250) + 1;
			maxSatelliteAlpha = 0.75;
			alphaFadeStartScale = 1.15;
			alphaFadeEndScale = 1.29;
		};
	};
	
	class controls
	{	
		class SpawnPointList: Life_RscListNBox
		{
			idc = 38510;
			text = "";
			sizeEx = 0.071;
			
			coloumns[] = {0,0,0.9};
			drawSideArrows = false;
			idcLeft = -1;
			idcRight = -1;
			rowHeight = 0.12;
			x = 0.105 - 0.5; y = 0.26 - 0.5;
			w = (8.8 / 40) + 0.3;
			h = (10 / 25) + 1;
			onLBSelChanged = "_this call life_fnc_wyemkgjquicvtvwgboajxnhrilghfmaxfblqoipowqhrqczdbgg;";
		};
		
		class adminButton : Life_RscButtonMenu
		{
			idc = 8753;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			
			onButtonClick = "[4,(getPlayerUID player),'','Spawn override',str _pos,profileName,'',str (getPos player)] remoteExec ['TON_fnc_cqbslmzhelexdchvshruhtirwniyhyywbybxhiltsdxdujmnhjuhnal',2]; [] call life_fnc_aixegqsqglhfqgoeyzkchufqmlhcnqvrfmdncqydynqjgjuinxuhnrrxv;";
			colorBackgroundFocused[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			colorDisabled[] = {0.2,0.2,0.2,0.9};
			Tooltip = "Den här knappen är alltid upplåst så att du kan spawna trots cooldown, den ska uppenbarligen bara användas när du behöver spawna snabbt för ett ärende/staffarbete.";
			sizeEx = 0.3;
			x = 0.11 - 0.5 + 0.51; y = 0.69 + 0.5 - (2 / 25);
			w = 0.5;
			h = (3 / 25);
		};
		
		class AdminButtonText : Life_RscTitle
		{
			colorBackground[] = {0,0,0,0};
			idc = 8754;
			text = "Spawn override (Staff)";
			Tooltip = "Den här knappen är alltid upplåst så att du kan spawna trots cooldown, den ska uppenbarligen bara användas när du behöver spawna snabbt för ett ärende/staffarbete.";
			sizeEx = 0.051;
			
			x = 0.20 - 0.5 + 0.51; y = 0.689 + 0.5 - (2 / 25);
			w = 0.4; h = (3 / 25);
		};
		
		class spawnButton : Life_RscButtonMenu
		{
			idc = 8752;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			
			onButtonClick = "[] call life_fnc_aixegqsqglhfqgoeyzkchufqmlhcnqvrfmdncqydynqjgjuinxuhnrrxv";
			colorBackgroundFocused[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			colorDisabled[] = {0.2,0.2,0.2,0.9};
			sizeEx = 0.3;
			x = 0.11 - 0.5; y = 0.69 + 0.5 - (2 / 25);
			w = 0.5;
			h = (3 / 25);
		};
		
		class SpawnButtonText : Life_RscTitle
		{
			colorBackground[] = {0,0,0,0};
			idc = -1;
			text = "Spawn";
			sizeEx = 0.071;
			
			x = 0.17 - 0.5 + 0.1; y = 0.69 + 0.5 - (2 / 25);
			w = (8 / 40) + 0.2; h = (3 / 25);
		};
	};
};