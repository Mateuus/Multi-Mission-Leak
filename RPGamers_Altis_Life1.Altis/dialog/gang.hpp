class Life_My_Gang_Diag {
	idd = 2620;
	name= "life_my_gang_menu";
	movingEnable = 0;
	enableSimulation = 1;
	onLoad = "";
	
	class controlsBackground {
		class EXphone: life_RscPicture
		{
			idc = 3001;

			text = "textures\phone.paa"; //--- ToDo: Localize;
			x = 0.439625 * safezoneW + safezoneX;
			y = 0.14692 * safezoneH + safezoneY;
			w = 0.426562 * safezoneW;
			h = 0.725732 * safezoneH;
		};
		class Title: Life_RscTitle
		{
			idc = -1;

			text = "$STR_Gang_Title";
			x = 0.598437 * safezoneW + safezoneX;
			y = 0.248 * safezoneH + safezoneY;
			w = 0.2625 * safezoneW;
			h = 0.028 * safezoneH;
			colorText[] = {0.95,0.95,0.95,1};
		};
	};
	
	class controls {
		class GangMemberList: Life_RscListBox
		{
			idc = 2621;

			x = 0.549062 * safezoneW + safezoneX;
			y = 0.290666 * safezoneH + safezoneY;
			w = 0.18375 * safezoneW;
			h = 0.259 * safezoneH;
		};
		class GangLeave: Life_RscButtonMenu
		{
			onButtonClick = "[] call life_fnc_gangLeave";

			idc = 1006;
			text = "$STR_Gang_Leave";
			x = 0.549375 * safezoneW + safezoneX;
			y = 0.552667 * safezoneH + safezoneY;
			w = 0.118125 * safezoneW;
			h = 0.028 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0.5,0,0,0.5};
		};
		class GangLock: Life_RscButtonMenu
		{
			idc = 2622;
			onButtonClick = "[] spawn life_fnc_gangUpgrade";

			text = "$STR_Gang_UpgradeSlots";
			x = 0.549375 * safezoneW + safezoneX;
			y = 0.584 * safezoneH + safezoneY;
			w = 0.118125 * safezoneW;
			h = 0.028 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0.5,0,0,0.5};
		};
		class GangKick: Life_RscButtonMenu
		{
			idc = 2624;
			onButtonClick = "[] call life_fnc_gangKick";

			text = "$STR_Gang_Kick";
			x = 0.549875 * safezoneW + safezoneX;
			y = 0.617556 * safezoneH + safezoneY;
			w = 0.118125 * safezoneW;
			h = 0.028 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0.5,0,0,0.5};
		};
		class GangLeader: Life_RscButtonMenu
		{
			idc = 2625;
			onButtonClick = "[] spawn life_fnc_gangNewLeader";

			text = "$STR_Gang_SetLeader";
			x = 0.54925 * safezoneW + safezoneX;
			y = 0.652556 * safezoneH + safezoneY;
			w = 0.118125 * safezoneW;
			h = 0.028 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0.5,0,0,0.5};
		};
		class InviteMember: GangLeader
		{
			idc = 2630;
			onButtonClick = "[] spawn life_fnc_gangInvitePlayer";

			text = "$STR_Gang_Invite_Player";
			x = 0.54925 * safezoneW + safezoneX;
			y = 0.722555 * safezoneH + safezoneY;
			w = 0.065625 * safezoneW;
			h = 0.028 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0.5,0,0,0.5};
		};
		class DisbandGang: InviteMember
		{
			idc = 2631;
			onButtonClick = "[] spawn life_fnc_gangDisband";

			text = "$STR_Gang_Disband_Gang";
			x = 0.54925 * safezoneW + safezoneX;
			y = 0.686444 * safezoneH + safezoneY;
			w = 0.118125 * safezoneW;
			h = 0.028 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0.5,0,0,0.5};
		};
		class ColorList: Life_RscCombo
		{
			idc = 2632;

			x = 0.617125 * safezoneW + safezoneX;
			y = 0.724222 * safezoneH + safezoneY;
			w = 0.118125 * safezoneW;
			h = 0.021 * safezoneH;
		};
		class ButtonClose: Life_RscButtonInvisible
		{
			onButtonClick = "closeDialog 0;";

			idc = 1012;
			x = 0.601719 * safezoneW + safezoneX;
			y = 0.801 * safezoneH + safezoneY;
			w = 0.0820312 * safezoneW;
			h = 0.0875 * safezoneH;
			colorText[] = {1,1,1,0};
			colorBackground[] = {0,0,0,0};
			tooltip = "Go back"; //--- ToDo: Localize;
		};
	};
};

class Life_Create_Gang_Diag {
	idd = 2520;
	name= "life_my_gang_menu_create";
	movingEnable = 0;
	enableSimulation = 1;
	onLoad = "[] spawn {waitUntil {!isNull (findDisplay 2520)}; ((findDisplay 2520) displayCtrl 2523) ctrlSetText format[localize ""STR_Gang_PriceTxt"",[(getNumber(missionConfigFile >> 'Life_Settings' >> 'gang_price'))] call life_fnc_numberText]};";
	
	class controlsBackground {
		class EXphone: life_RscPicture
		{
			idc = 3001;

			text = "textures\phone.paa"; //--- ToDo: Localize;
			x = 0.439625 * safezoneW + safezoneX;
			y = 0.14692 * safezoneH + safezoneY;
			w = 0.426562 * safezoneW;
			h = 0.725732 * safezoneH;
		};
		class Title1 : Life_RscTitle
		{
			idc = -1;

			text = "$STR_Gang_Title";
			x = 0.598437 * safezoneW + safezoneX;
			y = 0.248 * safezoneH + safezoneY;
			w = 0.2625 * safezoneW;
			h = 0.028 * safezoneH;
			colorText[] = {0.95,0.95,0.95,1};
		};
	};
	
	class controls {
		class InfoMsg: Life_RscStructuredText
		{
			idc = 2523;

			x = 0.5525 * safezoneW + safezoneX;
			y = 0.332 * safezoneH + safezoneY;
			w = 0.177187 * safezoneW;
			h = 0.084 * safezoneH;
		};
		class GangCreateField: Life_RscButtonMenu
		{
			onButtonClick = "[] call life_fnc_createGang";

			idc = 1006;
			text = "$STR_Gang_Create";
			x = 0.605 * safezoneW + safezoneX;
			y = 0.472 * safezoneH + safezoneY;
			w = 0.0820312 * safezoneW;
			h = 0.028 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0.5,0,0,0.5};
		};
		class CreateGangText: Life_RscEdit
		{
			idc = 2522;

			text = "$STR_Gang_YGN";
			x = 0.559062 * safezoneW + safezoneX;
			y = 0.43 * safezoneH + safezoneY;
			w = 0.170625 * safezoneW;
			h = 0.028 * safezoneH;
		};
		class ButtonClose: Life_RscButtonInvisible
		{
			onButtonClick = "closeDialog 0;";

			idc = 1012;
			x = 0.601719 * safezoneW + safezoneX;
			y = 0.801 * safezoneH + safezoneY;
			w = 0.0820312 * safezoneW;
			h = 0.0875 * safezoneH;
			colorText[] = {1,1,1,0};
			colorBackground[] = {0,0,0,0};
			tooltip = "Go back"; //--- ToDo: Localize;
		};
	};
};

