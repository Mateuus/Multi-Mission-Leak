/*
	File: fn_restrain.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Retrains the client.
*/
private["_unit","_player","_cop","_vehicle","_houseID","_boxID"];
_container = param [0,ObjNull,[ObjNull]];
_house = param [1,ObjNull,[ObjNull]];
_player = player;
_boxID = _container getVariable["containerID",-1];
_houseID = _house getVariable ["houseID",-1];
if(isNull _container) exitWith {};
if(_boxID == -1) exitWith {};
if (_houseID == -1) exitWith {};

_container setVariable ['DWEV_move_box',true,true];

(if (typeOf (_container) IN ["B_supplyCrate_F"])) then {_container attachTo [player,[0,1.5,0.86]];};
(if (typeOf (_container) IN ["Box_IND_Grenades_F"])) then {_container attachTo [player,[0,1.5,0.3]];};

_isContainer = (if (typeOf (_container) IN ["Box_IND_Grenades_F","B_supplyCrate_F"]) then {true;} else {false;});

DWEV_currentBox = _container;
while {_container getVariable ['DWEV_move_box',false]} do
{
				
	if((!alive player) || ((_container distance _house) > 9)) exitWith
	{
//		Hint "Kiste zu weit weg vom Hauses, nach einem Server restart ist die Kiste wieder da."; //erstmal nur loggen
		[8,_player,"DropBox",format ["%1 mit ID %2 mit HausID %3",(typeOf (_container)),_boxID,_houseID]] remoteExec ["DB_fnc_logToDB",(if (DWEV_HC_isActive && DWEV_HC_VALID) then {hc_1} else {2})];
//		deletevehicle _container; //Löscht die Kiste wenn Spieler zu weit vom Haus ist oder beim verschieben stirbt. Erstmal nur Loggen :)
	};

	sleep 0.3;
};
		
detach _container;
_container setVariable ['DWEV_move_box',false,true];

if (_isContainer) then 
{
	[_container] remoteExec ["DWF_fnc_updateHouseContainerPos",(if (DWEV_HC_isActive && DWEV_HC_VALID) then {hc_1} else {2})]; 
}
else
{
	[_container] remoteExec ["DWF_fnc_updateHouseFurniturePos",(if (DWEV_HC_isActive && DWEV_HC_VALID) then {hc_1} else {2})]; 
};
DWEV_currentBox = nil;
