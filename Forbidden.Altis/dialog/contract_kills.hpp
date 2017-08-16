class life_contract_kills {
	idd = 2400;
	name= "life_contract_kills";
	movingEnable = false;
	enableSimulation = true;
	
	class controlsBackground {
		class Life_RscTitleBackground:Life_RscText {
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
			idc = -1;
			x = 0.1;
			y = 0.2;
			w = 0.6;
			h = (1 / 25);
		};
		
		class MainBackground:Life_RscText {
			colorBackground[] = {0, 0, 0, 0.7};
			idc = -1;
			x = 0.1;
			y = 0.2 + (11 / 250);
			w = 0.6;
			h = 0.6 - (22 / 250);
		};
	};
	
	class controls {

		
		class Title : Life_RscTitle {
			colorBackground[] = {0, 0, 0, 0};
			idc = -1;
			text = "Contract kills";
			x = 0.1;
			y = 0.2;
			w = 0.6;
			h = (1 / 25);
		};
		
		class WantedConnection : Title {
			idc = 2404;
			style = 1;
			text = "";
		};
		
		class WantedList : Life_RscListBox 
		{
			idc = 2401;
			text = "";
			sizeEx = 0.035;
			onLBSelChanged = "[] call life_fnc_contractInfo";
			
			x = 0.12; y = 0.26;
			w = 0.2; h = 0.4;
		};
		
		class WantedDetails : Life_RscListBox
		{
			idc = 2402;
			text = "";
			sizeEx = 0.035;
			colorBackground[] = {0, 0, 0, 0};
			
			x = 0.34;
			y = 0.40;
			w = 0.36;
			h = 0.28;
		};
		
		class AlivePrice : Life_RscText
		{
			idc = 2423;
			text = "";
			x = 0.34;
			y = 0.04;
			w = 0.6;
			h = 0.6;
		};
		
		class DeadPrice : Life_RscText
		{
			idc = 2403;
			text = "";
			x = 0.34;
			y = 0.00;
			w = 0.6;
			h = 0.6;
		};
		
		
		
		class AlivePriceEnter : Life_RscEdit
		{
			idc = 2411;
			text = "";
			x = 0.18 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.39;
			w = (13 / 40);
			h = (1 / 25);
		};
		
		class ExecuteButtonKey : Life_RscButtonMenu {
			idc = 2409;
			text = "Add bounty";
			tooltip = "Add the selected bounty to the selected player";
			onButtonClick = "[] call life_fnc_kfxforisesreunorzbewnevbswvnydmxqgfpwnilaxoqyvgactditiwisrkf;";
			x = 0.23 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.48;
			w = (9 / 40);
			h = 1.2 * (1 / 25);
		};
		
		class AliveButtonKey : Life_RscButtonMenu {
			idc = 2426;
			text = "Alive";
			tooltip = "Use this button if the wanted player was captured alive (full amount)";
			onButtonClick = "[false] call life_fnc_tppegvqxhhptavvmkqydwakhmklnzdsoneeaaifskrnebwsxzyzyibf;";
			x = 0.21 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.48;
			w = (4 / 40);
			h = 1.2 * (1 / 25);
		};
		
		class DeadButtonKey : Life_RscButtonMenu {
			idc = 2427;
			text = "Dead";
			tooltip = "Use this button if the wanted player was killed (half amount)";
			onButtonClick = "[true] call life_fnc_tppegvqxhhptavvmkqydwakhmklnzdsoneeaaifskrnebwsxzyzyibf;";
			x = 0.37 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.48;
			w = (4 / 40);
			h = 1.2 * (1 / 25);
		};
		
		
		
		class CloseButtonKey : Life_RscButtonMenu {
			idc = -1;
			text = "$STR_Global_Close";
			onButtonClick = "closeDialog 0;";
			x = -0.06 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.8 - (1 / 25);
			w = (6.25 / 40);
			h = (1 / 25);
		};
		
		class PardonButtonKey : Life_RscButtonMenu {
			idc = 2405;
			text = "Remove";
			onButtonClick = "[] call life_fnc_tppegvqxhhptavvmkqydwakhmklnzdsoneeaaifskrnebwsxzyzyibfClick;";
			tooltip = "Enter moderator menu to remove player from wanted list and reward killer.";
			x = 0.42 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.8 - (1 / 25);
			w = (6.25 / 40);
			h = (1 / 25);
		};
		
		class ListAllButtonKey : Life_RscButtonMenu {
			idc = 2407;
			text = "Online";
			onButtonClick = "[1] call life_fnc_ppwigoewfmpzhvrhzmghmjpqwujebkoiaoohwxhvukamrwebdsizitltu;";
			tooltip = "Show all online players (including non-targets)";
			x = 0.1 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.8 - (1 / 25);
			w = (6.25 / 40);
			h = (1 / 25);
		};
		
		class ListTargetsButtonKey : Life_RscButtonMenu {
			idc = 2417;
			text = "Targets";
			onButtonClick = "[2] call life_fnc_ppwigoewfmpzhvrhzmghmjpqwujebkoiaoohwxhvukamrwebdsizitltu;";
			tooltip = "Show all players with a price on their head (both online and offline)";
			x = 0.26 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.8 - (1 / 25);
			w = (6.25 / 40);
			h = (1 / 25);
		};
		
		class AddCrimesButtonKey : Life_RscButtonMenu {
			idc = 2408;
			text = "Select player";
			tooltip = "Open the function to add bounty with the selected player";
			onButtonClick = "[] call life_fnc_gyehzdxuttctzhnimonleksaiwwboidjfoikhxqaexwoxolqfmx;";
			x = 0.42 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.8 - (1 / 25);
			w = (6.25 / 40);
			h = (1 / 25);
		};
	};
};

