class smartphone {

	idd = 88888;
	name = "life_my_telephone_menu";
	movingEnable = false;
	enableSimulation = true;
	onLoad = "[] spawn life_fnc_smartphone;";
	
		class controlsBackground 
		{
			class backgroundPhone: Life_RscPicture
			{
				idc = -1;
				text = "icons\phone\padfone_1024.paa";
				x = 0.386562 * safezoneW + safezoneX;
				y = 0.137 * safezoneH + safezoneY;
				w = 0.216562 * safezoneW;
				h = 0.726 * safezoneH;
			};
		};	

		class controls 
		{			
			class CloseButton1: Life_RscButtonMenu
			{
				idc = -1;
				onButtonClick = "closeDialog 0;[] spawn life_fnc_p_updateMenu";
				x = 0.395 * safezoneW + safezoneX;
				y = 0.775 * safezoneH + safezoneY;
				w = 0.2 * safezoneW;
				h = 0.05 * safezoneH;
				colorBackground[] = {-1,-1,-1,-1};
				colorBackgroundFocused[] = {-1,-1,-1,-1};
				colorBackground2[] = {-1,-1,-1,-1};
				color[] = {-1,-1,-1,-1};
				colorFocused[] = {-1,-1,-1,-1};
				color2[] = {-1,-1,-1,-1};
				colorText[] = {-1,-1,-1,-1};
				colorDisabled[] = {-1,-1,-1,-1};
				tooltip = "Zurück";				
			};
			
			class PlayerList: Life_RscListBox
			{
				idc = 88881;
				sizeEx = 0.030;
				x = 0.406 * safezoneW + safezoneX;
				y = 0.348 * safezoneH + safezoneY;
				w = 0.172 * safezoneW;
				h = 0.352 * safezoneH;
				onLBSelChanged = "[2] spawn life_fnc_smartphone;";
				colorBackground[] = {-1,-1,-1,-1};
				colorBackgroundFocused[] = {0,0,0,0.5};
				colorText[] = {0,0,0,1};
				colorTextSelect[] = {0,0,0,1};
				colorSelect[] = {0,0,0,0.5};
			};
			
			class Notruf_icon: Life_RscPicture
			{
				idc = -1;
				text = "icons\phone\sos.paa";
				x = 0.54593601 * safezoneW + safezoneX;
				y = 0.710 * safezoneH + safezoneY;
				w = 0.0309375 * safezoneW;
				h = 0.055 * safezoneH;
				
			};
			
			class schreibe_icon: Life_RscPicture
			{ 
				idc = -1;
				text = "icons\phone\schreibe.paa";
				x = 0.410187 * safezoneW + safezoneX;
				y = 0.710 * safezoneH + safezoneY;
				w = 0.0309375 * safezoneW;
				h = 0.055 * safezoneH;

			};

			class lastMsg_icon: Life_RscPicture
			{
				idc = -1;
				text = "icons\phone\lastMsg.paa";
				x = 0.45543667 * safezoneW + safezoneX;
				y = 0.710 * safezoneH + safezoneY;
				w = 0.0309375 * safezoneW;
				h = 0.055 * safezoneH;
			};
			/*
			class position_icon: Life_RscPicture
			{
				idc = -1;
				text = "icons\phone\position.paa";
				x = 0.50068634 * safezoneW + safezoneX;
				y = 0.710 * safezoneH + safezoneY;
				w = 0.0309375 * safezoneW;
				h = 0.055 * safezoneH;
			};
			*/
			class Schreiben: Life_RscButtonMenu
			{
				idc = 887892;
				x = 0.410187 * safezoneW + safezoneX;
				y = 0.710 * safezoneH + safezoneY;
				w = 0.0309375 * safezoneW;
				h = 0.055 * safezoneH;
				onButtonClick = "createDialog ""smartphone_schreiben"";";
				colorBackground[] = {-1,-1,-1,-1};
				colorBackgroundFocused[] = {-1,-1,-1,-1};
				colorBackground2[] = {-1,-1,-1,-1};
				color[] = {-1,-1,-1,-1};
				colorFocused[] = {-1,-1,-1,-1};
				color2[] = {-1,-1,-1,-1};
				colorText[] = {-1,-1,-1,-1};
				colorDisabled[] = {-1,-1,-1,-1};
				tooltip = "SMS schreiben";
			};
			
