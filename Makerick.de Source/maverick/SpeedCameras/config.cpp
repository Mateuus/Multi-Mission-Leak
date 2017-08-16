/*
	Author: Maverick Applications
	Desc: Altis Life SpeedCameras
*/

//Customize your settings, to fit your server setup!
class Maverick_SpeedCameras {

    //Define the possible locations for your shipwrecks.
    //position -> Get the position via: diag_log(getPosATL player) -> replace the [] with {}
    //direction -> Get the position via: diag_log((getDir player) - 90)
    //speedlimit -> Choose any value you like. In a zone where people should drive 50, make set it to 55 or 60, to catch those speeders!
	SpeedCameras[] = {
	  //{{<position>}, <direction>, <speedlimit>},
        {{3605.94,13087.6,0}, 283.865, 67}, //Kavalla Martketplace [Altis]
        {{3777.49,13420.8,0}, 146.733, 67},  //Outside kavalla near the construction site [Altis]
        {{6466.13,15234,0}, 162.058, 112}, // North facing kavala police checkpoint
        {{6543.7,15301.4, 0},341.9939, 112},  // South facing kavala police checkpoint
        {{12405.3,15880.9,0}, 7.4777, 112}, // north facing gh1
        {{12583,15891.6,0}, 184.911, 112}, // south facing gh1
        {{14237.6,18249.7,0}, 73.283, 52}, // south facing athira
        {{14169.7,18337.1,0}, 248.576, 52}, // north facing athira
        {{17278.4,13479.7,0}, 300.5203, 67}, // north facing pygros
        {{17252.1,13326.6,0}, 113.563, 67} // south facing pygros
	};

    //Shall the user get its driver licenses revoked? (Truck and Car license)
    RemoveDriverLicense    = 0;   // 0 = No | 1 = yes
    RemoveTruckLicense     = 0;   // 0 = No | 1 = yes

    //Shall the player be added to the wanted list with a speeding entry?
    AddPlayerToWanted      = 1;   // 0 = No | 1 = yes

    //Let the player pay a fine from his bank account
    SpeedingFee            = 0;// 0 = No fine payed | Any value over 0 $ will be then subtracted from the bank account

    //Define the messages, which will be shown to the player, when he was driving too fast
	InfoMSG                = "You have been captured driving %1 km/h over the speeding limit!";
	RemoveDriverLicenseMSG = "Your drivers license has been removed!";
	RemoveTruckLicenseMSG  = "Your truck license has been removed!";
	AddPlayerToWantedMSG   = "A wanted record about you has been created!";
	SpeedingFeeMSG         = "You have been fined with %1$ for speeding!";
};