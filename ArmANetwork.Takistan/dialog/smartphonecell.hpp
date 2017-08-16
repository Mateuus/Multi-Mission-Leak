////////////////////////////////////////////////////////
// ArmA.Network
////////////////////////////////////////////////////////
class Life_my_smartphone {
	idd = 88888;
	name = "life_my_telephone_menu";
	movingEnable = false;
	enableSimulation = true;
	onLoad = "[] spawn life_fnc_smartphone;";

  class controlsBackground {
    class MessageBackground: Life_RscPicture
    {
    	idc = -1;
    	text = "icons\Messagingback.paa";
    	x = 0.0307812 * safezoneW + safezoneX;
    	y = -0.303 * safezoneH + safezoneY;
    	w = 0.928125 * safezoneW;
    	h = 1.606 * safezoneH;
      colorBackground[] = {0, 0, 0, 0};
    };
    class Write: Life_RscPicture
    {
    	idc = 1201;
    	text = "icons\WriteButton.paa";
    	x = 0.0307812 * safezoneW + safezoneX;
    	y = -0.303 * safezoneH + safezoneY;
    	w = 0.928125 * safezoneW;
    	h = 1.606 * safezoneH;
      colorBackground[] = {0, 0, 0, 0};
    };
		class WriteOverlay: Life_RscPicture
    {
    	idc = 12011;
    	text = "icons\WriteButtonOverlay.paa";
    	x = 0.0307812 * safezoneW + safezoneX;
    	y = -0.303 * safezoneH + safezoneY;
    	w = 0.928125 * safezoneW;
    	h = 1.606 * safezoneH;
      colorBackground[] = {0, 0, 0, 0};
    };
    class DeleteInbox: Life_RscPicture
    {
    	idc = 1202;
    	text = "icons\DeleteInboxButton.paa";
    	x = 0.0307812 * safezoneW + safezoneX;
    	y = -0.303 * safezoneH + safezoneY;
    	w = 0.928125 * safezoneW;
    	h = 1.606 * safezoneH;
      colorBackground[] = {0, 0, 0, 0};
    };
    class Emergency: Life_RscPicture
    {
    	idc = 1203;
    	text = "icons\EmergencyButton.paa";
    	x = 0.0307812 * safezoneW + safezoneX;
    	y = -0.303 * safezoneH + safezoneY;
    	w = 0.928125 * safezoneW;
    	h = 1.606 * safezoneH;
      colorBackground[] = {0, 0, 0, 0};
    };
  };
  class controls {
    class ListOfMessage: Life_RscListNBox
    {
    	idc = 88882;
      colorText[] = {0,0,0,1};
			onLBSelChanged = "[(lbCurSel 88882)] call life_fnc_showMsg;";
      sizeEx = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8)";
      columns[] = {0,0.4};
    	x = 0.412344 * safezoneW + safezoneX;
    	y = 0.313 * safezoneH + safezoneY;
    	w = 0.273281 * safezoneW;
    	h = 0.286 * safezoneH;
      colorBackground[] = {0,0,0,0};
    };
    class PlayerList: Life_RscListbox
    {
    	idc = 88881;
			onLBSelChanged = "[2] spawn life_fnc_smartphone;";
      colorText[] = {0,0,0,1};
      sizeEx = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8)";
    	x = 0.314375 * safezoneW + safezoneX;
    	y = 0.313 * safezoneH + safezoneY;
    	w = 0.0928125 * safezoneW;
    	h = 0.407 * safezoneH;
      colorBackground[] = {0,0,0,0};
    };
		class TextShow: Life_RscControlsGroup
    {
			/*
    	x = 0.412344 * safezoneW + safezoneX;
    	y = 0.632 * safezoneH + safezoneY;
    	w = 0.273281 * safezoneW;
    	h = 0.088 * safezoneH;
			*/
			x = 0.287501;
			y = 0.74;
			w = 0.662499;
			h = 0.16;
      colorBackground[] = {0,0,0,0};
      class HScrollbar : HScrollbar {
				height = 0;
				color[] = {0, 0, 0, 1};
			};
      class controls {
        class SingleMessageStructureText: Life_RscStructuredText
        {
        	idc = 88887;
          text = "";
          colorText[] = {0,0,0,1};
          size = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8)";
					x = 0;//0.412344 * safezoneW + safezoneX;
					y = 0;//0.643 * safezoneH + safezoneY;
					w = 0.637501;//0.262969 * safezoneW;
					h = 1;//0.066 * safezoneH;
          colorBackground[] = {0,0,0,0};
        };
      };
    };
    class WriteButtonInvisible: Life_RscButtonInvisible
    {
    	idc = 2401;
      tooltip = "Message Selected Player";
      onButtonClick = "createDialog ""Life_smartphone_schreiben"";";
    	x = 0.314375 * safezoneW + safezoneX;
    	y = 0.731 * safezoneH + safezoneY;
    	w = 0.0928125 * safezoneW;
    	h = 0.033 * safezoneH;
    };
    class DeleteButtonInvisible: Life_RscButtonInvisible
    {
    	idc = 2402;
      onButtonClick = "[3] call life_fnc_smartphone;";
      tooltip = "Delete Inbox";
    	x = 0.494844 * safezoneW + safezoneX;
    	y = 0.731 * safezoneH + safezoneY;
    	w = 0.0928125 * safezoneW;
    	h = 0.033 * safezoneH;
    };
    class EmergencyButtonInvisible: Life_RscButtonInvisible
    {
    	idc = 2403;
      onButtonClick = "createDialog ""Life_smartphone_notruf"";";
      tooltip = "Contact Emergency Services";
    	x = 0.592812 * safezoneW + safezoneX;
    	y = 0.731 * safezoneH + safezoneY;
    	w = 0.0928125 * safezoneW;
    	h = 0.033 * safezoneH;
    };
    class CloseButton: Life_RscButtonInvisible
    {
    	idc = -1;
      onButtonClick = "closeDialog 0;";
      tooltip = "Close Messaging";
    	x = 0.309219 * safezoneW + safezoneX;
    	y = 0.236 * safezoneH + safezoneY;
    	w = 0.0309375 * safezoneW;
    	h = 0.033 * safezoneH;
    };
  };
};

