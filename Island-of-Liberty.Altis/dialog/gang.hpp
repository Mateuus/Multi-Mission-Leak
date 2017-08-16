class Life_My_Gang_Diag {
	idd = 2620;
	name= "life_my_gang_menu";
	movingEnable = false;
	enableSimulation = true;
	onLoad = "";
	
	class controlsBackground {

		class pictureBackground: Life_RscPicture
		{
			idc = 2016;
			text = "icons\phone\gangtablet.paa";
			x = 0.185469 * safezoneW + safezoneX;
			y = 0.165 * safezoneH + safezoneY;
			w = 0.629062 * safezoneW;
			h = 0.659 * safezoneH;
		};
		
		class ButtonClose: Life_RscButtonMenu
		{
			idc = -1;
			onButtonClick = "closeDialog 0;[] call life_fnc_p_updateMenu;";
			text = " ";
			x = (38.53/52) * safezoneW + safezoneX;
			y = (6.5/30) * safezoneH + safezoneY;
			w = 0.048 * safezoneW;
			h = (17/30) * safezoneH;
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
	};
		
		
	class controls {
		
		class Title: Life_RscTitle
		{
			idc = 2629;
			x = 0.43229592 * safezoneW + safezoneX;
			y = 0.221 * safezoneH + safezoneY;
			w = 0.108281 * safezoneW;
			h = 0.033 * safezoneH;
		};

		class GangBank : Title
		{
			idc = 601;
			text = ""; //--- ToDo: Localize;
			style = 1;
			x = 0.524881 * safezoneW + safezoneX;
			y = 0.221 * safezoneH + safezoneY;
			w = 0.159844 * safezoneW;
			h = 0.033 * safezoneH;
		};		
		
		
		class GangMemberList: Life_RscListbox
		{
			idc = 2621;
			text = "";
			sizeEx = 0.025;
			x = 0.26644851 * safezoneW + safezoneX;
			y = 0.29491526 * safezoneH + safezoneY;
			w = 0.15384615 * safezoneW;
			h = 0.4237881 * safezoneH;
			colorBackground[] = {0,0,0,0.7};
		};
		
		class ColorList : Life_RscCombo
		{
			idc = 2632;
			x = 0.44230769 * safezoneW + safezoneX;
			y = 0.3151864 * safezoneH + safezoneY;
			w = 0.134062 * safezoneW;
			h = 0.022 * safezoneH;
		};
		
		class GangLock : Life_RscButtonMenu
		{
			idc = 2622;
			onButtonClick = "[] spawn life_fnc_gangUpgrade";
			x = 0.44486659 * safezoneW + safezoneX;
			y = 0.6779661 * safezoneH + safezoneY;
			w = 0.04230769 * safezoneW;
			h = 0.07457627 * safezoneH;
			tooltip = "Slots erweitern"; //--- ToDo: Localize;
			colorBackground[] = {-1,-1,-1,-1};
			colorBackgroundFocused[] = {-1,-1,-1,-1};
			colorBackground2[] = {-1,-1,-1,-1};
			color[] = {-1,-1,-1,-1};
			colorFocused[] = {-1,-1,-1,-1};
			color2[] = {-1,-1,-1,-1};
			colorText[] = {-1,-1,-1,-1};
			colorDisabled[] = {-1,-1,-1,-1};	
		};
		
		class GangKick : Life_RscButtonMenu 
		{
			idc = 2624;
			onButtonClick = "[] call life_fnc_gangKick";
			x = 0.56346153 * safezoneW + safezoneX;
			y = 0.6779661 * safezoneH + safezoneY;
			w = 0.04230769 * safezoneW;
			h = 0.07457627 * safezoneH;
			tooltip = "Spieler Rauswerfen"; //--- ToDo: Localize;
			colorBackground[] = {-1,-1,-1,-1};
			colorBackgroundFocused[] = {-1,-1,-1,-1};
			colorBackground2[] = {-1,-1,-1,-1};
			color[] = {-1,-1,-1,-1};
			colorFocused[] = {-1,-1,-1,-1};
			color2[] = {-1,-1,-1,-1};
			colorText[] = {-1,-1,-1,-1};
			colorDisabled[] = {-1,-1,-1,-1};	
		};
		
		class GangLeader : Life_RscButtonMenu 
		{
			idc = 2625;
			onButtonClick = "[] spawn life_fnc_gangNewLeader";
			x = 0.50416406 * safezoneW + safezoneX;
			y = 0.6779661 * safezoneH + safezoneY;
			w = 0.04230769 * safezoneW;
			h = 0.07457627 * safezoneH;
			colorBackground[] = {-1,-1,-1,-1};
			colorBackgroundFocused[] = {-1,-1,-1,-1};
			colorBackground2[] = {-1,-1,-1,-1};
			color[] = {-1,-1,-1,-1};
			colorFocused[] = {-1,-1,-1,-1};
			color2[] = {-1,-1,-1,-1};
			colorText[] = {-1,-1,-1,-1};
			colorDisabled[] = {-1,-1,-1,-1};
			tooltip = "Neuen Anführer bestimmen";
		};

		class InviteMember : GangLeader
		{
			idc = 2630;
			onButtonClick = "[] spawn life_fnc_gangInvitePlayer";
			x = 0.58668269 * safezoneW + safezoneX;
			y = 0.3041864 * safezoneH + safezoneY;
			w = 0.0257812 * safezoneW;
			h = 0.044 * safezoneH;
			colorBackground[] = {-1,-1,-1,-1};
			colorBackgroundFocused[] = {-1,-1,-1,-1};
			colorBackground2[] = {-1,-1,-1,-1};
			color[] = {-1,-1,-1,-1};
			colorFocused[] = {-1,-1,-1,-1};
			color2[] = {-1,-1,-1,-1};
			colorText[] = {-1,-1,-1,-1};
			colorDisabled[] = {-1,-1,-1,-1};	
			tooltip = "Spieler einladen";
		};	
	
		class GangLeave : Life_RscButtonMenu 
		{
			idc = -1;
			onButtonClick = "[] spawn life_fnc_gangLeave";
			x = 0.622759 * safezoneW + safezoneX;
			y = 0.6779661 * safezoneH + safezoneY;
			w = 0.04230769 * safezoneW;
			h = 0.07457627 * safezoneH;
			colorBackground[] = {-1,-1,-1,-1};
			colorBackgroundFocused[] = {-1,-1,-1,-1};
			colorBackground2[] = {-1,-1,-1,-1};
			color[] = {-1,-1,-1,-1};
			colorFocused[] = {-1,-1,-1,-1};
			color2[] = {-1,-1,-1,-1};
			colorText[] = {-1,-1,-1,-1};
			colorDisabled[] = {-1,-1,-1,-1};
			tooltip = "Gang verlassen";
		};
	
		class DisbandGang : InviteMember
		{
			idc = 2631;
			onButtonClick = "[] spawn life_fnc_gangDisband";
			x = 0.68205647 * safezoneW + safezoneX;
			y = 0.6779661 * safezoneH + safezoneY;
			w = 0.04230769 * safezoneW;
			h = 0.07457627 * safezoneH;
			tooltip = "Gang auflösen"; //--- ToDo: Localize;
			colorBackground[] = {-1,-1,-1,-1};
			colorBackgroundFocused[] = {-1,-1,-1,-1};
			colorBackground2[] = {-1,-1,-1,-1};
			color[] = {-1,-1,-1,-1};
			colorFocused[] = {-1,-1,-1,-1};
			color2[] = {-1,-1,-1,-1};
			colorText[] = {-1,-1,-1,-1};
			colorDisabled[] = {-1,-1,-1,-1};	
		};
	
	
	
		class RscText_1001: Life_RscText
		{
			idc = -1;
			text = "Spieler einladen"; //--- ToDo: Localize;
			x = 0.44230769 * safezoneW + safezoneX;
			y = 0.27118644 * safezoneH + safezoneY;
			w = 0.113437 * safezoneW;
			h = 0.044 * safezoneH;
		};


		
		class userAddPicture: Life_RscPicture
		{
			idc = -1;
			text = "icons\phone\addUser.paa";
			x = 0.58668269 * safezoneW + safezoneX;
			y = 0.3041864 * safezoneH + safezoneY;
			w = 0.0257812 * safezoneW;
			h = 0.044 * safezoneH;
			tooltip = "Spieler einladen";
		};
		
		class RscPicture_1202: Life_RscPicture
		{
			idc = -1;
			text = "icons\phone\userKick.paa";
			x = 0.56346153 * safezoneW + safezoneX;
			y = 0.6779661 * safezoneH + safezoneY;
			w = 0.04230769 * safezoneW;
			h = 0.07457627 * safezoneH;
			tooltip = "Spieler Rauswerfen";
		};
		
		class RscPicture_1203: Life_RscPicture
		{
			idc = -1;
			text = "icons\phone\deleteGang.paa";
			x = 0.68205647 * safezoneW + safezoneX;
			y = 0.6779661 * safezoneH + safezoneY;
			w = 0.04230769 * safezoneW;
			h = 0.07457627 * safezoneH;
			tooltip = "Gang auflösen";
		};
		
		class RscPicture_1204: Life_RscPicture
		{
			idc = -1;
			text = "icons\phone\addSlot.paa";
			x = 0.44486659 * safezoneW + safezoneX;
			y = 0.6779661 * safezoneH + safezoneY;
			w = 0.04230769 * safezoneW;
			h = 0.07457627 * safezoneH;
			tooltip = "Slots erweitern";
		};
		
		class RscPicture_1205: Life_RscPicture
		{
			idc = -1;
			text = "icons\phone\leaveGang.paa";
			x = 0.622759 * safezoneW + safezoneX;
			y = 0.6779661 * safezoneH + safezoneY;
			w = 0.04230769 * safezoneW;
			h = 0.07457627 * safezoneH;
			tooltip = "Gang verlassen";
		};

		class RscPicture_1206: Life_RscPicture
		{
			idc = -1;
			text = "icons\phone\newBoss.paa";
			x = 0.50416406 * safezoneW + safezoneX;
			y = 0.6779661 * safezoneH + safezoneY;
			w = 0.04230769 * safezoneW;
			h = 0.07457627 * safezoneH;
			tooltip = "Neuen Anführer bestimmen";
		};
	};
};


class Life_Create_Gang_Diag {
	idd = 2520;
	name= "life_my_gang_menu_create";
	movingEnable = false;
	enableSimulation = true;
	onLoad = "[] spawn {waitUntil {!isNull (findDisplay 2520)}; ((findDisplay 2520) displayCtrl 2523) ctrlSetText format[localize ""STR_Gang_PriceTxt"",[(getNumber(missionConfigFile >> 'Life_Settings' >> 'gang_price'))] call life_fnc_numberText]; if(!(""ItemRadio"" in (assignedItems  player))) then {((findDisplay 2520) displayCtrl 2016) ctrlSetText ""icons\phone\tafel_1024_hz.paa"";};};";
	
	class controlsBackground {

	
		class pictureBackground: Life_RscPicture
		{
			idc = 2017;
			text = "icons\phone\blanktablet.paa";
			x = 0.185469 * safezoneW + safezoneX;
			y = 0.165 * safezoneH + safezoneY;
			w = 0.629062 * safezoneW;
			//w = 0,7 * safezoneW;
			//h = 0.759 * safezoneH;
			h = 0.659 * safezoneH;
		};
		
		class ButtonClose: Life_RscButtonMenu
		{
			idc = -1;
			onButtonClick = "closeDialog 0;[] call life_fnc_p_updateMenu;";
			text = " ";
			x = (38.53/52) * safezoneW + safezoneX;
			y = (6.5/30) * safezoneH + safezoneY;
			w = 0.048 * safezoneW;
			h = (17/30) * safezoneH;
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
	};
		
		
	class controls {
	
class Title : Life_RscTitle
{
	idc = -1;

	text = "$STR_Gang_Title";
	x = 0.309219 * safezoneW + safezoneX;
	y = 0.221 * safezoneH + safezoneY;
	w = 0.108281 * safezoneW;
	h = 0.033 * safezoneH;
};
		class CreateGangText : Life_RscEdit
		{
			idc = 2522;
			text = "$STR_Gang_YGN";
			x = 0.381406 * safezoneW + safezoneX;
			y = 0.511 * safezoneH + safezoneY;
			w = 0.195937 * safezoneW;
			h = 0.044 * safezoneH;
		};
	
	
		class GangCreateField_icon: Life_RscPicture
		{
			idc = -1;
			text = "icons\phone\use.paa";
			x = 0.587656 * safezoneW + safezoneX;
			y = 0.511 * safezoneH + safezoneY;
			w = 0.0257812 * safezoneW;
			h = 0.044 * safezoneH;
		};
	
		class GangCreateField : Life_RscButtonMenu 
		{
			idc = -1;
			onButtonClick = "[] call life_fnc_createGang";
			x = 0.587656 * safezoneW + safezoneX;
			y = 0.511 * safezoneH + safezoneY;
			w = 0.0257812 * safezoneW;
			h = 0.044 * safezoneH;
			colorBackground[] = {-1,-1,-1,-1};
			colorBackgroundFocused[] = {-1,-1,-1,-1};
			colorBackground2[] = {-1,-1,-1,-1};
			color[] = {-1,-1,-1,-1};
			colorFocused[] = {-1,-1,-1,-1};
			color2[] = {-1,-1,-1,-1};
			colorText[] = {-1,-1,-1,-1};
			colorDisabled[] = {-1,-1,-1,-1};	
		};
	};
};
