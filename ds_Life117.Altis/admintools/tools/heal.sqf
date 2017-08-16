if ((getPlayerUID player) in ["76561198132386162","76561198004047579"]) exitwith {hint 'inappropriate admin level';};
hint format ["Healing..."];
sleep 2;
player setDamage 0;
hint format ["Done"];
//diag_log format["Admin heal used by %1",(name player)];