			class Notruf: Life_RscButtonMenu
			{
				idc = -1;
				x = 0.54593601 * safezoneW + safezoneX;
				y = 0.710 * safezoneH + safezoneY;
				w = 0.0309375 * safezoneW;
				h = 0.055 * safezoneH;
				onButtonClick = "createDialog ""smartphone_notruf"";";
				colorBackground[] = {-1,-1,-1,-1};
				colorBackgroundFocused[] = {-1,-1,-1,-1};
				colorBackground2[] = {-1,-1,-1,-1};
				color[] = {-1,-1,-1,-1};
				colorFocused[] = {-1,-1,-1,-1};
				color2[] = {-1,-1,-1,-1};
				colorText[] = {-1,-1,-1,-1};
				colorDisabled[] = {-1,-1,-1,-1};	
				tooltip = "Notrufe und Kurzwahl";
			};

			class lastMsg: Life_RscButtonMenu
			{
				idc = -1;
				x = 0.45543667 * safezoneW + safezoneX;
				y = 0.710 * safezoneH + safezoneY;
				w = 0.0309375 * safezoneW;
				h = 0.055 * safezoneH;
				onButtonClick = "createDialog ""smartphone_lastmsg"";";
				colorBackground[] = {-1,-1,-1,-1};
				colorBackgroundFocused[] = {-1,-1,-1,-1};
				colorBackground2[] = {-1,-1,-1,-1};
				color[] = {-1,-1,-1,-1};
				colorFocused[] = {-1,-1,-1,-1};
				color2[] = {-1,-1,-1,-1};
				colorText[] = {-1,-1,-1,-1};
				colorDisabled[] = {-1,-1,-1,-1};
				tooltip = "Nachrichtenverlauf";	
			};
			/*
			class position: Life_RscButtonMenu
			{
				idc = -1;
				x = 0.50068634 * safezoneW + safezoneX;
				y = 0.710 * safezoneH + safezoneY;
				w = 0.0309375 * safezoneW;
				h = 0.055 * safezoneH;
				onButtonClick = """;"; //@Felix: to do
				colorBackground[] = {-1,-1,-1,-1};
				colorBackgroundFocused[] = {-1,-1,-1,-1};
				colorBackground2[] = {-1,-1,-1,-1};
				color[] = {-1,-1,-1,-1};
				colorFocused[] = {-1,-1,-1,-1};
				color2[] = {-1,-1,-1,-1};
				colorText[] = {-1,-1,-1,-1};
				colorDisabled[] = {-1,-1,-1,-1};
				tooltip = "Position senden";	
			};
			*/
		};
};

	
//////////////////////////////
//
//     Norrufe / Kurzwahl
//
//////////////////////////////

class smartphone_notruf
{
	idd = 887890;
	name= "smartphone_notruf";
	movingEnable = false;
	enableSimulation = true;
	onLoad = "[6] spawn life_fnc_newMsg;";

		class controlsBackground 
		{
			class backgroundPhone: Life_RscPicture
			{
				idc = -1;
				text = "icons\phone\padfone_emergency_1024.paa";
				x = 0.386562 * safezoneW + safezoneX;
				y = 0.137 * safezoneH + safezoneY;
				w = 0.216562 * safezoneW;
				h = 0.726 * safezoneH;
			};
		};	
	
		class controls {

