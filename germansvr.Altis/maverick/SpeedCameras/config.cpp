/*
	Author: Maverick Applications
	Desc: Altis Life SpeedCameras
*/

//Customize your settings, to fit your server setup!
class Maverick_SpeedCameras {

    //Define the possible locations for your speed cameras.
    //position -> Get the position via: diag_log(getPosATL player) -> replace the [] with {}
    //direction -> Get the position via: diag_log((getDir player) - 90)
    //speedlimit -> Choose any value you like. In a zone where people should drive 50, make set it to 55 or 60, to catch those speeders!
	SpeedCameras[] = {
	  //{{<position>}, <direction>, <speedlimit>},
        {{3612.866,13145.47,0}, 281.2, 50}, //Kavalla Martketplace Hauptstraße Norden
        {{3622.168,13080,0}, 101.366, 50}, //Kavalla Martketplace Hauptstraße Süden
        {{3795,13471,0}, 332.124, 50}, //Kavalla Ortseingang Norden
        {{3428.412,12648.966,0}, 136.822, 50}, //Kavalla Ortseingang Süden
        {{5721.456,14757.497,0}, 166.334, 130}, //Checkpoint 1 Süden
        {{6479.041,15260.313,0}, 339.567, 130}, //Checkpoint 1 Norden
        {{9018.235,15741.676,0}, 184.212, 50}, //agios West
        {{9630.173,15925,0}, 8.073, 50}, //agios ost
        {{23351.75,19744.688,0}, 148.026, 130}, //Maut station west
        {{23875.652,20156.95,0}, 322.760, 130}, //Maut station ost
	};

    //Shall the user get its driver licenses revoked? (Truck and Car license)
    RemoveDriverLicense    = 0;   // 0 = No | 1 = yes
    RemoveTruckLicense     = 0;   // 0 = No | 1 = yes

    //Shall the player be added to the wanted list with a speeding entry?
    AddPlayerToWanted      = 1;   // 0 = No | 1 = yes
	WantedCase			   = "4"; //The number/numbers+charaters that describe the crime you want the player to be added for

    //Let the player pay a fine from his bank account
    SpeedingFee            = 0;// 0 = No fine payed | Any value over 0 $ will be then subtracted from the bank account

    //Define the messages, which will be shown to the player, when he was driving too fast
	InfoMSG                = "Du wurdest mit %1 km/h geblitzt!";
	RemoveDriverLicenseMSG = "Deine B Führerschein wurde eingezogen!";
	RemoveTruckLicenseMSG  = "Deine C Führerschein wurde eingezogen!";
	AddPlayerToWantedMSG   = "Du wurdest wegen Überhöhter Geschwindigkeit zur Fahndungsliste hinzugefügt!";
	SpeedingFeeMSG         = "Bußgeld wegen zu schnellen Fahren: %1€";
};