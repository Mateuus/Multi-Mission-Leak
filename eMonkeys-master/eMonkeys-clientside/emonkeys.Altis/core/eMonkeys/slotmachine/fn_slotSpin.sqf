/*
	File: fn_slotspin.sqf
	Author: Jacob "PapaBear" Tyler
	Description: Takes bet, spins slots, determines if win, pays

*/
private["_slot","_slot1","_slot2","_slot3","_winnings","_slotcash","_betamt","_display","_jackpot","_cashText"];
_betamt = [_this,0,1,[0]] call BIS_fnc_param;
if(EMonkeys_c164 < _betamt) exitWith {hint format["Du hast nicht genug Geld, du brauchst mindestens %1€",_betamt];};
EMonkeys_c164 = (EMonkeys_c164 - _betamt);

disableSerialization;
(findDisplay 5780) displaySetEventHandler ["keyDown","_this call EMonkeys_fnc_displayHandler"];
_display = findDisplay 5780;
_slotcash = 0;
_slotPic1 = _display displayCtrl 5771;
_slotPic2 = _display displayCtrl 5772;
_slotPic3 = _display displayCtrl 5773;
_winningsText = _display displayCtrl 5775;
_cashText = _display displayCtrl 5776;
_bet1 = _display displayCtrl 5778;
_bet2 = _display displayCtrl 5779;
_bet3 = _display displayCtrl 5781;
_bet4 = _display displayCtrl 5782;
_closeButton = _display displayCtrl 5783;

_bet1 ctrlEnable false;
_bet2 ctrlEnable false;
_bet3 ctrlEnable false;
_bet4 ctrlEnable false;
_closeButton ctrlEnable false;

_cashText ctrlSetText format["%1",[EMonkeys_c164] call EMonkeys_fnc_numberText];

eM_action_inUse = true;
player say3D "spin";

// ROTATE SIMULATION ;)
for "_i" from 0 to 10 do
{
_number = ceil(random 8);

if (_number == 0) then {_slot1 = 0; _slotPic1 ctrlSetText "core\textures\menu_icons\icon_0.paa";};
if (_number == 1) then {_slot1 = 100; _slotPic1 ctrlSetText "core\textures\menu_icons\icon_1.paa";};
if (_number == 2) then {_slot1 = 200; _slotPic1 ctrlSetText "core\textures\menu_icons\icon_2.paa";};
if (_number == 3) then {_slot1 = 300; _slotPic1 ctrlSetText "core\textures\menu_icons\icon_3.paa";};
if (_number == 4) then {_slot1 = 400; _slotPic1 ctrlSetText "core\textures\menu_icons\icon_4.paa";};
if (_number == 5) then {_slot1 = 500; _slotPic1 ctrlSetText "core\textures\menu_icons\icon_5.paa";};
if (_number == 6) then {_slot1 = 600; _slotPic1 ctrlSetText "core\textures\menu_icons\icon_6.paa";};
if (_number == 7) then {_slot1 = 700; _slotPic1 ctrlSetText "core\textures\menu_icons\icon_7.paa";};
if (_number == 8) then {_slot1 = 800; _slotPic1 ctrlSetText "core\textures\menu_icons\icon_8.paa";};
if (_number == 9) then {_slot1 = 900; _slotPic1 ctrlSetText "core\textures\menu_icons\icon_9.paa";};


uisleep 0.1;

_number = ceil(random 8);

if (_number == 0) then {_slot2 = 0; _slotPic2 ctrlSetText "core\textures\menu_icons\icon_0.paa";};
if (_number == 1) then {_slot2 = 10; _slotPic2 ctrlSetText "core\textures\menu_icons\icon_1.paa";};
if (_number == 2) then {_slot2 = 20; _slotPic2 ctrlSetText "core\textures\menu_icons\icon_2.paa";};
if (_number == 3) then {_slot2 = 30; _slotPic2 ctrlSetText "core\textures\menu_icons\icon_3.paa";};
if (_number == 4) then {_slot2 = 40; _slotPic2 ctrlSetText "core\textures\menu_icons\icon_4.paa";};
if (_number == 5) then {_slot2 = 50; _slotPic2 ctrlSetText "core\textures\menu_icons\icon_5.paa";};
if (_number == 6) then {_slot2 = 60; _slotPic2 ctrlSetText "core\textures\menu_icons\icon_6.paa";};
if (_number == 7) then {_slot2 = 70; _slotPic2 ctrlSetText "core\textures\menu_icons\icon_7.paa";};
if (_number == 8) then {_slot2 = 80; _slotPic2 ctrlSetText "core\textures\menu_icons\icon_8.paa";};
if (_number == 9) then {_slot2 = 90; _slotPic2 ctrlSetText "core\textures\menu_icons\icon_9.paa";};


uisleep 0.1;

_number = ceil(random 8);

if (_number == 0) then {_slot3 = 0; _slotPic3 ctrlSetText "core\textures\menu_icons\icon_0.paa";};
if (_number == 1) then {_slot3 = 1; _slotPic3 ctrlSetText "core\textures\menu_icons\icon_1.paa";};
if (_number == 2) then {_slot3 = 2; _slotPic3 ctrlSetText "core\textures\menu_icons\icon_2.paa";};
if (_number == 3) then {_slot3 = 3; _slotPic3 ctrlSetText "core\textures\menu_icons\icon_3.paa";};
if (_number == 4) then {_slot3 = 4; _slotPic3 ctrlSetText "core\textures\menu_icons\icon_4.paa";};
if (_number == 5) then {_slot3 = 5; _slotPic3 ctrlSetText "core\textures\menu_icons\icon_5.paa";};
if (_number == 6) then {_slot3 = 6; _slotPic3 ctrlSetText "core\textures\menu_icons\icon_6.paa";};
if (_number == 7) then {_slot3 = 7; _slotPic3 ctrlSetText "core\textures\menu_icons\icon_7.paa";};
if (_number == 8) then {_slot3 = 8; _slotPic3 ctrlSetText "core\textures\menu_icons\icon_8.paa";};
if (_number == 9) then {_slot3 = 9; _slotPic3 ctrlSetText "core\textures\menu_icons\icon_9.paa";};


uisleep 0.1;
};



