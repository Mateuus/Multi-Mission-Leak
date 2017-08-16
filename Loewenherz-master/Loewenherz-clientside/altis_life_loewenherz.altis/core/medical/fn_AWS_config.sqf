/*
    File: fn_packupContainer.sqf
    Author: Bryan "Tonic" Boardwine
    Edited by: demiced

    Description:
    Packs up a deployed container.
*/


private ["_verletzungen","_all","_what","_config","_ret"];


_verletzungen = param[0,true,[true]];
_all = param[1,false,[false]];
_what = param[2,0,[0]];
_config = [];

/*
	Verletzungen:
	"broken_left_leg"
	"broken_right_leg"
	"broken_left_arm"
	"broken_right_arm"
	"bullet_wound_left_arm"
	"Bullet_wound_right_arm"
	"bullet_wound_left_leg"
	"bullet_wound_right_leg"
	"bullet_wound_torso"
	"big_wound_torso"
	"big_wound_left_arm"
	"big_wound_right_arm"
	"big_wound_left_leg"
	"big_wound_right_leg"
	"traumatic_brain_injury"
	"fever"
*/



if(_verletzungen) then {
	_config = [
		["broken_left_leg","Bruch linkes Bein","<t size='1.3' color='#FF0000' >Bruch des linken Beines:</t> <br/><br/> <t size='1.1'  >Behandlung mit:</t> <br/>- Schiene <br/>- ggf. Morphin"],
		["broken_right_leg","Bruch rechtes Bein","<t size='1.3' color='#FF0000' >Bruch des rechten Beines:</t> <br/><br/> <t size='1.1'  >Behandlung mit:</t> <br/>- Schiene <br/>- ggf. Morphin"],
		["broken_left_arm","Bruch linker Arm","<t size='1.3' color='#FF0000' >Bruch des linken Armes:</t> <br/><br/> <t size='1.1'  >Behandlung mit:</t> <br/>- Schiene <br/>- ggf. Morphin"],
		["broken_right_arm","Bruch rechter Arm","<t size='1.3' color='#FF0000' >Bruch des rechten Armes:</t> <br/><br/> <t size='1.1'  >Behandlung mit:</t> <br/>- Schiene <br/>- ggf. Morphin"],

		["bullet_wound_left_arm","Schusswunde linker Arm","<t size='1.3' color='#FF0000' >Schusswunde im linken Arm:</t> <br/><br/> <t size='1.1'  >Behandlung mit:</t> <br/>- Tourniquet <br/>- Israeli Bandage <br/>- ggf. Druckverband <br/>- ggf. Combat Gauze"],
		["Bullet_wound_right_arm","Schusswunde rechter Arm","<t size='1.3' color='#FF0000' >Schusswunde im rechten Arm:</t> <br/><br/> <t size='1.1'  >Behandlung mit:</t> <br/>- Tourniquet <br/>- Israeli Bandage <br/>- ggf. Druckverband <br/>- ggf. Combat Gauze"],
		["bullet_wound_left_leg","Schusswunde linkes Bein","<t size='1.3' color='#FF0000' >Schusswunde im linken Bein:</t> <br/><br/> <t size='1.1'  >Behandlung mit:</t> <br/>- Tourniquet <br/>- Israeli Bandage <br/>- ggf. Druckverband <br/>- ggf. Combat Gauze"],
		["bullet_wound_right_leg","Schusswunde rechtes Bein","<t size='1.3' color='#FF0000' >Schusswunde im rechten Bein:</t> <br/><br/> <t size='1.1'  >Behandlung mit:</t> <br/>- Tourniquet <br/>- Israeli Bandage <br/>- ggf. Druckverband <br/>- ggf. Combat Gauze"],
		["bullet_wound_torso","Schusswunde Torso","<t size='1.3' color='#FF0000' >Schusswunde im Torso:</t> <br/><br/> <t size='1.1'  >Behandlung mit:</t> <br/>- Israeli Bandage <br/>- ggf. Druckverband <br/>- ggf. Combat Gauze"],

		["big_wound_torso","Offene Wunde Torso","<t size='1.3' color='#FF0000' >Offene Wunde am Torso:</t> <br/><br/> <t size='1.1'  >Behandlung mit:</t> <br/>- Israeli Bandage <br/>- ggf. Druckverband <br/>- ggf. Combat Gauze"],
		["big_wound_left_arm","Offene Wunde linker Arm","<t size='1.3' color='#FF0000' >Offene Wunde am linken Arm:</t> <br/><br/> <t size='1.1'  >Behandlung mit:</t> <br/>- Tourniquet <br/>- Israeli Bandage <br/>- ggf. Druckverband <br/>- ggf. Combat Gauze"],
		["big_wound_right_arm","Offene Wunde rechter Arm","<t size='1.3' color='#FF0000' >Offene Wunde am rechten Arm:</t> <br/><br/> <t size='1.1'  >Behandlung mit:</t> <br/>- Tourniquet <br/>- Israeli Bandage <br/>- ggf. Druckverband <br/>- ggf. Combat Gauze"],
		["big_wound_left_leg","Offene Wunde linkes Bein","<t size='1.3' color='#FF0000' >Offene Wunde am linken Bein:</t> <br/><br/> <t size='1.1'  >Behandlung mit:</t> <br/>- Tourniquet <br/>- Israeli Bandage <br/>- ggf. Druckverband <br/>- ggf. Combat Gauze"],
		["big_wound_right_leg","Offene Wunde rechtes Bein","<t size='1.3' color='#FF0000' >Offene Wunde am rechten Bein:</t> <br/><br/> <t size='1.1'  >Behandlung mit:</t> <br/>- Tourniquet <br/>- Israeli Bandage <br/>- ggf. Druckverband <br/>- ggf. Combat Gauze"],


		["traumatic_brain_injury","Kopfverletzung","<t size='1.3' color='#FF0000' >Offene Wunde am Kopf:</t> <br/><br/> <t size='1.1'  >Behandlung mit:</t> <br/>- Israeli Bandage "],
		["fever","Fieber","<t size='1.3' color='#FF0000' >Fieber:</t> <br/><br/> <t size='1.1'  >Behandlung mit:</t> <br/>- Homöopathische Tabletten "]




	];

} else {

	_config = [
		["Tourniquet","Tourniquet","<t size='1.3' color='#FF0000' >Tourniquet:</t> <br/><br/> <t size='1.1'  >Beschreibung:</t> <br/> Dient zum Abbinden der Extremitäten zur Blutstillung bei stark blutenden Wunden, nicht bei Kopf- oder Brustverletzungen anwendbar!"],
		["Israeli Bandage","Israeli Bandage","<t size='1.3' color='#FF0000' >Israeli Bandage:</t> <br/><br/> <t size='1.1'  >Beschreibung:</t> <br/> Normale Bandage, für alle Wunden verwendbar!"],
		["Combat Gauze","Combat Gauze","<t size='1.3' color='#FF0000' >Combat Gauze:</t> <br/><br/> <t size='1.1'  >Beschreibung:</t> <br/> Eine mit einer gerinnungsstärkenden Flüssigkeit getränkter Wundstopfer, zur Anwendung Combat Gauze IN die Wunde einführen bis die Blutung gestoppt ist!"],
		["Druckverband","Druckverband","<t size='1.3' color='#FF0000' >Druckverband:</t> <br/><br/> <t size='1.1'  >Beschreibung:</t> <br/> Ein normaler Druckverband für stark blutende Wunden!"],
		["Morphine","Morphine","<t size='1.3' color='#FF0000' >Morphine:</t> <br/><br/> <t size='1.1'  >Beschreibung:</t> <br/> Morphine Autoinjektor zur schnellen Anwendung gegen Schmerzen, kann auch bei Knochenbrüchen helfen!"],
		["Homöopathische Tabletten","Homöopathische Tabletten","<t size='1.3' color='#FF0000' >Homöopathische Tabletten:</t> <br/><br/> <t size='1.1'  >Beschreibung:</t> <br/> Tabletten welche Fiebersenkend wirken, verschreibungspflichtig!"],
		["Schiene","Schiene","<t size='1.3' color='#FF0000' >Schiene:</t> <br/><br/> <t size='1.1'  >Beschreibung:</t> <br/> Eine normale Schiene, für sämtliche Extremitäten geignet, kann zum Kurieren von Brüchen genutzt werden!"]

	];


};





if(!_all) then {
	_ret = _config select _what;


} else {

	_ret = _config;
};


_ret;