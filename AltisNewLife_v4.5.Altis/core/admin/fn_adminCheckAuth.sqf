disableSerialization;
private[];
if(serverCommandAvailable "#kick") exitWith
{
    systemChat "Vous etes bien connecté.";
    true;
};
if(!(createDialog "admin_pw")) exitWith {};
false;