class Life_smartphone_notruf {
	idd = 887890;
	name= "life_my_smartphone_notruf";
	movingEnable = false;
	enableSimulation = true;
	onLoad = "[6] spawn life_fnc_newMsg;";

  class controlsBackground
	{
    class EmergencyBackground: Life_RscPicture
    {
    	idc = -1;
    	text = "icons\EmergencyMessageBackground.paa";
    	x = 0.0307812 * safezoneW + safezoneX;
    	y = -0.303 * safezoneH + safezoneY;
    	w = 0.928125 * safezoneW;
    	h = 1.606 * safezoneH;
      colorBackground[] = {0, 0, 0, 0};
    };
    class AdminRequest: Life_RscPicture
    {
    	idc = 1201;
    	text = "icons\AdminRequestOverlay.paa";
    	x = 0.0307812 * safezoneW + safezoneX;
    	y = -0.303 * safezoneH + safezoneY;
    	w = 0.928125 * safezoneW;
    	h = 1.606 * safezoneH;
      colorBackground[] = {0, 0, 0, 0};
    };
    class AdminRequestOverlay: Life_RscPicture
    {
    	idc = 12011;
    	text = "icons\AdminRequest.paa";
    	x = 0.0307812 * safezoneW + safezoneX;
    	y = -0.303 * safezoneH + safezoneY;
    	w = 0.928125 * safezoneW;
    	h = 1.606 * safezoneH;
      colorBackground[] = {0, 0, 0, 0};
    };
    class EMSRequest: Life_RscPicture
    {
    	idc = 1202;
    	text = "icons\EMSOverlay.paa";
    	x = 0.0307812 * safezoneW + safezoneX;
    	y = -0.303 * safezoneH + safezoneY;
    	w = 0.928125 * safezoneW;
    	h = 1.606 * safezoneH;
      colorBackground[] = {0, 0, 0, 0};
    };
    class EMSRequestOverlay: Life_RscPicture
    {
    	idc = 12021;
    	text = "icons\EMS.paa";
    	x = 0.0307812 * safezoneW + safezoneX;
    	y = -0.303 * safezoneH + safezoneY;
    	w = 0.928125 * safezoneW;
    	h = 1.606 * safezoneH;
      colorBackground[] = {0, 0, 0, 0};
    };
    class MechanicsRequest: Life_RscPicture
    {
    	idc = 1203;
    	text = "icons\MechanicsOverlay.paa";
    	x = 0.0307812 * safezoneW + safezoneX;
    	y = -0.303 * safezoneH + safezoneY;
    	w = 0.928125 * safezoneW;
    	h = 1.606 * safezoneH;
      colorBackground[] = {0, 0, 0, 0};
    };
    class MechanicsRequestOverlay: Life_RscPicture
    {
    	idc = 12031;
    	text = "icons\Mechanics.paa";
    	x = 0.0307812 * safezoneW + safezoneX;
    	y = -0.303 * safezoneH + safezoneY;
    	w = 0.928125 * safezoneW;
    	h = 1.606 * safezoneH;
      colorBackground[] = {0, 0, 0, 0};
    };
    class ServerMessage: Life_RscPicture
    {
    	idc = 1204;
    	text = "icons\ServerMessageOverlay.paa";
    	x = 0.0307812 * safezoneW + safezoneX;
    	y = -0.303 * safezoneH + safezoneY;
    	w = 0.928125 * safezoneW;
    	h = 1.606 * safezoneH;
      colorBackground[] = {0, 0, 0, 0};
    };
    class ServerMessageOverlay: Life_RscPicture
    {
    	idc = 12041;
    	text = "icons\ServerMessage.paa";
    	x = 0.0307812 * safezoneW + safezoneX;
    	y = -0.303 * safezoneH + safezoneY;
    	w = 0.928125 * safezoneW;
    	h = 1.606 * safezoneH;
      colorBackground[] = {0, 0, 0, 0};
    };
    class TextTSF: Life_RscPicture
    {
    	idc = 1205;
    	text = "icons\TextTSFOverlay.paa";
    	x = 0.0307812 * safezoneW + safezoneX;
    	y = -0.303 * safezoneH + safezoneY;
    	w = 0.928125 * safezoneW;
    	h = 1.606 * safezoneH;
      colorBackground[] = {0, 0, 0, 0};
    };
    class TextTSFOverlay: Life_RscPicture
    {
    	idc = 12051;
    	text = "icons\TextTSF.paa";
    	x = 0.0307812 * safezoneW + safezoneX;
    	y = -0.303 * safezoneH + safezoneY;
    	w = 0.928125 * safezoneW;
    	h = 1.606 * safezoneH;
      colorBackground[] = {0, 0, 0, 0};
    };
    class TextUN: Life_RscPicture
    {
    	idc = 1206;
    	text = "icons\TextUnOverlay.paa";
    	x = 0.0307812 * safezoneW + safezoneX;
    	y = -0.303 * safezoneH + safezoneY;
    	w = 0.928125 * safezoneW;
    	h = 1.606 * safezoneH;
      colorBackground[] = {0, 0, 0, 0};
    };
    class TextUNOverlay: Life_RscPicture
    {
    	idc = 12061;
    	text = "icons\TextUn.paa";
    	x = 0.0307812 * safezoneW + safezoneX;
    	y = -0.303 * safezoneH + safezoneY;
    	w = 0.928125 * safezoneW;
    	h = 1.606 * safezoneH;
      colorBackground[] = {0, 0, 0, 0};
    };
    class TSFAnnouncement: Life_RscPicture
    {
    	idc = 1207;
    	text = "icons\TSFAnnounceOverlay.paa";
    	x = 0.0307812 * safezoneW + safezoneX;
    	y = -0.303 * safezoneH + safezoneY;
    	w = 0.928125 * safezoneW;
    	h = 1.606 * safezoneH;
      colorBackground[] = {0, 0, 0, 0};
    };
    class TSFAnnouncementOverlay: Life_RscPicture
    {
    	idc = 12071;
    	text = "icons\TSFAnnounce.paa";
    	x = 0.0307812 * safezoneW + safezoneX;
    	y = -0.303 * safezoneH + safezoneY;
    	w = 0.928125 * safezoneW;
    	h = 1.606 * safezoneH;
      colorBackground[] = {0, 0, 0, 0};
    };
    class UNAnnouncement: Life_RscPicture
    {
    	idc = 1208;
    	text = "icons\UNAnnounceOverlay.paa";
    	x = 0.0307812 * safezoneW + safezoneX;
    	y = -0.303 * safezoneH + safezoneY;
    	w = 0.928125 * safezoneW;
    	h = 1.606 * safezoneH;
      colorBackground[] = {0, 0, 0, 0};
    };
    class UNAnnouncementOverlay: Life_RscPicture
    {
    	idc = 12081;
    	text = "icons\UNAnnounce.paa";
    	x = 0.0307812 * safezoneW + safezoneX;
    	y = -0.303 * safezoneH + safezoneY;
    	w = 0.928125 * safezoneW;
    	h = 1.606 * safezoneH;
      colorBackground[] = {0, 0, 0, 0};
    };
  };
  class controls {
    class EditText: Life_RscEdit
    {
    	idc = 888894;
      text = "";
      colorText[] = {0,0,0,1};
			colorBackground[] = {0,0,0,0};
      style = 16;
    	x = 0.314375 * safezoneW + safezoneX;
    	y = 0.313 * safezoneH + safezoneY;
    	w = 0.37125 * safezoneW;
    	h = 0.363 * safezoneH;
    };
    class CloseInvisible: Life_RscButtonInvisible
    {
    	idc = -1;
      onButtonClick = "closeDialog 0;";
    	x = 0.309219 * safezoneW + safezoneX;
    	y = 0.236 * safezoneH + safezoneY;
    	w = 0.0257812 * safezoneW;
    	h = 0.033 * safezoneH;
    };
    class TSFButton: Life_RscButtonInvisible
    {
    	idc = 2401;
			onButtonClick = "[2,-1,(ctrlText 888894)] call life_fnc_newMsg;";
    	x = 0.335 * safezoneW + safezoneX;
    	y = 0.698 * safezoneH + safezoneY;
    	w = 0.0773437 * safezoneW;
    	h = 0.022 * safezoneH;
    };
    class UNButton: Life_RscButtonInvisible
    {
    	idc = 2402;
			onButtonClick = "[3,-1,(ctrlText 888894)] call life_fnc_newMsg;";
    	x = 0.4175 * safezoneW + safezoneX;
    	y = 0.698 * safezoneH + safezoneY;
    	w = 0.0773437 * safezoneW;
    	h = 0.022 * safezoneH;
    };
    class EMSButton: Life_RscButtonInvisible
    {
    	idc = 2403;
			onButtonClick = "[4,-1,(ctrlText 888894)] call life_fnc_newMsg;";
    	x = 0.335 * safezoneW + safezoneX;
    	y = 0.731 * safezoneH + safezoneY;
    	w = 0.0773437 * safezoneW;
    	h = 0.022 * safezoneH;
    };
    class MechanicsButton: Life_RscButtonInvisible
    {
    	idc = 2404;
			//onButtonClick = "[5,-1,(ctrlText 888894)] call life_fnc_newMsg;";
    	x = 0.4175 * safezoneW + safezoneX;
    	y = 0.731 * safezoneH + safezoneY;
    	w = 0.0773437 * safezoneW;
    	h = 0.022 * safezoneH;
    };
    class RequestAdminButton: Life_RscButtonInvisible
    {
    	idc = 2405;
			onButtonClick = "[7,-1,(ctrlText 888894)] call life_fnc_newMsg;";
    	x = 0.5 * safezoneW + safezoneX;
    	y = 0.731 * safezoneH + safezoneY;
    	w = 0.0773437 * safezoneW;
    	h = 0.022 * safezoneH;
    };
    class AdminServerButton: Life_RscButtonInvisible
    {
    	idc = 2406;
			onButtonClick = "[8,-1,(ctrlText 888894)] call life_fnc_newMsg;";
    	x = 0.587656 * safezoneW + safezoneX;
    	y = 0.731 * safezoneH + safezoneY;
    	w = 0.0773437 * safezoneW;
    	h = 0.022 * safezoneH;
    };
    class TSFAnnouncementButton: Life_RscButtonInvisible
    {
    	idc = 2407;
			onButtonClick = "[9,-1,(ctrlText 888894)] call life_fnc_newMsg;";
    	x = 0.5 * safezoneW + safezoneX;
    	y = 0.698 * safezoneH + safezoneY;
    	w = 0.0773437 * safezoneW;
    	h = 0.022 * safezoneH;
    };
    class UNAnnouncementButton: Life_RscButtonInvisible
    {
    	idc = 2408;
			onButtonClick = "[10,-1,(ctrlText 888894)] call life_fnc_newMsg;";
    	x = 0.587656 * safezoneW + safezoneX;
    	y = 0.698 * safezoneH + safezoneY;
    	w = 0.0773437 * safezoneW;
    	h = 0.022 * safezoneH;
    };
  };
};

