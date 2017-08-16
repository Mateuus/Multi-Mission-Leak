private["_display","_message"];
disableSerialization;
_message = _this select 0;
[parseText format["<t size='2'>FLASH INFO </t>",player getVariable["realname",name player]],parseText format["<t size='1.2'>%1 - %1 - %1</t>",_message]] spawn BIS_fnc_AAN;
uiSleep 50;
_display = uinamespace getvariable "BIS_AAN";
_display closeDisplay 0; 