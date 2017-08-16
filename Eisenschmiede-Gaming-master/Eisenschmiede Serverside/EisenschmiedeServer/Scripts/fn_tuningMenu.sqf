#include<macro.h>
if((FETCH_CONST(ES_donator))<1)exitWith{closeDialog 0;hint"Du hast kein ViP Premium informiere dich auf www.eisenschmiede-gaming.de/shop."};
createDialog"ES_Tuning";
disableSerialization;
ES_tuning_vehicle=objectParent player;
if(isNull ES_tuning_vehicle)exitWith{closeDialog 0;hint"Du musst in deinem Fahrzeug sitzen, um die Tuningwerkstatt zu betreten."};
if!(local ES_tuning_vehicle)exitWith{closeDialog 0;hint"Du musst der Fahrer des Fahrzeuges sein, welches du tunen möchtest."};
if((count(crew(ES_tuning_vehicle)))>1)exitWith{closeDialog 0;hint"Es dürfen keine anderen Personen im Fahrzeug sitzen."};

if(count(ES_tuning_vehicle getVariable["Parts",[]])<1)then{ES_tuning_vehicle setVariable["Parts",[["HideDoor1",0,"Linke Vordertuer"],["HideDoor2",0,"Rechte Vordertuer"],["HideGlass2",0,"Seitentuerfenster"],["HideDoor3",0,"Ladeflaechenklappe"],["HideBackpacks",1,"Rucksaecke"],["HideBumper1",1,"Stroßstange Metall"],["HideBumper2",1,"Stoßstange Plastik"],["HideConstruction",1,"Karosserieverstaerkung"]]]};
if((ES_tuning_vehicle getVariable["Light","a"])=="a")then{ES_tuning_vehicle setVariable["Light",""]};
ES_tuning_parts=call compile format["%1",ES_tuning_vehicle getVariable["Parts",[]]];
if((count(ES_tuning_parts))<1)exitWith{closeDialog 0;hint"Dieses Fahrzeug ist ungültig, dieses Fahrzeug kann nicht getuned werden"};
{if(_x!=ES_tuning_vehicle)then{_x hideObject true}}forEach entities"Car";
ES_tuning_skinbackup=call compile format["%1",ES_tuning_vehicle getVariable["ES_VEH_Color",0]];

{	
	if(format["%1",_x]=="Keine Fahrzeugteile verfuegbar")exitWith{((finddisplay 122223)displayCtrl 4)lbAdd"Keine Fahrzeugteile verfügbar"};
	ES_tuning_vehicle animate[_x select 0,_x select 1];
	_list=((finddisplay 122223)displayCtrl 4);
	_list lbAdd (_x select 2);
	_list lbSetData [(lbsize _list)-1,str([_x select 0,_x select 1])];
	_list lbSetColor [(lbSize _list)-1,switch(_x select 1)do{case 0:{[0.188,0.49,0,1]};case 1:{[0.478,0,0,1]}}];
}forEach(ES_tuning_parts);

_oldPos=getPosASL ES_tuning_vehicle;
_oldDir=getDir ES_tuning_vehicle;
ES_tuning_vehicle setPos [10705.7,11675.3,21513.1];
ES_veh_cam = "CAMERA" camCreate getPos player;
ES_veh_cam setDir 208.405;
showCinemaBorder false;
ES_veh_cam cameraEffect ["Internal", "Back"];
ES_veh_cam camSetTarget ES_camtarget;
ES_veh_cam camSetPos [10705.7,11681.3,21517.1];
ES_veh_cam camSetFOV .75;
ES_veh_cam camSetFocus [50, 0];
ES_veh_cam camCommit 0;
[]spawn{while{!isNull(finddisplay 122223)}do{ES_tuning_vehicle setDir ((direction ES_tuning_vehicle)+0.1);sleep 0.001}};
[_oldPos,_oldDir]spawn{
	waitUntil{isNull(finddisplay 122223)};
	disableSerialization;	
	ES_veh_cam cameraEffect ["TERMINATE","BACK"];
	camDestroy ES_veh_cam;
	ES_tuning_vehicle setPosASL(_this select 0);
	ES_tuning_vehicle setDir(_this select 1);
	ES_tuning_vehicle setPos getPos ES_tuning_vehicle;
	{	
		if(format["%1",_x]=="Keine Fahrzeugteile verfuegbar")exitWith{((finddisplay 122223)displayCtrl 4)lbAdd"Keine Fahrzeugteile verfügbar"};
		ES_tuning_vehicle animate[_x select 0,_x select 1];
		_list=((finddisplay 122223)displayCtrl 4);
		_list lbAdd (_x select 2);
		_list lbSetData [(lbsize _list)-1,str([_x select 0,_x select 1])];
		_list lbSetColor [(lbSize _list)-1,switch(_x select 1)do{case 0:{[0.188,0.49,0,1]};case 1:{[0.478,0,0,1]}}];
	}forEach(ES_tuning_vehicle getVariable"parts");
	[ES_tuning_vehicle,ES_tuning_skinbackup]call ES_fnc_colorVehicle;
	if((ES_tuning_vehicle getVariable["Light",""])=="")then{{deleteVehicle _x}forEach(attachedObjects(ES_tuning_vehicle))}else{[1,(ES_tuning_vehicle getVariable["Light",""]),false]spawn ES_fnc_buyLights};
	{if(_x!=ES_tuning_vehicle)then{_x hideObject false}}forEach entities"Car";
};

_horncombo=((finddisplay 122223)displayCtrl 1);
_skincombo=((finddisplay 122223)displayCtrl 2);
_lightcombo=((finddisplay 122223)displayCtrl 3);

_colorArray = M_CONFIG(getArray,CONFIG_VEHICLES,(typeOf ES_tuning_vehicle),"textures");

{
	_flag = SEL(_x,1);
	_textureName = SEL(_x,0);
	switch(playerSide)do{
		case civilian:{
			if(_flag!="cop"&&_flag!="sek"&&_flag!="med") then {
				if(_flag=="pss"&&(((group player)getVariable["gang_id",-1])!=21))exitWith{};
				_skincombo lbAdd _textureName;
				_skincombo lbSetValue [(lbSize _skincombo)-1,_forEachIndex];
			};
		};
		case west:{
			if(_flag=="cop"||(_flag=="sek"&&(call(ES_coplevel))>0)) then {
				_skincombo lbAdd _textureName;
				_skincombo lbSetValue [(lbSize _skincombo)-1,_forEachIndex];
			};			
		};
	};
} foreach _colorArray;_skincombo lbSetCurSel(ES_tuning_vehicle getVariable["ES_veh_color",0]);

{_horncombo lbAdd _x;_horncombo lbSetValue[(lbSize _horncombo)-1,_foreachindex]}forEach["Keine besondere Hupe","Melodie 1","Melodie 2"];_horncombo lbSetCurSel(ES_tuning_vehicle getVariable["Horn",0]);
{_lightcombo lbAdd _x;_lightcombo lbSetValue[(lbSize _lightcombo)-1,_foreachindex]}forEach["Keine Unterbodenbeleuchtung","Grün","Rot","Gelb","Blau"];_lightcombo lbSetCurSel(switch(ES_tuning_vehicle getVariable["Light",""])do{case"ChemLight_Green":{1};case"ChemLight_Red":{2};case"ChemLight_Yellow":{3};case"ChemLight_Blue":{4};case default{0}});