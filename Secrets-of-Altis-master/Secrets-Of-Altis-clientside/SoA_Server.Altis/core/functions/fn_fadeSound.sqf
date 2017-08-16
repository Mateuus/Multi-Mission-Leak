/*
File: fn_fadeSound.sqf
Auhtor: Michael Francis

Description:
Fades out sound.
*/

life_fadeSound = !life_fadeSound;

if (life_fadeSound) then 
{
1 fadeSound 0.1; // Faded to 10%
hint "Du hast nun Ohrstöpsel eingesetzt.";
}
else
{
1 fadeSound 1; // Returned to 100%
hint "Du hast die Ohrstöpsel entfernt.";
};