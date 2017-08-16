class jailTime {
	idd = 1467;
	name= "life_cop_jail_jailTime";
	movingEnable = false;
	enableSimulation = true;
	onLoad = "[] spawn {waitUntil {!isNull (findDisplay 9920)}; ((findDisplay 9920) displayCtrl 9921) ctrlSetText ""Jail time (minutes):""};";
	
	class controlsBackground {
		class Life_RscTitleBackground:Life_RscText {
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
			idc = -1;
			x = 0.1;
			y = 0.2;
			w = 0.5;
			h = (1 / 25);
		};
		
		class MainBackground:Life_RscText {
			colorBackground[] = {0, 0, 0, 0.7};
			idc = -1;
			x = 0.1;
			y = 0.2 + (11 / 250);
			w = 0.5;
			h = 0.3 - (22 / 250);
		};
	};
	
	class controls {
	
		class InfoMsg : Life_RscStructuredText
		{
			idc = 9921;
			sizeEx = 0.020;
			text = "Set jail time (minutes)";
			x = 0.1;
			y = 0.25;
			w = 0.5; h = 0.11;
		};
		
		class Title : Life_RscTitle {
			colorBackground[] = {0, 0, 0, 0};
			idc = -1;
			text = "Send to jail";
			x = 0.1;
			y = 0.2;
			w = 0.5;
			h = (1 / 25);
		};

		class AdminCloseComp : Life_RscButtonMenu {
			idc = -1;
			text = "$STR_Global_Close";
			onButtonClick = "closeDialog 0;";
			x = -0.06 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.5 - (1 / 25);
			w = (6.25 / 40);
			h = (1 / 25);
		};
		
		class AdminCompensVer : Life_RscButtonMenu {
			idc = -1;
			text = "Jail";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "[life_pInact_curTarget] call life_fnc_thhsfexmndwxquaxsecnqtttxzjvzuuuxdhngtjtvmweiljpnitdxbxylwd";
			x = 0.27;
			y = 0.40;
			w = (6.25 / 40);
			h = (1 / 25);
		};
		
		class AdminCompensTex : Life_RscEdit
		{
			idc = 9922;
			text = "";
			x = 0.04 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.35;
			w = (13 / 40);
			h = (1 / 25);
		};
	};
};


class jailTimeAdmin {
	idd = 1467;
	name= "jailTimeAdmin";
	movingEnable = false;
	enableSimulation = true;
	onLoad = "[] spawn {waitUntil {!(isNull (findDisplay 1467))}; adminJailIndexR = (findDisplay 1467) displayAddEventhandler['Keydown',{if((_this select 1) == 28) then {[1] spawn life_fnc_eliycpwtfslwxqiaaizfowtkdglgnryluwnlydmyjjfvbdbhehebuir;};}]; waitUntil {isNull (findDisplay 1467)}; (findDisplay 1467) displayRemoveEventHandler ['KeyDown', adminJailIndexR];};";
	
	class controlsBackground {
		class Life_RscTitleBackground:Life_RscText {
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
			idc = -1;
			x = 0.1;
			y = 0.2;
			w = 0.5;
			h = (1 / 25);
		};
		
		class MainBackground:Life_RscText {
			colorBackground[] = {0, 0, 0, 0.7};
			idc = -1;
			x = 0.1;
			y = 0.2 + (11 / 250);
			w = 0.5;
			h = 0.3 - (22 / 250) + (3 / 25);
		};
	};
	
	class controls {
		
		class Title : Life_RscTitle {
			colorBackground[] = {0, 0, 0, 0};
			idc = -1;
			text = "Admin jail";
			x = 0.1;
			y = 0.2;
			w = 0.5;
			h = (1 / 25);
		};

		class PutInJail : Life_RscButtonMenu {
			idc = -1;
			text = "Jail";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "[1] spawn life_fnc_eliycpwtfslwxqiaaizfowtkdglgnryluwnlydmyjjfvbdbhehebuir;";
			x = 0.27;
			y = 0.40 + (3 / 25);
			w = (6.25 / 40);
			h = (1 / 25);
		};
		
