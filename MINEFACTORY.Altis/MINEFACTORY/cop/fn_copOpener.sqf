{
    if (_x animationPhase "Door_1_rot" == 1) then {
        _x animate ["Door_1_rot", 0];
    } 
    else 
    {
        _x animate ["Door_1_rot", 1];
    };
    
} forEach (nearestObjects [player, ["Land_BarGate_F"], 25]); //25 bedeutet ab einer nähe von 25 Metern zur Schranke, kann belibig geändert werden