			class CloseButton1: Life_RscButtonMenu
			{
				idc = -1;
				onButtonClick = "closeDialog 0;";
				x = 0.395 * safezoneW + safezoneX;
				y = 0.775 * safezoneH + safezoneY;
				w = 0.2 * safezoneW;
				h = 0.05 * safezoneH;
				colorBackground[] = {-1,-1,-1,-1};
				colorBackgroundFocused[] = {-1,-1,-1,-1};
				colorBackground2[] = {-1,-1,-1,-1};
				color[] = {-1,-1,-1,-1};
				colorFocused[] = {-1,-1,-1,-1};
				color2[] = {-1,-1,-1,-1};
				colorText[] = {-1,-1,-1,-1};
				colorDisabled[] = {-1,-1,-1,-1};
				tooltip = "Zurück";				
			};


			class textEdit : Life_RscEdit 
			{
				idc = 888894;
				text = ""; //--- ToDo: Localize;
				x = 0.407187 * safezoneW + safezoneX;
				y = 0.476 * safezoneH + safezoneY;
				w = 0.171667 * safezoneW;
				h = 0.0422592 * safezoneH;
				colorText[] = {0,0,0,0.5};
				colorBackground[] = {-1,-1,-1,-1};
				colorBackgroundFocused[] = {-1,-1,-1,-1};
				colorBackground2[] = {-1,-1,-1,-1};
				font = PuristaMedium;
			};
			
			
			class AdminMsgAll: life_RscButtonMenu			

			{
				idc = 888898;
				x = 0.40953846 * safezoneW + safezoneX;
				y = 0.37288136 * safezoneH + safezoneY;
				w = 0.03846154 * safezoneW;
				h = 0.06779661 * safezoneH;
				onButtonClick = "[7,-1,(ctrlText 888894)] spawn life_fnc_newMsg;";
				colorBackground[] = {-1,-1,-1,-1};
				colorBackgroundFocused[] = {-1,-1,-1,-1};
				colorBackground2[] = {-1,-1,-1,-1};
				color[] = {-1,-1,-1,-1};
				colorFocused[] = {-1,-1,-1,-1};
				color2[] = {-1,-1,-1,-1};
				colorText[] = {-1,-1,-1,-1};
				colorDisabled[] = {-1,-1,-1,-1};
				tooltip = "Globale Nachricht";
			};
			
			

			class TxtAdminButton: life_RscButtonMenu
			{
				idc = 888896;
				onButtonClick = "[3,-1,(ctrlText 888894)] spawn life_fnc_newMsg;";
				x = 0.40953846 * safezoneW + safezoneX;
				y = 0.37288136 * safezoneH + safezoneY;
				w = 0.03846154 * safezoneW;
				h = 0.06779661 * safezoneH;
				colorBackground[] = {-1,-1,-1,-1};
				colorBackgroundFocused[] = {-1,-1,-1,-1};
				colorBackground2[] = {-1,-1,-1,-1};
				color[] = {-1,-1,-1,-1};
				colorFocused[] = {-1,-1,-1,-1};
				color2[] = {-1,-1,-1,-1};
				colorText[] = {-1,-1,-1,-1};
				colorDisabled[] = {-1,-1,-1,-1};
				tooltip = "Adminanfrage";
			};

			class ASFReq: life_RscButtonMenu
			{
				idc = 888900;
				onButtonClick = "[8,-1,(ctrlText 888894)] spawn life_fnc_newMsg;";
				x = 0.40953846 * safezoneW + safezoneX;
				y = 0.29830508 * safezoneH + safezoneY;
				w = 0.03846154 * safezoneW;
				h = 0.06779661 * safezoneH;
				colorBackground[] = {-1,-1,-1,-1};
				colorBackgroundFocused[] = {-1,-1,-1,-1};
				colorBackground2[] = {-1,-1,-1,-1};
				color[] = {-1,-1,-1,-1};
				colorFocused[] = {-1,-1,-1,-1};
				color2[] = {-1,-1,-1,-1};
				colorText[] = {-1,-1,-1,-1};
				colorDisabled[] = {-1,-1,-1,-1};
				tooltip = "Anfrage an die ASF";
			};
				
