class life_my_gang_menu {
	idd = 9620;
	name= "life_my_gang_menu";
	movingEnable = false;
	enableSimulation = true;
	onLoad = "[false] spawn life_fnc_gangManagement;";
	
	class controlsBackground {
		class Life_RscTitleBackground:Life_RscText {
			colorBackground[] = {0.4, 0, 0, 0.7};
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
			text = "Gang Management";
			x = 0.1;
			y = 0.2;
			w = 0.6;
			h = (1 / 25);
		};
		
		class GangMemberList : Life_RscListBox 
		{
			idc = 9621;
			text = "";
			sizeEx = 0.035;
			
			x = 0.12; y = 0.26;
			w = 0.350; h = 0.370;
		};

		class CloseLoadMenu : Life_RscButtonMenu {
			idc = -1;
			text = "Close";
			onButtonClick = "closeDialog 0;[] call life_fnc_p_updateMenu";
			x = -0.06 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.8 - (1 / 25);
			w = (6.25 / 40);
			h = (1 / 25);
		};
		
		class GangLeave : Life_RscButtonMenu {
			idc = -1;
			text = "Leave";
			colorBackground[] = {0.5, 0, 0, 0.5};
			onButtonClick = "[] spawn life_fnc_leaveGang";
			x = 0.50;
			y = 0.26;
			w = (6.25 / 40);
			h = (1 / 25);
		};
		
		class GangInvite : Life_RscButtonMenu 
		{
			idc = 9622;
			text = "Invite";
			colorBackground[] = {0.5, 0, 0, 0.5};
			onButtonClick = "[false] call life_fnc_inviteGang";
			x = 0.50;
			y = 0.31;
			w = (6.25 / 40);
			h = (1 / 25);
		};
		
		class GangKick : Life_RscButtonMenu 
		{
			idc = 9624;
			text = "Kick";
			colorBackground[] = {0.5, 0, 0, 0.5};
			onButtonClick = "[] spawn life_fnc_kickGang";
			x = 0.50;
			y = 0.36;
			w = (6.25 / 40);
			h = (1 / 25);
		};
		
		class GangPromote : Life_RscButtonMenu 
		{
			idc = 9625;
			text = "Promote";
			colorBackground[] = {0.5, 0, 0, 0.5};
			onButtonClick = "[true] spawn life_fnc_setRankGang";
			x = 0.50;
			y = 0.41;
			w = (6.25 / 40);
			h = (1 / 25);
		};
		
		class GangDemote : Life_RscButtonMenu 
		{
			idc = 9630;
			text = "Demote";
			colorBackground[] = {0.5, 0, 0, 0.5};
			onButtonClick = "[false] spawn life_fnc_setRankGang";
			x = 0.50;
			y = 0.46;
			w = (6.25 / 40);
			h = (1 / 25);
		};

		class GangWars : Life_RscButtonMenu 
		{
			idc = 9635;
			text = "Wars";
			colorBackground[] = {0.5, 0, 0, 0.5};
			onButtonClick = "createDialog ""life_gang_wars_diag""";
			x = 0.50;
			y = 0.51;
			w = (6.25 / 40);
			h = (1 / 25);
		};
		
		class setTag : Life_RscButtonMenu 
		{
			idc = 1337;
			text = "Set Tag";
			colorBackground[] = {0.5, 0, 0, 0.5};
			onButtonClick = "[1] call life_fnc_setTag";
			x = 0.50;
			y = 0.56;
			w = (6.25 / 40);
			h = (1 / 25);
		};
		
		class GangName : Title {
			idc = 9601;
			style = 1;
			text = "";
		};
	};
};

class Life_Create_Gang_Diag {
	idd = 9520;
	name= "life_my_gang_menu_create";
	movingEnable = false;
	enableSimulation = true;
	
	class controlsBackground {
		class Life_RscTitleBackground:Life_RscText {
			colorBackground[] = {0.4, 0, 0, 0.7};
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
			idc = -1;
			sizeEx = 0.020;
			text = "<t align='center'><t size='.8px'>Creating a gang here will convert this home into a gang house!<br>All gang members will be able to lock and unlock it.</t></t>";
			x = 0.1;
			y = 0.25;
			w = 0.5; h = 0.09;
		};
		
		class Title : Life_RscTitle {
			colorBackground[] = {0, 0, 0, 0};
			idc = -1;
			text = "Gang Management";
			x = 0.1;
			y = 0.2;
			w = 0.5;
			h = (1 / 25);
		};

