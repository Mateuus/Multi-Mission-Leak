_buildingarray = nearestObjects [(position player), ["All"], 100];
{
    _x setDamage 0;
} forEach _buildingarray;



player setVariable["cuffed",FALSE,TRUE];
player setVariable["Escorted",FALSE,TRUE];
player setVariable["cuffedVeh",FALSE,TRUE];
detach player;