if((_slot1 == 0) && (_slot2 == 0) && (_slot3 == 0)) then { _slot = 999; } else 
{
_slot = _slot1 + _slot2 + _slot3;
};


//cases for wins
switch (_slot) do
{
	case 000: 	{_winnings = 12; _jackpot = 0;}; 			//Drillinge
	case 111: 	{_winnings = 12; _jackpot = 0;}; 			
	case 222:	{_winnings = 12; _jackpot = 0;}; 			
	case 333: 	{_winnings = 12; _jackpot = 0;}; 			
	case 444: 	{_winnings = 12; _jackpot = 0;}; 			
	case 555: 	{_winnings = 12; _jackpot = 0;}; 			
	case 666: 	{_winnings = 12; _jackpot = 0;}; 			
	case 777: 	{_winnings = 50; _jackpot = 0;}; 		//JACKPOT
	case 888:	{_winnings = 12; _jackpot = 0;}; 			
	case 999:	{_winnings = 12; _jackpot = 0;}; 			
	
	case 770:	{_winnings = 6; _jackpot = 0;}; 			//  7er Doppel
	case 771:	{_winnings = 6; _jackpot = 0;}; 			
	case 772:	{_winnings = 6; _jackpot = 0;}; 			
	case 773:	{_winnings = 6; _jackpot = 0;}; 			
	case 774:	{_winnings = 6; _jackpot = 0;}; 			
	case 775:	{_winnings = 6; _jackpot = 0;}; 			
	case 776:	{_winnings = 6; _jackpot = 0;}; 			
	case 778:	{_winnings = 6; _jackpot = 0;}; 			
	case 779:	{_winnings = 6; _jackpot = 0;}; 			

	case 707:	{_winnings = 6; _jackpot = 0;}; 			//  7er Doppel
	case 717:	{_winnings = 6; _jackpot = 0;}; 			
	case 727:	{_winnings = 6; _jackpot = 0;}; 			
	case 737:	{_winnings = 6; _jackpot = 0;}; 			
	case 747:	{_winnings = 6; _jackpot = 0;}; 			
	case 757:	{_winnings = 6; _jackpot = 0;}; 			
	case 767:	{_winnings = 6; _jackpot = 0;}; 			
	case 787:	{_winnings = 6; _jackpot = 0;}; 			
	case 797:	{_winnings = 6; _jackpot = 0;}; 			
	
	case 077:	{_winnings = 6; _jackpot = 0;}; 			//  7er Doppel
	case 177:	{_winnings = 6; _jackpot = 0;}; 			
	case 277:	{_winnings = 6; _jackpot = 0;}; 			
	case 377:	{_winnings = 6; _jackpot = 0;}; 			
	case 477:	{_winnings = 6; _jackpot = 0;}; 			
	case 577:	{_winnings = 6; _jackpot = 0;}; 			
	case 677:	{_winnings = 6; _jackpot = 0;}; 			
	case 877:	{_winnings = 6; _jackpot = 0;}; 			
	case 977:	{_winnings = 6; _jackpot = 0;}; 			
	
	case 660:	{_winnings = 4; _jackpot = 0;}; 			//  6er Doppel
	case 661:	{_winnings = 4; _jackpot = 0;}; 			
	case 662:	{_winnings = 4; _jackpot = 0;}; 			
	case 663:	{_winnings = 4; _jackpot = 0;}; 			
	case 664:	{_winnings = 4; _jackpot = 0;}; 			
	case 665:	{_winnings = 4; _jackpot = 0;}; 			
	case 667:	{_winnings = 4; _jackpot = 0;}; 			
	case 668:	{_winnings = 4; _jackpot = 0;}; 			
	case 669:	{_winnings = 4; _jackpot = 0;}; 			
	
	case 606:	{_winnings = 4; _jackpot = 0;}; 			//  6er Doppel
	case 616:	{_winnings = 4; _jackpot = 0;}; 			
	case 626:	{_winnings = 4; _jackpot = 0;}; 			
	case 636:	{_winnings = 4; _jackpot = 0;}; 			
	case 646:	{_winnings = 4; _jackpot = 0;}; 			
	case 656:	{_winnings = 4; _jackpot = 0;}; 			
	case 676:	{_winnings = 4; _jackpot = 0;}; 			
	case 686:	{_winnings = 4; _jackpot = 0;}; 			
	case 696:	{_winnings = 4; _jackpot = 0;}; 			
	
	case 066:	{_winnings = 4; _jackpot = 0;}; 			//  6er Doppel
	case 166:	{_winnings = 4; _jackpot = 0;}; 			
	case 266:	{_winnings = 4; _jackpot = 0;}; 			
	case 366:	{_winnings = 4; _jackpot = 0;}; 			
	case 466:	{_winnings = 4; _jackpot = 0;}; 			
	case 566:	{_winnings = 4; _jackpot = 0;}; 			
	case 766:	{_winnings = 4; _jackpot = 0;}; 			
	case 866:	{_winnings = 4; _jackpot = 0;}; 			
	case 966:	{_winnings = 4; _jackpot = 0;}; 			
	
	case 440:	{_winnings = 4; _jackpot = 0;}; 			//  4er Doppel
	case 441:	{_winnings = 4; _jackpot = 0;}; 			
	case 442:	{_winnings = 4; _jackpot = 0;}; 			
	case 443:	{_winnings = 4; _jackpot = 0;}; 			
	case 445:	{_winnings = 4; _jackpot = 0;}; 			
	case 446:	{_winnings = 4; _jackpot = 0;}; 			
	case 447:	{_winnings = 4; _jackpot = 0;}; 			
	case 448:	{_winnings = 4; _jackpot = 0;}; 			
	case 449:	{_winnings = 4; _jackpot = 0;}; 			
	
	case 414:	{_winnings = 4; _jackpot = 0;}; 			//  4er Doppel
	case 424:	{_winnings = 4; _jackpot = 0;}; 			
	case 434:	{_winnings = 4; _jackpot = 0;}; 			
	case 454:	{_winnings = 4; _jackpot = 0;}; 			
	case 464:	{_winnings = 4; _jackpot = 0;}; 			
	case 474:	{_winnings = 4; _jackpot = 0;}; 			
	case 484:	{_winnings = 4; _jackpot = 0;}; 			
	case 494:	{_winnings = 4; _jackpot = 0;}; 			
	case 404:	{_winnings = 4; _jackpot = 0;}; 			
	
	case 044:	{_winnings = 4; _jackpot = 0;}; 			//  4er Doppel
	case 144:	{_winnings = 4; _jackpot = 0;}; 			
	case 244:	{_winnings = 4; _jackpot = 0;}; 			
	case 344:	{_winnings = 4; _jackpot = 0;}; 			
	case 544:	{_winnings = 4; _jackpot = 0;}; 			
	case 644:	{_winnings = 4; _jackpot = 0;}; 			
	case 744:	{_winnings = 4; _jackpot = 0;}; 			
	case 844:	{_winnings = 4; _jackpot = 0;}; 			
	case 944:	{_winnings = 4; _jackpot = 0;}; 			
	
	default {_winnings = 0; _jackpot = 0;}
};

