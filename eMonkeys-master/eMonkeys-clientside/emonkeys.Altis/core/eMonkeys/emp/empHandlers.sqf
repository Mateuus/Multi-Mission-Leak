    /*
    EMP VEHICLE SCRIPT
    File: empHandlers.sqf
    Author: DemoCore
    Date: 2014.05.05
    Version: 1.00
    */
     
     
    empWarn = nil;
    "empWarn" addPublicVariableEventHandler
    {
            _toEmp = _this select 1;
            [_toEmp] spawn
            {
                    _vehicle = (_this select 0);
                    _newCooldown = time + warnCooldown;
                    _vehicle setVariable["warnReadyTimeStamp", _newCooldown];
                    [1604, _newCooldown, _vehicle] execVM "core\eMonkeys\emp\menuCooldownCounter.sqf";
            };
    };
     
    empUpdateLaunchVariable = nil;
    "empUpdateLaunchVariable" addPublicVariableEventHandler
    {
            _id = (_this select 0);
            _vehicleGotten = _this select 1;
            [_vehicleGotten] spawn
            {
                    _vehicle = (_this select 0);
                    _vehicle setVariable["empReadyTimeStamp", _newCooldown];
                    [1603, _newCooldown, _vehicle] execVM "core\eMonkeys\emp\menuCooldownCounter.sqf";
            };
    };
     
    empLaunch = nil;
    "empLaunch" addPublicVariableEventHandler
    {
            _id = (_this select 0);
           
            //spawn -> IN HINTERGRUND PROZESS, DAMIT uisleep GEHT!
            _toEmp = _this select 1;
            //[_var] execVM "defuseBomb.sqf";
            [_toEmp] spawn
            {
                    _vehicle = (_this select 0);
                    [getPos _vehicle] execVM "core\eMonkeys\emp\empLight.sqf";
                    _newCooldown = time + empCooldown;
            };
    };

