/*
0 -> startSound
1 -> stopSound
2 -> busySound
3 -> lineIsBusy
4 -> substractMoney
5 -> startCall
6 -> stopCall
7 -> updatePhoneDialog
8 -> noConnectionSound
9 -> setCurrentCallPartner
    0 -> radioIndex
    1 -> receivedPlayer
10 -> unsetCurrentCallPartner
11 -> stopCallFromServer
12 -> updatePhonesoundsDialog
*/

_type = [_this, 0, -1, [-1]] call BIS_fnc_param;
_params = [_this, 1, [], [[]]] call BIS_fnc_param;
_solveEndActive = [_this, 2, true, [true]] call BIS_fnc_param;
_solveStartActive = [_this, 3, true, [true]] call BIS_fnc_param;

if (_type == -1) exitWith {};

if (_solveStartActive) then { life_phoneCallActive = true };

switch (_type) do {
    case 0: {
        playSound "phoneCalls_dialing";
        uiSleep 8;
    };
    
    case 1: {
        playSound "phoneCalls_hangup";
        uiSleep 7;
    };
    
    case 2: {
        [8, [], false] call phoneCalls_fnc_partial;
        playSound "phoneCalls_dtizne";
        uiSleep 2.7;
        [1, [], false] call phoneCalls_fnc_partial;
    };
    
    case 3: {
        [8, [], false] call phoneCalls_fnc_partial;
        playSound "phoneCalls_utszb";
        uiSleep 3;
        [1, [], false] call phoneCalls_fnc_partial;
    };
    
    case 4: {
        private ["_amount"];
        _amount = _params select 0;
        life_currentMinCosts = _amount;
        if (life_atmcash - _amount < 0) exitWith { [6] call phoneCalls_fnc_partial; };
        life_atmcash = life_atmcash - _amount;
        systemChat format["[PHONE] Die Gebühr in höhe von $%1 wurde von deinem Konto abgezogen.", _amount];
    };
    
    case 5: {
        private ["_object", "_result"];
        _uid = [_params, 0, "", [""]] call BIS_fnc_param;
        
        ctrlEnable [9401, false];
        _object = ObjNull;
        {
            if ((getPlayerUID _x) == _uid) exitWith { _object = _x; };
        } forEach playableUnits;
        
        if (!isNull _object) then {  
            [0, [], false] call phoneCalls_fnc_partial;  
            if ((_object getVariable ["isCalling", false]) || (_object getVariable ["incomingCall", false]) || (_object getVariable ["phoneMute", false])) then {  
                [2, [], false] call phoneCalls_fnc_partial;
            } else {  
                if (!(_object getVariable ["incomingCall", false]) && !(_object getVariable ["isCalling", false])) then {  
                    _result = false; 
                     
                    if (!(_object getVariable ["isCalling", false]) && !(_object getVariable ["incomingCall", false])) then { 
                        _object setVariable ["incomingCall", true, true];
                        //player setVariable ["incomingCall", true, true]; 
                        _time = time; 
                         
                        while { true } do { 
                            [15, [], false] call phoneCalls_fnc_partial; 
                            if (!(_object getVariable ["incomingCall", false])) exitWith {systemChat "1";}; 
                            if (((time - _time) >= life_phoneRingTime)) exitWith {systemChat "2";}; 
                            if ((_object getVariable ["isCalling", false])) exitWith {systemChat "3";}; 
                            if (!alive _object) exitWith { systemChat "4"; };
                        };
                        _result = true;
                        
                        if (((time - _time) >= life_phoneRingTime)) then {
                            _result = false;
                            _object setVariable ["incomingCall", false, true];
                            _object setVariable ["isCalling", false, true];
                            systemChat "5";
                        };
                        
                        if (!(_object getVariable ["incomingCall", false])) then {
                            _result = false;
                            _object setVariable ["isCalling", false, true];
                            systemChat "6";
                        };
                        
                        if (!alive _object) then {
                            _result = false;
                            _object setVariable ["isCalling", false, true]; 
                            _object setVariable ["incomingCall", false, true];
                            systemChat "7";
                        };
                    } else {
                        _result = false;
                    };
                    
                    systemChat str _result;
                    if (_result) then {
                        [player, _object] remoteExec ["phoneCallsServer_fnc_startCall", 2];
                    } else { 
                        [1, [], false] call phoneCalls_fnc_partial;  
                    };  
                } else {  
                    [2, [], false] call phoneCalls_fnc_partial;  
                };  
            };  
        } else { hint "Es ist niemand Online oder der ausgewählte Spieler ist nicht mehr Online"; };
        ctrlEnable [9401, true];
    };
    
    case 6: {
        _object = life_currentPhonePartner;
        if (!isNull _object) then {
            if ((_object getVariable ["isCalling", false])) then {
                [player, _object] remoteExec ["phoneCallsServer_fnc_stopCall", 2];
            };
        };
    };
    
    case 7: {
        disableSerialization;
        if (!life_phoneCallDialogActive) then {
            closeDialog 0;
            createDialog "phoneDialog";
        };
        
        ctrlSetText [9405 , "-"];
        ctrlSetText [9404, "-"];
        
        if (player getVariable ["isCalling", false]) then {
            ctrlEnable [9401, false];
            ctrlEnable [9402, true];
            ctrlEnable [9407, false];
            ctrlEnable [9408, false];
            ctrlSetText [9404, format["%1", (life_currentPhonePartner getVariable ["realname", (name life_currentPhonePartner)])]];
            ctrlSetText [9403 , format["%1 Minute/n", round ((time - life_timeSincePhoneCall) / 60)]];
        } else {
            ctrlEnable [9401, true];
            ctrlEnable [9402, false];
            ctrlSetText [9405 , "-"];
        };
        
        if (player getVariable ["incomingCall", false]) then {
            ctrlEnable [9407, true];
            ctrlEnable [9408, true];
            ctrlSetText [9405 , "Eingehender Anruf"];
        } else {
            ctrlEnable [9407, false];//Annehmen
            ctrlEnable [9408, false];//Ablehnen
            ctrlSetText [9405 , "-"];
        };
        
        lbClear 9406;
        {
            if (_x != player) then {
                lbAdd [9406, (_x getVariable ["realname", name _x])];
                lbSetData [9406, ((lbSize 9406) - 1), (getPlayerUID _x)];
            };
        } forEach playableUnits;
        
        if ((lbSize 9406) == 0) then {
            lbAdd [9406, "Niemand Online"];
            lbSetData [9406, 0, "ObjNull"];
        };
        
        disableSerialization;
        _button = (findDisplay 9400) displayCtrl 9409;
        if (!(player getVariable ["phoneMute", false])) then {
            _button ctrlSetText "Stummen";
        } else {
            _button ctrlSetText "Entstummen";
            ctrlEnable [9401, false];
            ctrlEnable [9402, false];
            ctrlEnable [9407, false];
            ctrlEnable [9408, false];
        };
    };
    
    case 8: {
        playSound "phoneCalls_noConnection";
        uiSleep 4.1;
    };
    
    case 9: {
        _object = _params select 0;
        
        if (!isNull _object) then {
            life_currentPhonePartner = _object;
            life_timeSincePhoneCall = time;
        };
    };
    
    case 10: {
        life_currentPhonePartner = ObjNull;
    };
    
    case 11: {
        _hangupPlayer = _params select 0;
        
        if (_hangupPlayer == life_currentPhonePartner) then {
            [8, [], false] call phoneCalls_fnc_partial;
        } else {
            [1, [], false] call phoneCalls_fnc_partial;
        };
        
        [10, [], false] call phoneCalls_fnc_partial;
        life_timeSincePhoneCall = -1;
    };
    
    case 12: {
        closeDialog 0;
        waitUntil {!dialog};
        createDialog "phoneDialogSounds";
        
        lbClear 9501;
        {
            lbAdd [9501, (_x select 2)];
            lbSetData [9501, ((lbSize 9501) - 1), format["%1", _forEachIndex]];
        } forEach life_phoneCallSounds;
    };
    
    case 13: {
        ctrlEnable [9407, false];
        player setVariable ["isCalling", true, true];
    };
    
    case 14: {
        ctrlEnable [9408, false];
        player setVariable ["incomingCall", false, true];
    };
    
    case 15: {
        playSound "phoneCalls_dialingBeep";
        uiSleep 2.7;
    };
    
    case 16: {
        _data = [_params, 0, "-1", [""]] call BIS_fnc_param;
        if (isNil "_data") exitWith {};
        _index = parseNumber _data;
        if (_index == -1) exitWith {};
        if (_index >= (count life_phoneCallSounds)) exitWith {};        
        life_currentRingtone = _index;
        
        hint format["Du hast nun den Klingelton %1 ausgewählt!", ((life_phoneCallSounds select _index) select 2)];
    };
    
    case 17: {
        if (life_phoneCallDialogActive) then {
            if (!isNull life_currentPhonePartner) then {
                if (life_timeSincePhoneCall > -1) then {
                    ctrlSetText [9403, format["%1 min.", (life_timeSincePhoneCall / 60)]];
                };
                
                ctrlSetText [9404, (life_currentPhonePartner getVariable ["realname", name life_currentPhonePartner])];
                ctrlSetText [9405, format["Derzeitige Gebührenhöhe: %1", 1000]];
            };
        };
    };
    
    case 18: {
        player setVariable ["incomingCall", false, true];
        player setVariable ["isCalling", false, true];
        
        ctrlEnable [9408, false];
        ctrlEnable [9407, false];
        
        ctrlSetText [9405 , "Anruf abgelehnt"];
    };
    
    case 19: {
        _bool = [_params, 0, false, [false]] call BIS_fnc_param;
        _index = _params select 1;
        if (_bool) then {
            player customChat [_index, "[PHONE] Anruf angenommen"];
            life_currentPhonePartner customChat [_index, "[PHONE] Anruf angenommen"];
        } else {
            player customChat [_index, "[PHONE] Anruf aufgelegt"];
            life_currentPhonePartner customChat [_index, "[PHONE] Anruf aufgelegt"];
        };
    };
    
    case 20: {
        player setVariable ["incomingCall", true, true];//TRUE
        player setVariable ["isCalling", true, true];//FALSE
        
        ctrlEnable [9401, false];
        ctrlEnable [9402, true];
        ctrlEnable [9407, false];//Annehmen
        ctrlEnable [9408, false];//Ablehnen
    };
    
    case 21: {
        disableSerialization;
        _button = (findDisplay 9400) displayCtrl 9409;
        if ((player getVariable ["phoneMute", false])) then {
            player setVariable ["phoneMute", false, true];
            _button ctrlEnable false;
            _button ctrlSetText "Stummen";
            sleep 1;
            _button ctrlEnable true;
        } else {
            player setVariable ["phoneMute", true, true];
            _button ctrlEnable false;
            _button ctrlSetText "Entstummen";
            sleep 1;
            _button ctrlEnable true;
        };
    };
};

if (_solveEndActive) then { life_phoneCallActive = false; };
