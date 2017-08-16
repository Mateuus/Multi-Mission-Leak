/*
@Version: 0.3
@Author: =IFD= Cryptonat
@Edited: 5/16/14

Description:
*/

while {true} do {
sleep 300;
[] call SOCK_fnc_updateRequest;
hint composeText [ image "icons\save.paa", " Sauvegarde automatique" ];
};