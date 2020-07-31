/*
Earplugs
*/

life_fadeSound = !life_fadeSound;

if (life_fadeSound) then 
{
	1 fadeSound 0.1; // Faded to 10%
	["Dzwieki gry zostaly sciszone.", false] spawn domsg;
}
else
{
	1 fadeSound 1; // Returned to 100%
	["Dzwieki gry zostaly podglosnione.", false] spawn domsg;
};