		class CloseJailMenu : Life_RscButtonMenu {
			idc = -1;
			text = "$STR_Global_Close";
			onButtonClick = "closeDialog 0;";
			x = -0.06 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.5 + (2 / 25);
			w = (6.25 / 40);
			h = (1 / 25);
		};
		
		
		class GiveTime : Life_RscTitle
		{
			idc = 9921;
			
			text = "Tid (minuter)";
			x = 0.1;
			y = 0.25 - (5 / 250);
			w = 0.5; h = 0.11;
		};
		
		class TimeHere : Life_RscEdit
		{
			idc = 9922;
			text = "";
			x = 0.1;
			y = 0.35 - (10 / 250);
			w = (13 / 40);
			h = (1 / 25);
		};
		
		class GiveReason : Life_RscTitle
		{
			idc = 9923;
			
			text = "Anledning:";
			x = 0.1;
			y = 0.35 - (20 / 250) + (2 / 25);
			w = 0.5; h = 0.11;
		};
		
		class ReasonHere : Life_RscEdit
		{
			idc = 9924;
			text = "";
			x = 0.1;
			y = 0.45 - (25 / 250) + (2 / 25);
			w = (13 / 40);
			h = (1 / 25);
		};
		
		
	};
};

class safeRadius {
	idd = 1467;
	name= "life_cop_jail_jailTime";
	movingEnable = false;
	enableSimulation = true;
	onLoad = "[] spawn {waitUntil {!isNull (findDisplay 9920)}; ((findDisplay 9920) displayCtrl 9921) ctrlSetText ""Radie (meter):""};";
	
	class controlsBackground {
		class Life_RscTitleBackground:Life_RscText {
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
			idc = -1;
			x = 0.1;
			y = 0.2;
			w = 0.5;
			h = (1 / 25);
		};
		
		class MainBackground:Life_RscText {
			colorBackground[] = {0, 0, 0, 0.7};
			idc = -1;
			x = 0.1;
			y = 0.2 + (11 / 250);
			w = 0.5;
			h = 0.3 - (22 / 250);
		};
	};
	
	class controls {
	
		class InfoMsg : Life_RscStructuredText
		{
			idc = 9921;
			sizeEx = 0.020;
			text = "Radie (meter):";
			x = 0.1;
			y = 0.25;
			w = 0.5; h = 0.11;
		};
		
		class Title : Life_RscTitle {
			colorBackground[] = {0, 0, 0, 0};
			idc = -1;
			text = "Spawnkvadratens radie";
			x = 0.1;
			y = 0.2;
			w = 0.5;
			h = (1 / 25);
		};

		class AdminCloseComp : Life_RscButtonMenu {
			idc = -1;
			text = "$STR_Global_Close";
			onButtonClick = "closeDialog 0;";
			x = -0.06 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.5 - (1 / 25);
			w = (6.25 / 40);
			h = (1 / 25);
		};
		
		class AdminCompensVer : Life_RscButtonMenu {
			idc = -1;
			text = "Klar";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "[6] call ADP_fnc_setSpawn";
			x = 0.27;
			y = 0.40;
			w = (6.25 / 40);
			h = (1 / 25);
		};
		
		class AdminCompensTex : Life_RscEdit
		{
			idc = 9922;
			text = "";
			x = 0.04 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.35;
			w = (13 / 40);
			h = (1 / 25);
		};
	};
};


class radioMessage {
	idd = 1467;
	name= "life_radioMessage";
	movingEnable = false;
	enableSimulation = true;
	onLoad = "[] spawn {waitUntil {!isNull (findDisplay 9920)}; ((findDisplay 9920) displayCtrl 9921) ctrlSetText ""Radiomeddelande""};";
	
	class controlsBackground {
		class Life_RscTitleBackground:Life_RscText {
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
			idc = -1;
			x = 0.1;
			y = 0.2;
			w = 0.5;
			h = (1 / 25);
		};
		
		class MainBackground:Life_RscText {
			colorBackground[] = {0, 0, 0, 0.7};
			idc = -1;
			x = 0.1;
			y = 0.2 + (11 / 250);
			w = 0.5;
			h = 0.3 - (22 / 250);
		};
	};
	
