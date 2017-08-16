/*
	File: initPlayerLocal.sqf

	Description:
	Starts the initialization of the player.
*/
if(!hasInterface) exitWith {}; //This is a headless client, he doesn't need to do anything but keep being headless..
if ("epoch_objects" in activatedAddons) exitWith {["Mod",true,false] spawn BIS_fnc_endMission;};
if ("cooldown" in allVariables uiNamespace) exitWith {["Koth",true,false] spawn BIS_fnc_endMission;};

#define CONST(var1,var2) var1 = compileFinal (if(typeName var2 == "STRING") then {var2} else {str(var2)})
CONST(BIS_fnc_endMission,BIS_fnc_endMission);
//[] execVM "SpyGlass\fn_initSpy.sqf";
[] execVM "core\init.sqf";

//Execute JIP code.
if((_this select 1)) then {
	[] execVM "core\jip.sqf";
};

// disable random radio chatter
enableRadio false;
enableSentences false;

//Log Markers
KK_fnc_collectMrkInfo = {
       [
           _this,
           markerText _this,
           markerPos _this,
           mapGridPosition markerPos _this,           
           markerDir _this,
           markerSize _this,
           markerType _this,
           markerShape _this,
           markerBrush _this,
           markerColor _this,
           markerAlpha _this
       ]
   };
   KK_fnc_setMrkEHs = {
       scopeName "func";
       waitUntil {
           if (
               _this == 53 && getClientState == "BRIEFING READ"
           ) then {
               breakOut "func";
           };
           !isNull findDisplay _this
       };
       findDisplay _this displayAddEventHandler [
           "KeyDown", 
           {
               if (_this select 1 == 211) then {
                   _mrknames = allMapMarkers;
                   _mrkdetails = [];
                   {
                       _mrkdetails pushBack (
                           _x call KK_fnc_collectMrkInfo
                       );
                   } forEach _mrknames;
                   0 = [_mrknames, _mrkdetails] spawn {
                       _mrknames = _this select 0;
                       _mrkdetails = _this select 1;
                       PG_markerLog = [
                           "DELETED",
                           name player,
                           getplayerUID player
                       ];
                       {
                           _i = _mrknames find _x;
                           if (_i > -1) then {
                               PG_markerLog pushBack (_mrkdetails select _i);
                           };
                       } forEach (_mrknames - allMapMarkers);
                       if (count PG_markerLog > 3) then {
                           publicVariableServer "PG_markerLog";
                       };
                   };
                   false
               } else {
				if (_this select 3) then {
					PG_markerLog = "I probably drew a line on the Map";
					publicVariableServer "PG_markerLog";					};				
			};            }
       ];
       findDisplay _this displayAddEventHandler [
           "ChildDestroyed", 
           {
               if (
                   ctrlIdd (_this select 1) == 54 && _this select 2 == 1
               ) then {
                   0 = all_mrkrs spawn {
                       PG_markerLog = [
                           "PLACED",
                           name player,
                           getplayerUID player
                       ];
                       {
                           PG_markerLog pushBack (
                               _x call KK_fnc_collectMrkInfo
                           );      
                       } forEach (allMapMarkers - _this);
                       if (count PG_markerLog > 3) then {
                           publicVariableServer "PG_markerLog";
                       };  
                   };
               };
           }
       ];
       findDisplay _this displayCtrl 51 ctrlAddEventHandler [
           "MouseButtonDblClick", 
           {
               0 = 0 spawn {
                   if (!isNull findDisplay 54) then {
                       findDisplay 54 displayCtrl 1 
                           buttonSetAction "all_mrkrs = allMapMarkers";
                   };
               };
           }
       ];
   };
0 = 12 spawn KK_fnc_setMrkEHs;
0 = 53 spawn KK_fnc_setMrkEHs;