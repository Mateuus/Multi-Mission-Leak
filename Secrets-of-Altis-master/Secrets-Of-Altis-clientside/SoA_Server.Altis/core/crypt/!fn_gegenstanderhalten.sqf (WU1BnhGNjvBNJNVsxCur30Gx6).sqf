
private["_item","_itemconvert","_itemname","_itempic","_ui","_name","_pic","_template"];
DisableSerialization;

_item = _this select 0;

_itemconvert = [_item,0] call life_fnc_varHandle;
_itemname = [_itemconvert] call life_fnc_varToStr;
_itempic = [_itemconvert] call life_fnc_itemIcon;

10 cutRsc ["life_popup", "PLAIN", 0.5, false];
playsound "gegenstand";

_ui = uiNameSpace getVariable "life_popup";
_name = _ui displayCtrl 6101;
_pic = _ui displayCtrl 6102;
_template = _ui displayCtrl 6103;
_name ctrlSetText format["%1",_itemname];
_pic ctrlSetText format["%1",_itempic];
_template ctrlSetText "images\hud\gegenstanderhalten.paa";