	class controls {
	
		class InfoMsg : Life_RscStructuredText
		{
			idc = 9921;
			sizeEx = 0.020;
			text = "Radiomeddelande:";
			x = 0.1;
			y = 0.25;
			w = 0.5; h = 0.11;
		};
		
		class Title : Life_RscTitle {
			colorBackground[] = {0, 0, 0, 0};
			idc = -1;
			text = "Skicka ett radiomeddelande till alla Altisbor";
			x = 0.1;
			y = 0.2;
			w = 0.5;
			h = (1 / 25);
		};

		class AdminCloseComp : Life_RscButtonMenu {
			idc = -1;
			text = "$STR_Global_Close";
			onButtonClick = "closeDialog 0;";
			x = -0.06 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.5 - (1 / 25);
			w = (6.25 / 40);
			h = (1 / 25);
		};
		
		class AdminCompensVer : Life_RscButtonMenu {
			idc = 1876;
			text = "Skicka";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "[true] call life_fnc_bthqxeuwsvprqjadtkzqnihxwnisqgewjngluralfaeobxqdhrrwgskrt";
			x = 0.27;
			y = 0.40;
			w = (6.25 / 40);
			h = (1 / 25);
		};
		
		class AdminCompensTex : Life_RscEdit
		{
			idc = 9922;
			text = "";
			x = 0.04 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.35;
			w = (13 / 40);
			h = (1 / 25);
		};
	};
};

class jailQuestion {
	idd = 1467;
	name= "life_jailQuestion";
	movingEnable = false;
	enableSimulation = true;
	
	
	class controlsBackground {
		class Life_RscTitleBackground:Life_RscText {
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
			idc = -1;
			x = 0.1;
			y = 0.2;
			w = 0.5;
			h = (1 / 25);
		};
		
		class MainBackground:Life_RscText {
			colorBackground[] = {0, 0, 0, 0.7};
			idc = -1;
			x = 0.1;
			y = 0.2 + (11 / 250);
			w = 0.5;
			h = 0.3 - (22 / 250);
		};
	};
	
	class controls {
	
		class InfoMsg : Life_RscText
		{
			idc = 9921;
			
			text = "asdasd";
			x = 0.1;
			y = 0.25;
			w = 0.5; h = 0.11;
		};
		
		class Title : Life_RscTitle {
			colorBackground[] = {0, 0, 0, 0};
			idc = -1;
			text = "Svara för att gå vidare";
			x = 0.1;
			y = 0.2;
			w = 0.5;
			h = (1 / 25);
		};
		
		class AnswerQuestionButton : Life_RscButtonMenu {
			idc = 16856;
			text = "Svara";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "[] spawn life_fnc_azpkbanftwwoddtwudeiivsxerwfgrnmjowlnihvuhksckqmrsbexffbi";
			x = 0.27;
			y = 0.40;
			w = (6.25 / 40);
			h = (1 / 25);
		};
		
		class TextJailAnswer : Life_RscEdit
		{
			idc = 9922;
			text = "";
			onKeyDown = "if((_this select 1) in [28,156]) then {[] spawn life_fnc_azpkbanftwwoddtwudeiivsxerwfgrnmjowlnihvuhksckqmrsbexffbi};";
			x = 0.04 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.35;
			w = (13 / 40);
			h = (1 / 25);
		};
	};
};

class jailQuestion2 {
	idd = 1467;
	name= "life_jailQuestion2";
	movingEnable = false;
	enableSimulation = true;
	
	
	class controlsBackground {
		class Life_RscTitleBackground:Life_RscText {
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
			idc = -1;
			x = 0.1 - 0.2;
			y = 0.2;
			w = 0.9;
			h = (1 / 25);
		};
		
		class MainBackground:Life_RscText {
			colorBackground[] = {0, 0, 0, 0.7};
			idc = -1;
			x = 0.1 - 0.2;
			y = 0.2 + (11 / 250);
			w = 0.9;
			h = 0.8 - (22 / 250) + (4 / 25);
		};
	};
	
	class controls {
		
