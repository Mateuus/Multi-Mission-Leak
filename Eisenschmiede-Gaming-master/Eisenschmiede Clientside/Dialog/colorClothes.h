class ColorClothesMenu
{
	idd = 49090;
	name = "ColorClothesMenu";
	movingEnabled = 1;
	enableSimulation = 1;
	
	class controlsBackground
	{
		class RscTitleBackground : ES_RscText
		{
			idc = -1;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};

			x = 0.3;
			y = 0.2;
			w = 0.5;
			h = 0.04;
		};
		
		class RscMainBackground : ES_RscText
		{
			idc = -1;
			colorBackground[] = {0,0,0,0.7};
			
			x = 0.3;
			y = 0.244;
			w = 0.5;
			h = 0.26;
		};
		
		class PriceHeader : ES_RscText
		{
			idc = -1;
			text = "Preis: 10.000$";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
			
			x = 0.304;
			y = 0.46;
			w = 0.244;
			h = 0.04;
		};
		
		class CategoryHeader : ES_RscText
		{
			idc = 49091;
			text = "Kategorie: Kleidung";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
			
			x = 0.552;
			y = 0.46;
			w = 0.244;
			h = 0.04;
		};
		
		class Title : ES_RscTitle
		{
			colorBackground[] = {0,0,0,0};
			text = "Pimp Your Clothes";
			idc = -1;
			
			x = 0.3;
			y = 0.2;
			w = 0.5;
			h = 0.04;
		};
	};
	
	class controls
	{
		class VDonRed : ES_RscText
		{
			idc = -1;
			text = "Rot:";
			
			x = 0.3;
			y = 0.258;
			w = 0.275;
			h = 0.04;
		};
		
		class VDinGreen : ES_RscText
		{
			idc = -1;
			text = "Grün:";
			
			x = 0.3;
			y = 0.308;
			w = 0.275;
			h = 0.04;
		};
		
		class VDinBlue : ES_RscText
		{
			idc = -1;
			text = "Blau:";
			
			x = 0.3;
			y = 0.358;
			w = 0.275;
			h = 0.04;
		};
		
		class VDinLight : ES_RscText
		{
			idc = -1;
			text = "Helligkeit:";
			
			x = 0.3;
			y = 0.408;
			w = 0.275;
			h = 0.04;
		};
		
		
		
		class VD_Red_slider : ES_RscXSliderH 
		{
			idc = 49092;
			text = "";
			onSliderPosChanged = "ES_colorClothR = (sliderPosition 49092); ctrlSetText [49093, format['%1', ES_colorClothR]]; ES_colorClothTempR = ES_colorClothR; if(ES_colorClothSelection == 0) then {player setObjectTexture [0, format['#(rgb,8,8,3)color(%1,%2,%3,%4)',(ES_colorClothR/255),(ES_colorClothG/255),(ES_colorClothB/255),(ES_colorClothH/240)]];} else {(unitBackpack player) setObjectTexture [0, format['#(rgb,8,8,3)color(%1,%2,%3,%4)',(ES_colorClothR/255),(ES_colorClothG/255),(ES_colorClothB/255),(ES_colorClothH/240)]];};";
			tooltip = "Roter RGB-Wert";
			
			color[] = { 1, 0, 0, 1 }; 
			coloractive[] = { 1, 0, 0, 1 };
			
			x = 0.42;
			y = 0.26;
			
			w = "9 * 			(			((safezoneW / safezoneH) min 1.2) / 40)";
			h = "1 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
		
		class VD_Red_value : ES_RscEdit
		{
			idc = 49093;
			text = "120";
			sizeEx = 0.030;
			
			onKillFocus = "ES_colorClothTempR = parseNumber(ctrlText 49093); if (typename ES_colorClothTempR != typename 0) then { ES_colorClothTempR = 120; ES_colorClothR = 120; ctrlSetText [49093, '120']; sliderSetPosition [49092, 120]; hint 'Ungültiger RGB-Wert'; } else { if(ES_colorClothTempR < 0) then { ES_colorClothTempR = 0; ES_colorClothR = 0; ctrlSetText [49093, '0']; sliderSetPosition [49092, 0]; hint 'Ungültiger RGB-Wert'; } else { if(ES_colorClothTempR > 255) then { ES_colorClothTempR = 255; ES_colorClothR = 255; ctrlSetText [49093, '255']; sliderSetPosition [49092, 255]; hint 'Ungültiger RGB-Wert'; } else { ES_colorClothR = ES_colorClothTempR; ctrlSetText [49093, format[""%1"", ES_colorClothTempR]]; sliderSetPosition [49092, ES_colorClothTempR]; };};}; if(ES_colorClothSelection == 0) then { player setObjectTexture [0, format['#(rgb,8,8,3)color(%1,%2,%3,%4)',(ES_colorClothR/255),(ES_colorClothG/255),(ES_colorClothB/255),(ES_colorClothH/240)]]; } else { (unitBackpack player) setObjectTexture [0, format['#(rgb,8,8,3)color(%1,%2,%3,%4)',(ES_colorClothR/255),(ES_colorClothG/255),(ES_colorClothB/255),(ES_colorClothH/240)]];};";
			tooltip = "Roter RGB-Wert";
			
			x = 0.70;
			y = 0.26;
			w = 0.096;
			h = 0.04;
		};
		
		class VD_Green_slider : ES_RscXSliderH 
		{
			idc = 49094;
			text = "";
			onSliderPosChanged = "ES_colorClothG = (sliderPosition 49094); ctrlSetText [49095, format['%1', ES_colorClothG]]; ES_colorClothTempG = ES_colorClothG; if(ES_colorClothSelection == 0) then {player setObjectTexture [0, format['#(rgb,8,8,3)color(%1,%2,%3,%4)',(ES_colorClothR/255),(ES_colorClothG/255),(ES_colorClothB/255),(ES_colorClothH/240)]];} else {(unitBackpack player) setObjectTexture [0, format['#(rgb,8,8,3)color(%1,%2,%3,%4)',(ES_colorClothR/255),(ES_colorClothG/255),(ES_colorClothB/255),(ES_colorClothH/240)]];};";
			tooltip = "Gruener RGB-Wert";
			
			color[] = { 0, 1, 0, 1 }; 
			coloractive[] = { 0, 1, 0, 1 };
			
			x = 0.42;
			y = 0.31;
			
			w = "9 * 			(			((safezoneW / safezoneH) min 1.2) / 40)";
			h = "1 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
		
		class VD_Green_value : ES_RscEdit
		{
			idc = 49095;
			text = "120";
			sizeEx = 0.030;
			
			onKillFocus = "ES_colorClothTempG = parseNumber(ctrlText 49095); if (typename ES_colorClothTempG != typename 0) then {ES_colorClothTempG = 120; ES_colorClothG = 120; ctrlSetText [49095, '120']; sliderSetPosition [49094, 120]; hint 'Ungültiger RGB-Wert';} else { if(ES_colorClothTempG < 0) then {ES_colorClothTempG = 0; ES_colorClothG = 0; ctrlSetText [49095, '0']; sliderSetPosition [49094, 0]; hint 'Ungültiger RGB-Wert';} else { if(ES_colorClothTempG > 255) then {ES_colorClothTempG = 255; ES_colorClothB = 255; ctrlSetText [49095, '255']; sliderSetPosition [49094, 255]; hint 'Ungültiger RGB-Wert';} else { ES_colorClothG = ES_colorClothTempG; ctrlSetText [49095, format[""%1"", ES_colorClothTempG]]; sliderSetPosition [49094, ES_colorClothTempG];};};}; if(ES_colorClothSelection == 0) then {player setObjectTexture [0, format['#(rgb,8,8,3)color(%1,%2,%3,%4)',(ES_colorClothR/255),(ES_colorClothG/255),(ES_colorClothB/255),(ES_colorClothH/240)]];} else {(unitBackpack player) setObjectTexture [0, format['#(rgb,8,8,3)color(%1,%2,%3,%4)',(ES_colorClothR/255),(ES_colorClothG/255),(ES_colorClothB/255),(ES_colorClothH/240)]];};";
			tooltip = "Gruener RGB-Wert";
			
			x = 0.70;
			y = 0.31;
			w = 0.096;
			h = 0.04;
		};
		
		class VD_Blue_slider : ES_RscXSliderH 
		{
			idc = 49096;
			text = "";
			onSliderPosChanged = "ES_colorClothB = (sliderPosition 49096); ctrlSetText [49097, format['%1', ES_colorClothB]]; ES_colorClothTempB = ES_colorClothB; if(ES_colorClothSelection == 0) then {player setObjectTexture [0, format['#(rgb,8,8,3)color(%1,%2,%3,%4)',(ES_colorClothR/255),(ES_colorClothG/255),(ES_colorClothB/255),(ES_colorClothH/240)]];} else {(unitBackpack player) setObjectTexture [0, format['#(rgb,8,8,3)color(%1,%2,%3,%4)',(ES_colorClothR/255),(ES_colorClothG/255),(ES_colorClothB/255),(ES_colorClothH/240)]];};";
			tooltip = "Blauer RGB-Wert";
			
			color[] = { 0, 0, 1, 1 }; 
			coloractive[] = { 0, 0, 1, 1 };
			
			x = 0.42;
			y = 0.36;
			
			w = "9 * 			(			((safezoneW / safezoneH) min 1.2) / 40)";
			h = "1 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
		
		class VD_Blue_value : ES_RscEdit
		{
			idc = 49097;
			text = "120";
			sizeEx = 0.030;
			
			onKillFocus = "ES_colorClothTempB = parseNumber(ctrlText 49097); if (typename ES_colorClothTempB != typename 0) then {ES_colorClothTempB = 120; ES_colorClothB = 120; ctrlSetText [49097, '120']; sliderSetPosition [49096, 120]; hint 'Ungültiger RGB-Wert';} else { if(ES_colorClothTempB < 0) then {ES_colorClothTempB = 0; ES_colorClothB = 0; ctrlSetText [49097, '0']; sliderSetPosition [49096, 0]; hint 'Ungültiger RGB-Wert';} else { if(ES_colorClothTempB > 255) then {ES_colorClothTempB = 255; ES_colorClothB = 255; ctrlSetText [49097, '255']; sliderSetPosition [49096, 255]; hint 'Ungültiger RGB-Wert';} else	{ ES_colorClothB = ES_colorClothTempB; ctrlSetText [49097, format[""%1"", ES_colorClothTempB]]; sliderSetPosition [49096, ES_colorClothTempB];};};}; if(ES_colorClothSelection == 0) then {player setObjectTexture [0, format['#(rgb,8,8,3)color(%1,%2,%3,%4)',(ES_colorClothR/255),(ES_colorClothG/255),(ES_colorClothB/255),(ES_colorClothH/240)]];} else {(unitBackpack player) setObjectTexture [0, format['#(rgb,8,8,3)color(%1,%2,%3,%4)',(ES_colorClothR/255),(ES_colorClothG/255),(ES_colorClothB/255),(ES_colorClothH/240)]];};";
			tooltip = "Blauer RGB-Wert";
			
			x = 0.70;
			y = 0.36;
			w = 0.096;
			h = 0.04;
		};
		
		class VD_Light_slider : ES_RscXSliderH 
		{
			idc = 49098;
			text = "";
			onSliderPosChanged = "ES_colorClothH = (sliderPosition 49098); ctrlSetText [49099, format['%1', ES_colorClothH]]; ES_colorClothTempH = ES_colorClothH; if(ES_colorClothSelection == 0) then {player setObjectTexture [0, format['#(rgb,8,8,3)color(%1,%2,%3,%4)',(ES_colorClothR/255),(ES_colorClothG/255),(ES_colorClothB/255),(ES_colorClothH/240)]];} else {(unitBackpack player) setObjectTexture [0, format['#(rgb,8,8,3)color(%1,%2,%3,%4)',(ES_colorClothR/255),(ES_colorClothG/255),(ES_colorClothB/255),(ES_colorClothH/240)]];};";
			tooltip = "Helligkeit des RGB-Werts";
			
			color[] = { 1, 1, 1, 1 }; 
			coloractive[] = { 1, 1, 1, 1 };
			
			x = 0.42;
			y = 0.41;
			
			w = "9 * 			(			((safezoneW / safezoneH) min 1.2) / 40)";
			h = "1 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
		
		class VD_Light_value : ES_RscEdit
		{
			idc = 49099;
			text = "120";
			sizeEx = 0.030;
			
			onKillFocus = "ES_colorClothTempH = parseNumber(ctrlText 49099); if (typename ES_colorClothTempH != typename 0) then {ES_colorClothTempH = 120; ES_colorClothH = 120; ctrlSetText [49099, '120']; sliderSetPosition [49098, 120]; hint 'Ungültiger RGB-Wert';} else { if(ES_colorClothTempH < 0) then {ES_colorClothTempH = 0; ES_colorClothH = 0; ctrlSetText [49099, '0']; sliderSetPosition [49098, 0]; hint 'Ungültiger RGB-Wert';} else { if(ES_colorClothTempH > 240) then {ES_colorClothTempH = 240; ES_colorClothH = 240; ctrlSetText [49099, '240']; sliderSetPosition [49098, 240]; hint 'Ungültiger RGB-Wert';} else { ES_colorClothH = ES_colorClothTempH; ctrlSetText [49099, format[""%1"", ES_colorClothTempH]]; sliderSetPosition [49098, ES_colorClothTempH];};};}; if(ES_colorClothSelection == 0) then {player setObjectTexture [0, format['#(rgb,8,8,3)color(%1,%2,%3,%4)',(ES_colorClothR/255),(ES_colorClothG/255),(ES_colorClothB/255),(ES_colorClothH/240)]];} else {(unitBackpack player) setObjectTexture [0, format['#(rgb,8,8,3)color(%1,%2,%3,%4)',(ES_colorClothR/255),(ES_colorClothG/255),(ES_colorClothB/255),(ES_colorClothH/240)]];};";
			tooltip = "Helligkeit des RGB-Werts";
			
			x = 0.70;
			y = 0.41;
			w = 0.096;
			h = 0.04;
		};
		
		
		class ButtonBuy : ES_RscButtonMenu {
			idc = -1;
			text = "KAUFEN";
			onButtonClick = "if(ES_cash >= 10000) then { if((typename ES_colorClothR == typename 0) && (typename ES_colorClothG == typename 0) && (typename ES_colorClothB == typename 0) && (typename ES_colorClothH == typename 0)) then { if((ES_colorClothR >= 0) && (ES_colorClothR <= 255) && (ES_colorClothG >= 0) && (ES_colorClothG <= 255) && (ES_colorClothB >= 0) && (ES_colorClothB <= 255) && (ES_colorClothH >= 0) && (ES_colorClothH <= 255)) then	{ES_cash = ES_cash - 10000;[0] call XAS_fnc_updatePartial;	if(ES_colorClothSelection == 0) then{ES_colorClothBought = 1; player setObjectTextureGlobal [0, format['#(rgb,8,8,3)color(%1,%2,%3,%4)',(ES_colorClothR/255),(ES_colorClothG/255),(ES_colorClothB/255),(ES_colorClothH/240)]]; } else { ES_colorClothBought = 2; (unitBackpack player) setObjectTextureGlobal [0, format['#(rgb,8,8,3)color(%1,%2,%3,%4)',(ES_colorClothR/255),(ES_colorClothG/255),(ES_colorClothB/255),(ES_colorClothH/240)]];	};} else {hint 'Ungültiger RGB-Wert !!!';};} else {hint 'Ungültiger RGB-Wert !!!';};} else {hint 'Du hast nicht genug Bargeld !!!';}; closeDialog 0;";
			x = 0.3;
			y = 0.508;
			w = 0.164;
			h = 0.04;
		};
		
		class ButtonSwitch : ES_RscButtonMenu {
			idc = -1;
			text = "Ranzen";
			onButtonClick = "if(ES_colorClothSelection == 0) then {ES_colorClothSelection = 1; ctrlSetText [49091, ""Kategorie: Rucksack""]; ES_shop_cam camSetTarget (player modelToWorld [0,-0.15,1.3]); ES_shop_cam camSetPos (player modelToWorld [1,-4,2]); ES_shop_cam camCommit 1;} else {ES_colorClothSelection = 0; ctrlSetText [49091, ""Kategorie: Kleidung""]; ES_shop_cam camSetTarget (player modelToWorld [0,0,1]); ES_shop_cam camSetPos (player modelToWorld [1,4,2]); ES_shop_cam camCommit 1;};";
			x = 0.468;
			y = 0.508;
			w = 0.164;
			h = 0.04;
		};
		
		class ButtonClose : ES_RscButtonMenu {
			idc = -1;
			text = "SCHLIEßEN";
			onButtonClick = "closeDialog 0;";
			x = 0.636;
			y = 0.508;
			w = 0.164;
			h = 0.04;
		};
	};
};