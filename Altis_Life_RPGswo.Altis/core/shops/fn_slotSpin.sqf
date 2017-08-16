/*
	File: fn_textures\slotspin.sqf
	Author: Jacob "PapaBear" Tyler
	Description: Takes bet, spins textures\slots, determines if win, pays

*/
private["_slot","_slot1","_slot2","_slot3","_winnings","_slotcash","_betamt","_display","_jackpot"];
_betamt = param [0,1,[0]];
if(dwf_cash < _betamt) exitWith {hint format["Du hast nicht genug geld dabei! (%1 €)",_betamt];};
dwf_cash = (dwf_cash - _betamt);

disableSerialization;
_display = findDisplay 5780;

_slotPic1 = _display displayCtrl 5771;
_slotPic2 = _display displayCtrl 5772;
_slotPic3 = _display displayCtrl 5773;
_winningsText = _display displayCtrl 5775;
_bet1 = _display displayCtrl 5778;
_bet2 = _display displayCtrl 5779;
_bet3 = _display displayCtrl 5781;
_bet4 = _display displayCtrl 5782;

_bet1 ctrlEnable false;
_bet2 ctrlEnable false;
_bet3 ctrlEnable false;
_bet4 ctrlEnable false;

DWEV_action_inUse = true;

// ROTATE SIMULATION ;)
for "_i" from 0 to 10 do
{
_number = ceil(random 7);
_pplayer = _this select 0;
if (_number == 0) then {_slot1 = 0; _slotPic1 ctrlSetText "textures\slots\slot_zero.paa";};
if (_number == 1) then {_slot1 = 100; _slotPic1 ctrlSetText "textures\slots\slot_one.paa";};
if (_number == 2) then {_slot1 = 200; _slotPic1 ctrlSetText "textures\slots\slot_two.paa";};
if (_number == 3) then {_slot1 = 300; _slotPic1 ctrlSetText "textures\slots\slot_three.paa";};
if (_number == 4) then {_slot1 = 400; _slotPic1 ctrlSetText "textures\slots\slot_four.paa";};
if (_number == 5) then {_slot1 = 500; _slotPic1 ctrlSetText "textures\slots\slot_five.paa";};
if (_number == 6) then {_slot1 = 600; _slotPic1 ctrlSetText "textures\slots\slot_six.paa";};
if (_number == 7) then {_slot1 = 700; _slotPic1 ctrlSetText "textures\slots\slot_seven.paa";};
playSound "HintExpand";
sleep 0.1;

_number = ceil(random 7);
_pplayer = _this select 0;
if (_number == 0) then {_slot2 = 0; _slotPic2 ctrlSetText "textures\slots\slot_zero.paa";};
if (_number == 1) then {_slot2 = 10; _slotPic2 ctrlSetText "textures\slots\slot_one.paa";};
if (_number == 2) then {_slot2 = 20; _slotPic2 ctrlSetText "textures\slots\slot_two.paa";};
if (_number == 3) then {_slot2 = 30; _slotPic2 ctrlSetText "textures\slots\slot_three.paa";};
if (_number == 4) then {_slot2 = 40; _slotPic2 ctrlSetText "textures\slots\slot_four.paa";};
if (_number == 5) then {_slot2 = 50; _slotPic2 ctrlSetText "textures\slots\slot_five.paa";};
if (_number == 6) then {_slot2 = 60; _slotPic2 ctrlSetText "textures\slots\slot_six.paa";};
if (_number == 7) then {_slot2 = 70; _slotPic2 ctrlSetText "textures\slots\slot_seven.paa";};	
playSound "HintExpand";
sleep 0.1;

_number = ceil(random 7);
_pplayer = _this select 0;
if (_number == 0) then {_slot3 = 0; _slotPic3 ctrlSetText "textures\slots\slot_zero.paa";};
if (_number == 1) then {_slot3 = 1; _slotPic3 ctrlSetText "textures\slots\slot_one.paa"; };
if (_number == 2) then {_slot3 = 2; _slotPic3 ctrlSetText "textures\slots\slot_two.paa"; };
if (_number == 3) then {_slot3 = 3; _slotPic3 ctrlSetText "textures\slots\slot_three.paa"; };
if (_number == 4) then {_slot3 = 4; _slotPic3 ctrlSetText "textures\slots\slot_four.paa"; ;};
if (_number == 5) then {_slot3 = 5; _slotPic3 ctrlSetText "textures\slots\slot_five.paa"; };
if (_number == 6) then {_slot3 = 6; _slotPic3 ctrlSetText "textures\slots\slot_six.paa"; };
if (_number == 7) then {_slot3 = 7; _slotPic3 ctrlSetText "textures\slots\slot_seven.paa"; };
playSound "HintExpand";
sleep 0.1;
};