		class theQuestion : Life_RscTextPerks {
			colorBackground[] = {0, 0, 0, 0};
			idc = 2400;
			text = "asdasdt3wfw3efve4grbdv asf w32wefsvdewgrve4 rdvsd w3ef weds sdc";
			x = -0.1;
			y = 0.25 + (1 / 25);
			w = 0.9;
			h = 0.43;
		};
		
		class Title : Life_RscTitle {
			colorBackground[] = {0, 0, 0, 0};
			idc = -1;
			text = "Svara för att gå vidare";
			x = 0.1 - 0.2;
			y = 0.2;
			w = 0.9;
			h = (1 / 25);
		};
		
		class AnswerQuestionButtonA : Life_RscButtonMenu {
			idc = 16853;
			text = "Svara";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "['a'] spawn life_fnc_azpkbanftwwoddtwudeiivsxerwfgrnmjowlnihvuhksckqmrsbexffbi";
			x = 0.12 - 0.2;
			y = 0.90 - (45 / 250);
			w = (3.5 / 40);
			h = (1 / 25);
		};
		
		class AnswerQuestionButtonB : Life_RscButtonMenu {
			idc = 16854;
			text = "Svara";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "['b'] spawn life_fnc_azpkbanftwwoddtwudeiivsxerwfgrnmjowlnihvuhksckqmrsbexffbi";
			x = 0.12 - 0.2;
			y = 0.90 - (30 / 250);
			w = (3.5 / 40);
			h = (1 / 25);
		};
		
		class AnswerQuestionButtonC : Life_RscButtonMenu {
			idc = 16855;
			text = "Svara";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "['c'] spawn life_fnc_azpkbanftwwoddtwudeiivsxerwfgrnmjowlnihvuhksckqmrsbexffbi";
			x = 0.12 - 0.2;
			y = 0.90 - (15 / 250);
			w = (3.5 / 40);
			h = (1 / 25);
		};
		
		class AnswerQuestionButtonD : Life_RscButtonMenu {
			idc = 16856;
			text = "Svara";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "['d'] spawn life_fnc_azpkbanftwwoddtwudeiivsxerwfgrnmjowlnihvuhksckqmrsbexffbi";
			x = 0.12 - 0.2;
			y = 0.90;
			w = (3.5 / 40);
			h = (1 / 25);
		};
		
		class InfoMsgA : Life_RscText
		{
			idc = 9930;
			text = "";
			x = 0.12 + (3.8 / 40) - 0.2;
			y = 0.90 - (45 / 250);
			w = 0.9; 
			h = (1 / 25);
		};
		
		class InfoMsgB : Life_RscText
		{
			idc = 9931;
			text = "";
			x = 0.12 + (3.8 / 40) - 0.2;
			y = 0.90 - (30 / 250);
			w = 0.9; 
			h = (1 / 25);
		};
		
		class InfoMsgC : Life_RscText
		{
			idc = 9932;
			text = "";
			x = 0.12 + (3.8 / 40) - 0.2;
			y = 0.90 - (15 / 250);
			w = 0.9; 
			h = (1 / 25);
		};
		
		class InfoMsgD : Life_RscText
		{
			idc = 9933;
			text = "";
			x = 0.12 + (3.8 / 40) - 0.2;
			y = 0.90;
			w = 0.9; 
			h = (1 / 25);
		};
		
		class AbortButton : Life_RscButtonMenu {
			idc = 16956;
			text = "Avbryt testet";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "doingWeaponTest = false; closeDialog 0;";
			x = 0.13;
			y = 0.90 + (1 /25);
			w = (10 / 40);
			h = (1 / 25);
		};
		
		class InfoMsg0 : Life_RscText
		{
			idc = 9921;
			text = "Vet du inte vad som gäller? Gå in på vår hemsida och läs reglerna: ";
			x = 0;
			y = 0.90 + (2 /25);
			w = 0.9; h = 0.11;
		};
		
		class InfoMsg1 : Life_RscText
		{
			idc = -1;
			text = "www.publiclir.se | Gå in under Arma 3 > Regler";
			x = 0.13;
			y = 0.90 + (3 /25);
			w = 0.9; h = 0.11;
		};
	};
};

