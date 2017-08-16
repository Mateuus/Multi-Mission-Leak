
private["_erfolg","_erfolgname","_ui","_name","_pic","_template"];
DisableSerialization;

_erfolg = _this select 0;
_erfolgname = [_erfolg] call life_fnc_varToShortStr;

10 cutRsc ["life_popup", "PLAIN", 0.5, false];
playsound "erfolg";

[0,format["[ERFOLG] %1 hat den Erfolg [%2] errungen!",name player,_erfolgname]] remoteExecCall ["life_fnc_broadcast",0];
life_serverpoints = life_serverpoints + 1;

_ui = uiNameSpace getVariable "life_popup";
_name = _ui displayCtrl 6101;
_pic = _ui displayCtrl 6102;
_template = _ui displayCtrl 6103;
_pic ctrlSetText "icons\erfolg.paa";
_name ctrlSetText format["%1",_erfolgname];
_template ctrlSetText "images\hud\erfolgerhalten.paa";