class Life_smartphone_schreiben
{
	idd = 88883;
	name = "life_my_smartphone_schreiben";
	movingEnable = false;
	enableSimulation = true;
	onLoad = "[0,(lbData[88881,(lbCurSel 88881)])] spawn life_fnc_newMsg;";

	class controlsBackground {
		class SendPlayerMessageBack: Life_RscPicture
		{
			idc = -1;
			text = "icons\WritePlayerMessageBackground.paa";
			x = 0.0307812 * safezoneW + safezoneX;
			y = -0.303 * safezoneH + safezoneY;
			w = 0.928125 * safezoneW;
			h = 1.606 * safezoneH;
			colorBackground[] = {0, 0, 0, 0};
		};
		class SendOverlayImage: Life_RscPicture
		{
			idc = 1201;
			text = "icons\SendOverlay.paa";
			x = 0.0307812 * safezoneW + safezoneX;
			y = -0.303 * safezoneH + safezoneY;
			w = 0.928125 * safezoneW;
			h = 1.606 * safezoneH;
			colorBackground[] = {0, 0, 0, 0};
		};
	};
	class controls {
		class MessagePlayer: Life_RscEdit
		{
			idc = 88884;
			style = 16;
			text = "";
			x = 0.314375 * safezoneW + safezoneX;
			y = 0.313 * safezoneH + safezoneY;
			w = 0.37125 * safezoneW;
			h = 0.418 * safezoneH;
			colorText[] = {0,0,0,1};
			colorBackground[] = {0,0,0,0};
		};
		class CloseMessageDialog: Life_RscButtonInvisible
		{
			idc = -1;
			onButtonClick = "closeDialog 0;";
			tooltip = "Return To Main Messaging Menu";
			x = 0.309219 * safezoneW + safezoneX;
			y = 0.236 * safezoneH + safezoneY;
			w = 0.0257812 * safezoneW;
			h = 0.033 * safezoneH;
		};
		class SendMessageButton: Life_RscButtonInvisible
		{
			idc = -1;
			tooltip = "Send Message to Selected Player";
			onButtonClick = "[1,-1,(ctrlText 88884)] call life_fnc_newMsg;";
			x = 0.453594 * safezoneW + safezoneX;
			y = 0.742 * safezoneH + safezoneY;
			w = 0.0876563 * safezoneW;
			h = 0.022 * safezoneH;
		};
	};
};
