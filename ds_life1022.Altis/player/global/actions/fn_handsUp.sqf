/*
    File: fn_handsUp.sqf

    Author:

    Description:
	Makes the player put their hands on their head
*/

if((player getVariable ["restrained",false])||(player getVariable ["escorting",false]))exitwith{};
if(!isNull objectParent player)exitwith{};
if((speed player) > 1)exitwith{};
if(player getVariable ["surrender",false])exitwith{player setVariable ["surrender",false,true];};

player setVariable ["surrender",true,true];

while {player getVariable ["surrender",false]} do
	{
	player playMove "AmovPercMstpSnonWnonDnon_AmovPercMstpSsurWnonDnon";

	if(!(alive player)||(!isNull objectParent player))then
		{
		player setVariable ["surrender",false,true];
		};
	};

player playMoveNow "AmovPercMstpSnonWnonDnon_AwopPercMstpSoptWbinDnon_end";