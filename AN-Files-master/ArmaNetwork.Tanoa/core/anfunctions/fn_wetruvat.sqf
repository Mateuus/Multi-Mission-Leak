/*
	ArmA.Network
	Author: Rathbone
	Copyright (c) ArmA.Network 2015 - 2016

	The usage of this file is restricted to ArmA.Network
	You're not allowed to modify this file!
	Licensed under the Arma EULA and Arma Tools EULA.
	For further questions contact the author!
*/
switch playerSide do 
{
    case west: 
    {
        [] call life_fnc_defruhuf;
        [0] call life_fnc_cruswutaq;
    };
    case independent: 
    {
        [] call life_fnc_cathatur;
        [0] call life_fnc_cruswutaq;
    };
    case civilian: 
    {
        if (life_newPlayer) then 
        {
            [] spawn life_fnc_ruduk;
        } 
        else 
        {
            [] call life_fnc_qeswanef;
            [0] call life_fnc_cruswutaq;
        };
    };
    default {};
};
