/*
	File: fn_alterStats.sqf
	Author: Shawn "Huntah" Macgillivray
	
	Description:
	Alters a players saved stats
*/
private["_type","_tempVal"];

_type = _this select 0;
//systemchat format ["%1",_type];

switch(_type)do
	{
	case 0://Cop Impound
		{
		_tempVal = DS_infoArray select 3;
		_tempVal = _tempVal + 1;
		DS_infoArray set[3,_tempVal];
		};
	case 1://Cop Ticket
		{
		_tempVal = DS_infoArray select 4;
		_tempVal = _tempVal + 1;
		DS_infoArray set[4,_tempVal];
		};
	case 2://Cop Jail
		{
		_tempVal = DS_infoArray select 5;
		_tempVal = _tempVal + 1;
		DS_infoArray set[5,_tempVal];
		};
	case 3://Cop Kill
		{
		_tempVal = DS_infoArray select 6;
		_tempVal = _tempVal + 1;
		DS_infoArray set[6,_tempVal];
		};
	case 4://2 Mins Cop
		{
		_tempVal = DS_infoArray select 0;
		_tempVal = _tempVal + 2;
		DS_infoArray set[0,_tempVal];
		};
	case 5://2 Mins Civ
		{
		_tempVal = DS_infoArray select 1;
		_tempVal = _tempVal + 2;
		DS_infoArray set[1,_tempVal];
		};
	case 6://2 Mins WL CIV
		{
		_tempVal = DS_infoArray select 2;
		_tempVal = _tempVal + 2;
		DS_infoArray set[2,_tempVal];
		};
	case 7://Medic Revive
		{
		_tempVal = DS_infoArray select 7;
		_tempVal = _tempVal + 1;
		DS_infoArray set[7,_tempVal];
		};
	case 8://Mechanic Impound
		{
		_tempVal = DS_infoArray select 8;
		_tempVal = _tempVal + 1;
		DS_infoArray set[8,_tempVal];
		};
	case 9://Kills (DEATHS)
		{
		_tempVal = DS_infoArray select 9;
		_tempVal = _tempVal + 1;
		DS_infoArray set[9,_tempVal];
		};
	case 12://Sickness
		{
		if(!(player getVariable ["DS_sick_infection",false]))then
			{
			DS_infoArray set[12,0];
			}
			else
			{
			if(playerside == west)then
				{
				DS_infoArray set[12,2];
				}
				else
				{
				DS_infoArray set[12,1];
				};
			};
		};
	case 13://crafting
		{
		_tempVal = DS_infoArray select 29;
		_tempVal = _tempVal + 1;
		DS_infoArray set [29,_tempVal];
		if(_tempVal > ((DS_infoArray select 30)*5))then
			{
			_tempVal = DS_infoArray select 30;
			_tempVal = _tempVal + 1;
			DS_infoArray set [29,0];
			DS_infoArray set [30,_tempVal];
			titleCut ["","WHITE OUT",0];
			sleep 0.5;
			titleCut ["","WHITE IN",0];
			player say3D "success";
			titleText [format["Congratulations, you have levelled up to level %1. You now have a greater chance to critical success items",(DS_infoArray select 30)],"PLAIN"];
			if((DS_infoArray select 13) == 44)then{[0] call DS_fnc_questCompleted;};
			[] call DS_fnc_compileData;
			};
		};
	};

			