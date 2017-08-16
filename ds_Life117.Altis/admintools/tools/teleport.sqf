if ((getPlayerUID player) in ["76561198132386162","76561198004047579"]) exitwith {hint 'inappropriate admin level';};
cutText ["Click somewhere on the map to move there", "PLAIN"];
onMapSingleClick "vehicle player setPos _pos; onMapSingleClick '';true;";

//diag_log format["Admin teleport used by %1",(name player)];
