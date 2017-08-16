/*----------------------------------------------------------
Author: Shawn "Huntah" Macgillivray
	
Description:
Crop dusting missions (In a jet)

A Mission for jets
-----------------------------------------------------------*/

private ["_totalPayment","_startPos","_markerArray","_prevMarker","_jet","_dropping","_payment","_counter","_newmarker","_markerlocation","_markerobj","_markername","_markerojb","_action"];

_action = [
	"Do you want to start this Crop Dusting Job? You will need your own Jet to complete the mission",
	"Crop Dusting",
	"Continue",
	"No Thanks"
] call BIS_fnc_guiMessage;
if(!_action)exitwith{};
if(DS_dusting)exitwith{hint 'You already have one of these missions running'};
DS_dusting = true;

_startPos = (position player);

_markerArray  =
[
getmarkerpos "copper",getmarkerpos "sand",getmarkerpos "1_3",getmarkerpos "apple2",getmarkerpos "camTest3",getmarkerpos "peach1",getmarkerpos "apple1",
getmarkerpos "bv_1_1",getmarkerpos "apple4",getmarkerpos "1d_1",getmarkerpos "iron",getmarkerpos "salt",getmarkerpos "apple3",getmarkerpos "1d"
];

systemchat "Hey there, simply buy a jet and fly low and slow over the 3 markers then return to a reload point to top up and receive payment";
hint "Hey there, simply buy a jet and fly low and slow over the 3 markers then return to a reload point to top up and receive payment";
sleep 6;
systemchat "Your first crop to dust is marked on the map";
hint "Your first crop to dust is marked on the map";
_jet = vehicle player;
sleep 0.5;
_dropping = 0;
_payment = 0;
_counter = 0;
_totalPayment = 0;

while{true}do
	{
	_prevMarker = (position player);
	deleteMarkerLocal "cropDusting";
	_newmarker = (floor(random(count _markerArray)));
	_markerlocation = (_markerArray select _newmarker);
	while{_prevMarker distance _markerlocation < 7000} do
		{
		_newmarker = (floor(random(count _markerArray)));
		_markerlocation = (_markerArray select _newmarker);
		};
	_dusting = true;
	_markerobj = createmarkerlocal ["cropDusting",[0,0]];
	_markername = "cropDusting";
	_markerobj setmarkershapelocal "Icon";
	"cropDusting" setmarkertypelocal "hd_warning";
	"cropDusting" setmarkercolorlocal "colorblack";
	"cropDusting" setmarkersizelocal [1, 1];
	"cropDusting" setmarkertextlocal "Field to Dust";
	_markername Setmarkerposlocal _markerlocation;
	_payment = round ((player distance _markerlocation)*1.9);
	if((DS_infoArray select 13) > 29)then{_payment = (_payment*1.3);};
	if((DS_infoArray select 13) > 34)then{_payment = (_payment*2);};
	while{_dusting}do
		{
		if((player distance _markerlocation <= 170)&&(typeOf (vehicle player) in ["I_Plane_Fighter_03_AA_F","B_Plane_CAS_01_F"]))then
			{
			_jet = (vehicle player);
			while{player distance _markerlocation <= 170}do
				{
				_jet setDamage 0.4;
				hint 'Spraying field';
				_dropping = _dropping + 1;
				sleep 1;
				_jet setDamage 0;
				};
			};
		if(_dropping > 2)then
			{
			_dusting = false;
			_dropping = 0;
			if(typeOf (vehicle player) == "B_Plane_CAS_01_F")then{_payment = _payment * 1.5};
			_totalPayment = _totalPayment + _payment;
			if(_counter != 2)then
				{
				systemchat format ["Good job, you will earn $%1 for that drop, your next marker will be on your map shortly",[_payment] call DS_fnc_numberText];
				hint format ["Good job, you will earn $%1 for that drop, your next marker will be on your map shortly",[_payment] call DS_fnc_numberText];
				}
				else
				{
				systemchat format ["Good job, you completed your final delivery and will receive $%1 for this run. You must now return to your boss for your payment of $%2",[_payment] call DS_fnc_numberText,[_totalPayment] call DS_fnc_numberText];
				hint format ["Good job, you completed your final delivery and will receive $%1 for this run. You must now return to your boss for your payment of $%2",[_payment] call DS_fnc_numberText,[_totalPayment] call DS_fnc_numberText];
				};
			_counter = _counter + 1;
			};		
		sleep 3;
		};
	if(_counter > 2)exitwith{};
	};
	
deleteMarkerLocal "cropDusting";	
_markerlocation = (getMarkerPos "air_serv_1");
_dusting = true;
_markerobj = createmarkerlocal ["cropDusting",[0,0]];
_markername = "cropDusting";
_markerobj setmarkershapelocal "Icon";
"cropDusting" setmarkertypelocal "hd_warning";
"cropDusting" setmarkercolorlocal "colorblack";
"cropDusting" setmarkersizelocal [1, 1];
"cropDusting" setmarkertextlocal "Dusting reload/payment";
_markername Setmarkerposlocal _markerlocation;

while {_dusting} do
	{
	if(player distance _markerlocation <= 50)then
		{
		systemchat format ["Good job, you have completed these jobs, a payment of $%1 has been deposited to your bank account!",[_totalPayment] call DS_fnc_numberText];
		hint format ["Good job, you have completed these jobs, a payment of $%1 has been deposited to your bank account!",[_totalPayment] call DS_fnc_numberText];
		[_totalPayment,true,true] spawn DS_fnc_handleMoney;
		_dusting = false;
		};		
		sleep 5;
	};
deleteMarkerLocal "cropDusting";	
sleep 10;
systemchat "Your job is finished, talk to the crop duster to get a new job";
DS_dusting = false;		
[100,true] spawn DS_fnc_moralAlter;
if((DS_infoArray select 13) == 19)then
	{
	[0] call DS_fnc_questCompleted;
	};
if((DS_infoArray select 13) == 29)then
	{
	_tempNum = (DS_infoArray select 14) + 1;
	DS_infoArray set [14,_tempNum];
	if((DS_infoArray select 14) > 2)then
		{
		[0] call DS_fnc_questCompleted;
		};
	};
if((DS_infoArray select 13) == 34)then
	{
	_tempNum = (DS_infoArray select 14) + 1;
	DS_infoArray set [14,_tempNum];
	if((DS_infoArray select 14) > 4)then
		{
		[0] call DS_fnc_questCompleted;
		};
	};
if((DS_infoArray select 13) == 38)then
	{
	_tempNum = (DS_infoArray select 14) + 1;
	DS_infoArray set [14,_tempNum];
	if((DS_infoArray select 14) > 9)then
		{
		[0] call DS_fnc_questCompleted;
		};
	};