/*-----------------------------------------------------------------------------

       Author: G00golplexian
       Name: fn_radiomod.sqf
       Description: Radio for all! Wuhu

------------------------------------------------------------------------------*/

private["_mode"];
disableSerialization;

_mode = _this select 0;

switch(_mode) do {

	case 0: 
	{
		if(radio_active) then {
			_radiobutton = (finddisplay 8000 displayCtrl 8001);
	 		_radiobutton ctrlSetText "OFF AIR";
	 		_radiobutton ctrlSetTextColor [1,0,0,1];
		} else {
	 		_radiobutton = (finddisplay 8000 displayCtrl 8001);
	 		_radiobutton ctrlSetText "ON AIR";
	 		_radiobutton ctrlSetTextColor [0,1,0,1];
		};
	};

	case 1: {
		if(radio_active) then {
			radio_active = false;
			publicVariable "radio_active";

			[4,format["<img size='8' color='#FFFFFF' image='images\werbung.paa'/><br/><br/><t size='2.5'>OFF AIR</t><br/> Radio Altis 95.8 bedankt sich bei allen Zuhörern."]] remoteExecCall ["life_fnc_broadcast",0];
		} else {
			radio_active = true;
			publicVariable "radio_active";

			[4,format["<img size='8' color='#FFFFFF' image='images\werbung.paa'/><br/><br/><t size='2.5'>ON AIR</t><br/> Radio Altis 95.8 ist jetzt live!"]] remoteExecCall ["life_fnc_broadcast",0];
		};
	};
};