			class TxtCopButton: life_RscButtonMenu
			{
				idc = 888895;
				onButtonClick = "[2,-1,(ctrlText 888894)] spawn life_fnc_newMsg;";
				x = 0.45376923 * safezoneW + safezoneX;
				y = 0.29830508 * safezoneH + safezoneY;
				w = 0.03846154 * safezoneW;
				h = 0.06779661 * safezoneH;
				colorBackground[] = {-1,-1,-1,-1};
				colorBackgroundFocused[] = {-1,-1,-1,-1};
				colorBackground2[] = {-1,-1,-1,-1};
				color[] = {-1,-1,-1,-1};
				colorFocused[] = {-1,-1,-1,-1};
				color2[] = {-1,-1,-1,-1};
				colorText[] = {-1,-1,-1,-1};
				colorDisabled[] = {-1,-1,-1,-1};
				tooltip	= "Notruf an die Polizei";
			};
			
			class TxtCopButtonGlobal: life_RscButtonMenu
			{
				idc = 888901;
				onButtonClick = "[9,-1,(ctrlText 888894)] spawn life_fnc_newMsg;";
				x = 0.45376923 * safezoneW + safezoneX;
				y = 0.29830508 * safezoneH + safezoneY;
				w = 0.03846154 * safezoneW;
				h = 0.06779661 * safezoneH;
				colorBackground[] = {-1,-1,-1,-1};
				colorBackgroundFocused[] = {-1,-1,-1,-1};
				colorBackground2[] = {-1,-1,-1,-1};
				color[] = {-1,-1,-1,-1};
				colorFocused[] = {-1,-1,-1,-1};
				color2[] = {-1,-1,-1,-1};
				colorText[] = {-1,-1,-1,-1};
				colorDisabled[] = {-1,-1,-1,-1};
				tooltip	= "Globale Polizeinachricht";
			};
				
			class EMSReq: life_RscButtonMenu
			{
				idc = 888899;
				onButtonClick = "[4,-1,(ctrlText 888894)] spawn life_fnc_newMsg;";
				x = 0.499 * safezoneW + safezoneX;
				y = 0.29630508 * safezoneH + safezoneY;
				w = 0.03846154 * safezoneW;
				h = 0.06779661 * safezoneH;
				colorBackground[] = {-1,-1,-1,-1};
				colorBackgroundFocused[] = {-1,-1,-1,-1};
				colorBackground2[] = {-1,-1,-1,-1};
				color[] = {-1,-1,-1,-1};
				colorFocused[] = {-1,-1,-1,-1};
				color2[] = {-1,-1,-1,-1};
				colorText[] = {-1,-1,-1,-1};
				colorDisabled[] = {-1,-1,-1,-1};
				tooltip = "Notruf an die Sanitäter";
			};
			
			class ALACReq: life_RscButtonMenu
			{
				idc = 888899;
				onButtonClick = "[11,-1,(ctrlText 888894)] spawn life_fnc_newMsg;";
				x = 0.54223077 * safezoneW + safezoneX;
				y = 0.29830508 * safezoneH + safezoneY;
				w = 0.03846154 * safezoneW;
				h = 0.06779661 * safezoneH;
				colorBackground[] = {-1,-1,-1,-1};
				colorBackgroundFocused[] = {-1,-1,-1,-1};
				colorBackground2[] = {-1,-1,-1,-1};
				color[] = {-1,-1,-1,-1};
				colorFocused[] = {-1,-1,-1,-1};
				color2[] = {-1,-1,-1,-1};
				colorText[] = {-1,-1,-1,-1};
				colorDisabled[] = {-1,-1,-1,-1};
				tooltip = "Anfrage an den ALAC";
			};
			
