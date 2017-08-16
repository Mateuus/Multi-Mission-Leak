disableSerialization;
_mode = _this select 0;
switch (_mode) do {
    case 0:{
            createdialog " phone";
            _nummern = [];
            _dialog = finddisplay 3700;
            _callpic = _dialog displayCtrl 3701;
            _decallpic = _dialog displayCtrl 3708;
            _buttoncall = _dialog displayCtrl 3706;
            _buttondecall = _dialog displayCtrl 3709;
            _list = _dialog displayCtrl 3703;
            _eingabe = _dialog displayCtrl 3704;
            _calltext = _dialog displayCtrl 3707;
            _eingabe ctrlEnable false;
            lbClear _list;
            if (player getvariable " life_callflug") then {
                ctrlSetText[3713, "images\ tablet\ flugmodusan.paa"];
            };
            if ((player getvariable " life_callactive1") OR(player getvariable " life_callactive2")) then {
                _callpic ctrlShow false;
                _buttoncall ctrlShow false;
                _decallpic ctrlShow true;
                _buttondecall ctrlShow true;
                _calltext ctrlSetText " Anruf im Gange...";
            } else {
                _callpic ctrlShow true;
                _buttoncall ctrlShow true;
                _decallpic ctrlShow false;
                _buttondecall ctrlShow false;
                _calltext ctrlSetText format["Eigene Nummer: % 1", (player getvariable " phone")];
            };
            _list lbadd " Don Ator";
            _list lbSetData[(lbSize _list) - 1, "01567888999"];
            _list lbadd " Wunderkiste";
            _list lbSetData[(lbSize _list) - 1, "01517258219"]; {
                _nummern pushback(_x getvariable " phone");
            }
            foreach playableUnits; {
                if ((_x select 0) in _nummern) then {
                    _list lbadd format[" % 1", (_x select 1)];
                    _list lbSetData[(lbSize _list) - 1, (_x select 0)];
                };
            }
            foreach life_kontakte;
            if (((lbSize _list) - 1) == -1) exitWith {
                _list lbAdd " Keine Kontakte vorhanden.";
                _list lbSetData[(lbSize _list) - 1, str(ObjNull)];
            };
        };
    case 1:{
            _val = ctrlText 3704;
            _nummern = [];
            _life_smartphonetarget = ObjNull;
            _life_smartphonetargetNr = "";
            _already = false;
            if (!([_val] call SOA_fnc_isnumber)) exitWith {
                hint " Du hast keine Nummer eingegeben."
            };
            if (_val == (player getvariable " phone")) exitWith {
                hint " Du kannst deine eigene Nummer nicht hinzufügen!"
            }; {
                _nummern pushback[(_x getvariable " phone"), _x];
            }
            foreach playableUnits; {
                if (_val == (_x select 0)) exitWith {
                    _life_smartphonetargetNr = (_x select 0);
                    _life_smartphonetarget = (_x select 1)
                };
            }
            foreach _nummern;
            if (isNull _life_smartphonetarget) exitWith {
                hint " Ungültige Rufnummer.";
            }; {
                if (_life_smartphonetargetNr == (_x select 0)) exitWith {
                    hint " Kontakt bereits hinzugefügt!";
                    _already = true;
                }
            }
            foreach life_kontakte;
            if (_already) exitWith {};
            life_kontakte pushback[_life_smartphonetargetNr, name _life_smartphonetarget];
            [15] call SOCK_fnc_updatePartial;
            [2] call life_fnc_closedialog;
        };
    case 2:{
            _dialog = finddisplay 3700;
            _calltext = _dialog displayCtrl 3707;
            _val = ctrlText 3704;
            _nummern = []; {
                _nummern pushback[(_x getvariable " phone"), _x];
            }
            foreach playableUnits;
            if (_val == " * 100#") exitWith {
                _calltext ctrlSetText " Frage Guthaben ab...";
                sleep 2;
                [format["Dein derzeitiges Guthaben beträgt: % 1€.", [life_guthaben] call life_fnc_numberText], "Guthabenabfrage...", true, false] spawn bis_fnc_GUImessage;
                _calltext ctrlSetText format["Eigene Nummer: % 1", (player getvariable " phone")];
            };
            if (_val == (life_guthabencode select 1)) exitWith {
                _type = (life_guthabencode select 0);
                switch (_type) do {
                    case 0:{
                            life_guthabencode = [-1, ""];
                            [false, "guthaben", 1] call life_fnc_handleinv;
                            life_guthaben = life_guthaben + 5000;
                            hint " Dein Guthaben wurde aufgeladen.";
                        };
                    case 1:{
                            life_guthabencode = [-1, ""];
                            [false, "guthabenplus", 1] call life_fnc_handleinv;
                            life_guthaben = life_guthaben + 100000;
                            hint " Dein Guthaben wurde aufgeladen.";
                        };
                    case 2:{
                            life_guthabencode = [-1, ""];
                            [false, "guthabenpremium", 1] call life_fnc_handleinv;
                            life_guthaben = life_guthaben + 1000000;
                            hint " Dein Guthaben wurde aufgeladen.";
                        };
                };
            };
            if (_val == "01567888999") exitWith {
                if (player getvariable " life_callactive1") exitWith {
                    hint " Du führst bereits ein Gespräch!"
                };
                switch (call life_donator) do {
                    case 0:{
                            player setvariable["life_callactive1", true];
                            playsound " CallDial";
                            sleep 7;
                            playsound " donatornein";
                            sleep 13;
                            player setvariable["life_callactive1", false];
                        };
                    case 1:{
                            player setvariable["life_callactive1", true];
                            playsound " CallDial";
                            sleep 7;
                            playsound " donatorja";
                            sleep 25;
                            player setvariable["life_callactive1", false];
                        };
                    case 2:{
                            [] spawn life_fnc_donatorsupply;
                        };
                };
            };
            if (_val == "01517258219") exitWith {
                playsound " CallDial";
                sleep 7;
                [format["Du hörst eine mysteriöse Stimme aus der Kiste, welche laut % 1 Punkt(e) schreit.", [life_serverpoints] call life_fnc_numberText], "Wunderpunkteabfrage", true, false] spawn bis_fnc_GUImessage;
            };
            if (_val == "018054646") exitWith {
                if (player getvariable " life_callactive1") exitWith {
                    hint " Du führst bereits ein Gespräch!"
                };
                player setvariable["life_callactive1", true];
                playsound " CallDial";
                sleep 7;
                playsound " dimitri";
                sleep 23;
                player setvariable["life_callactive1", false];
            };
            if (_val == (player getvariable " phone")) exitWith {
                hint " Du kannst dich nicht selbst anrufen!";
                playsound " CallDenied";
            };
            if (life_netzhacked) exitWith {
                hint " Altis - Talk ist zurzeit nicht verfügbar.Kein Netz.";
                playsound " notavailable"
            };
            if (player getvariable " life_callflug") exitWith {
                hint " Du hast den Flugmodus eingeschaltet, Anrufe nicht möglich!"
            };
            if ((player getvariable " life_callactive1") OR(player getvariable " life_callactive2")) exitWith {
                hint " Du führst bereits ein Gespräch!"
            };
            if (life_callinUse1 && life_callinUse2) exitWith {
                hint " Alle Leitungen sind besetzt!";
                playsound " CallDenied";
            };
            if (_val == "110") exitWith {
                if (playerside == west) exitWith {
                    createdialog " smsnotruf"
                };
                _exit = false; {
                    if (str _x == "cop") exitWith {
                        life_guthaben = life_guthaben + 1000;
                        _exit = true;
                        life_smartphoneTarget = _x;
                        [player, 0] remoteExec["life_fnc_callAction", life_smartphoneTarget]
                    };
                }
                foreach playableUnits;
                if (_exit) exitWith {};
                if !(_exit) exitWith {
                    createdialog " smsnotruf"
                };
            };
            if (_val == "112") exitWith {
                if (playerside == independent) exitWith {
                    createdialog " smsnotruf"
                };
                _exit = false; {
                    if (str _x == "ahw") exitWith {
                        life_guthaben = life_guthaben + 1000;
                        _exit = true;
                        life_smartphoneTarget = _x;
                        [player, 0] remoteExec["life_fnc_callAction", life_smartphoneTarget]
                    };
                }
                foreach playableUnits;
                if (_exit) exitWith {};
                if !(_exit) exitWith {
                    createdialog " smsnotruf"
                };
            };
            if (life_guthaben < 1000) exitWith {
                hint " Dein Guthaben reicht für das gewünschte Gespräch nicht aus."
            }; {
                if (_val == (_x select 0)) exitWith {
                    life_smartphonetarget = (_x select 1)
                };
            }
            foreach _nummern;
            if (isNull life_smartphoneTarget) exitWith {
                hint " Der gewünschte Gesprächspartner ist zur Zeit nicht erreichbar.";
                playsound " notavailable";
            };
            if ((ctrlText 3710) == "Telefonzelle") then {
                [player, 1] remoteExec["life_fnc_callAction", life_smartphoneTarget];
            } else {
                [player, 0] remoteExec["life_fnc_callAction", life_smartphoneTarget];
            };
        };
    case 3:{
            _dialog = finddisplay 3700;
            _val = _dialog displayCtrl 3704;
            _old = ctrltext 3704;
            _ziffer = _this select 1;
            switch (_ziffer) do {
                case 0:{
                        _val ctrlSetText format[" % 1 % 2", _old, "0"];
                        playsound " mittel"
                    };
                case 1:{
                        _val ctrlSetText format[" % 1 % 2", _old, "1"];
                        playsound " tief"
                    };
                case 2:{
                        _val ctrlSetText format[" % 1 % 2", _old, "2"];
                        playsound " mittel"
                    };
                case 3:{
                        _val ctrlSetText format[" % 1 % 2", _old, "3"];
                        playsound " hoch"
                    };
                case 4:{
                        _val ctrlSetText format[" % 1 % 2", _old, "4"];
                        playsound " tief"
                    };
                case 5:{
                        _val ctrlSetText format[" % 1 % 2", _old, "5"];
                        playsound " mittel"
                    };
                case 6:{
                        _val ctrlSetText format[" % 1 % 2", _old, "6"];
                        playsound " hoch"
                    };
                case 7:{
                        _val ctrlSetText format[" % 1 % 2", _old, "7"];
                        playsound " tief"
                    };
                case 8:{
                        _val ctrlSetText format[" % 1 % 2", _old, "8"];
                        playsound " mittel"
                    };
                case 9:{
                        _val ctrlSetText format[" % 1 % 2", _old, "9"];
                        playsound " hoch"
                    };
                case " *":{
                        _val ctrlSetText format[" % 1 % 2", _old, " * "];
                        playsound " tief"
                    };
                case "#":{
                        _val ctrlSetText format[" % 1 % 2", _old, "#"];
                        playsound " hoch"
                    };
                case " DEL":{
                        _val ctrlSetText "";
                        playsound " hoch"
                    };
            };
        };
    case 4:{
            _booln = _this select 1;
            switch (_booln) do {
                case 0:{
                        player setvariable["life_callflug", true, true];
                        hint " Flugmodus eingeschaltet.Eingehende Anrufe werden blockiert.";
                        ctrlSetText[3713, "images\ tablet\ flugmodusan.paa"]
                    };
                case 1:{
                        player setvariable["life_callflug", false, true];
                        hint " Flugmodus ausgeschaltet.Anrufe wieder verfügbar.";
                        ctrlSetText[3713, "images\ tablet\ flugmodusaus.paa"]
                    };
            };
        };
    case 5:{
            _dialog = finddisplay 3700;
            _list = _dialog displayCtrl 3703;
            _val = _dialog displayCtrl 3704;
            _val ctrlSetText format[" % 1", (_list lbdata(lbCurSel _list))];
        };
    case 6:{
            if (!dialog) exitWith {};
            _dialog = finddisplay 3700;
            _callpic = _dialog displayCtrl 3701;
            _decallpic = _dialog displayCtrl 3708;
            _buttoncall = _dialog displayCtrl 3706;
            _buttondecall = _dialog displayCtrl 3709;
            _calltext = _dialog displayCtrl 3707;
            _callpic ctrlShow true;
            _buttoncall ctrlShow true;
            _decallpic ctrlShow false;
            _buttondecall ctrlShow false;
            _calltext ctrlSetText format["Eigene Nummer: % 1", (player getvariable " phone")];
        };
    case 7:{
            life_smartphoneTarget = ObjNull;
        };
};