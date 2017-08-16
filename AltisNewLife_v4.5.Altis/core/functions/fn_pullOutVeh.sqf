if(playerSide == west OR (vehicle player == player)) exitWith {};
if(player getVariable "restrained") then
{
	detach player;
	player setVariable["Escorting",false,true];
	player setVariable["transporting",false,true];
};

player action ["Eject", vehicle player];
titleText["Vous avez été sorti du véhicule","PLAIN"];
titleFadeOut 4;