			class TxtTaxiButton: life_RscButtonMenu
			{
				idc = 888895;
				onButtonClick = "[10,-1,(ctrlText 888894)] spawn life_fnc_newMsg;";
				x = 0.45376923 * safezoneW + safezoneX;
				y = 0.37288136 * safezoneH + safezoneY;
				w = 0.03846154 * safezoneW;
				h = 0.06779661 * safezoneH;
				colorBackground[] = {-1,-1,-1,-1};
				colorBackgroundFocused[] = {-1,-1,-1,-1};
				colorBackground2[] = {-1,-1,-1,-1};
				color[] = {-1,-1,-1,-1};
				colorFocused[] = {-1,-1,-1,-1};
				color2[] = {-1,-1,-1,-1};
				colorText[] = {-1,-1,-1,-1};
				colorDisabled[] = {-1,-1,-1,-1};
				tooltip	= "Anfrage an das Taxi-Unternehmen";
			};
			
			class TxtEventButton: life_RscButtonMenu
			{
				idc = 888893;
				onButtonClick = "[12,-1,(ctrlText 888894)] spawn life_fnc_newMsg;";
				x = 0.499 * safezoneW + safezoneX;
				y = 0.37288136 * safezoneH + safezoneY;
				w = 0.03846154 * safezoneW;
				h = 0.06779661 * safezoneH;
				colorBackground[] = {-1,-1,-1,-1};
				colorBackgroundFocused[] = {-1,-1,-1,-1};
				colorBackground2[] = {-1,-1,-1,-1};
				color[] = {-1,-1,-1,-1};
				colorFocused[] = {-1,-1,-1,-1};
				color2[] = {-1,-1,-1,-1};
				colorText[] = {-1,-1,-1,-1};
				colorDisabled[] = {-1,-1,-1,-1};
				tooltip	= "Anfrage an das Event-Team";
			};
			
			class EventMsgButton: life_RscButtonMenu
			{
				idc = 888892;
				onButtonClick = "[13,-1,(ctrlText 888894)] spawn life_fnc_newMsg;";
				x = 0.499 * safezoneW + safezoneX;
				y = 0.37288136 * safezoneH + safezoneY;
				w = 0.03846154 * safezoneW;
				h = 0.06779661 * safezoneH;
				colorBackground[] = {-1,-1,-1,-1};
				colorBackgroundFocused[] = {-1,-1,-1,-1};
				colorBackground2[] = {-1,-1,-1,-1};
				color[] = {-1,-1,-1,-1};
				colorFocused[] = {-1,-1,-1,-1};
				color2[] = {-1,-1,-1,-1};
				colorText[] = {-1,-1,-1,-1};
				colorDisabled[] = {-1,-1,-1,-1};
				tooltip	= "Event Nachricht";
			};


			
	};
};		

//////////////////////////////
//
//         NEW MESSAGE
//
//////////////////////////////


class smartphone_schreiben
{
	idd = 88883;
	name = "smartphone_schreiben";
	movingEnable = false;
	enableSimulation = true;
	onLoad = "[0,(lbData[88881,(lbCurSel 88881)])] spawn life_fnc_newMsg;";
	
	class controlsBackground 
	{
		class backgroundPhone: Life_RscPicture
		{
			idc = -1;
			text = "icons\phone\padfone_write_1024.paa";
			x = 0.386562 * safezoneW + safezoneX;
			y = 0.137 * safezoneH + safezoneY;
			w = 0.216562 * safezoneW;
			h = 0.726 * safezoneH;
		};			
	};	
	
	class controls {
			
		class CloseButton1: Life_RscButtonMenu
		{
			idc = -1;
			onButtonClick = "closeDialog 0;";
			x = 0.395 * safezoneW + safezoneX;
			y = 0.775 * safezoneH + safezoneY;
			w = 0.2 * safezoneW;
			h = 0.05 * safezoneH;
			colorBackground[] = {-1,-1,-1,-1};
			colorBackgroundFocused[] = {-1,-1,-1,-1};
			colorBackground2[] = {-1,-1,-1,-1};
			color[] = {-1,-1,-1,-1};
			colorFocused[] = {-1,-1,-1,-1};
			color2[] = {-1,-1,-1,-1};
			colorText[] = {-1,-1,-1,-1};
			colorDisabled[] = {-1,-1,-1,-1};
			tooltip = "Zurück";
		};
		
