//name,colors,classname,buyprice,sellprice,stock,description,ding


fnc_placec4 = {
	createDialog "c4timer";
};

fnc_c4buttonup = {
_c4pic_array = ["\A3L_Client2\c4files\pic0.paa","\A3L_Client2\c4files\pic1.paa","\A3L_Client2\c4files\pic2.paa","\A3L_Client2\c4files\pic3.paa","\A3L_Client2\c4files\pic4.paa","\A3L_Client2\c4files\pic5.paa","\A3L_Client2\c4files\pic6.paa","\A3L_Client2\c4files\pic7.paa","\A3L_Client2\c4files\pic8.paa","\A3L_Client2\c4files\pic9.paa"];
_eentallenpic = ctrltext 154269;
_tientallenpic = ctrltext 154268;
_eentallen = _c4pic_array find _eentallenpic;
_tientallen = _c4pic_array find _tientallenpic;

if (_eentallen == 9) then {
	if (_tientallen == 5) then {
		_eentallen = 0;
		_tientallen = 0;
	} else {
		_tientallen = _tientallen + 1;
		_eentallen = 0;
	};
} else {
	_eentallen = _eentallen + 1;
};

_eentallenpicn = _c4pic_array select _eentallen;
_tientallenpicn = _c4pic_array select _tientallen;
player say "c4_buttons";
((uiNamespace getVariable "c4timer") displayCtrl 154269) ctrlSetText _eentallenpicn; //eentallen
((uiNamespace getVariable "c4timer") displayCtrl 154268) ctrlSetText _tientallenpicn; //tientallen
};


fnc_c4buttondown = {
_c4pic_array = ["\A3L_Client2\c4files\pic0.paa","\A3L_Client2\c4files\pic1.paa","\A3L_Client2\c4files\pic2.paa","\A3L_Client2\c4files\pic3.paa","\A3L_Client2\c4files\pic4.paa","\A3L_Client2\c4files\pic5.paa","\A3L_Client2\c4files\pic6.paa","\A3L_Client2\c4files\pic7.paa","\A3L_Client2\c4files\pic8.paa","\A3L_Client2\c4files\pic9.paa"];
_eentallenpic = ctrltext 154269;
_tientallenpic = ctrltext 154268;
_eentallen = _c4pic_array find _eentallenpic;
_tientallen = _c4pic_array find _tientallenpic;

	if (_eentallen == 0) then {
		if (_tientallen == 0) then {
			_eentallen = 9;
			_tientallen = 5;
		} else {
			_tientallen = _tientallen - 1;
			_eentallen = 9;
		};
	} else {
		_eentallen = _eentallen - 1;
	};

_eentallenpicn = _c4pic_array select _eentallen;
_tientallenpicn = _c4pic_array select _tientallen;
player say "c4_buttons";
((uiNamespace getVariable "c4timer") displayCtrl 154269) ctrlSetText _eentallenpicn; //eentallen
((uiNamespace getVariable "c4timer") displayCtrl 154268) ctrlSetText _tientallenpicn; //tientallen
};









