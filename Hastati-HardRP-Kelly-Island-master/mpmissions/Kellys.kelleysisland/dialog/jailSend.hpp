class life_jail_send {
	idd = 61301;
	name= "life_jail_send";
	movingEnable = 0;
	enableSimulation = 1;
	onLoad = "";
	
	class controlsBackground {
		class MainBackground : Life_RscText {
			idc = -1;
			x = 0.125;
			y = 0.28;
			w = 0.725;
			h = 0.48;
			colorBackground[] = {0,0,0,0.5};
		};
		class Life_RscTitleBackground: Life_RscText {
			idc = 3001;
			text = "Wyslij do wiezienia: "; //--- ToDo: Localize;
			x = 0.1375;
			y = 0.3;
			w = 0.7;
			h = 0.04;
		};
	};
	
	class controls {
		class jailSendMinutes : Life_RscText 
		{
			idc = 3002;
			text = "Okres(minuty):"; //--- ToDo: Localize;
			x = 0.15;
			y = 0.44;
			w = 0.25;
			h = 0.04;
		};
		class jailSendReason : Life_RscText 
		{
			idc = 3003;
			text = "Powod:"; //--- ToDo: Localize;
			x = 0.15;
			y = 0.52;
			w = 0.25;
			h = 0.04;
		};
		class jailTimeInput : Life_RscEdit {
			idc = 3004;
			text = "";
			x = 0.475;
			y = 0.44;
			w = 0.325;
			h = 0.04;
		};
		
		class jailReasonInput : Life_RscEdit {
			idc = 3005;
			x = 0.475;
			y = 0.52;
			w = 0.325;
			h = 0.14;
			style = 18;
		};
		class jailApply: Life_RscButton
		{
			idc = 3006;
			text = "Zatwierdz"; //--- ToDo: Localize;
			x = 0.725;
			y = 0.7;
			w = 0.125;
			h = 0.06;
			action="life_sendToJail = true;";
		};
		class jailExit: Life_RscButton
		{
			idc = 3007;
			text = "Anuluj"; //--- ToDo: Localize;
			x = 0.725;
			y = 0.7;
			w = 0.125;
			h = 0.06;
			action="closeDialog 0;";
		};
	};
};