class jailQuestion3 {
	idd = 1467;
	name= "life_jailQuestion3";
	movingEnable = false;
	enableSimulation = true;
	
	
	class controlsBackground {
		class Life_RscTitleBackground:Life_RscText {
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
			idc = -1;
			x = 0.1 - 0.2;
			y = 0.2;
			w = 0.9;
			h = (1 / 25);
		};
		
		class MainBackground:Life_RscText {
			colorBackground[] = {0, 0, 0, 0.7};
			idc = -1;
			x = 0.1 - 0.2;
			y = 0.2 + (11 / 250);
			w = 0.9;
			h = 0.8 - (22 / 250) + (4 / 25);
		};
	};
	
	class controls {
		
		class theQuestion : Life_RscText {
			idc = 2400;
			text = "Vilken siffra sa jag precis?";
			x = -0.1;
			y = 0.25 + (1 / 25);
			w = 0.9;
			h = (1 / 25);
		};
		
		class Title : Life_RscTitle {
			colorBackground[] = {0, 0, 0, 0};
			idc = -1;
			text = "Svara för att gå vidare";
			x = 0.1 - 0.2;
			y = 0.2;
			w = 0.9;
			h = (1 / 25);
		};
		
		class AnswerQuestionButton1 : Life_RscButtonMenu {
			idc = 16853;
			text = "Siffran 1";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "['1'] spawn life_fnc_azpkbanftwwoddtwudeiivsxerwfgrnmjowlnihvuhksckqmrsbexffbi";
			x = 0.12 - 0.2;
			y = 0.25 + (3 / 25);
			w = (6 / 40);
			h = (15 / 250);
		};
		
		class AnswerQuestionButton2 : Life_RscButtonMenu {
			idc = 16854;
			text = "Siffran 2";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "['2'] spawn life_fnc_azpkbanftwwoddtwudeiivsxerwfgrnmjowlnihvuhksckqmrsbexffbi";
			x = 0.12 - 0.2 + (8 / 40);
			y = 0.25 + (3 / 25);
			w = (6 / 40);
			h = (15 / 250);
		};
		
		class AnswerQuestionButton3 : Life_RscButtonMenu {
			idc = 16855;
			text = "Siffran 3";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "['3'] spawn life_fnc_azpkbanftwwoddtwudeiivsxerwfgrnmjowlnihvuhksckqmrsbexffbi";
			x = 0.12 - 0.2 + (16 / 40);
			y = 0.25 + (3 / 25);
			w = (6 / 40);
			h = (15 / 250);
		};
		
		class AnswerQuestionButton4 : Life_RscButtonMenu {
			idc = 16856;
			text = "Siffran 4";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "['4'] spawn life_fnc_azpkbanftwwoddtwudeiivsxerwfgrnmjowlnihvuhksckqmrsbexffbi";
			x = 0.12 - 0.2;
			y = 0.25 + (6 / 25);
			w = (6 / 40);
			h = (15 / 250);
		};
		
		class AnswerQuestionButton5 : Life_RscButtonMenu {
			idc = 16857;
			text = "Siffran 5";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "['5'] spawn life_fnc_azpkbanftwwoddtwudeiivsxerwfgrnmjowlnihvuhksckqmrsbexffbi";
			x = 0.12 - 0.2 + (8 / 40);
			y = 0.25 + (6 / 25);
			w = (6 / 40);
			h = (15 / 250);
		};
		
		class AnswerQuestionButton6 : Life_RscButtonMenu {
			idc = 16858;
			text = "Siffran 6";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "['6'] spawn life_fnc_azpkbanftwwoddtwudeiivsxerwfgrnmjowlnihvuhksckqmrsbexffbi";
			x = 0.12 - 0.2 + (16 / 40);
			y = 0.25 + (6 / 25);
			w = (6 / 40);
			h = (15 / 250);
		};
		
		class AnswerQuestionButton7 : Life_RscButtonMenu {
			idc = 16859;
			text = "Siffran 7";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "['7'] spawn life_fnc_azpkbanftwwoddtwudeiivsxerwfgrnmjowlnihvuhksckqmrsbexffbi";
			x = 0.12 - 0.2;
			y = 0.25 + (9 / 25);
			w = (6 / 40);
			h = (15 / 250);
		};
		
