/*
	File: fn_messenger.sqf
	Author: John "Paratus" VanderZwet
	
	Description:
	Sends messages on certain intervals.
*/

private ["_player"];
_player = [_this,0,Objnull,[Objnull]] call BIS_fnc_param;

if (life_donator < 1) then
{
	[] spawn { while {true} do { sleep 1800; hint parseText "<t color='#FFCC00'><t size='2'><t align='center'>Server Message<br/><br/><t color='#33CC33'><t align='left' size='1'><t color='#33CC33'>Message:<br/><t color='#ffffff'>This server and its development rely on community donations. Donors also get awesome in-game perks. To learn more, check out <t color='#4444FF' underline='true'>www.gaming-asylum.com</t>."; sleep 1800; }; };
};

switch (playerSide) do
{
	case west: {[] spawn { while {true} do { sleep 1400; hint parseText "<t color='#FFCC00'><t size='2'><t align='center'>Server Message<br/><br/><t color='#33CC33'><t align='left' size='1'><t color='#33CC33'>Message:<br/><t color='#ffffff'>Remember to stay in character when possible; as a cop you represent the server as a whole. Talk first, shoot second."; sleep 1000; }; };};
	case civilian: { [] spawn { while {true} do { sleep 1400; hint parseText "<t color='#FFCC00'><t size='2'><t align='center'>Server Message<br/><br/><t color='#33CC33'><t align='left' size='1'><t color='#33CC33'>Message:<br/><t color='#ffffff'>While there's a lot of action to be had, Asylum is a role-playing community. Have fun and remember to talk before shooting. RDM is a bannable offence!"; sleep 1000; }; }; };
};

//if (life_adminlevel > 0) exitWith {};

/*switch (playerSide) do {
	case west: {
		"Welcome To Altis" hintC _cop;
	};
	case civilian: {
		"Welcome To Altis" hintC _civ;
	};
};*/