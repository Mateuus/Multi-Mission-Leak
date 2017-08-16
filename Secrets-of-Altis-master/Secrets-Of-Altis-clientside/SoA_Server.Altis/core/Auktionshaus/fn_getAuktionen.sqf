disableSerialization;
private["_display","_warenbox","_vItem"];

AH_loaded = false;
[0,player] remoteExecCall ["HClient_fnc_SAH_reciever",life_HC];
waitUntil {AH_loaded};

_display = finddisplay 640;
_warenbox = _display displayCtrl 641;
lbclear _warenbox;

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
            _warenbox lnbSetData [[((lnbSize _warenbox) select 0)-1,0],format ["%1",[_pid,_item,_price,_menge]]];
            _warenbox lnbSetPicture [[((lnbSize _warenbox) select 0)-1,0],_icon];
        };

        if(_item isKindOf "Car" OR _item isKindOf "Air") then {
            _vehicleInfo = [_item] call life_fnc_fetchVehInfo;
            _colorVehicle = [(_vehicleInfo select 0),_color] call life_fnc_vehicleColorStr;
            _text = format["(%1)",_colorVehicle];
            if(_text == "()") then {_text = ""};

            _warenbox lnbAddRow [format["%1 (%2)",(_vehicleInfo select 3),_text],_nameSeller,format["%1 Stk.",_menge],"k.A.",format["%1€",([_price] call life_fnc_numberText)]];
            _warenbox lnbSetData [[((lnbSize _warenbox) select 0)-1,0],format ["%1",[_pid,_item,_price,_menge,_color]]];
            _warenbox lnbSetPicture [[((lnbSize _warenbox) select 0)-1,0],(_vehicleInfo select 2)];
        };

        if(!(_item in life_inv_items) && !(_item isKindOf "Car" OR _item isKindOf "Air")) then {
            _warenbox lnbAddRow [(([_item] call life_fnc_fetchCfgDetails) select 1),_nameSeller,format["%1 Stk.",_menge],"k.A.",format["%1€",([_price] call life_fnc_numberText)]];
            _warenbox lnbSetData [[((lnbSize _warenbox) select 0)-1,0],format ["%1",[_pid,_item,_price,_menge]]];
            _warenbox lnbSetPicture [[((lnbSize _warenbox) select 0)-1,0],([_item] call life_fnc_fetchCfgDetails select 2)];
        };
    };
} forEach AH_offers;