#include <macro.h>
/*
	File: fn_ptoolsUse.sqf
	Author: blaster, Thanks to tonic for code model

	Description:
	Main functionality for prospecting tools in mining.
*/

closeDialog 0;
private["_mine","_item1","_item2","_item3","_item4","_item5","_item6","_item7","_item8","_item9","_item10","_item11","_item12","_item13","_msg"];
_mine = "";

switch (true) do {
	case (player distance (getMarkerPos "sm_1") < 40): {_mine = ["dirt",40,"rock",30,"sand",10,"copperore",10,"ironore",10];};
	case (player distance (getMarkerPos "sm_2") < 40): {_mine = ["dirt",30,"rock",20,"sand",20,"copperore",10,"ironore",10,"salt",10];};
	case (player distance (getMarkerPos "sm_3") < 40): {_mine = ["dirt",30,"rock",20,"sand",10,"zincore",10,"lead",10,"ironore",10,"sulphur",10];};
	case (player distance (getMarkerPos "sm_4") < 40): {_mine = ["dirt",40,"rock",20,"salt",10,"copperore",15,"zincore",5,"crystal",4,"platinumore",1];};
	case (player distance (getMarkerPos "sm_5") < 40): {_mine = ["dirt",30,"rock",20,"lead",10,"zincore",20,"crystal",5,"sapphire",5,"oilu",3,"diamond",2];};
	case (player distance (getMarkerPos "sm_6") < 40): {_mine = ["dirt",30,"rock",20,"ironore",20,"copperore",10,"emerald",5,"ruby",5,"oilu",2,"diamond",2,"platinumore",1];};
	case (player distance (getMarkerPos "mm_1") < 40): {_mine = ["dirt",20,"rock",20,"lead",10,"sand",10,"zincore",10,"emerald",5,"ruby",5,"oilu",6,"sapphire",4,"crystal",7,"diamond",2,"platinumore",1];};
	case (player distance (getMarkerPos "mm_2") < 40): {_mine = ["dirt",50,"rock",10,"copperore",5,"salt",10,"sand",5,"emerald",10,"ruby",10];};
	case (player distance (getMarkerPos "mm_3") < 40): {_mine = ["dirt",50,"rock",10,"lead",5,"ruby",5,"zincore",5,"emerald",5,"oilu",5,"sapphire",5,"platinumore",8,"diamond",2];};
	case (player distance (getMarkerPos "mm_4") < 40): {_mine = ["dirt",60,"rock",10,"zincore",10,"emerald",5,"oilu",5,"sapphire",5,"diamond",5];};
	case (player distance (getMarkerPos "mm_5") < 40): {_mine = ["dirt",50,"rock",10,"sand",5,"copperore",5,"ironore",5,"salt",5,"sapphire",5,"ruby",5,"crystal",5,"oilu",3,"diamond",2];};
	case (player distance (getMarkerPos "lm_1") < 40): {_mine = ["dirt",70,"rock",10,"oilu",5,"copperore",5,"sapphire",5,"diamond",5];};
	case (player distance (getMarkerPos "lm_2") < 40): {_mine = ["dirt",50,"rock",5,"zincore",5,"sand",5,"ironore",5,"oilu",5,"copperore",5,"ruby",5,"emerald",5,"sapphire",5,"platinumore",3,"diamond",2];};
	case (player distance (getMarkerPos "oil_1") < 40) : {_mine = ["dirt",50,"rock",5,"oilu",45];};
	case (player distance (getMarkerPos "oil_2") < 40) : {_mine = ["dirt",45,"rock",5,"oilu",50];};
	case (player distance (getMarkerPos "diamond_1") < 50): {_mine = ["dirt",30,"rock",10,"diamond",60];};
	default {""};
};

if(EQUAL(_mine,"")) exitWith {hint localize "STR_ISTR_Pick_NotNear"};
if(vehicle player != player) exitWith {hint localize "STR_ISTR_Pick_MineVeh";};

sleep 2;

