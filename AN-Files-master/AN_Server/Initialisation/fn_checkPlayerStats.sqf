params[
    ["_uid", "", [""]], ["_name", "", [""]], ["_side", "", [""]], ["_owner", objNull, [objNull]]
];

try {
    if (_uid isEqualTo ""
        OR {
            _name isEqualTo ""
        }) then {
        throw format["Player Error - %1", _owner];
    };

    if !(_side in ["WEST", "CIV", "GUER"]) then {
        throw "Player Error - Side Unknown";
    };

    if (isNull _owner OR {
            isNil "_owner"
        }) then {
        throw "Fatal Player Error";
    };

    if !(_uid in ["", "__SERVER__", "__HEADLESS__"]) then {
        private _ownerID = owner _owner;
        private _message = format["ExistPlayer%1Info:%2", _side, _uid];
        private _isKnownAccount = ([_message, 2] call DB_fnc_asyncCall) select 0;
        if (_isKnownAccount) then {
            ["Starting Session..."] remoteExecCall["life_fnc_wraruswuth", _ownerID];
            [format["StartPlayer%1Session:%2:%3", _side, _name, _uid], 1] call DB_fnc_asyncCall;

            if (_side isEqualTo "CIV") then {
                ["Checking Wanted Status..."] remoteExecCall["life_fnc_wraruswuth", _ownerID];
                private _isWanted = ([format["IsPlayerWanted:%1", _uid], 2] call DB_fnc_asyncCall) select 0;
                if (_isWanted) then {
                    [format["PlayerIsWanted:%1:%2", _name, _uid], 1] call DB_fnc_asyncCall;
                };
            };

            PlayerStats = true;
            _ownerID publicVariableClient "PlayerStats";
        }
        else {
            private _money = getNumber(configFile >> "CfgSettings" >> "PlayerSettings" >> "StartingMoney");
            private _bank = getNumber(configFile >> "CfgSettings" >> "PlayerSettings" >> "StartingBank");
            private _alias = [
                [_name]
            ] call DB_fnc_mresArray;
            switch _side do {
                case "CIV":{
                        ["Creating New Account..."] remoteExecCall["life_fnc_wraruswuth", _ownerID];
                        format["Player %1 (UID %2) Creating New Account (CIV)", _name, _uid] call AN_server_log;
                        private _level = getNumber(configFile >> "CfgSettings" >> "PlayerSettings" >> "StartingLevel");
                        private _exp = getNumber(configFile >> "CfgSettings" >> "PlayerSettings" >> "StartingEXP");
                        private _skillpoint = getNumber(configFile >> "CfgSettings" >> "PlayerSettings" >> "StartingSkillpoints");
                        [format["InsertPlayerCivInfo:%1:%2:%3:%4:%5:%6:%7:%8", _name, _uid, _money, _bank, _alias, _level, _exp, _skillpoint], 1] call DB_fnc_asyncCall;
                        PlayerStats = true;
                        _ownerID publicVariableClient "PlayerStats";
                    };
                case "WEST":{
                        ["Creating New Account..."] remoteExecCall["life_fnc_wraruswuth", _ownerID];
                        format["Player %1 (UID %2) Creating New Account (TSO)", _name, _uid] call AN_server_log;
                        [format["InsertPlayerCopInfo:%1:%2:%3:%4:%5", _name, _uid, _money, _bank, _alias], 1] call DB_fnc_asyncCall;
                        PlayerStats = true;
                        _ownerID publicVariableClient "PlayerStats";

                    };
                case "GUER":{
                        ["Creating New Account..."] remoteExecCall["life_fnc_wraruswuth", _ownerID];
                        format["Player %1 (UID %2) Creating New Account (EMS)", _name, _uid] call AN_server_log;
                        [format["InsertPlayerEMSInfo:%1:%2:%3:%4:%5", _name, _uid, _money, _bank, _alias], 1] call DB_fnc_asyncCall;
                        PlayerStats = true;
                        _ownerID publicVariableClient "PlayerStats";
                    };
                default {
                    throw "Error - Whitelist not Found";
                };
            };
        };
    };

} catch {
    [_exception] remoteExecCall["life_fnc_wraruswuth", _ownerID];
};
true