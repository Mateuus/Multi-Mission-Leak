/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Creates a NLR timer for the player
*/

private ["_deathPos"];

if((playerSide isEqualTo west)&&(miscInfoArray select 8))exitWith{};

_deathPos = getPos (vehicle player);
sleep 20;
if(_deathPos distance spawnIsland < 2000)exitWith{DS_nlr = false;};//Ignore NLR on spawn island
if((str(player) in ["cop_1","cop_4","cop_3","cop_5","cop_6","cop_7"])&&(miscInfoArray select 7)&&(_deathPos distance kavAtm_4 < 6000))exitWith{DS_nlr = false;};//Pub cops, have no choice when locked into Kavala
DS_nlr_time = 900;

while{true}do {
	if(DS_nlr_time < 0)exitWith{hint "New life cooldown is over";DS_nlr = false;DS_nlr_time = 0;};
	if(DS_revived)exitWith{DS_revived = false;DS_nlr = false;DS_nlr_time = 0;};
	if(!alive player)exitWith{DS_nlr_time = 0;};
	if((alive player)&&(player distance _deathPos < 1500))then {
	   hint format ["!!!Warning!!!\n You are too close to the point of your last death (within 1.5km)\n\n This is in breach of the New life rule\n\n\n You are not allowed back here for another %1 minutes\n\n\n Message the admins and get approval to break NLR if you have a valid explanation to do so otherwise you could be kicked without warning (leave the area until you get approval)\n\n\n If you have died by a glitch, make sure you explain to the admins what it is and that you are messaging about NLR",(round(DS_nlr_time/60))];
		DS_nlr = true;
	} else {
		DS_nlr = false;
	};
	player setVariable ["breakingNLR",DS_nlr,true];
	sleep 10;
	DS_nlr_time = DS_nlr_time - 10;
};

DS_nlr = false;
player setVariable ["breakingNLR",DS_nlr,true];