		class AnswerQuestionButton8 : Life_RscButtonMenu {
			idc = 16860;
			text = "Siffran 8";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "['8'] spawn life_fnc_azpkbanftwwoddtwudeiivsxerwfgrnmjowlnihvuhksckqmrsbexffbi";
			x = 0.12 - 0.2 + (8 / 40);
			y = 0.25 + (9 / 25);
			w = (6 / 40);
			h = (15 / 250);
		};
		
		class AnswerQuestionButton9 : Life_RscButtonMenu {
			idc = 16861;
			text = "Siffran 9";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "['9'] spawn life_fnc_azpkbanftwwoddtwudeiivsxerwfgrnmjowlnihvuhksckqmrsbexffbi";
			x = 0.12 - 0.2 + (16 / 40);
			y = 0.25 + (9 / 25);
			w = (6 / 40);
			h = (15 / 250);
		};
		
		class InfoMsgA : Life_RscText
		{
			idc = 9930;
			text = "Hörde du inte?";
			x = 0.12 - 0.2;
			y = 0.25 + (15 / 25);
			w = 0.9; 
			h = (1 / 25);
		};
		
		class AnswerQuestionSurrender : Life_RscButtonMenu {
			idc = 16862;
			text = "Ge upp (+1 minut)";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "['surrender'] spawn life_fnc_azpkbanftwwoddtwudeiivsxerwfgrnmjowlnihvuhksckqmrsbexffbi";
			x = 0.12 - 0.2;
			y = 0.25 + (165 / 250);
			w = (12 / 40);
			h = (15 / 250);
		};
	};
};

class surveyDiag {
	idd = 85683;
	name= "surveyDiag";
	movingEnable = false;
	enableSimulation = true;
	
	class controlsBackground {
		class Life_RscTitleBackground:Life_RscText {
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
			idc = -1;
			x = 0.05;
			y = 0.05;
			w = 0.9;
			h = (1 / 25);
		};
		
		class MainBackground:Life_RscText {
			colorBackground[] = {0.1, 0.1, 0.1, 0.7};
			idc = -1;
			x = 0.05;
			y = 0.05 + (11 / 250);
			w = 0.9;
			h = 0.85 - (22 / 250) + (7 / 25);
		};
	};
	
	class controls {
		
		class Title : Life_RscTitle {
			colorBackground[] = {0, 0, 0, 0};
			idc = 26698;
			text = "Vi står nu inför ett stort beslut och behöver din åsikt!";
			x = 0.05;
			y = 0.05;
			w = 0.9;
			h = (1 / 25);
		};
		
		
		class theQuestion : Life_RscTextPerks {
			colorBackground[] = {0, 0, 0, 0};
			idc = 2400;
			text = "asdasdt3wfw3efve4grbdv asf w32wefsvdewgrve4 rdvsd w3ef weds sdc";
			x = 0.07;
			y = 0.15;
			w = 0.86;
			h = 0.365;
		};
		
		class theAnnouncement : Life_RscTextPerks {
			colorBackground[] = {0, 0, 0, 0};
			idc = 2401;
			text = "asdasdt3wfw3efve4grbdv asf w32wefsvdewgrve4 rdvsd w3ef weds sdc";
			x = 0.07;
			y = 0.15;
			w = 0.86;
			h = 0.85;
		};

		
		class SurveyCheckboxA : Life_Checkbox
		{
			idc = 2970;
			sizeEx = 0.04;
			onCheckedChanged = "['a',_this select 1,2970] call life_fnc_jbqkemehjbtvoisfmszohxdmswunhwgqrtapyubmvrsxcmnwehz;";
			x = 0.12 - 0.05;
			y = 0.75 - (45 / 250) - (1 / 25);
		};
		
		class SurveyCheckboxB : Life_Checkbox
		{
			idc = 2971;
			sizeEx = 0.04;
			onCheckedChanged = "['b',_this select 1,2971] call life_fnc_jbqkemehjbtvoisfmszohxdmswunhwgqrtapyubmvrsxcmnwehz;";
			x = 0.12 - 0.05;
			y = 0.75 - (30 / 250) - (1 / 25);
		};
		
