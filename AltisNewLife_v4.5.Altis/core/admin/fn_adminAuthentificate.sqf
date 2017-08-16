private["_pw"];
if(serverCommandAvailable "#kick") exitWith
{
    hint "Vous devez etre authentifié !";
};
_pw = ctrlText 1400;
if(isNil("_pw") || _pw == "") exitWith
{
    hint "Vous devez entrer un mot de passe !";
};
closeDialog 0;
serverCommand format [ "#login %1", _pw];
if(!(serverCommandAvailable "#kick")) exitWith
{
    hint "Authentification refusé!";
};