		class textEdit : Life_RscEdit 
		{
			idc = 88884;
			text = "";
			x = 0.405 * safezoneW + safezoneX;
			y = 0.476 * safezoneH + safezoneY;
			w = 0.146 * safezoneW;
			h = 0.0422592 * safezoneH;
			colorText[] = {0,0,0,0.8};
			colorBackground[] = {-1,-1,-1,-1};
			colorBackgroundFocused[] = {-1,-1,-1,-1};
			colorBackground2[] = {-1,-1,-1,-1};
			font = PuristaMedium;
		};
		
		class Absenden : Life_RscButtonMenu 
		{
			idc = 88885;
			onButtonClick = "[1,-1,(ctrlText 88884)] spawn life_fnc_newMsg;";
			x = 0.55509231 * safezoneW + safezoneX;
			y = 0.46201695 * safezoneH + safezoneY;
			w = 0.03077 * safezoneW;
			h = 0.071186 * safezoneH;
			colorBackground[] = {-1,-1,-1,-1};
			colorBackgroundFocused[] = {-1,-1,-1,-1};
			colorBackground2[] = {-1,-1,-1,-1};
			color[] = {-1,-1,-1,-1};
			colorFocused[] = {-1,-1,-1,-1};
			color2[] = {-1,-1,-1,-1};
			colorText[] = {-1,-1,-1,-1};
			colorDisabled[] = {-1,-1,-1,-1};
			tooltip = "Absenden";
		};
		
		class AdminMsg_icon: Life_RscPicture
		{
			idc = 20211;
			text = "icons\phone\admin.paa";
			x = 0.40673077 * safezoneW + safezoneX;
			y = 0.34237288 * safezoneH + safezoneY;
			w = 0.04807692 * safezoneW;
			h = 0.08474576 * safezoneH;
		};	
		
		class AdminMsg: Life_RscButtonMenu
		{
			idc = 888897;
			onButtonClick = "[5,-1,(ctrlText 88884)] spawn life_fnc_newMsg;";
			x = 0.40673077 * safezoneW + safezoneX;
			y = 0.34237288 * safezoneH + safezoneY;
			w = 0.04807692 * safezoneW;
			h = 0.08474576 * safezoneH;
			colorBackground[] = {-1,-1,-1,-1};
			colorBackgroundFocused[] = {-1,-1,-1,-1};
			colorBackground2[] = {-1,-1,-1,-1};
			color[] = {-1,-1,-1,-1};
			colorFocused[] = {-1,-1,-1,-1};
			color2[] = {-1,-1,-1,-1};
			colorText[] = {1,1,1,1};
			colorDisabled[] = {-1,-1,-1,-1};
			tooltip = "Als Admin PN";
		};
		
		class MedicMsg_icon: Life_RscPicture
		{
			idc = 20212;
			text = "icons\phone\sani.paa";
			x = 0.499 * safezoneW + safezoneX;
			y = 0.34237288 * safezoneH + safezoneY;
			w = 0.04807692 * safezoneW;
			h = 0.08474576 * safezoneH;
		};	
		
		class MedicMsg: Life_RscButtonMenu
		{
			idc = 888891;
			onButtonClick = "[""MedicalAnswer""] remoteExec [""BIS_fnc_showNotification"",life_smartphoneTarget];";
			x = 0.499 * safezoneW + safezoneX;
			y = 0.34237288 * safezoneH + safezoneY;
			w = 0.04807692 * safezoneW;
			h = 0.08474576 * safezoneH;
			colorBackground[] = {-1,-1,-1,-1};
			colorBackgroundFocused[] = {-1,-1,-1,-1};
			colorBackground2[] = {-1,-1,-1,-1};
			color[] = {-1,-1,-1,-1};
			colorFocused[] = {-1,-1,-1,-1};
			color2[] = {-1,-1,-1,-1};
			colorText[] = {1,1,1,1};
			colorDisabled[] = {-1,-1,-1,-1};
			tooltip = "Schnellantwort";
		};
	};
};		