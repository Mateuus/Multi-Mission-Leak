/*
 Author: Crunch
 Description: Config für das Neue MSG-System und so
*/
class cfgMsg {
 class msgTime { //Regelt wie lange die Nachricht da stehen soll in Sekunden
 class fast {time=5;};
 class slow {time=15;};
 class msg {time=45;};
 };
 class msgColors { //Regelt die Farben vom Header im RGBT style
 class default {rgbt[]={255,137,0,.9};};
 class red {rgbt[]={255,0,0,.9};};
 class green {rgbt[]={0,255,0,.9};};
 class blue {rgbt[]={0,0,255,.9};};
 };
 class msgSmiley {
 senabled = 1;
 smileys[] = { //Example: ["CODE","PFAD ZUM BILD","NAME"];
 {":angry:","<img size='.6' image='icons\em_angry.paa'/>","Sauer"},
 {":cool:","<img size='.6' image='icons\em_cool.paa'/>","Cool"},
 {":cry:","<img size='.6' image='icons\em_cry.paa'/>","Häulen"},
 {":D","<img size='.6' image='icons\em_dd.paa'/>","Lachkick"},
 {":evil:","<img size='.6' image='icons\em_devil.paa'/>","Täufel"},
 {"<33","<img size='.6' image='icons\em_dh.paa'/>","Doppel Herz"},
 {":(","<img size='.6' image='icons\em_dk.paa'/>","Traurig"},
 {":nlike:","<img size='.6' image='icons\em_dlike.paa'/>","Gefällt mir nicht"},
 {":gamer:","<img size='.6' image='icons\em_gamer.paa'/>","Gamer"},
 {":ghost:","<img size='.6' image='icons\em_ghost.paa'/>","Geist"},
 {"<3","<img size='.6' image='icons\em_heart.paa'/>","Herz"},
 {"*D","<img size='.6' image='icons\em_heye.paa'/>","Liebe"},
 {":*","<img size='.6' image='icons\em_kiss.paa'/>","Kuss"},
 {":like:","<img size='.6' image='icons\em_like.paa'/>","Like"},
 {":nerd:","<img size='.6' image='icons\em_nerd.paa'/>","Nerd"},
 {":nintre:","<img size='.6' image='icons\em_nintrest.paa'/>","Nicht Interessiert"},
 {":pedo:","<img size='.6' image='icons\em_pedo.paa'/>","Pedo"},
 {":rock:","<img size='.6' image='icons\em_rock.paa'/>","Rockenroll"},
 {":shity:","<img size='.6' image='icons\em_shit.paa'/>","Shitty"},
 {"xD","<img size='.6' image='icons\em_xd.paa'/>","Lachflash"},
 {"xP","<img size='.6' image='icons\em_xp.paa'/>","Freaky"},
 {":kappa:","<img size='.7' image='icons\em_kappa.paa'/>","Kappa"},
 {":lol:","<img size='.7' image='icons\em_lol.paa'/>","LOL"}
 };
 };
};