if((_slot1 == 0) && (_slot2 == 0) && (_slot3 == 0)) then { _slot = 999; } else 
{
_slot = _slot1 + _slot2 + _slot3;
};

//cases for wins
switch (_slot) do
{
// alles vom standard um 1 erhöht, wenn zu viel wieder runter um 1
	case 999: 	{_winnings = 6; _jackpot = 0;}; 			// Einsatz x3 | 3x Kiwi | 50k = 150k
	case 111:	{_winnings = 6; _jackpot = 0;}; 			// Einsatz x7 | 3x Kirsche | 50k = 350k
	case 222: 	{_winnings = 6; _jackpot = 0;}; 			// Einsatz x7 | 3x Pflaume | 50k = 350k 
	case 333: 	{_winnings = 20; _jackpot = 0;}; 			// Einsatz x20 | 3x 3 Siebener | 50k = 1500000k
	case 444: 	{_winnings = 6; _jackpot = 0;}; 			// Einsatz x7 | 3x Zitrone | 50k = 350k
	case 555: 	{_winnings = 6; _jackpot = 0;}; 			// Einsatz x7 | 3x Orange | 50k = 350k
	case 666: 	{_winnings = 6; _jackpot = 0;}; 			// Einsatz x7 | 3x Äpfel | 50k = 350k
	case 777: 	{_winnings = 15; _jackpot = 0;}; 			// Einsatz x20 | 3x  Sieben | 50k = 1000000k
	
// Einsatzraus zwei gleiche an posi 1 und 2
	case 110:	{_winnings = 2; _jackpot = 0;}; 			// DoppelterEinsatz raus
	case 112:	{_winnings = 2; _jackpot = 0;}; 			// DoppelterEinsatz raus
	case 113:	{_winnings = 2; _jackpot = 0;}; 			// DoppelterEinsatz raus
	case 114:	{_winnings = 2; _jackpot = 0;}; 			// DoppelterEinsatz raus
	case 115:	{_winnings = 2; _jackpot = 0;}; 			// DoppelterEinsatz raus
	case 116:	{_winnings = 2; _jackpot = 0;}; 			// DoppelterEinsatz raus
	case 117:	{_winnings = 2; _jackpot = 0;}; 			// DoppelterEinsatz raus
	
	case 220:	{_winnings = 2; _jackpot = 0;}; 			// DoppelterEinsatz raus
	case 221:	{_winnings = 2; _jackpot = 0;}; 			// DoppelterEinsatz raus
	case 223:	{_winnings = 2; _jackpot = 0;}; 			// DoppelterEinsatz raus
	case 224:	{_winnings = 2; _jackpot = 0;}; 			// DoppelterEinsatz raus
	case 225:	{_winnings = 2; _jackpot = 0;}; 			// DoppelterEinsatz raus
	case 226:	{_winnings = 2; _jackpot = 0;}; 			// DoppelterEinsatz raus
	case 227:	{_winnings = 2; _jackpot = 0;}; 			// DoppelterEinsatz raus
	
	case 330:	{_winnings = 2; _jackpot = 0;}; 			// DoppelterEinsatz raus
	case 331:	{_winnings = 2; _jackpot = 0;}; 			// DoppelterEinsatz raus
	case 332:	{_winnings = 2; _jackpot = 0;}; 			// DoppelterEinsatz raus
	case 334:	{_winnings = 2; _jackpot = 0;}; 			// DoppelterEinsatz raus
	case 335:	{_winnings = 2; _jackpot = 0;}; 			// DoppelterEinsatz raus
	case 336:	{_winnings = 2; _jackpot = 0;}; 			// DoppelterEinsatz raus
	case 337:	{_winnings = 2; _jackpot = 0;}; 			// DoppelterEinsatz raus
	
	case 440:	{_winnings = 2; _jackpot = 0;}; 			// DoppelterEinsatz raus
	case 441:	{_winnings = 2; _jackpot = 0;}; 			// DoppelterEinsatz raus
	case 442:	{_winnings = 2; _jackpot = 0;}; 			// DoppelterEinsatz raus
	case 443:	{_winnings = 2; _jackpot = 0;}; 			// DoppelterEinsatz raus
	case 445:	{_winnings = 2; _jackpot = 0;}; 			// DoppelterEinsatz raus
	case 446:	{_winnings = 2; _jackpot = 0;}; 			// DoppelterEinsatz raus
	case 447:	{_winnings = 2; _jackpot = 0;}; 			// DoppelterEinsatz raus
	
	case 550:	{_winnings = 2; _jackpot = 0;}; 			// DoppelterEinsatz raus
	case 551:	{_winnings = 2; _jackpot = 0;}; 			// DoppelterEinsatz raus
	case 552:	{_winnings = 2; _jackpot = 0;}; 			// DoppelterEinsatz raus
	case 553:	{_winnings = 2; _jackpot = 0;}; 			// DoppelterEinsatz raus
	case 554:	{_winnings = 2; _jackpot = 0;}; 			// DoppelterEinsatz raus
	case 556:	{_winnings = 2; _jackpot = 0;}; 			// DoppelterEinsatz raus
	case 557:	{_winnings = 2; _jackpot = 0;}; 			// DoppelterEinsatz raus
	
	case 660:	{_winnings = 2; _jackpot = 0;}; 			// DoppelterEinsatz raus
	case 661:	{_winnings = 2; _jackpot = 0;}; 			// DoppelterEinsatz raus
	case 662:	{_winnings = 2; _jackpot = 0;}; 			// DoppelterEinsatz raus
	case 663:	{_winnings = 2; _jackpot = 0;}; 			// DoppelterEinsatz raus
	case 664:	{_winnings = 2; _jackpot = 0;}; 			// DoppelterEinsatz raus
	case 665:	{_winnings = 2; _jackpot = 0;}; 			// DoppelterEinsatz raus
	case 667:	{_winnings = 2; _jackpot = 0;}; 			// DoppelterEinsatz raus
	
	case 770:	{_winnings = 2; _jackpot = 0;}; 			// DoppelterEinsatz raus
	case 771:	{_winnings = 2; _jackpot = 0;}; 			// DoppelterEinsatz raus
	case 772:	{_winnings = 2; _jackpot = 0;}; 			// DoppelterEinsatz raus
	case 773:	{_winnings = 2; _jackpot = 0;}; 			// DoppelterEinsatz raus
	case 774:	{_winnings = 2; _jackpot = 0;}; 			// DoppelterEinsatz raus
	case 775:	{_winnings = 2; _jackpot = 0;}; 			// DoppelterEinsatz raus
	case 776:	{_winnings = 2; _jackpot = 0;}; 			// DoppelterEinsatz raus	
	
// Einsatzraus zwei gleiche an posi 1 und 3
	case 101:	{_winnings = 0.5; _jackpot = 0;}; 			// DoppelterEinsatz raus
	case 121:	{_winnings = 0.5; _jackpot = 0;}; 			// DoppelterEinsatz raus
	case 131:	{_winnings = 0.5; _jackpot = 0;}; 			// DoppelterEinsatz raus
	case 141:	{_winnings = 0.5; _jackpot = 0;}; 			// DoppelterEinsatz raus
	case 151:	{_winnings = 0.5; _jackpot = 0;}; 			// DoppelterEinsatz raus
	case 161:	{_winnings = 0.5; _jackpot = 0;}; 			// DoppelterEinsatz raus
	case 171:	{_winnings = 0.5; _jackpot = 0;}; 			// DoppelterEinsatz raus
	
	case 202:	{_winnings = 0.5; _jackpot = 0;}; 			// DoppelterEinsatz raus
	case 212:	{_winnings = 0.5; _jackpot = 0;}; 			// DoppelterEinsatz raus
	case 232:	{_winnings = 0.5; _jackpot = 0;}; 			// DoppelterEinsatz raus
	case 242:	{_winnings = 0.5; _jackpot = 0;}; 			// DoppelterEinsatz raus
	case 252:	{_winnings = 0.5; _jackpot = 0;}; 			// DoppelterEinsatz raus
	case 262:	{_winnings = 0.5; _jackpot = 0;}; 			// DoppelterEinsatz raus
	case 272:	{_winnings = 0.5; _jackpot = 0;}; 			// DoppelterEinsatz raus
	
	case 303:	{_winnings = 0.5; _jackpot = 0;}; 			// DoppelterEinsatz raus
	case 313:	{_winnings = 0.5; _jackpot = 0;}; 			// DoppelterEinsatz raus
	case 323:	{_winnings = 0.5; _jackpot = 0;}; 			// DoppelterEinsatz raus
	case 343:	{_winnings = 0.5; _jackpot = 0;}; 			// DoppelterEinsatz raus
	case 353:	{_winnings = 0.5; _jackpot = 0;}; 			// DoppelterEinsatz raus
	case 363:	{_winnings = 0.5; _jackpot = 0;}; 			// DoppelterEinsatz raus
	case 373:	{_winnings = 0.5; _jackpot = 0;}; 			// DoppelterEinsatz raus
	
	case 404:	{_winnings = 0.5; _jackpot = 0;}; 			// DoppelterEinsatz raus
	case 414:	{_winnings = 0.5; _jackpot = 0;}; 			// DoppelterEinsatz raus
	case 424:	{_winnings = 0.5; _jackpot = 0;}; 			// DoppelterEinsatz raus
	case 434:	{_winnings = 0.5; _jackpot = 0;}; 			// DoppelterEinsatz raus
	case 454:	{_winnings = 0.5; _jackpot = 0;}; 			// DoppelterEinsatz raus
	case 464:	{_winnings = 0.5; _jackpot = 0;}; 			// DoppelterEinsatz raus
	case 474:	{_winnings = 0.5; _jackpot = 0;}; 			// DoppelterEinsatz raus
	
	case 505:	{_winnings = 0.5; _jackpot = 0;}; 			// DoppelterEinsatz raus
	case 515:	{_winnings = 0.5; _jackpot = 0;}; 			// DoppelterEinsatz raus
	case 525:	{_winnings = 0.5; _jackpot = 0;}; 			// DoppelterEinsatz raus
	case 535:	{_winnings = 0.5; _jackpot = 0;}; 			// DoppelterEinsatz raus
	case 545:	{_winnings = 0.5; _jackpot = 0;}; 			// DoppelterEinsatz raus
	case 565:	{_winnings = 0.5; _jackpot = 0;}; 			// DoppelterEinsatz raus
	case 575:	{_winnings = 0.5; _jackpot = 0;}; 			// DoppelterEinsatz raus
	
	case 606:	{_winnings = 0.5; _jackpot = 0;}; 			// DoppelterEinsatz raus
	case 616:	{_winnings = 0.5; _jackpot = 0;}; 			// DoppelterEinsatz raus
	case 626:	{_winnings = 0.5; _jackpot = 0;}; 			// DoppelterEinsatz raus
	case 636:	{_winnings = 0.5; _jackpot = 0;}; 			// DoppelterEinsatz raus
	case 646:	{_winnings = 0.5; _jackpot = 0;}; 			// DoppelterEinsatz raus
	case 656:	{_winnings = 0.5; _jackpot = 0;}; 			// DoppelterEinsatz raus
	case 676:	{_winnings = 0.5; _jackpot = 0;}; 			// DoppelterEinsatz raus
	
	case 707:	{_winnings = 0.5; _jackpot = 0;}; 			// DoppelterEinsatz raus
	case 717:	{_winnings = 0.5; _jackpot = 0;}; 			// DoppelterEinsatz raus
	case 727:	{_winnings = 0.5; _jackpot = 0;}; 			// DoppelterEinsatz raus
	case 737:	{_winnings = 0.5; _jackpot = 0;}; 			// DoppelterEinsatz raus
	case 747:	{_winnings = 0.5; _jackpot = 0;}; 			// DoppelterEinsatz raus
	case 757:	{_winnings = 0.5; _jackpot = 0;}; 			// DoppelterEinsatz raus
	case 767:	{_winnings = 0.5; _jackpot = 0;}; 			// DoppelterEinsatz raus
	
// Einsatzraus zwei gleiche an posi 1 und 3
	case 011:	{_winnings = 0.5; _jackpot = 0;}; 			// DoppelterEinsatz raus
	case 211:	{_winnings = 0.5; _jackpot = 0;}; 			// DoppelterEinsatz raus
	case 311:	{_winnings = 0.5; _jackpot = 0;}; 			// DoppelterEinsatz raus
	case 411:	{_winnings = 0.5; _jackpot = 0;}; 			// DoppelterEinsatz raus
	case 511:	{_winnings = 0.5; _jackpot = 0;}; 			// DoppelterEinsatz raus
	case 611:	{_winnings = 0.5; _jackpot = 0;}; 			// DoppelterEinsatz raus
	case 711:	{_winnings = 0.5; _jackpot = 0;}; 			// DoppelterEinsatz raus
	
	case 022:	{_winnings = 0.5; _jackpot = 0;}; 			// DoppelterEinsatz raus
	case 122:	{_winnings = 0.5; _jackpot = 0;}; 			// DoppelterEinsatz raus
	case 322:	{_winnings = 0.5; _jackpot = 0;}; 			// DoppelterEinsatz raus
	case 422:	{_winnings = 0.5; _jackpot = 0;}; 			// DoppelterEinsatz raus
	case 522:	{_winnings = 0.5; _jackpot = 0;}; 			// DoppelterEinsatz raus
	case 622:	{_winnings = 0.5; _jackpot = 0;}; 			// DoppelterEinsatz raus
	case 722:	{_winnings = 0.5; _jackpot = 0;}; 			// DoppelterEinsatz raus
	
	case 033:	{_winnings = 0.5; _jackpot = 0;}; 			// DoppelterEinsatz raus
	case 133:	{_winnings = 0.5; _jackpot = 0;}; 			// DoppelterEinsatz raus
	case 233:	{_winnings = 0.5; _jackpot = 0;}; 			// DoppelterEinsatz raus
	case 433:	{_winnings = 0.5; _jackpot = 0;}; 			// DoppelterEinsatz raus
	case 533:	{_winnings = 0.5; _jackpot = 0;}; 			// DoppelterEinsatz raus
	case 633:	{_winnings = 0.5; _jackpot = 0;}; 			// DoppelterEinsatz raus
	case 733:	{_winnings = 0.5; _jackpot = 0;}; 			// DoppelterEinsatz raus
	
	case 044:	{_winnings = 0.5; _jackpot = 0;}; 			// DoppelterEinsatz raus
	case 144:	{_winnings = 0.5; _jackpot = 0;}; 			// DoppelterEinsatz raus
	case 244:	{_winnings = 0.5; _jackpot = 0;}; 			// DoppelterEinsatz raus
	case 344:	{_winnings = 0.5; _jackpot = 0;}; 			// DoppelterEinsatz raus
	case 544:	{_winnings = 0.5; _jackpot = 0;}; 			// DoppelterEinsatz raus
	case 644:	{_winnings = 0.5; _jackpot = 0;}; 			// DoppelterEinsatz raus
	case 744:	{_winnings = 0.5; _jackpot = 0;}; 			// DoppelterEinsatz raus
	
	case 055:	{_winnings = 0.5; _jackpot = 0;}; 			// DoppelterEinsatz raus
	case 155:	{_winnings = 0.5; _jackpot = 0;}; 			// DoppelterEinsatz raus
	case 255:	{_winnings = 0.5; _jackpot = 0;}; 			// DoppelterEinsatz raus
	case 355:	{_winnings = 0.5; _jackpot = 0;}; 			// DoppelterEinsatz raus
	case 455:	{_winnings = 0.5; _jackpot = 0;}; 			// DoppelterEinsatz raus
	case 655:	{_winnings = 0.5; _jackpot = 0;}; 			// DoppelterEinsatz raus
	case 755:	{_winnings = 0.5; _jackpot = 0;}; 			// DoppelterEinsatz raus
	
	case 066:	{_winnings = 0.5; _jackpot = 0;}; 			// DoppelterEinsatz raus
	case 166:	{_winnings = 0.5; _jackpot = 0;}; 			// DoppelterEinsatz raus
	case 266:	{_winnings = 0.5; _jackpot = 0;}; 			// DoppelterEinsatz raus
	case 366:	{_winnings = 0.5; _jackpot = 0;}; 			// DoppelterEinsatz raus
	case 466:	{_winnings = 0.5; _jackpot = 0;}; 			// DoppelterEinsatz raus
	case 566:	{_winnings = 0.5; _jackpot = 0;}; 			// DoppelterEinsatz raus
	case 766:	{_winnings = 0.5; _jackpot = 0;}; 			// DoppelterEinsatz raus
	
	case 077:	{_winnings = 0.5; _jackpot = 0;}; 			// DoppelterEinsatz raus
	case 177:	{_winnings = 0.5; _jackpot = 0;}; 			// DoppelterEinsatz raus
	case 277:	{_winnings = 0.5; _jackpot = 0;}; 			// DoppelterEinsatz raus
	case 377:	{_winnings = 0.5; _jackpot = 0;}; 			// DoppelterEinsatz raus
	case 477:	{_winnings = 0.5; _jackpot = 0;}; 			// DoppelterEinsatz raus
	case 577:	{_winnings = 0.5; _jackpot = 0;}; 			// DoppelterEinsatz raus
	case 677:	{_winnings = 0.5; _jackpot = 0;}; 			// DoppelterEinsatz raus
	default {_winnings = 0; _jackpot = 0;}
};



if((_jackpot == 0) && (_winnings !=0)) then {     
	_slotcash = _winnings * _betamt;
};
if((_jackpot !=0) && (_winnings == 0)) then {     
	_slotcash = _jackpot;
};
if((_jackpot == 0) && (_winnings == 0)) then {     
	_slotcash = 0;
};

//sound wenn gewinn
if (_winnings > 0 && _winnings <= 10) then
{
	playSound "RscDisplayCurator_ping01";
};

if (_winnings > 10 ) then
{
	playSound "RscDisplayCurator_ping03";
};


dwf_cash = dwf_cash + _slotcash;
_winningsText ctrlSetText format["%1",[_slotcash] call DWEV_fnc_numberText];

_bet1 ctrlEnable true;
_bet2 ctrlEnable true;
_bet3 ctrlEnable true;
_bet4 ctrlEnable true;
DWEV_action_inUse = false;