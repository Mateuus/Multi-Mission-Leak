private["_dialog","_warenbox","_verkaufbox","_mengenbox","_seltenbox","_preisbox","_sofortkauf","_vItem","_curOffer","_pid","_item","_price","_selectedOffer","_seller","_icon","_old"];

AH_loaded = false;
[0,player] remoteExecCall ["HClient_fnc_SAH_reciever",life_HC];
waitUntil {sleep 0.1; AH_loaded};
if(!dialog) then {createDialog "Auktionshaus";};
disableSerialization;
_dialog = findDisplay 15100;
_warenbox = _dialog displayCtrl 15101;
_sofortkauf = _dialog displayCtrl 15015;
_einstellen = _dialog displayCtrl 15016;
_verlassen = _dialog displayCtrl 15017;
_sofortkauf ctrlEnable false;

lbclear _warenbox;
_einstellen ctrlSetStructuredText parseText "<t size='0.9' valign='middle' align='center'>Ware einstellen</t>";
_verlassen ctrlSetStructuredText parseText "<t size='0.9' valign='middle' align='center'>Verlassen</t>";
_sofortkauf ctrlSetStructuredText parseText "<t size='0.9' valign='middle' align='center'>Sofortkauf!</t>";

{
    _curOffer = _x;
    _pid = _curOffer select 0;
    _item = _curOffer select 1;
    _price = _curOffer select 2;
	_menge = _curOffer select 3;
	_color = _curOffer select 4;
	_nameSeller = _curOffer select 5;
	
	if!(isnil "_menge") then 
	{
	    if(_item in life_inv_items) then {

	        _icon = [_item] call life_fnc_itemIcon;
	        _shrt = [_item,1] call life_fnc_varHandle;
	        _color = [_shrt] call life_fnc_classColors;

	    	_warenbox lnbAddRow [[_item] call life_fnc_varToStr,_nameSeller,format["%1 Stk.",_menge],format["%1",(_color select 0)],format["%1€",([_price] call life_fnc_numberText)]];
	    	_warenbox lnbSetColor [[((lnbSize _warenbox) select 0)-1,0],(_color select 1)];
	    	_warenbox lnbSetColor [[((lnbSize _warenbox) select 0)-1,3],(_color select 1)];
	        _warenbox lnbSetData [[((lnbSize _warenbox) select 0)-1,0],format ["%1",[_pid,_item,_price,_menge,0,_nameSeller]]];
	        _warenbox lnbSetPicture [[((lnbSize _warenbox) select 0)-1,0],_icon];
	    };

		if(_item isKindOf "Car" OR _item isKindOf "Air") then {
			_vehicleInfo = [_item] call life_fnc_fetchVehInfo;
			_colorVehicle = [(_vehicleInfo select 0),_color] call life_fnc_vehicleColorStr;
			_text = format["(%1)",_colorVehicle];
			if(_text == "()") then {_text = ""};

	    	_warenbox lnbAddRow [format["%1 (%2)",(_vehicleInfo select 3),_text],_nameSeller,format["%1 Stk.",_menge],"k.A.",format["%1€",([_price] call life_fnc_numberText)]];
	        _warenbox lnbSetData [[((lnbSize _warenbox) select 0)-1,0],format ["%1",[_pid,_item,_price,_menge,_color,_nameSeller]]];
	        _warenbox lnbSetPicture [[((lnbSize _warenbox) select 0)-1,0],(_vehicleInfo select 2)];
		};

		if(!(_item in life_inv_items) && !(_item isKindOf "Car" OR _item isKindOf "Air")) then {
	    	_warenbox lnbAddRow [(([_item] call life_fnc_fetchCfgDetails) select 1),_nameSeller,format["%1 Stk.",_menge],"k.A.",format["%1€",([_price] call life_fnc_numberText)]];
	        _warenbox lnbSetData [[((lnbSize _warenbox) select 0)-1,0],format ["%1",[_pid,_item,_price,_menge,0,_nameSeller]]];
	        _warenbox lnbSetPicture [[((lnbSize _warenbox) select 0)-1,0],([_item] call life_fnc_fetchCfgDetails select 2)];
		};
	};
} forEach AH_offers;

/*_old = "";

while{!isnull _dialog} do {
	WaitUntil {((lnbCurSelRow _warenbox != -1) && _warenbox lnbData [(lnbCurSelRow _warenbox),0] != _old) OR !dialog};

	if(!dialog OR (lnbCurSelRow _warenbox == -1)) exitWith {};

	_old = _warenbox lnbData [(lnbCurSelRow _warenbox),0];	
	_selectedOffer = call compile _old;
	_seller = _selectedOffer select 0;
	if(_seller == (getplayerUID player)) then {
		_sofortkauf ctrlEnable true;
		_sofortkauf ctrlSetStructuredText parseText "<t size='0.9' valign='middle' align='center'>Stornieren!</t>";
		_sofortkauf ctrlSetBackgroundColor [0.4, 0, 0, 0.8];
	} else {
		_sofortkauf ctrlEnable true;
		_sofortkauf ctrlSetStructuredText parseText "<t size='0.9' valign='middle' align='center'>Sofortkauf!</t>";
		_sofortkauf ctrlSetBackgroundColor [0.24,0.58,0,0.8];
	};
	uisleep 0.5;
};*/