disableSerialization;
private["_msg","_life_smartphoneCaller"];

_msg = format["Der Anruf wurde beendet.",name player];

_dialog = finddisplay 3700;
_callpic = _dialog displayCtrl 3701;
_decallpic = _dialog displayCtrl 3708;
_buttoncall = _dialog displayCtrl 3706;
_buttondecall = _dialog displayCtrl 3709;
_calltext = _dialog displayCtrl 3707;

if!(isNull (player getVariable "life_smartphoneCaller")) then {
_life_smartphoneCaller = player getVariable "life_smartphoneCaller";

	if(player getVariable "life_callactive1") then {
		life_radio_call1 radioChannelRemove [player, _life_smartphoneCaller];
		life_radio_call4 radioChannelRemove [player, _life_smartphoneCaller];
		player setVariable["life_callactive1",false];
		["life_callactive1",false,false] remoteExecCall ["life_fnc_setVar",_life_smartphoneCaller];
		
		life_callinUse1 = false;
		PublicVariable "life_callinUse1";
		player setVariable ["life_smartphoneCaller",ObjNull];
	};
	if(player getVariable "life_callactive2") then {
		life_radio_call2 radioChannelRemove [player, _life_smartphoneCaller];
		life_radio_call5 radioChannelRemove [player, _life_smartphoneCaller];
		player setVariable["life_callactive2",false];
		["life_callactive2",false,false] remoteExecCall ["life_fnc_setVar",_life_smartphoneCaller];
		
		life_callinUse2 = false;
		PublicVariable "life_callinUse2";
		player setVariable ["life_smartphoneCaller",ObjNull];
	};

	_callpic ctrlShow true;
	_buttoncall ctrlShow true;
	_decallpic ctrlShow false;
	_buttondecall ctrlShow false;
	hint "Anruf beendet.";
	_calltext ctrlSetText "Anruf beendet...";

	[1,_msg] remoteExecCall ["life_fnc_broadcast",_life_smartphoneCaller];
	"callDenied" remoteExecCall ["playsound",_life_smartphoneCaller];
	[6] remoteExecCall ["life_fnc_phone",_life_smartphoneCaller];
	[7] remoteExecCall ["life_fnc_phone",_life_smartphoneCaller];
	
	sleep 1;
	_calltext ctrlSetText format["Eigene Nummer: %1",(player getvariable "phone")];
	
} else {

	if(player getVariable "life_callactive1") then {
		life_radio_call1 radioChannelRemove [player, life_smartphoneTarget];
		life_radio_call4 radioChannelRemove [player, life_smartphoneTarget];
		player setVariable["life_callactive1",false];
		["life_callactive1",false,false] remoteExecCall ["life_fnc_setVar",life_smartphoneTarget];
		["life_smartphoneCaller",ObjNull,false] remoteExecCall ["life_fnc_setVar",life_smartphoneTarget];
		
		life_callinUse1 = false;
		PublicVariable "life_callinUse1";
	};
	if(player getVariable "life_callactive2") then {
		life_radio_call2 radioChannelRemove [player, life_smartphoneTarget];
		life_radio_call5 radioChannelRemove [player, life_smartphoneTarget];
		player setVariable["life_callactive2",false];
		["life_callactive2",false,false] remoteExecCall ["life_fnc_setVar",life_smartphoneTarget];
		["life_smartphoneCaller",ObjNull,false] remoteExecCall ["life_fnc_setVar",life_smartphoneTarget];
		
		life_callinUse2 = false;
		PublicVariable "life_callinUse2";
	};
	
	_callpic ctrlShow true;
	_buttoncall ctrlShow true;
	_decallpic ctrlShow false;
	_buttondecall ctrlShow false;
	hint "Anruf beendet.";
	_calltext ctrlSetText "Anruf beendet...";

	[1,_msg] remoteExecCall ["life_fnc_broadcast",life_smartphoneTarget];
	"callDenied" remoteExecCall ["playsound",life_smartphoneTarget];
	[6] remoteExecCall ["life_fnc_phone",life_smartphoneTarget];
	life_smartphoneTarget = ObjNull;
	
	sleep 1;
	_calltext ctrlSetText format["Eigene Nummer: %1",(player getvariable "phone")];
};
