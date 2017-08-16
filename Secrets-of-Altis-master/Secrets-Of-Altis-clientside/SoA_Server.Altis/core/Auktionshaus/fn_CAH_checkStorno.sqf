private["_dialog","_warenbox","_sofortkauf","_selectedOffer","_seller","_old"];

disableSerialization;
_dialog = findDisplay 15100;
_warenbox = _dialog displayCtrl 15101;
_sofortkauf = _dialog displayCtrl 15015;

if(isnull _dialog) exitWith {};
if(lnbCurSelRow _warenbox == -1) exitWith {};

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