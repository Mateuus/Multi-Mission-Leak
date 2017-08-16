/*
	Darkside Life

	Author: ShadowRanger (Luke)

	Description:
	Adds a player's police task actions
*/

private ["_removeOld"];

_removeOld = [_this,0,false,[false]] call BIS_fnc_param;

if(_removeOld)then
    {
    player removeAction DS_taskAction1;
    player removeAction DS_taskAction2;
    player removeAction DS_taskAction3;
    player removeAction DS_taskAction4;
    player removeAction DS_taskAction5;
    player removeAction DS_taskAction6;
    player removeAction DS_taskAction7;
    player removeAction DS_taskAction8;
    player removeAction DS_taskAction9;
    player removeAction DS_taskAction10;
    player removeAction DS_taskAction11;
    };

DS_taskAction1 = player addAction["<t color='#FF8000'>Update Task</t>",{DS_setTask = true;},[],2000,false,false,"",
'!DS_setTask'];
DS_taskAction2 = player addAction["<t color='#FF8000'>Awaiting Orders</t>",DS_fnc_setupTaskActions,0,1010,false,false,"",
'DS_setTask'];
DS_taskAction3 = player addAction["<t color='#FF8000'>Patrolling</t>",DS_fnc_setupTaskActions,1,1009,false,false,"",
'DS_setTask'];
DS_taskAction4 = player addAction["<t color='#FF8000'>Sting Operation</t>",DS_fnc_setupTaskActions,2,1006,false,false,"",
'DS_setTask'];
DS_taskAction5 = player addAction["<t color='#FF8000'>Pursuing</t>",DS_fnc_setupTaskActions,3,1007,false,false,"",
'DS_setTask'];
DS_taskAction6 = player addAction["<t color='#FF8000'>Processing</t>",DS_fnc_setupTaskActions,4,1005,false,false,"",
'DS_setTask'];
DS_taskAction7 = player addAction["<t color='#FF8000'>Responding</t>",DS_fnc_setupTaskActions,5,1008,false,false,"",
'DS_setTask'];
DS_taskAction8 = player addAction["<t color='#FF8000'>Piloting</t>",DS_fnc_setupTaskActions,6,1004,false,false,"",
'DS_setTask'];
DS_taskAction9 = player addAction["<t color='#FF8000'>Raiding</t>",DS_fnc_setupTaskActions,7,1003,false,false,"",
'DS_setTask'];
DS_taskAction10 = player addAction["<t color='#FF8000'>Escorting Convoy</t>",DS_fnc_setupTaskActions,8,1002,false,false,"",
'DS_setTask'];
DS_taskAction11 = player addAction["<t color='#FF8000'>On a break</t>",DS_fnc_setupTaskActions,9,1001,false,false,"",
'DS_setTask'];