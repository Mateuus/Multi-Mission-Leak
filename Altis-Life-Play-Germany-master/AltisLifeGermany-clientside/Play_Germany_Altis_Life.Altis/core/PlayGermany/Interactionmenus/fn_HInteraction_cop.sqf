/*


	Show vehicle interaction menu


*/


private["_display","_curTarget","_bLockHouse","_bSearch","_bRaid","_bHouseOwner","_bVersiegeln"];
if(!dialog) then {
	createDialog "d_HInteraction_cop";
};
disableSerialization;
_curTarget = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _curTarget) exitWith {closeDialog 0;}; //Bad target

_display = findDisplay 37402;

_bLockHouse = _display displayCtrl 9991;
_bSearch = _display displayCtrl 9992;
_bRaid = _display displayCtrl 9993;
_bHouseOwner = _display displayCtrl 9994; // Deaktiviert
_bVersiegeln = _display displayCtrl 999979; // Aktiviert
_bVersiegeln ctrlShow false;
_bLockHouse ctrlShow false;
_bSearch ctrlShow false;
_bRaid ctrlShow false;
_bHouseOwner ctrlShow false;
life_pInact_curTarget = _curTarget;
if(_curTarget isKindOf "House_F" && playerSide == west) exitWith {
	if(fed_bank_dome == _curTarget OR (nearestObject [fed_bank,"Land_Research_house_V1_F"]) == _curTarget) then {
		
		_bVersiegeln ctrlSetTooltip "Versiegeln";
		_bVersiegeln buttonSetAction "[life_pInact_curTarget] spawn life_fnc_repairDoor; closeDialog 0;";
		_bVersiegeln ctrlShow true;
		
		//Zentralbank
		_bRaid ctrlSetTooltip "Tür öffnen";
		_bRaid buttonSetAction "[life_pInact_curTarget] spawn life_fnc_copOpenBank; closeDialog 0;";
		_bRaid ctrlShow true;
		
		
	} else {
		if(!isNil {_curTarget getVariable "house_owner"}) then {
			_bHouseOwner ctrlSetTooltip localize "STR_House_Raid_Owner";
			_bHouseOwner buttonSetAction "[life_pInact_curTarget] call life_fnc_copHouseOwner;";
			_bHouseOwner ctrlShow true;
			
			_bRaid ctrlSetTooltip localize "STR_pInAct_BreakDown";
			_bRaid buttonSetAction "[life_pInact_curTarget] spawn life_fnc_copBreakDoor; closeDialog 0;";
			_bRaid ctrlShow true;
			
			_bSearch ctrlSetTooltip localize "STR_pInAct_SearchHouse";
			_bSearch buttonSetAction "[life_pInact_curTarget] spawn life_fnc_raidHouse; closeDialog 0;";
			_bSearch ctrlShow true;
			
			if(player distance _curTarget > 3.6) then {
				_bSearch ctrlEnable false;
			};
			
			_bLockHouse ctrlSetTooltip localize "STR_pInAct_LockHouse";
			_bLockHouse buttonSetAction "[life_pInact_curTarget] spawn life_fnc_lockupHouse; closeDialog 0;";
			_bLockHouse ctrlShow true;
		} else {
			closeDialog 0;
		};
	};
};

	


