/*
	Opens extended cellphone menu
*/
private["_display","_units","_type","_index"];

disableSerialization;
waitUntil {!isNull findDisplay 3000};
_display = findDisplay 3000;

lbClear 1500;
lbClear 1501;



switch(playerSide) do
{
	case west: 
	{
		ctrlShow[2050,false]; //Gang Icon
		ctrlShow[2051,false]; //Gang Button
		ctrlShow[2054,false]; //Craft Icon
		ctrlShow[2055,false]; //Craft Button
	};
	case independent:
	{
		ctrlShow[2050,false]; //Gang Icon
		ctrlShow[2051,false]; //Gang Button
		ctrlShow[2052,false]; //Wanted Icon
		ctrlShow[2053,false]; //Wanted Button
	};
	case civilian:
	{
		ctrlShow[2052,false]; //Wanted Icon
		ctrlShow[2053,false]; //Wanted Button
	};
	case east:
	{
		ctrlShow[2052,false]; //Wanted Icon
		ctrlShow[2053,false]; //Wanted Button
	};
};

if((call EMonkeys_coplevel) < 3) then
{
	ctrlShow[2406,false];//Wanted + Button
	ctrlShow[2407,false]; //Wanted + Icon
};

if((call EMonkeys_adminlevel) < 1) then
{
	ctrlShow[2056,false]; //Admin Icon
	ctrlShow[2057,false]; //Admin Button
};



if((call EMonkeys_adminlevel) < 1) then
{
	ctrlShow[2056,false]; //Admin Icon
	ctrlShow[2057,false]; //Admin Button
	ctrlShow [2402, false];
	ctrlShow [2058, false];
};



/*
if((call EMonkeys_adminlevel) < 1) then
{
	ctrlShow [2402, false];
	//ctrlShow [2058, false];
};
*/

//Fill listbox with default stuff
/////////////////////////////////
_index = lbAdd [1500, "Admins/Support"];
lbSetValue[1500,_index,2];
lbSetColor[1500,_index,[190,190,190,1]];

if( (call EMonkeys_adminlevel) >= 1) then
{
	_index = lbAdd [1500, "Adminmeldung"];
	lbSetValue[1500,_index,4];
	lbSetColor[1500,_index,[190,190,190,1]];
};

_index = lbAdd [1500, "Polizei rufen"];
lbSetValue[1500,_index,1];
lbSetColor[1500,_index,[0,0,255,1]];

if( (call EMonkeys_coplevel) >= 1) then
{
	_index = lbAdd [1500, "Polizeimeldung"];
	lbSetValue[1500,_index,5];
	lbSetColor[1500,_index,[0,0,255,1]];
};

//Feuerwehr
_index = lbAdd [1500, "Feuerwehr rufen"];
lbSetValue[1500,_index,7];
lbSetColor[1500,_index,[139,0,0,1]];

//Lotsen
_index = lbAdd [1500, "Lotsen rufen"];
lbSetValue[1500,_index,8]; //ID:6
lbSetColor[1500,_index,[0,191,255,1]];

_index = lbAdd [1500, "-----------------"];
lbSetColor[1500,_index,[255,255,255,1]];
//Fill listbox with online players
/////////////////////////////////
{
	if(alive _x && _x != player && !(side _x in [west,independent])) then
	{
		_index = lbAdd [1500, name _x];
		lbSetData[1500,_index,str(_x)];
		lbSetValue[1500,_index,0];		
		
		switch (side _x) do
		{
			case civilian: {lbSetColor[1500,_index,[255,255,255,1]];};
			case east: {lbSetColor[1500,_index,[255,255,255,1]];};
		};
		
		if (name _x in CPE_Last_Contacts) then
			{
				lbSetColor[1500,_index,[0,0.7,0,1]];
			};
	};
} foreach playableUnits;

_msg1 = eM_lastMessage;

_msg4 = []; _msg4 =_msg4+ _msg1; reverse _msg4;

_msg2 = "";

{
_msg3 = format ["%1<br/><br/>",_x];
_msg2 = _msg2 + _msg3;
}foreach _msg4;


_text = _display displayCtrl 1501;

_text ctrlSetStructuredText parseText _msg2;




