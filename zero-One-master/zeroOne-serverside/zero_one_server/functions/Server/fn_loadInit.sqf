/* 
 File: loadInit.sqf 
 Author: Arkensor 
 DESC: Spawns the actual initServer. Extra file needed as post init calls ... 
 It also sets up some variables which were given by the client before 
*/ 
if(!isNil "zero_server_start") exitWith {}; 
zero_server_start = true; 
enableSaving [false, false]; 
setTerrainGrid 50; 
setViewDistance 1000; 
setObjectViewDistance [835,50]; 
enableSaving[false,false]; 
 
HC1_on = false; 
HC2_on = false; 
 
RscSpectator_allowFreeCam = false; 
 
[] call zero_fnc_rEo; //Load KRON 
[] call zero_fnc_WIIan; //Load the map 
 
/* 
//Killzonekids functions for url fetch 
url_fetch_error = { 
    diag_log format["IDENTITY CHECK: URL: %1 ERROR: %2", _this select 0, _this select 1]; 
    [(format["IDENTITY CHECK: URL: %1 ERROR: %2", _this select 0, _this select 1])] spawn {(_this select 0) call {("debug_console" callExtension (_this + "~0001"))}}; 
}; 
 
url_fetch_callback = { 
    private["_url","_scr","_owner","_uid"]; 
    if (isNil "url_fetch_queue") then { 
        url_fetch_queue = [_this]; 
        { 
            _url = _x select 0; 
            _scr = _x select 1; 
            _owner = _this select 2; 
            _uid = _this select 3; 
            waitUntil { 
                if ("url_fetch" callExtension format [ 
                    "%1", 
                    _url 
                ] == "OK") exitWith {true}; 
                false 
            }; 
            private "_res"; 
            waitUntil { 
                _res = "url_fetch" callExtension "OK"; 
                if (_res != "WAIT") exitWith {true}; 
                false 
            }; 
            if (_res == "ERROR") then { 
                [ 
                    _url, 
                    "url_fetch" callExtension "ERROR" 
                ] spawn url_fetch_error; 
            } else { 
                if (typeName _scr == typeName {}) then { 
                    [_url, _res, _owner, _uid] spawn _scr; 
                } else { 
                    [_url, _res, _owner, _uid] execVM _scr; 
                }; 
            }; 
        } forEach url_fetch_queue; 
        url_fetch_queue = nil; 
    } else { 
        url_fetch_queue set [count url_fetch_queue, _this]; 
    }; 
}; 
 
url_fetch_function = { 
    if((_this select 1) in ["private","lowplaytime","noarmaowner","gamescount","notenoughegames"]) then { 
  //diag_log format["IDENTITY CHECK: PlayerID: %2 State: %1", _this select 1, _this select 3]; 
        "ArmaLeakTeam" serverCommand format["#kick %1",(_this select 2)]; 
        [(format["IDENTITY CHECK: PlayerID: %2 State: %1", _this select 1, _this select 3])] spawn {(_this select 0) call {("debug_console" callExtension (_this + "~0001"))}}; 
    }; 
}; 
*/ 
 
[] spawn zero_fnc_initServer; //Now init the server 