		class CloseLoadMenu : Life_RscButtonMenu {
			idc = -1;
			text = "Close";
			onButtonClick = "closeDialog 0;";
			x = -0.06 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.5 - (1 / 25);
			w = (6.25 / 40);
			h = (1 / 25);
		};
		
		class GangCreateField : Life_RscButtonMenu {
			idc = -1;
			text = "Create";
			colorBackground[] = {0.5, 0, 0, 0.5};
			onButtonClick = "[] call life_fnc_doCreateGang;closeDialog 0;";
			x = 0.27;
			y = 0.40;
			w = (6.25 / 40);
			h = (1 / 25);
		};
		
		class CreateGangText : Life_RscEdit
		{
			idc = 9522;
			text = "Your Gang Name";
			
			x = 0.04 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.35;
			w = (13 / 40);
			h = (1 / 25);
		};
		
	};
};

class Life_Invite_Gang_Diag {
	idd = 9550;
	name= "life_my_gang_menu_invite";
	movingEnable = false;
	enableSimulation = true;
	
	class controlsBackground {
		class Life_RscTitleBackground:Life_RscText {
			colorBackground[] = {0.4, 0, 0, 0.7};
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
			idc = -1;
			sizeEx = 0.020;
			text = "<t align='center'><t size='.8px'>Select the player you wish to invite.</t></t>";
			x = 0.1;
			y = 0.25;
			w = 0.5; h = 0.05;
		};
		
		class Title : Life_RscTitle {
			colorBackground[] = {0, 0, 0, 0};
			idc = -1;
			text = "Gang Management";
			x = 0.1;
			y = 0.2;
			w = 0.5;
			h = (1 / 25);
		};

		class CloseLoadMenu : Life_RscButtonMenu {
			idc = -1;
			text = "Close";
			onButtonClick = "closeDialog 0;";
			x = -0.06 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.5 - (1 / 25);
			w = (6.25 / 40);
			h = (1 / 25);
		};
		
		class GangCreateField : Life_RscButtonMenu {
			idc = -1;
			text = "Invite";
			colorBackground[] = {0.5, 0, 0, 0.5};
			onButtonClick = "[true] spawn life_fnc_inviteGang;";
			x = 0.27;
			y = 0.40;
			w = (6.25 / 40);
			h = (1 / 25);
		};
		
		class PlayerList : Life_RscCombo 
		{
			idc = 9555;
			
			x = 0.04 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.30;
			w = 0.3; h = (1 / 25);
		};
		
	};
};

class life_gang_wars_diag {
	idd = 9580;
	name= "life_gang_wars_diag";
	movingEnable = false;
	enableSimulation = true;
	onLoad = "[] spawn life_fnc_gangWars;";
	
	class controlsBackground {
		class Life_RscTitleBackground:Life_RscText {
			colorBackground[] = {0.4, 0, 0, 0.7};
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
			text = "Gang War Management";
			x = 0.1;
			y = 0.2;
			w = 0.6;
			h = (1 / 25);
		};
		
		class GangMemberList : Life_RscListBox 
		{
			idc = 9581;
			text = "";
			sizeEx = 0.035;
			onLBSelChanged = "_this call life_fnc_warsLBChange";
			
			x = 0.12; y = 0.26;
			w = 0.350; h = 0.370;
		};

		class CloseLoadMenu : Life_RscButtonMenu {
			idc = -1;
			text = "Close";
			onButtonClick = "closeDialog 0;";
			x = -0.06 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.8 - (1 / 25);
			w = (6.25 / 40);
			h = (1 / 25);
		};
		
		class GangChallenge : Life_RscButtonMenu {
			idc = 9582;
			text = "Challenge";
			colorBackground[] = {0.5, 0, 0, 0.5};
			onButtonClick = "[] call life_fnc_challengeWar";
			x = 0.50;
			y = 0.26;
			w = (6.25 / 40);
			h = (1 / 25);
		};
		
		class GangAccept : Life_RscButtonMenu 
		{
			idc = 9583;
			text = "Accept";
			colorBackground[] = {0.5, 0, 0, 0.5};
			onButtonClick = "[false] call life_fnc_acceptWar";
			x = 0.50;
			y = 0.31;
			w = (6.25 / 40);
			h = (1 / 25);
		};
		
		class GangCancel : Life_RscButtonMenu 
		{
			idc = 9584;
			text = "Surrender";
			colorBackground[] = {0.5, 0, 0, 0.5};
			onButtonClick = "[] spawn life_fnc_cancelWar";
			x = 0.50;
			y = 0.36;
			w = (6.25 / 40);
			h = (1 / 25);
		};
	
		class GangName : Title {
			idc = 9585;
			style = 1;
			text = "";
		};
	};
};