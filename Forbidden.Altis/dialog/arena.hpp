class life_arena {
	idd = 5000;
	name= "life_arena";
	movingEnable = false;
	enableSimulation = true;
	
	class controlsBackground {
		class Life_RscTitleBackground:Life_RscText {
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
			idc = -1;
			x = -0.1;
			y = 0;
			w = 1.0;
			h = (1 / 25);
		};
		
		class MainBackground:Life_RscText {
			colorBackground[] = {0, 0, 0, 0.7};
			idc = -1;
			x = -0.1;
			y = 0 + (11 / 250);
			w = 1.0;
			h = 1.0 - (22 / 250);
		};
	};
	
	class controls {

		
		class Title : Life_RscTitle {
			colorBackground[] = {0, 0, 0, 0};
			idc = -1;
			text = "Arena";
			x = -0.1;
			y = 0;
			w = 0.6;
			h = (1 / 25);
		};
		
		class WantedConnection : Title {
			idc = 5105;
			style = 1;
			text = "connection";
		};
		
		class LobbyList : Life_RscListBox 
		{
			idc = 5001;
			text = "";
			sizeEx = 0.035;
			onLBSelChanged = "[] call life_fnc_qbjgoxshnqgnpmcoeaykwqoucvlkvukkhmazswyjrfmgrzthqowaqxrjt";
			
			x = -0.08; y = 0.06;
			w = 0.25; h = 0.8;
		};
		
		
		
		class LobbyName : Life_RscText
		{
			idc = 5201;
			text = "Namn:";
			x = 0.20;
			y = 0.06;
			w = 0.6;
			h = (1/25);
		};
		
		class LobbyNameEnter : Life_RscEdit
		{
			idc = 5202;
			text = "";
			x = 0.31;
			y = 0.06;
			w = (13 / 40);
			h = (1 / 25);
		};
		
		class Password : Life_RscText
		{
			idc = 5204;
			text = "Lösen:";
			x = 0.20;
			y = 0.08 + (1/25);
			w = 0.6;
			h = (1/25);
		};
		
		class PasswordEnter : Life_RscEdit
		{
			idc = 5205;
			text = "";
			x = 0.31;
			y = 0.08 + (1/25);
			w = (13 / 40);
			h = (1 / 25);
		};
		
		class CreateLobbyKey : Life_RscButtonMenu {
			idc = 5203;
			text = "Skapa lobby";
			tooltip = "Skapa lobbyn med de valda inställningarna!";
			onButtonClick = "[] call life_fnc_hrcgxevrlytjmcrfxxyyracdhswbdbumqjcyhmdgsfhrxiiwmhmkxg;";
			x = 0.26 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.8 - (1 / 25);
			w = (10 / 40);
			h = 1.9 * (1 / 25);
		};
		
		
		
		
		
		class LobbyHost : Life_RscText
		{
			idc = 5301;
			text = "Värd: ";
			x = 0.55;
			y = 0.06;
			w = 0.6;
			h = (1/25);
		};
		
		class BlueTeam : Life_RscText
		{
			idc = 5305;
			text = "Blåa laget:";
			x = 0.31;
			y = 0.55;
			w = 0.4;
			h = (1/25);
		};
		
		class BlueList : Life_RscListBox 
		{
			idc = 5302;
			text = "";
			sizeEx = 0.035;
			
			x = 0.22; y = 0.6;
			w = 0.30; h = 0.34;
		};
		
		class RedTeam : Life_RscText
		{
			idc = 5306;
			text = "Röda laget:";
			x = 0.65;
			y = 0.55;
			w = 0.4;
			h = (1/25);
		};
		
		class RedList : Life_RscListBox 
		{
			idc = 5303;
			text = "";
			sizeEx = 0.035;
			
			x = 0.56; y = 0.6;
			w = 0.30; h = 0.34;
		};
		
		class JoinBlueKey : Life_RscButtonMenu {
			idc = 5309;
			text = "Joina blå";
			tooltip = "Gå med i det blå laget!";
			onButtonClick = "[0] call life_fnc_xlbqtcjmmdhjerukkkzawsfyeigfnyadisrzmtmaahdaitmrgwfasi;";
			x = 0.27 + (1 / 250 / (safezoneW / safezoneH));
			y = 0.50;
			w = (8 / 40);
			h = 1.2 * (1 / 25);
		};
		
		class JoinRedKey : Life_RscButtonMenu {
			idc = 5308;
			text = "Joina röd";
			tooltip = "Gå med i det röda laget!";
			onButtonClick = "[1] call life_fnc_xlbqtcjmmdhjerukkkzawsfyeigfnyadisrzmtmaahdaitmrgwfasi;";
			x = 0.27 + (13.75 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.50;
			w = (8 / 40);
			h = 1.2 * (1 / 25);
		};
		
		class StartGameKey : Life_RscButtonMenu {
			idc = 5310;
			text = "Starta";
			tooltip = "Starta matchen";
			onButtonClick = "[] call life_fnc_tgqcsxllhqthtxtxgvixewlnzasxwpbzaocccpkqjtuuagzvwfimp;";
			x = 0.27 + (1 / 250 / (safezoneW / safezoneH)) - (1 / 40);
			y = 0.50;
			w = (10 / 40);
			h = 1.2 * (1 / 25);
		};
		
		class DeleteLobbyKey : Life_RscButtonMenu {
			idc = 5311;
			text = "Radera lobbyn";
			tooltip = "Radera lobbyn";
			onButtonClick = "[] call life_fnc_ksmxjdquldiomffbfqlsfwtecekaaonnwqjswohnrpldntgfiedd;";
			x = 0.27 + (12.75 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.50;
			w = (10 / 40);
			h = 1.2 * (1 / 25);
		};
		
		
		
		class CloseButtonKey : Life_RscButtonMenu {
			idc = -1;
			text = "Stäng";
			onButtonClick = "closeDialog 0;";
			x = -0.1;
			y = 1.0 - (10 / 250);
			w = (6.25 / 40);
			h = (1 / 25);
		};
		
		class RefreshButtonKey : Life_RscButtonMenu {
			idc = 2407;
			text = "Refresh";
			onButtonClick = "[1] call life_fnc_qgdtuhpajgjpukcdknpfzcuilqojmyzfasjqgvcoilzwhqqcxdpy;";
			tooltip = "";
			x = 0.06;
			y = 1.0 - (10 / 250));
			w = (6.25 / 40);
			h = (1 / 25);
		};
		
		class CreateLobbyButtonKey : Life_RscButtonMenu {
			idc = 5101;
			text = "Skapa";
			tooltip = "Tryck här för att skapa en ny lobby";
			onButtonClick = "[2] call life_fnc_qgdtuhpajgjpukcdknpfzcuilqojmyzfasjqgvcoilzwhqqcxdpy;";
			x = -0.04;
			y = 0.86 + (2 / 250);
			w = (6.25 / 40);
			h = (1 / 25);
		};
	};
};
