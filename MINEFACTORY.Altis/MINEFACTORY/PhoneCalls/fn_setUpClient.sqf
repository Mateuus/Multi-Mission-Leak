life_phoneCallActive = false;
life_currentPhonePartner = ObjNull;
life_phoneCallSounds = [
    ["phoneCalls_ringtone_sandstorm", 7.07, "Sandstorm"],
    ["phoneCalls_ringtone_newkids", 16.5, "New Kids"],
    ["phoneCalls_ringtone_bananaphone", 2, "Bananaphone"],
    ["phoneCalls_ringtone_allahuakbar", 12, "Terrorist"],
    ["phoneCalls_ringtone_bapabapapa", 13.1, "The Blue Danube"]
];
life_phoneResult = false;
life_phoneCallDialogActive = false;
life_timeSincePhoneCall = -1;
life_currentMinCosts = 1000;
life_currentRingtone = 0;
life_phoneRingTime = 30;

if (!isServer) then {
    [] spawn {
        while {true} do {
            waitUntil {life_phoneCallDialogActive || (!(player getVariable ["isCalling", false]) && (player getVariable ["incomingCall", false])) && alive player};
            [17, [], false, false] call phoneCalls_fnc_partial;
            if (!(player getVariable ["isCalling", false]) && (player getVariable ["incomingCall", false])) then {
                _ringtone = (life_phoneCallSounds select life_currentRingtone) select 0;
                _ringtime = (life_phoneCallSounds select life_currentRingtone) select 1;
                [player, _ringtone, 25] call life_fnc_globalSound;
                sleep _ringtime;
            };
        };
    };
};
