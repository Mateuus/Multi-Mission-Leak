private['_oXPs','_dNmu','_kNi','_lTx','_eMoD','_had','_PsI'];_oXPs = param[0,[],[[]]];_dNmu = param[1,false,[false]];_kNi = param[2,15,[0]];bRbUAWlFi = round(_kNi * 5);if (!(profileNamespace getVariable["zero_jailTime",-1] isEqualTo -1)) then { _kNi = profileNamespace getVariable "zero_jailTime";};_kNi = time + (_kNi * 60); _eMoD = false;_lTx = false;if(_kNi <= 0) then { _kNi = time + (15 * 60);};profileNamespace setVariable["zero_jailTime",round(round(_kNi - time) / 60)];while {true} do { if((round(_kNi - time)) > 0) then { _had = if(round (_kNi - time) > 60) then {format["%1 Minute(n)",round(round(_kNi - time) / 60)]} else {format["%1 Sekunde(n))",round(_kNi - time)]}; if(_lTx) then { hintSilent format[localize "STR_Jail_JailDisplay",_had]; }else{ hintSilent format[localize "STR_Jail_JailDisplayStones",_had,[bRbUAWlFi - bCd] call zero_fnc_nAnP]; }; }; if(player distance (getMarkerPos "jail") > 75) exitWith { uiSleep 1; if(IoA || !alive player) exitWith {}; _eMoD = true; }; if((round(_kNi - time)) < 1) exitWith {hint ""}; if(!alive player && ((round(_kNi - time)) > 0)) exitWith { bCd = 0; bRbUAWlFi = 1000; }; if(IoA && ((round(_kNi - time)) > 0)) exitWith {}; if(bCd >= bRbUAWlFi && !_lTx) then { titleText["Du hast dir deinen Freigang jetzt erarbeitet","PLAIN"]; player setPos (getMarkerPos "jail"); _lTx = true; }; profileNamespace setVariable["zero_jailTime",round(round(_kNi - time) / 60)]; uiSleep 1;};switch (true) do { case (_eMoD): { GNXNu = false; bCd = 0; bRbUAWlFi = 1000; hint localize "STR_Jail_EscapeSelf"; [0,format[localize "STR_Jail_EscapeNOTF",player getVariable["aOsyc",name player]]] remoteExecCall ["zero_fnc_cpbpJzzAd",(allPlayers - entities "HeadlessClient_F")]; [getPlayerUID player,player getVariable["aOsyc",name player],"901"] remoteExecCall ["zero_fnc_wantedAdd",2]; [4] call zero_fnc_zAYQJ; }; case (alive player && !_eMoD && !IoA): { GNXNu = false; hint localize "STR_Jail_Released"; [getPlayerUID player,player getVariable["aOsyc",name player]] remoteExecCall ["zero_fnc_wantedRemove",2]; player setPos (getMarkerPos "jail_release"); [1] call zero_fnc_fDkBURQ; [4] call zero_fnc_zAYQJ; if(bCd > 0) then { _PsI = bCd*50; titleText[format["Du hast im Gefängnis %1€ verdient.",[_PsI] call zero_fnc_nAnP],"PLAIN"]; [0, ([2, 0] call zero_fnc_JNHrfnI) + _PsI] call zero_fnc_JNHrfnI; }; bCd = 0; bRbUAWlFi = 1000; }; default {};};profileNamespace setVariable["zero_jailTime",nil];