/* 
EMP VEHICLE SCRIPT
File: launchEmp.sqf
Author: DemoCore
Date: 2014.05.05
Version: 1.01
*/
_gen = _this select 0;
_caller = _this select 1;
_id = _this select 2;

_listControl = 1500;

empDidAction = false;

disableSerialization;

//if(_caller ist polizist) then {
	_vehicle = vehicle _caller;
	if(typeof _vehicle in allowedVehicles) then
	{
		gottenVehicles = [];
		empSelection = 0;
		empListSelection = -1;
		_list = (findDisplay 13371) displayCtrl _listControl;
		
		
		createDialog "EmpMenu";
		//liste updaten
		[_listControl, _vehicle] execVm "core\eMonkeys\emp\updateTerminal.sqf";
		while{dialog} do
		{
			waitUntil { empDidAction or !dialog};
			//check ob die Person darin sitzt
			if(!(_vehicle == _caller)) then
			{
				//check ob helikopter alive ist.
				if(damage _vehicle < 1) then
				{
					if(empListSelection > -1) then
					{
						_toEmp = gottenVehicles select (empListSelection);
						//check ob auslösen ausgewählt wurde und in der liste etwas ausgewätl wurde
						if((empSelection == 2)) then
						{
							_restCooldownWarn = (_vehicle getVariable ["warnReadyTimeStamp", 0]) - time;
							_restCooldown = (_vehicle getVariable ["empReadyTimeStamp", 0]) - time;
							if((_restCooldown <= 0) and (_restCooldownWarn <= 0)) then
							{
								//launch light on every client
								empLaunch = _toEmp;
								publicVariable "empLaunch";
								
								//do hit on owner of vehicle
								if(local _toEmp) then
								{//lichtgröße, leichen
									_toEmp setHitPointDamage ["hitEngine", 1.0];
								};
								[getPos _toEmp] execVM "core\eMonkeys\emp\empLight.sqf";
								
								//set emp cooldown global
								_newCooldown = time + empCooldown;
								_vehicle setVariable["empReadyTimeStamp", _newCooldown];
								
								[1603, _newCooldown, _vehicle] execVM "core\eMonkeys\emp\menuCooldownCounter.sqf";
								
								[[_toEmp],"EMonkeys_fnc_empHit",_toEmp] call EMonkeys_fnc_mp;
								[[_toEmp, "fired"],"EMonkeys_fnc_empWarning",true,false] call EMonkeys_fnc_mp;
								
								playSound3d [MISSION_ROOT + "sounds\empSound.ogg", player];
								playSound3d [MISSION_ROOT + "sounds\empSound.ogg", _toEmp];
							};
							//hint format["cooldown set to %1", time + _empCooldown];
						};
						//warnen
						if(empSelection == 1) then
						{
							_restCooldownWarn = (_vehicle getVariable ["warnReadyTimeStamp", 0]) - time;
							
							if(_restCooldownWarn <= 0) then
							{
								empWarn = _toEmp;
								publicVariable "empWarn";
								playSound3d [MISSION_ROOT + "sounds\empWarnSound.ogg", _toEmp];
								playSound3d [MISSION_ROOT + "sounds\empWarnSound.ogg", _toEmp, true];
								playSound3d [MISSION_ROOT + "sounds\empWarnSound.ogg", player];
								
								[[_toEmp, "warning"],"EMonkeys_fnc_empWarning",true,false] call EMonkeys_fnc_mp;
								
								_newCooldown = time + warnCooldown;
								_vehicle setVariable["warnReadyTimeStamp", _newCooldown];
								[1604, _newCooldown, _vehicle] execVM "core\eMonkeys\emp\menuCooldownCounter.sqf";
							};
						};
					};
				};
			};
			empDidAction = false;
			empSelection = 0;
		};
	}
	else
	{
		//hint format["%1", typeof _vehicle];
		hint "Du musst dich in einem EMP fähigen Hubschrauber befinden.";
	};

	
//};