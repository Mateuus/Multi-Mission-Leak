/*
	File: fn_callSiren.sqf
	Author: blackfisch
	
	Description: 
	Action when siren is activated

	**************************************
	****** Allgemeine Einstellungen ******
	**************************************
*/
private _city = _this select 3;
private _duration = 11.65; //Dauer des Sounds in Sekunden
private _level = 8; //Benötigtes Coplevel zum Auslösen - Zum deaktivieren -1
private _adminLevel = 4; //Benötigtes Adminlevel zum auslösen (unabhängig vom Coplevel! Zum deaktivieren eine hohe Zahl eingeben, die als AdminLevel nicht existiert)
private _cooldown = 2; //Zeit zwischen zwei Ausführungen der gleichen Sirene in Minuten
private _sirenactive = ""; //NICHT ÄNDERN!
private _msg = ""; //NICHT ÄNDERN!
private _esc = false; //NICHT ÄNDERN!

/*
	*************************
	****** Scriptstart ******
	*************************
*/
if (playerSide != west && {(call life_adminlevel) < _adminLevel}) exitWith {hint "Du bist kein Polizist!"}; //Anti-Abuse
if !(_level <= 0) then {
	if ((call life_coplevel) < _level && {(call life_adminlevel) < _adminLevel}) exitWith {hint "Du besitzt nicht den benötigten Rang!";};
};
if (isNil "bf_sirenActive") then {bf_sirenActive = false;}; //Debug
if (bf_sirenActive) exitWith {hint "Die Sirenen laufen noch!"}; //Debug
_cooldown = _cooldown * 60; //Umwandlung in minuten

switch (_city) do
{
	case "siren_test": //Test
	{
		_cooldown = _cooldown * 2;
		if ((isNil "bf_sirenTestInUse") || {(serverTime - bf_sirenTestInUse) > _cooldown}) then {
			//Start Siren Test Script
			bf_sirenKavalaInUse = (serverTime - (60*9));
			bf_sirenAthiraInUse = (serverTime - (60*9));
			bf_sirenPyrgosInUse = (serverTime - (60*9));
			bf_sirenSofiaInUse = (serverTime - (60*9));
			bf_sirenTestInUse = serverTime;
			bf_sirenActive = true;
			publicVariable "bf_sirenActive";
			
			_msg = "Es startet nun ein Testlauf der Zivilschutzsirenen."; //prepare the message being sent
			[1,_msg] remoteExecCall ["life_fnc_broadcast",-2]; //broadcast the Alarm has been activated
			uisleep 1;
			
			[siren_Kavala,"alarmSiren"] remoteExec ["life_fnc_say3D",-2]; //play alarm Kavala
			[siren_Athira,"alarmSiren"] remoteExec ["life_fnc_say3D",-2]; //play alarm Athira
			[siren_Pyrgos,"alarmSiren"] remoteExec ["life_fnc_say3D",-2]; //play alarm Pyrgos
			[siren_Sofia,"alarmSiren"] remoteExec ["life_fnc_say3D",-2]; //play alarm Sofia
			bf_sirenActive = false;
		} else {_esc = true;}; //prevent them from activating it multiple serverTimes while still active
	};
	
	case "siren_Kavala": //Kavala
	{
		if ((isNil "bf_sirenKavalaInUse") || {(serverTime - bf_sirenKavalaInUse) > _cooldown}) then {
			_msg = "<t color='#aa0000' size='2.5' shadow='1' shadowColor='#000000' align='center'>ALARM</t> <br/> <br/> Die Zivilschutzsirene in Kavala wurde ausgelöst! Bringen Sie sich in Sicherheit und folgen Sie den Anweisungen der Polizei- und Rettungkräfte!"; //prepare the message being sent
			_sirenactive = siren_Kavala;
			bf_sirenKavalaInUse = serverTime;
			bf_sirenActive = true;
		} else {_esc = true;}; //prevent them from activating it multiple serverTimes while still active
	};
	
	case "siren_Athira": //Athira
	{
		if ((isNil "bf_sirenAthiraInUse") || {(serverTime - bf_sirenAthiraInUse) > _cooldown}) then {
			_msg = "<t color='#aa0000' size='2.5' shadow='1' shadowColor='#000000' align='center'>ALARM</t> <br/> <br/> Die Zivilschutzsirene in Athira wurde ausgelöst! Bringen Sie sich in Sicherheit und folgen Sie den Anweisungen der Polizei- und Rettungkräfte!"; //prepare the message being sent
			_sirenactive = siren_Athira;
			bf_sirenAthiraInUse = serverTime;
			bf_sirenActive = true;
		} else {_esc = true;}; //prevent them from activating it multiple serverTimes while still active
	};
	
	case "siren_Pyrgos": //Pyrgos
	{
		if ((isNil "bf_sirenPyrgosInUse") || {(serverTime - bf_sirenPyrgosInUse) > _cooldown}) then {
			_msg = "<t color='#aa0000' size='2.5' shadow='1' shadowColor='#000000' align='center'>ALARM</t> <br/> <br/> Die Zivilschutzsirene in Pyrgos wurde ausgelöst! Bringen Sie sich in Sicherheit und folgen Sie den Anweisungen der Polizei- und Rettungkräfte!"; //prepare the message being sent
			_sirenactive = siren_Pyrgos;
			bf_sirenPyrgosInUse = serverTime;
			bf_sirenActive = true;
		} else {_esc = true;}; //prevent them from activating it multiple serverTimes while still active
	};
	
	case "siren_Sofia": //Sofia
	{
		if ((isNil "bf_sirenSofiaInUse") || {(serverTime - bf_sirenSofiaInUse) > _cooldown}) then {
			_msg = "<t color='#aa0000' size='2.5' shadow='1' shadowColor='#000000' align='center'>ALARM</t> <br/> <br/> Die Zivilschutzsirene in Sofia wurde ausgelöst! Bringen Sie sich in Sicherheit und folgen Sie den Anweisungen der Polizei- und Rettungkräfte!"; //prepare the message being sent
			_sirenactive = siren_Sofia;
			bf_sirenSofiaInUse = serverTime;
			bf_sirenActive = true;
		} else {_esc = true;}; //prevent them from activating it multiple serverTimes while still active
	};
	
	default {};
};

if (_esc) exitWith {hint "Die Sirenen laufen noch!"};

//Make variables public to all
publicVariable "bf_sirenKavalaInUse";
publicVariable "bf_sirenAthiraInUse";
publicVariable "bf_sirenPyrgosInUse";
publicVariable "bf_sirenSofiaInUse";
publicVariable "bf_sirenTestInUse";
publicVariable "bf_sirenActive";

if (_city isEqualTo "siren_test") exitWith {};
if (isNil "_sirenactive" || _msg isEqualTo "") exitWith {diag_log "ERROR: ERR_VAR_isNil_SIREN"};

[1,_msg,false,true] remoteExecCall ["life_fnc_broadcast",-2]; //broadcast the Alarm has been activated

[_sirenactive,"alarmSiren"] remoteExec ["life_fnc_say3D",-2]; //play alarm
uisleep _duration;	//wait until finished
[_sirenactive,"alarmSiren"] remoteExec ["life_fnc_say3D",-2]; //play alarm
uisleep _duration;	//wait until finished
[_sirenactive,"alarmSiren"] remoteExec ["life_fnc_say3D",-2]; //play alarm
uisleep _duration;	//wait until finished

bf_sirenActive = false;
publicVariable "bf_sirenActive";