switch (count(_mine)) do {
	case 2: {
		_item1 = [localize M_CONFIG(getText,"VirtualItems",SEL(_mine,0),"displayName"),SEL(_mine,1)];
		_msg = format["Sample Percent Results: \n%1: %2",SEL(_item1,0),SEL(_item1,1)];
	};
	case 4: {
		_item1 = [localize M_CONFIG(getText,"VirtualItems",SEL(_mine,0),"displayName"),SEL(_mine,1)];
		_item2 = [localize M_CONFIG(getText,"VirtualItems",SEL(_mine,2),"displayName"),SEL(_mine,3)];
		_msg = format["Sample Percent Results: \n%1: %2 \n%3: %4",SEL(_item1,0),SEL(_item1,1),SEL(_item2,0),SEL(_item2,1)];
	};
	case 6: {
		_item1 = [localize M_CONFIG(getText,"VirtualItems",SEL(_mine,0),"displayName"),SEL(_mine,1)];
		_item2 = [localize M_CONFIG(getText,"VirtualItems",SEL(_mine,2),"displayName"),SEL(_mine,3)];
		_item3 = [localize M_CONFIG(getText,"VirtualItems",SEL(_mine,4),"displayName"),SEL(_mine,5)];
		_msg = format["Sample Percent Results: \n%1: %2 \n%3: %4 \n%5: %6",SEL(_item1,0),SEL(_item1,1),SEL(_item2,0),SEL(_item2,1),SEL(_item3,0),SEL(_item3,1)];
		};
	case 8: {
		_item1 = [localize M_CONFIG(getText,"VirtualItems",SEL(_mine,0),"displayName"),SEL(_mine,1)];
		_item2 = [localize M_CONFIG(getText,"VirtualItems",SEL(_mine,2),"displayName"),SEL(_mine,3)];
		_item3 = [localize M_CONFIG(getText,"VirtualItems",SEL(_mine,4),"displayName"),SEL(_mine,5)];
		_item4 = [localize M_CONFIG(getText,"VirtualItems",SEL(_mine,6),"displayName"),SEL(_mine,7)];
		_msg = format["Sample Percent Results: \n%1: %2 \n%3: %4 \n%5: %6 \n%7: %8",SEL(_item1,0),SEL(_item1,1),SEL(_item2,0),SEL(_item2,1),SEL(_item3,0),SEL(_item3,1),SEL(_item4,0),SEL(_item4,1)];
	};
	case 10: {
		_item1 = [localize M_CONFIG(getText,"VirtualItems",SEL(_mine,0),"displayName"),SEL(_mine,1)];
		_item2 = [localize M_CONFIG(getText,"VirtualItems",SEL(_mine,2),"displayName"),SEL(_mine,3)];
		_item3 = [localize M_CONFIG(getText,"VirtualItems",SEL(_mine,4),"displayName"),SEL(_mine,5)];
		_item4 = [localize M_CONFIG(getText,"VirtualItems",SEL(_mine,6),"displayName"),SEL(_mine,7)];
		_item5 = [localize M_CONFIG(getText,"VirtualItems",SEL(_mine,8),"displayName"),SEL(_mine,9)];
		_msg = format["Sample Percent Results: \n%1: %2 \n%3: %4 \n%5: %6 \n%7: %8 \n%7: %8",SEL(_item1,0),SEL(_item1,1),SEL(_item2,0),SEL(_item2,1),SEL(_item3,0),SEL(_item3,1),SEL(_item4,0),SEL(_item4,1),SEL(_item5,0),SEL(_item5,1)];
	};
	case 12: {
		_item1 = [localize M_CONFIG(getText,"VirtualItems",SEL(_mine,0),"displayName"),SEL(_mine,1)];
		_item2 = [localize M_CONFIG(getText,"VirtualItems",SEL(_mine,2),"displayName"),SEL(_mine,3)];
		_item3 = [localize M_CONFIG(getText,"VirtualItems",SEL(_mine,4),"displayName"),SEL(_mine,5)];
		_item4 = [localize M_CONFIG(getText,"VirtualItems",SEL(_mine,6),"displayName"),SEL(_mine,7)];
		_item5 = [localize M_CONFIG(getText,"VirtualItems",SEL(_mine,8),"displayName"),SEL(_mine,9)];
		_item6 = [localize M_CONFIG(getText,"VirtualItems",SEL(_mine,10),"displayName"),SEL(_mine,11)];
		_msg = format["Sample Percent Results: \n%1: %2 \n%3: %4 \n%5: %6 \n%7: %8 \n%9: %10 \n%11: %12",SEL(_item1,0),SEL(_item1,1),SEL(_item2,0),SEL(_item2,1),SEL(_item3,0),SEL(_item3,1),SEL(_item4,0),SEL(_item4,1),SEL(_item5,0),SEL(_item5,1),SEL(_item6,0),SEL(_item6,1)];
	};
	case 14: {
		_item1 = [localize M_CONFIG(getText,"VirtualItems",SEL(_mine,0),"displayName"),SEL(_mine,1)];
		_item2 = [localize M_CONFIG(getText,"VirtualItems",SEL(_mine,2),"displayName"),SEL(_mine,3)];
		_item3 = [localize M_CONFIG(getText,"VirtualItems",SEL(_mine,4),"displayName"),SEL(_mine,5)];
		_item4 = [localize M_CONFIG(getText,"VirtualItems",SEL(_mine,6),"displayName"),SEL(_mine,7)];
		_item5 = [localize M_CONFIG(getText,"VirtualItems",SEL(_mine,8),"displayName"),SEL(_mine,9)];
		_item6 = [localize M_CONFIG(getText,"VirtualItems",SEL(_mine,10),"displayName"),SEL(_mine,11)];
		_item7 = [localize M_CONFIG(getText,"VirtualItems",SEL(_mine,12),"displayName"),SEL(_mine,13)];
		_msg = format["Sample Percent Results: \n%1: %2 \n%3: %4 \n%5: %6 \n%7: %8 \n%9: %10 \n%11: %12 \n%13: %14",SEL(_item1,0),SEL(_item1,1),SEL(_item2,0),SEL(_item2,1),SEL(_item3,0),SEL(_item3,1),SEL(_item4,0),SEL(_item4,1),SEL(_item5,0),SEL(_item5,1),SEL(_item6,0),SEL(_item6,1),SEL(_item7,0),SEL(_item7,1)];
	};
	case 16: {
		_item1 = [localize M_CONFIG(getText,"VirtualItems",SEL(_mine,0),"displayName"),SEL(_mine,1)];
		_item2 = [localize M_CONFIG(getText,"VirtualItems",SEL(_mine,2),"displayName"),SEL(_mine,3)];
		_item3 = [localize M_CONFIG(getText,"VirtualItems",SEL(_mine,4),"displayName"),SEL(_mine,5)];
		_item4 = [localize M_CONFIG(getText,"VirtualItems",SEL(_mine,6),"displayName"),SEL(_mine,7)];
		_item5 = [localize M_CONFIG(getText,"VirtualItems",SEL(_mine,8),"displayName"),SEL(_mine,9)];
		_item6 = [localize M_CONFIG(getText,"VirtualItems",SEL(_mine,10),"displayName"),SEL(_mine,11)];
		_item7 = [localize M_CONFIG(getText,"VirtualItems",SEL(_mine,12),"displayName"),SEL(_mine,13)];
		_item8 = [localize M_CONFIG(getText,"VirtualItems",SEL(_mine,14),"displayName"),SEL(_mine,15)];
		_msg = format["Sample Percent Results: \n%1: %2 \n%3: %4 \n%5: %6 \n%7: %8 \n%9: %10 \n%11: %12 \n%13: %14 \n%15: %16",SEL(_item1,0),SEL(_item1,1),SEL(_item2,0),SEL(_item2,1),SEL(_item3,0),SEL(_item3,1),SEL(_item4,0),SEL(_item4,1),SEL(_item5,0),SEL(_item5,1),SEL(_item6,0),SEL(_item6,1),SEL(_item7,0),SEL(_item7,1),SEL(_item8,0),SEL(_item8,1)];
	};
	case 18: {
		_item1 = [localize M_CONFIG(getText,"VirtualItems",SEL(_mine,0),"displayName"),SEL(_mine,1)];
		_item2 = [localize M_CONFIG(getText,"VirtualItems",SEL(_mine,2),"displayName"),SEL(_mine,3)];
		_item3 = [localize M_CONFIG(getText,"VirtualItems",SEL(_mine,4),"displayName"),SEL(_mine,5)];
		_item4 = [localize M_CONFIG(getText,"VirtualItems",SEL(_mine,6),"displayName"),SEL(_mine,7)];
		_item5 = [localize M_CONFIG(getText,"VirtualItems",SEL(_mine,8),"displayName"),SEL(_mine,9)];
		_item6 = [localize M_CONFIG(getText,"VirtualItems",SEL(_mine,10),"displayName"),SEL(_mine,11)];
		_item7 = [localize M_CONFIG(getText,"VirtualItems",SEL(_mine,12),"displayName"),SEL(_mine,13)];
		_item8 = [localize M_CONFIG(getText,"VirtualItems",SEL(_mine,14),"displayName"),SEL(_mine,15)];
		_item9 = [localize M_CONFIG(getText,"VirtualItems",SEL(_mine,16),"displayName"),SEL(_mine,17)];
		_msg = format["Sample Percent Results: \n%1: %2 \n%3: %4 \n%5: %6 \n%7: %8 \n%9: %10 \n%11: %12 \n%13: %14 \n%15: %16 \n%17: %18",SEL(_item1,0),SEL(_item1,1),SEL(_item2,0),SEL(_item2,1),SEL(_item3,0),SEL(_item3,1),SEL(_item4,0),SEL(_item4,1),SEL(_item5,0),SEL(_item5,1),SEL(_item6,0),SEL(_item6,1),SEL(_item7,0),SEL(_item7,1),SEL(_item8,0),SEL(_item8,1),SEL(_item9,0),SEL(_item9,1)];
	};
	case 20: {
		_item1 = [localize M_CONFIG(getText,"VirtualItems",SEL(_mine,0),"displayName"),SEL(_mine,1)];
		_item2 = [localize M_CONFIG(getText,"VirtualItems",SEL(_mine,2),"displayName"),SEL(_mine,3)];
		_item3 = [localize M_CONFIG(getText,"VirtualItems",SEL(_mine,4),"displayName"),SEL(_mine,5)];
		_item4 = [localize M_CONFIG(getText,"VirtualItems",SEL(_mine,6),"displayName"),SEL(_mine,7)];
		_item5 = [localize M_CONFIG(getText,"VirtualItems",SEL(_mine,8),"displayName"),SEL(_mine,9)];
		_item6 = [localize M_CONFIG(getText,"VirtualItems",SEL(_mine,10),"displayName"),SEL(_mine,11)];
		_item7 = [localize M_CONFIG(getText,"VirtualItems",SEL(_mine,12),"displayName"),SEL(_mine,13)];
		_item8 = [localize M_CONFIG(getText,"VirtualItems",SEL(_mine,14),"displayName"),SEL(_mine,15)];
		_item9 = [localize M_CONFIG(getText,"VirtualItems",SEL(_mine,16),"displayName"),SEL(_mine,17)];
		_item10 = [localize M_CONFIG(getText,"VirtualItems",SEL(_mine,18),"displayName"),SEL(_mine,19)];
		_msg = format["Sample Percent Results: \n%1: %2 \n%3: %4 \n%5: %6 \n%7: %8 \n%9: %10 \n%11: %12 \n%13: %14 \n%15: %16 \n%17: %18 \n%19: %20",SEL(_item1,0),SEL(_item1,1),SEL(_item2,0),SEL(_item2,1),SEL(_item3,0),SEL(_item3,1),SEL(_item4,0),SEL(_item4,1),SEL(_item5,0),SEL(_item5,1),SEL(_item6,0),SEL(_item6,1),SEL(_item7,0),SEL(_item7,1),SEL(_item8,0),SEL(_item8,1),SEL(_item9,0),SEL(_item9,1),SEL(_item10,0),SEL(_item10,1)];
	};
	case 22: {
		_item1 = [localize M_CONFIG(getText,"VirtualItems",SEL(_mine,0),"displayName"),SEL(_mine,1)];
		_item2 = [localize M_CONFIG(getText,"VirtualItems",SEL(_mine,2),"displayName"),SEL(_mine,3)];
		_item3 = [localize M_CONFIG(getText,"VirtualItems",SEL(_mine,4),"displayName"),SEL(_mine,5)];
		_item4 = [localize M_CONFIG(getText,"VirtualItems",SEL(_mine,6),"displayName"),SEL(_mine,7)];
		_item5 = [localize M_CONFIG(getText,"VirtualItems",SEL(_mine,8),"displayName"),SEL(_mine,9)];
		_item6 = [localize M_CONFIG(getText,"VirtualItems",SEL(_mine,10),"displayName"),SEL(_mine,11)];
		_item7 = [localize M_CONFIG(getText,"VirtualItems",SEL(_mine,12),"displayName"),SEL(_mine,13)];
		_item8 = [localize M_CONFIG(getText,"VirtualItems",SEL(_mine,14),"displayName"),SEL(_mine,15)];
		_item9 = [localize M_CONFIG(getText,"VirtualItems",SEL(_mine,16),"displayName"),SEL(_mine,17)];
		_item10 = [localize M_CONFIG(getText,"VirtualItems",SEL(_mine,18),"displayName"),SEL(_mine,19)];
		_item11 = [localize M_CONFIG(getText,"VirtualItems",SEL(_mine,20),"displayName"),SEL(_mine,21)];
		_msg = format["Sample Percent Results: \n%1: %2 \n%3: %4 \n%5: %6 \n%7: %8 \n%9: %10 \n%11: %12 \n%13: %14 \n%15: %16 \n%17: %18 \n%19: %20 \n%21: %22",SEL(_item1,0),SEL(_item1,1),SEL(_item2,0),SEL(_item2,1),SEL(_item3,0),SEL(_item3,1),SEL(_item4,0),SEL(_item4,1),SEL(_item5,0),SEL(_item5,1),SEL(_item6,0),SEL(_item6,1),SEL(_item7,0),SEL(_item7,1),SEL(_item8,0),SEL(_item8,1),SEL(_item9,0),SEL(_item9,1),SEL(_item10,0),SEL(_item10,1),SEL(_item11,0),SEL(_item11,1)];
	};
	case 24: {
		_item1 = [localize M_CONFIG(getText,"VirtualItems",SEL(_mine,0),"displayName"),SEL(_mine,1)];
		_item2 = [localize M_CONFIG(getText,"VirtualItems",SEL(_mine,2),"displayName"),SEL(_mine,3)];
		_item3 = [localize M_CONFIG(getText,"VirtualItems",SEL(_mine,4),"displayName"),SEL(_mine,5)];
		_item4 = [localize M_CONFIG(getText,"VirtualItems",SEL(_mine,6),"displayName"),SEL(_mine,7)];
		_item5 = [localize M_CONFIG(getText,"VirtualItems",SEL(_mine,8),"displayName"),SEL(_mine,9)];
		_item6 = [localize M_CONFIG(getText,"VirtualItems",SEL(_mine,10),"displayName"),SEL(_mine,11)];
		_item7 = [localize M_CONFIG(getText,"VirtualItems",SEL(_mine,12),"displayName"),SEL(_mine,13)];
		_item8 = [localize M_CONFIG(getText,"VirtualItems",SEL(_mine,14),"displayName"),SEL(_mine,15)];
		_item9 = [localize M_CONFIG(getText,"VirtualItems",SEL(_mine,16),"displayName"),SEL(_mine,17)];
		_item10 = [localize M_CONFIG(getText,"VirtualItems",SEL(_mine,18),"displayName"),SEL(_mine,19)];
		_item11 = [localize M_CONFIG(getText,"VirtualItems",SEL(_mine,20),"displayName"),SEL(_mine,21)];
		_item12 = [localize M_CONFIG(getText,"VirtualItems",SEL(_mine,22),"displayName"),SEL(_mine,23)];
		_msg = format["Sample Percent Results: \n%1: %2 \n%3: %4 \n%5: %6 \n%7: %8 \n%9: %10 \n%11: %12 \n%13: %14 \n%15: %16 \n%17: %18 \n%19: %20 \n%21: %22 \n%23: %24",SEL(_item1,0),SEL(_item1,1),SEL(_item2,0),SEL(_item2,1),SEL(_item3,0),SEL(_item3,1),SEL(_item4,0),SEL(_item4,1),SEL(_item5,0),SEL(_item5,1),SEL(_item6,0),SEL(_item6,1),SEL(_item7,0),SEL(_item7,1),SEL(_item8,0),SEL(_item8,1),SEL(_item9,0),SEL(_item9,1),SEL(_item10,0),SEL(_item10,1),SEL(_item11,0),SEL(_item11,1),SEL(_item12,0),SEL(_item12,1)];
	};
	case 26: {
		_item1 = [localize M_CONFIG(getText,"VirtualItems",SEL(_mine,0),"displayName"),SEL(_mine,1)];
		_item2 = [localize M_CONFIG(getText,"VirtualItems",SEL(_mine,2),"displayName"),SEL(_mine,3)];
		_item3 = [localize M_CONFIG(getText,"VirtualItems",SEL(_mine,4),"displayName"),SEL(_mine,5)];
		_item4 = [localize M_CONFIG(getText,"VirtualItems",SEL(_mine,6),"displayName"),SEL(_mine,7)];
		_item5 = [localize M_CONFIG(getText,"VirtualItems",SEL(_mine,8),"displayName"),SEL(_mine,9)];
		_item6 = [localize M_CONFIG(getText,"VirtualItems",SEL(_mine,10),"displayName"),SEL(_mine,11)];
		_item7 = [localize M_CONFIG(getText,"VirtualItems",SEL(_mine,12),"displayName"),SEL(_mine,13)];
		_item8 = [localize M_CONFIG(getText,"VirtualItems",SEL(_mine,14),"displayName"),SEL(_mine,15)];
		_item9 = [localize M_CONFIG(getText,"VirtualItems",SEL(_mine,16),"displayName"),SEL(_mine,17)];
		_item10 = [localize M_CONFIG(getText,"VirtualItems",SEL(_mine,18),"displayName"),SEL(_mine,19)];
		_item11 = [localize M_CONFIG(getText,"VirtualItems",SEL(_mine,20),"displayName"),SEL(_mine,21)];
		_item12 = [localize M_CONFIG(getText,"VirtualItems",SEL(_mine,22),"displayName"),SEL(_mine,23)];
		_item13 = [localize M_CONFIG(getText,"VirtualItems",SEL(_mine,24),"displayName"),SEL(_mine,25)];
		_msg = format["Sample Results (Percent): \n%1: %2 \n%3: %4 \n%5: %6 \n%7: %8 \n%9: %10 \n%11: %12 \n%13: %14 \n%15: %16 \n%17: %18 \n%19: %20 \n%21: %22 \n%23: %24 \n%25: %26",SEL(_item1,0),SEL(_item1,1),SEL(_item2,0),SEL(_item2,1),SEL(_item3,0),SEL(_item3,1),SEL(_item4,0),SEL(_item4,1),SEL(_item5,0),SEL(_item5,1),SEL(_item6,0),SEL(_item6,1),SEL(_item7,0),SEL(_item7,1),SEL(_item8,0),SEL(_item8,1),SEL(_item9,0),SEL(_item9,1),SEL(_item10,0),SEL(_item10,1),SEL(_item11,0),SEL(_item11,1),SEL(_item12,0),SEL(_item12,1),SEL(_item13,0),SEL(_item13,1)];
	};
};

hint _msg;
