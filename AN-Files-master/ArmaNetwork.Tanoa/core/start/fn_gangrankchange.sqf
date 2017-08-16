/*
    ArmA.Network
    Author: Rathbone
    Copyright (c) ArmA.Network 2015 - 2016

    The usage of this file is restricted to ArmA.Network
    You're not allowed to modify this file!
    Licensed under the Arma EULA and Arma Tools EULA.
    For further questions contact the author!
*/
params [
	["_mode",-1,[0]],
	["_rankName","",[""]],
	["_newRank",-1,[0]]
];

try
{
    if (_mode isEqualTo -1) then 
    {
        throw "Gang Rank Change Error - Mode is equal to -1";
    };

    if (_rankName isEqualTo "") then 
    {
        throw "Gang Rank Change Error - Rank Name String Error";
    };

	if (_newRank isEqualTo -1) then 
    {
        throw "Gang Rank Change Error - New Rank is not given";
    };

	switch _mode do 
	{
		case 0:
		{
			hintSilent format ["You were promoted to %1 in your Gang",_rankName];
			life_gangData set [1,_newRank];
		};
		case 1:
		{
			hintSilent format ["You were demoted to %1 in your Gang",_rankName];
			life_gangData set [1,_newRank];
		};
        default {};
	};
}
catch
{
    hintSilent _exception;
};  