		class SurveyCheckboxC : Life_Checkbox
		{
			idc = 2972;
			sizeEx = 0.04;
			onCheckedChanged = "['c',_this select 1,2972] call life_fnc_jbqkemehjbtvoisfmszohxdmswunhwgqrtapyubmvrsxcmnwehz;";
			x = 0.12 - 0.05;
			y = 0.75 - (15 / 250) - (1 / 25);
		};
		
		class SurveyCheckboxD : Life_Checkbox
		{
			idc = 2973;
			sizeEx = 0.04;
			onCheckedChanged = "['d',_this select 1,2973] call life_fnc_jbqkemehjbtvoisfmszohxdmswunhwgqrtapyubmvrsxcmnwehz;";
			x = 0.12 - 0.05;
			y = 0.75 - (1 / 25);
		};
		
		class SurveyCheckboxE : Life_Checkbox
		{
			idc = 2974;
			sizeEx = 0.04;
			onCheckedChanged = "['-',_this select 1,2974] call life_fnc_jbqkemehjbtvoisfmszohxdmswunhwgqrtapyubmvrsxcmnwehz;";
			x = 0.12 - 0.05;
			y = 0.75 + (15 / 250) - (1 / 25);
		};
		
		class InfoMsgA : Life_RscText
		{
			idc = 9930;
			text = "";
			x = 0.12;
			y = 0.75 - (45 / 250) - (1 / 25);
			w = 0.9; 
			h = (1 / 25);
		};
		
		class InfoMsgB : Life_RscText
		{
			idc = 9931;
			text = "";
			x = 0.12;
			y = 0.75 - (30 / 250) - (1 / 25);
			w = 0.9; 
			h = (1 / 25);
		};
		
		class InfoMsgC : Life_RscText
		{
			idc = 9932;
			text = "";
			x = 0.12;
			y = 0.75 - (15 / 250) - (1 / 25);
			w = 0.9; 
			h = (1 / 25);
		};
		
		class InfoMsgD : Life_RscText
		{
			idc = 9933;
			text = "";
			x = 0.12;
			y = 0.75 - (1 / 25);
			w = 0.9; 
			h = (1 / 25);
		};
		
		class InfoMsgE : Life_RscText
		{
			idc = 9934;
			text = "Annat / Vet ej";
			x = 0.12;
			y = 0.75 + (15 / 250) - (1 / 25);
			w = 0.9; 
			h = (1 / 25);
		};
		
		class ButtonNoAnswerSurvey : Life_RscButtonMenu {
			idc = 16859;
			text = "Svara";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "[] call life_fnc_nlniopvyqqbuhijbkydgmpyozjntbfjswfnrhmwdcjfmnqfcmuswlptyh";
			x = 0.23;
			y = 1.03; 
			w = (10 / 40);
			h = (1 / 25);
		};
		
		class ButtonConfirmSurvey : Life_RscButtonMenu {
			idc = 16860;
			text = "Uppfattat";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "[] call life_fnc_nlniopvyqqbuhijbkydgmpyozjntbfjswfnrhmwdcjfmnqfcmuswlptyh";
			x = 0.23;
			y = 1.03; 
			w = (10 / 40);
			h = (1 / 25);
		};
		
		class ButtonSurveyLater : Life_RscButtonMenu {
			idc = 16858;
			text = "Senare";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "closeDialog 0;";
			x = 0.23 + (11/40);
			y = 0.75 + (7 /25);
			w = (10 / 40);
			h = (1 / 25);
		};
		
		class SurveyMotivate : Life_RscText
		{
			idc = 1025;
			text = "Motivering (valfritt):";
			x = 0.4;
			y = 0.75 + (3 /25);
			w = 0.5;
			h = (1 / 25);
		};
		
		class MotivateField : Life_RscEdit
		{
			idc = 1026;
			text = "";
			x = 0.07;
			y = 0.76 + (4 /25);
			w = 0.86;
			h = (1 / 25);
		};
		
	};
};
