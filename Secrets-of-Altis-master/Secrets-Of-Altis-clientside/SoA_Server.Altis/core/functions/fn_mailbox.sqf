#include <macro.h>
private["_mode""_item","_menge","_mailbox","_mailicon","_ui","_icon","_itemdata","_itemname","_index","_handled","_arr"];
DisableSerialization;

_mode = _this select 0;
_ui = uiNameSpace getVariable ["playerHUD",displayNull];
_mailicon = _ui displayCtrl 50;
_mailbox = getControl(7100,7101);

switch(_mode) do {
	case 0: {
		if(life_mailbox isEqualTo []) exitWith {hint "Du hast keine Post."; ctrlEnable[7102,false]};
		
		ctrlEnable[7102,true];
		
		{
			_item = _x select 0;
			_menge = _x select 1;
			_von = _x select 2;
			_itemhandled = [_item,0] call life_fnc_varHandle;
			_icon = [_itemhandled] call life_fnc_itemIcon;
		
			_mailbox lbAdd format["%1 (%2x) von %3",[_itemhandled] call life_fnc_varToStr,_menge,_von];
			_mailbox lbSetData [(lbSize _mailbox)-1,format ["%1",[_item,_menge,_von]]];
			_mailbox lbSetPicture [(lbSize _mailbox)-1,_icon];
			_mailbox lbSetPictureColor [(lbSize _mailbox)-1, [1, 1, 1, 1]];
		} foreach life_mailbox;
	};

	case 1: {	
		_itemdata = call compile (_mailbox lbdata (lbCurSel 7101));
		_item = _itemdata select 0;
		_menge = _itemdata select 1;
		_itemhandled = [_item,0] call life_fnc_varHandle;
		_itemname = [_itemhandled] call life_fnc_varToStr;
		
		if([true,_item,_menge] call life_fnc_handleinv) then {

			_mailbox lbdelete (lbCurSel 7101);
			
			_index = -1;
			_handled = false;
			{
				_index = _index + 1;
				if (_x isEqualTo  _itemdata AND !_handled) then {life_mailbox deleteAt _index;_handled=true};
			} forEach life_mailbox;
			
			titleText [format ["%1 (%2x) wurde deinem Inventar hinzugefügt.",_itemname,_menge],"PLAIN DOWN"];
			if(life_mailbox isEqualTo []) then {_mailicon ctrlShow false; mailreceived = false; ctrlEnable[7102,false];};
			
		} else {hint "Zu wenig Platz im Inventar!"};
	};
	
	case 2: {
		_item = _this select 1;
		_menge = _this select 2;
		_von = _this select 3;
	
		life_mailbox pushback [_item,_menge,_von];

		hint "Post erhalten!";
		playsound "notification";
		
		if!(ctrlShown _mailicon) then {
			_mailicon ctrlShow true;
			mailreceived = true;
		};
	};
};