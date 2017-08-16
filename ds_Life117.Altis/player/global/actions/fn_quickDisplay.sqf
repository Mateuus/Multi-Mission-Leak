/*
Darkside Life

Author: Shawn "Huntah" Macgillivray

Description:
Quick display to show player information on a hint
*/
private["_stunWeapon","_medics","_mechanics","_security","_gangName","_bounty1","_bounty2","_bounty3","_bounty4","_bounty5","_bounty6","_bounty7","_pubsLocked","_copDeaths","_deathNum","_policebank","_copnumbers","_civnumbers","_moralImg","_pubcopNumbers","_notWanted","_gangLock","_lotto"];
titleText[format["",_message],"PLAIN"];

//TESTING CASH

if(DS_menuOpened)exitwith{DS_menuOpened = false;hint ""};
DS_menuOpened = true;
[] spawn
	{
	sleep 20;
	DS_menuOpened = false;
	};

_medics = 0;
_mechanics = 0;
_security = 0;
_gangLock = "";
_gangName = (group player) getVariable ["gangName",""];
if(_gangName != "")then
	{
	if((group player) getVariable ["gangLocked",false])then
		{
		_gangLock = "Your gang is locked";
		}
		else
		{
		_gangLock = "Your gang is unlocked";
		};
	};
_bounty1 = "";
_bounty2 = "";
_bounty3 = "";
_bounty4 = "";
_bounty5 = "";
_bounty6 = "";
_bounty7 = "";
_notWanted = "";
_pubsLocked = "Locked";

if(playerside == west)then
	{
	_copDeaths = "Lives remaining:  ";
	_deathNum = format ["%1",DS_infoArray select 9];
	_copDeaths = _copDeaths + _deathNum;
	if(player getVariable ["stunAmmo",false])then
		{
		_stunWeapon = "Ammo Type: STUN<br/>";
		}
		else
		{
		_stunWeapon = "Ammo Type: Lethal<br/>";
		};
	}
	else
	{
	_stunWeapon = "";
	_copDeaths = "";
	};
if(player getVariable ["security",false])then
	{
	if(player getVariable ["stunAmmo",false])then
		{
		_stunWeapon = "Ammo Type: STUN<br/>";
		}
		else
		{
		_stunWeapon = "Ammo Type: Lethal<br/>";
		};
	};
if((DS_wanted_stats select 0) == 0)then
	{
	_notWanted = "Not Wanted";
	};
if((DS_wanted_stats select 0) > 0)then
	{
	_bounty1 = "extras\icons\star.jpg";
	};
if((DS_wanted_stats select 0) > 4999)then
	{
	_bounty2 = "extras\icons\star.jpg";
	};
if((DS_wanted_stats select 0) > 14999)then
	{
	_bounty3 = "extras\icons\star.jpg";
	};
if((DS_wanted_stats select 0) > 29999)then
	{
	_bounty4 = "extras\icons\star.jpg";
	};
if((DS_wanted_stats select 0) > 49999)then
	{
	_bounty5 = "extras\icons\star.jpg";
	};
if((DS_wanted_stats select 0) > 99999)then
	{
	_bounty7 = "extras\icons\star.jpg";
	};
if(playerside != west)then
	{
	_policebank = "";
	}
	else
	{
	_policebank = format ["Current money in police bank <br/> $%1 ",[DS_policebank] call DS_fnc_numberText];
	};
_copnumbers = 0;
_pubcopNumbers = 0;
{
	if(_x getVariable ["cop",false])then
		{
		_copnumbers = _copnumbers + 1;
		};
	if(_x getVariable ["pubcop",false])then
		{
		_pubcopNumbers = _pubcopNumbers + 1;
		};
	if(_x getVariable ["medic",false])then
		{
		_medics = _medics + 1;
		};
	if(_x getVariable ["mechanic",false])then
		{
		_mechanics = _mechanics + 1;
		};
	if(_x getVariable ["security",false])then
		{
		_security = _security + 1;
		};
}forEach playableUnits;
if(miscInfoArray select 7)then{_pubsLocked = "locked"}else{_pubsLocked = "Unlocked"};
_civnumbers = (count(playableUnits)) - ((_copnumbers)+(_pubcopNumbers)+(_medics)+(_mechanics)+(_security));
if(DS_moral > 999)then{DS_moral = 999};
if(DS_moral < 0)then{DS_moral = 0};
if(DS_moral isEqualTo 999)then
	{
	_moralImg = "extras\icons\face_angel.jpg";
	};
if(DS_moral < 999)then
	{
	_moralImg = "extras\icons\face_thumbsUp.jpg";
	};
if(DS_moral < 820)then
	{
	_moralImg = "extras\icons\face_smile.jpg";
	};	
if(DS_moral < 710)then
	{
	_moralImg = "extras\icons\face_glasses.jpg";
	};	
if(DS_moral < 600)then
	{
	_moralImg = "extras\icons\face_highfive.jpg";
	};	
if(DS_moral < 500)then
	{
	_moralImg = "extras\icons\face_sad.jpg";
	};	
if(DS_moral < 375)then
	{
	_moralImg = "extras\icons\face_crying.jpg";
	};		
if(DS_moral < 250)then
	{
	_moralImg = "extras\icons\face_thumbsDown.jpg";
	};		
if(DS_moral < 120)then
	{
	_moralImg = "extras\icons\face_mad.jpg";
	};		
if(DS_moral isEqualTo 0)then
	{
	_moralImg = "extras\icons\face_horrified.jpg";
	};	
_str = parseText format ["%26<t color='#4CCF00' size='1.5'>Server Information</t><br/><br/>
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
<t color='#FFFFFF' size='1'>Current Fuel Price: $%9 / 10-litres</t><br/><br/>
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
,[DS_atmcoin] call DS_fnc_numberText
,[DS_coin] call DS_fnc_numberText
,_civnumbers
,_copnumbers
,_pubsLocked
,_pubcopNumbers
,((_civnumbers)+(_copnumbers)+(_pubcopnumbers)+(_medics)+(_mechanics)+(_security))
,(gasMoneyArray select 11)
,DS_nlr_time
,_policebank
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

hint _str;






































