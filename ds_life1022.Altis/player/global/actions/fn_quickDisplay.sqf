/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Quick display to show player information on a hint
*/

private ["_stunWeapon","_medics","_mechanics","_security","_gangName","_bounty1","_bounty2","_bounty3","_bounty4","_bounty5","_bounty6","_bounty7","_pubsLocked","_copDeaths","_deathNum","_policeBank","_copNumbers","_civNumbers","_moralImg","_pubCopNumbers","_notWanted","_gangLock","_lotto"];

titleText [format ["",_message],"PLAIN"];

if((playerSide isEqualTo west)&&(DS_copLevel < 3)&&(!(miscInfoArray select 8)))then{player setVariable ["stunAmmo",true,true];};

if(DS_crimeRate > 10)then{DS_crimeRate = 10;publicVariable "DS_crimeRate"};

if(DS_menuOpened)exitWith{DS_menuOpened = false;hint ""};
DS_menuOpened = true;

[] spawn {
	sleep 20;
	DS_menuOpened = false;
};

_gangName = (group player) getVariable ["gangName",""];
_gangLock = "";
if(!(_gangName isEqualTo ""))then {
	_gangLock = if((group player) getVariable ["gangLocked",false])then{"Your gang is locked"}else{"Your gang is unlocked"};
};
_bounty1 = "";
_bounty2 = "";
_bounty3 = "";
_bounty4 = "";
_bounty5 = "";
_bounty6 = "";
_bounty7 = "";
_notWanted = "";

if(playerSide isEqualTo west)then {
	_copDeaths = "Lives remaining:  ";
	_deathNum = format ["%1",DS_infoArray select 9];
	_copDeaths = _copDeaths + _deathNum;
	_stunWeapon = if(player getVariable ["stunAmmo",false])then{"Ammo Type: STUN<br/>"}else{"Ammo Type: LETHAL<br/>"};
} else {
	_stunWeapon = "";
	_copDeaths = "";
};

if(player getVariable ["security",false])then {
	_stunWeapon = if(player getVariable ["stunAmmo",false])then{"Ammo Type: STUN<br/>"}else{"Ammo Type: LETHAL<br/>"};
};

if((DS_wanted_stats select 0) isEqualTo 0)then{_notWanted = "Not Wanted";};
if((DS_wanted_stats select 0) > 0)then{_bounty1 = "extras\icons\star.jpg";};
if((DS_wanted_stats select 0) > 4999)then{_bounty2 = "extras\icons\star.jpg";};
if((DS_wanted_stats select 0) > 14999)then{_bounty3 = "extras\icons\star.jpg";};
if((DS_wanted_stats select 0) > 29999)then{_bounty4 = "extras\icons\star.jpg";};
if((DS_wanted_stats select 0) > 49999)then{_bounty5 = "extras\icons\star.jpg";};
if((DS_wanted_stats select 0) > 99999)then{_bounty7 = "extras\icons\star.jpg";};

if(!(playerSide isEqualTo west))then {
	_policeBank = "";
} else {
	_policeBank = format ["Current money in police bank <br/> $%1 ",[DS_policebank] call DS_fnc_numberText];
};

_copNumbers = {_x getVariable ["cop",false]} count allPlayers;
_pubCopNumbers = {_x getVariable ["pubCop",false]} count allPlayers;
_medics = {_x getVariable ["medic",false]} count allPlayers;
_mechanics = {_x getVariable ["mechanic",false]} count allPlayers;
_security = {_x getVariable ["security",false]} count allPlayers;
_pubsLocked = if(miscInfoArray select 7)then{"Locked"}else{"Unlocked"};
_civNumbers = civilian countSide allPlayers;

_moralImg = switch(true)do {
	case (DS_moral isEqualTo 999): {"extras\icons\face_angel.jpg";};
	case (DS_moral > 820): {"extras\icons\face_thumbsUp.jpg";};
	case (DS_moral > 710): {"extras\icons\face_smile.jpg";};
	case (DS_moral > 600): {"extras\icons\face_glasses.jpg";};
	case (DS_moral > 500): {"extras\icons\face_highfive.jpg";};
	case (DS_moral > 375): {"extras\icons\face_sad.jpg";};
	case (DS_moral > 250): {"extras\icons\face_crying.jpg";};
	case (DS_moral > 120): {"extras\icons\face_thumbsDown.jpg";};
	case (DS_moral > 0): {"extras\icons\face_mad.jpg";};
	case (DS_moral isEqualTo 0): {"extras\icons\face_horrified.jpg";};
};

_string = parseText format ["%26<t color='#4CCF00' size='1.5'>Server Information</t><br/><br/>
<t color='#FFFFF'>Runtime: %1 Minutes</t><br/><br/>
<t color='#FFFF00'>Banked Money: $%2 </t><br/>
<t color='#FFFF00'>Money in Wallet: $%3 </t><br/><br/>
<t color='#81F781'>Civilians Online: %4</t><br/>
<t color='#81F781'> *Medics: %23</t><br/>
<t color='#81F781'> *Mechanics: %24</t><br/>
<t color='#81F781'> *Security Contractors: %25</t><br/>
<t color='#00BFFF'>Police Officers Online: %5</t><br/>
<t color='#00BFFF'>Rent-a-cops Online: (%6) %7</t><br/><br/>
<t size='1.5' color='#FFFFF3'>-- Total Players: %8 --</t><br/><br/>
<t color='#FFFFFF' size='1'>Current Crime Rate: %9 / 10</t><br/><br/>
<t color='#FFFF00' size='1'>Remaining NLR Time: %10 seconds</t><br/><br/>
<t color='#00BFFF' size='1'>%11</t><br/><br/>
<t color='#FF0000'>FPS: %12</t><br/><br/>
<t color='#2EFEF7'>Morality</t><br/>
<img size='5' image= '%13' /><br/><br/>
<t color='#00FF00'>Wanted Level</t><br/><br/>
<t color='#FF0000'>%14</t>
<img size='1' image= '%15' /><img size='1' image= '%16' /><img size='1' image= '%17' /><img size='1' image= '%18' /><img size='1' image= '%19' /><img size='1' image= '%20' /> <br/><br/><br/>
%21<br/><br/>
%22

"
,(round(time/60))
,[DS_atmCoin] call DS_fnc_numberText
,[DS_coin] call DS_fnc_numberText
,_civNumbers
,_copNumbers
,_pubsLocked
,_pubCopNumbers
,((_civNumbers)+(_copNumbers)+(_pubCopNumbers)+(_medics)+(_mechanics)+(_security))
,(floor(DS_crimeRate))
,DS_nlr_time
,_policeBank
,(round(diag_fps))
,_moralImg
,_notWanted
,_bounty1
,_bounty2
,_bounty3
,_bounty4
,_bounty5
,_bounty7
,_copDeaths
,_gangLock
,_medics
,_mechanics
,_security
,_stunWeapon
];

hint _string;