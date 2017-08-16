class SettingsMenu
{
	idd = 2900;
	name = "SettingsMenu";
	movingEnabled = 1;
	enableSimulation = 1;
	
	class controlsBackground
	{
		class RscTitleBackground : life_RscText
		{
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
			idc = -1;
			x = 0.3;
			y = 0.2;
			w = 0.5;
			h = (1 / 25);
		};
		
		class RscMainBackground : life_RscText
		{
			colorBackground[] = {0,0,0,0.7};
			idc = -1;
			x = 0.3;
			y = 0.2 + (11 / 250);
			w = 0.5;
			h = 0.58 - (22 / 250);
		};
		
		class PlayerTagsHeader : Life_RscText
		{
			idc = -1;
			text = "$STR_SM_PlayerTags";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
			
			x = 0.30;
			y = 0.33;
			w = 0.35;
			h = (1 / 25);
		};
		
		class SideChatHeader : PlayerTagsHeader
		{
			idc = -1;
			text = "$STR_SM_SC";
			shadow = 0;
			
			y = 0.38;
		};
		
		class RevealNearestHeader : PlayerTagsHeader
		{
			idc = -1;
			text = "Visa närmaste objekten";
			
			y = 0.43;
		};
		
		class TurboHeader : PlayerTagsHeader
		{
			idc = -1;
			text = "Turbo";
			
			y = 0.48;
		};
		
		class StreamerHeader : PlayerTagsHeader
		{
			idc = -1;
			text = "Streamer mode";
			
			y = 0.53;
		};
		
		class CarHornHeader : life_RscText
		{
			idc = 3974;
			text = "Tuta bil:";
			
			x = 0.32;
			y = 0.63;
			w = 0.275; h = 0.04;
		};
		
		class AirHornHeader : life_RscText
		{
			idc = 3975;
			text = "Tuta flyg:";
			
			x = 0.32;
			y = 0.68;
			w = 0.275; h = 0.04;
		};
		
		class Title : life_RscTitle
		{
			idc = -1;
			colorBackground[] = {0,0,0,0};
			text = "$STR_SM_Title";
			x = 0.3;
			y = 0.2;
			w = 0.5;
			h = (1 / 25);
		};
	};
	
	class controls
	{
		class VDonFoot : life_RscText
		{
			idc = -1;
			text = "View:";
			
			x = 0.32; y = 0.258;
			w = 0.275; h = 0.04;
		};
		
		class VD_onfoot_slider : life_RscXSliderH 
		{
			idc = 2901;
			text = "";
			onSliderPosChanged = "[0,_this select 1] call life_fnc_ltgtkfffeegfyemdcauwkfclgmcgflyyuosszxmxqkabbslxniws;";
			tooltip = "View distance";
			x = 0.42;
			y = 0.30 - (1 / 25);
			
			w = "9 * 			(			((safezoneW / safezoneH) min 1.2) / 40)";
			h = "1 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
		
		class VD_onfoot_value : Life_RscEdit
		{
			idc = 2902;
			text = "";
			onChar = "[_this select 0, _this select 1,'ground',false] call life_fnc_pwrzjzrbbffznvkszcdocljzulhgdjmwxyacpswjcvvzgmhetbvqjtuqs;";
			onKeyUp = "[_this select 0, _this select 1,'ground',true] call life_fnc_pwrzjzrbbffznvkszcdocljzulhgdjmwxyacpswjcvvzgmhetbvqjtuqs;";
			
			x = .70; y = .258;
			w = .08; h = .04;
		};
		
		class PlayerTagsONOFF : Life_Checkbox
		{
			//text = "ON";
			tooltip = "$STR_GUI_PlayTags";
			idc = 2970;
			sizeEx = 0.04;
			onCheckedChanged = "['tags',_this select 1] call life_fnc_ubdsksldghyzjhcxtmlvexvkedniohkhannnmfswsxtdyoskdnnj;";
			x = 0.65;
			y = 0.33;
		};
		
		class SideChatONOFF : PlayerTagsONOFF
		{
			idc = 2971;
			tooltip = "Sätt på ekker stäng av allmänna frågor-chatten";
			onCheckedChanged = "['sidechat',_this select 1] call life_fnc_ubdsksldghyzjhcxtmlvexvkedniohkhannnmfswsxtdyoskdnnj;";

			y = 0.38;
		};
		
		class RevealONOFF : PlayerTagsONOFF
		{
			tooltip = "$STR_GUI_PlayerReveal";
			onCheckedChanged = "['objects',_this select 1] call life_fnc_ubdsksldghyzjhcxtmlvexvkedniohkhannnmfswsxtdyoskdnnj;";
			idc = 2972;
			y = 0.43;
		};
		
		class TurboONOFF : PlayerTagsONOFF
		{
			tooltip = "$STR_GUI_TurboPerk";
			onCheckedChanged = "['turbo',_this select 1] call life_fnc_ubdsksldghyzjhcxtmlvexvkedniohkhannnmfswsxtdyoskdnnj;";
			idc = 2973;
			y = 0.48;
		};
		
		class StreamerONOFF : PlayerTagsONOFF
		{
			tooltip = "$STR_GUI_StreamingMode";
			onCheckedChanged = "['streamer',_this select 1] call life_fnc_ubdsksldghyzjhcxtmlvexvkedniohkhannnmfswsxtdyoskdnnj;";
			idc = 2977;
			y = 0.53;
		};
		
		class GroundHornChoose : Life_RscCombo {
			idc = 2974;
			Tooltip = "Sätter tutan för markfordon (tuta med F). Denna funktion är exklusiv för VIP donator.";
			onLBSelChanged  = "['groundhorn',_this select 0,_this select 1] call life_fnc_rlbyemutxmbsypimwqcnghdcqwomnpbashnlzfpnarphlavxres;";
			x = 0.45; y = 0.63;
			w = 0.275; h = 0.03;
		
		};
		
		class AirHornChoose : Life_RscCombo {
			idc = 2975;
			Tooltip = "Sätter tutan för helikoptrar och flygplan (tuta med F). Denna funktion är exklusiv för VIP donator.";
			onLBSelChanged  = "['airhorn',_this select 0,_this select 1] call life_fnc_rlbyemutxmbsypimwqcnghdcqwomnpbashnlzfpnarphlavxres";
			x = 0.45; y = 0.68;
			w = 0.275; h = 0.03;
		
		};
		
		class ButtonClose : life_RscButtonMenu {
			idc = -1;
			//shortcuts[] = {0x00050000 + 2};
			text = "$STR_Global_Close";
			onButtonClick = "closeDialog 0;";
			x = 0.48;
			y = 0.78 - (1 / 25);
			w = (6.25 / 40);
			h = (1 / 25);
		};
	};
};