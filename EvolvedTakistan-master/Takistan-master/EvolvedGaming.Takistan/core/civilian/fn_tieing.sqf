/*

	Description:
	tieing
*/
private["_civ"];
_civ = param [0,Objnull,[Objnull]];
if(isNull _civ) exitWith {};

//Monitor excessive restrainment
[] spawn
{
	private["_time"];
	while {true} do
	{
		_time = time;
		waitUntil {uiSleep 1; (!(player getVariable ["tied", false]) || (time - _time) > (6 * 90))};
		
		if(!(player getVariable["tied", false])) exitWith {};
		if(!([west,getPos player,30] call life_fnc_nearUnits) && (player getVariable["tied", false]) && isNull objectParent player) exitWith {
			player setVariable["restrained", nil, true];
			player setVariable["Escorting", nil, true];
			player setVariable["transporting", nil, true];
			player setVariable["tied", nil, true];

			detach player;
			titleText[format["You managed to wiggle free"],"PLAIN"];
		};
	};
};

titleText[format["%1 ziptied you.",name _civ],"PLAIN"];

if((player getVariable["surrender", false])) then { player setVariable["surrender", nil, true]; };	

player switchMove "";

while {player getVariable ["tied", false]} do
{

	if(isNull objectParent player) then {
		player playMove "AmovPercMstpSnonWnonDnon_Ease";
	};

	_state = vehicle player;
	waitUntil {animationState player != "AmovPercMstpSnonWnonDnon_Ease" || !(player getvariable ["tied", false]) || vehicle player != _state};
			
	if(!alive player) exitWith
	{
		player setVariable ["restrained", nil, true];
		player setVariable ["Escorting", nil, true];
		player setVariable ["transporting", nil, true];
		player setVariable ["tied", nil, true];
		detach _player;
	};

	if(vehicle player != player) then
	{
		//disableUserInput true;
		if(driver (vehicle player) == player) then {player action["eject",vehicle player];};
	};
};

//disableUserInput false;
		
if(alive player) then
{
	player switchMove "AmovPercMstpSlowWrflDnon_SaluteIn";
	player setVariable ["restrained", nil, true];
	player setVariable ["Escorting", nil, true];
	player setVariable ["transporting", nil, true];
	player setVariable ["tied",nil , true];
	detach player;
};