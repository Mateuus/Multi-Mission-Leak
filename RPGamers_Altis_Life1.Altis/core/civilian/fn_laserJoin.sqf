if (playerSide != civilian) exitWith { ["You can't play laser tag while on duty! GET TO WORK!",5,"orange"] call RPG_Fnc_Msg; };

["You have joined the laser tag queue",5,"blue"] call RPG_Fnc_Msg;
["The next game will start any time within the next few minutes",5,"blue"] call RPG_Fnc_Msg;
["Stay nearby or joining will fail!",5,"blue"] call RPG_Fnc_Msg;

player setVariable ["life_laser_pos", getPos player, true];
life_old_group = group player;

[[player],"RPG_fnc_laserQueue",false,false] spawn BIS_fnc_MP;