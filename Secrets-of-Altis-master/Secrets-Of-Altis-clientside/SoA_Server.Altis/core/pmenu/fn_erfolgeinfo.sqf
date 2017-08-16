/*
		fn_erfolgeinfo.sqf
		Author: G00golplexian
		
		Description: Lists up the achievements in Z menu.
*/
private["_dialog","_liste","_side","_val","_str","_struct","_structimg","_mode","_title","_button"];

_mode = _this select 0;

switch(_mode) do {

	case 0: {
		createDialog "erfolge";
		disableSerialization;

		_dialog = findDisplay 2800;
		_liste = _dialog displayCtrl 2802;
		_button = _dialog displayCtrl 2803;
		_old = "";

		{

			_str = [_x] call life_fnc_varToShortStr;
			_img = [_x] call life_fnc_itemIcon;
			_val = missionNamespace getVariable _x;

			_liste ctrlSetTextColor[0,0,0,1];
			_liste lbadd format[" %1",_str];
			_liste lbSetData [(lbsize _liste)-1,_x];
			_liste lbsetPicture [(lbsize _liste)-1,_img];
			_liste lbSetColor [(lbsize _liste)-1,[0,1,0,1]];
			
			if(!_val) then
			{
				_liste lbSetPictureColor [(lbsize _liste)-1,[1,1,1,0.2]];
				_liste lbSetColor [(lbsize _liste)-1,[1,1,1,0.2]];
			};
		} foreach life_erfolge;
		
		_liste lbSetCurSel 0;
	};
	
	case 1: {
		createDialog "erfolgeBig";
		disableSerialization;
	
		_dialogListe = findDisplay 2800;
		_dialog = findDisplay 2830;
		_liste = _dialogListe displayCtrl 2802;
		_text = _dialog displayCtrl 2831;
		_icon = _dialog displayCtrl 2832;
		_title = _dialog displayCtrl 2833;
		_erfolg = (_liste lbData (lbCurSel _liste));
	
		_iconconverted = [_erfolg] call life_fnc_itemIcon;
		_textconverted = [_erfolg] call life_fnc_varToStr;
		_titleconverted = [_erfolg] call life_fnc_varToShortStr;
		
		_icon ctrlSetText _iconconverted;
		_text ctrlSetText _textconverted;
		_title ctrlsetText _titleconverted;
	};
};