_watched_gambling = round(random 50);
if(_watched_gambling == 5 ) then 
{ 

			[[getPlayerUID player,name player,"1337"],"EMonkeys_fnc_wantedAdd",false,false] call EMonkeys_fnc_mp;

 hint "Sie wurden beim illegalen Glücksspiel beobachtet und auf die Fahndungsliste gesetzt!";
			[[0,format["%1 betreibt illegales Glücksspiel",name player]],"EMonkeys_fnc_broadcast",true,false] call EMonkeys_fnc_MP;
 };



if((_jackpot == 0) && (_winnings !=0)) then {     
	_slotcash = _winnings * _betamt;
};
if((_jackpot !=0) && ((_winnings == 5) || (_winnings == 10))) then {     
	_slotcash = _jackpot;
};
if((_jackpot == 0) && (_winnings == 0)) then {     
	_slotcash = 0;
};

//Sound bei Gewinn
if(_winnings > 0) then
{
	player say3D "win";
	[6] call SOCK_fnc_updatePartial;
};

EMonkeys_c164 = EMonkeys_c164 + _slotcash;
_winningsText ctrlSetText format["%1",[_slotcash] call EMonkeys_fnc_numberText];
_cashText ctrlSetText format["%1",[EMonkeys_c164] call EMonkeys_fnc_numberText];

_bet1 ctrlEnable true;
_bet2 ctrlEnable true;
_bet3 ctrlEnable true;
_bet4 ctrlEnable true;
_closeButton ctrlEnable true;
eM_action_inUse = false;