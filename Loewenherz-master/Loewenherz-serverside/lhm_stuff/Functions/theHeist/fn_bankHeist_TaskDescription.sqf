/* 
Filename: fn_TaskDescription.sqf 
 
Author: Blackd0g 
 
Description: Bank Heist Mission Task Descriptions and Positions... 
*/ 
private ["_way","_MissionState","_return","_task","_taskPos","_taskState","_description","_descriptionShort","_descriptionHUD","_notification"]; 
_way = param [0,"",[""]]; 
_MissionState = param [1,0,[0]]; 
_return = []; 
 
switch (_way) do 
{ 
 case "Way1": // Die Sicherheitslücke... 
 { 
  switch (_MissionState) do 
  { 
   case 0: 
   { 
    // Define Mission Vars 
    _task = "Way1_0"; // can be any name 
    _taskPos = getPos loui; // target positon marker 
    _taskState = "Assigned";  // Statements below 
    _description = "Begebe dich nach Athira und suche nach Loui"; // Map Task long text 
    _descriptionShort = "Suche Loui auf"; // Map Task 
    _descriptionHUD = "Finde Loui in Athira"; // Target marker Name 
    _notification = "BankJobAssigned"; // cfgNotification Name 
 
    _return = [_task,_taskPos,_taskState,_description,_descriptionShort,_descriptionHUD,_notification]; 
   }; 
 
 
   case 1: 
   { 
    // Define Mission Vars 
    _task = "Way1_1"; // can be any name 
    _taskPos = []; // target positon marker 
    _taskState = "Assigned";  // Statements below 
    _description = "Bringe Loui folgendes Zeug: "; // Map Task long text 
    _descriptionShort = "Louis Stuff"; // Map Task 
    _descriptionHUD = ""; // Target marker Name 
    _notification = "BankJobAssigned"; // cfgNotification Name 
 
    _return = [_task,_taskPos,_taskState,_description,_descriptionShort,_descriptionHUD,_notification]; 
   }; 
 
   case 2: 
   { 
    // Define Mission Vars 
    _task = "Way1_2"; // can be any name 
    _taskPos = []; // target positon marker 
    _taskState = "Assigned";  // Statements below 
    _description = "Aktiviere alle Server und suche danach Loui in Athira wieder auf!"; // Map Task long text 
    _descriptionShort = "Server aktivieren"; // Map Task 
    _descriptionHUD = ""; // Target marker Name 
    _notification = "BankJobAssigned"; // cfgNotification Name 
 
    _return = [_task,_taskPos,_taskState,_description,_descriptionShort,_descriptionHUD,_notification]; 
   }; 
 
   case 3: 
   { 
    // Define Mission Vars 
    _task = "Way1_3"; // can be any name 
    _taskPos = []; // target positon marker 
    _taskState = "Assigned";  // Statements below 
    _description = "Finde die geheime Station in den Bergen suedöstlich von Kavala und aktiviere den Angriff am PC in der Höhle! Starte dort das Programm 'Sledge'"; // Map Task long text 
    _descriptionShort = "Finde die Höhle, starte den Hack!"; // Map Task 
    _descriptionHUD = ""; // Target marker Name 
    _notification = "BankJobAssigned"; // cfgNotification Name 
 
    _return = [_task,_taskPos,_taskState,_description,_descriptionShort,_descriptionHUD,_notification]; 
   }; 
 
   case 4: 
   { 
    // Define Mission Vars 
    _task = "Way1_4"; // can be any name 
    _taskPos = getPos loui; // target positon marker 
    _taskState = "Assigned";  // Statements below 
    _description = "Gehe zu Loui um den Code für die Bank zu erhalten"; // Map Task long text 
    _descriptionShort = "Gehe zu Loui"; // Map Task 
    _descriptionHUD = "Gehe zu Loui"; // Target marker Name 
    _notification = "BankJobAssigned"; // cfgNotification Name 
 
    _return = [_task,_taskPos,_taskState,_description,_descriptionShort,_descriptionHUD,_notification]; 
   }; 
   case 5: 
   { 
    // Define Mission Vars 
    _task = "Way1_5"; // can be any name 
    _taskPos = [11638.4,11899.6,0] ; // target positon marker 
    _taskState = "Assigned";  // Statements below 
    _description = "Finde den Bankangestellten. Er befindet sich vermutlich in einem der Verwaltungsgebaeude"; // Map Task long text 
    _descriptionShort = "Finde den Mitarbeiter"; // Map Task 
    _descriptionHUD = "Finde den Mitarbeiter"; // Target marker Name 
    _notification = "BankJobAssigned"; // cfgNotification Name 
 
    _return = [_task,_taskPos,_taskState,_description,_descriptionShort,_descriptionHUD,_notification]; 
   }; 
 
   case 6: 
   { 
    // Define Mission Vars 
    _task = "Way1_6"; // can be any name 
    _taskPos = [11660.1,11846.9,0]; // target positon marker 
    _taskState = "Assigned";  // Statements below 
    _description = format["Benutze den Code und gib diesen an den beiden Keypad Terminals in den beiden kleinen Kuppeln ein! Der Code muss GLEICHZEITIG bestaetigt werden sonst geht die Tür nicht auf. Beim 3 Fehlversuch wird der Alarm ausgeloest! Keycode: %1",fed_code]; // Map Task long text 
    _descriptionShort = "Gib den Code an beiden Keypads ein"; // Map Task 
    _descriptionHUD = "Gib die Tuercodes ein"; // Target marker Name 
    _notification = "BankJobAssigned"; // cfgNotification Name 
 
    _return = [_task,_taskPos,_taskState,_description,_descriptionShort,_descriptionHUD,_notification]; 
   }; 
 
 
   case 7: 
   { 
    // Define Mission Vars 
    _task = "Way1_7"; // can be any name 
    _taskPos = [11684.7,11832.1,0.00143814]; // target positon marker 
    _taskState = "Assigned";  // Statements below 
    _description = "Geht nun in den großen Dome und öffnet die Tür zum Tresorraum mit einem Bolzenschneider, aber leise....."; // Map Task long text 
    _descriptionShort = "Knacke die Tür"; // Map Task 
    _descriptionHUD = "Tür knacken"; // Target marker Name 
    _notification = "BankJobAssigned"; // cfgNotification Name 
 
    _return = [_task,_taskPos,_taskState,_description,_descriptionShort,_descriptionHUD,_notification]; 
   }; 
 
   case 8: 
   { 
    // Define Mission Vars 
    _task = "Way1_8"; // can be any name 
    _taskPos = getPos fed_bank; // target positon marker 
    _taskState = "Assigned";  // Statements below 
    _description = "Der Weg ist frei! Platzier die Sprengladung am Tresor und gehe in Sicherheit. Danach könnt ihr den Tresor leerräumen. Achtung die Cops werden das mitkriegen..."; // Map Task long text 
    _descriptionShort = "Platzier die Sprengladung"; // Map Task 
    _descriptionHUD = "Bombe plazieren"; // Target marker Name 
    _notification = "BankJobAssigned"; // cfgNotification Name 
 
    _return = [_task,_taskPos,_taskState,_description,_descriptionShort,_descriptionHUD,_notification]; 
   }; 
 
  }; 
 }; 
 
 case "Way2": // Der Stromausfall... 
 { 
  switch (_MissionState) do 
  { 
   case 0: 
   { 
    // Define Mission Vars 
    _task = ""; // can be any name 
    _taskPos = []; // target positon marker 
    _taskState = "";  // Statements below 
    _description = ""; // Map Task long text 
    _descriptionShort = ""; // Map Task 
    _descriptionHUD = ""; // Target marker Name 
    _notification = ""; // cfgNotification Name 
 
    _return = [_task,_taskPos,_taskState,_description,_descriptionShort,_descriptionHUD,_notification]; 
   }; 
 
   case 1: 
   { 
    // Define Mission Vars 
    _task = ""; // can be any name 
    _taskPos = []; // target positon marker 
    _taskState = "";  // Statements below 
    _description = ""; // Map Task long text 
    _descriptionShort = ""; // Map Task 
    _descriptionHUD = ""; // Target marker Name 
    _notification = ""; // cfgNotification Name 
 
    _return = [_task,_taskPos,_taskState,_description,_descriptionShort,_descriptionHUD,_notification]; 
   }; 
 
   case 2: 
   { 
    // Define Mission Vars 
    _task = ""; // can be any name 
    _taskPos = []; // target positon marker 
    _taskState = "";  // Statements below 
    _description = ""; // Map Task long text 
    _descriptionShort = ""; // Map Task 
    _descriptionHUD = ""; // Target marker Name 
    _notification = ""; // cfgNotification Name 
 
    _return = [_task,_taskPos,_taskState,_description,_descriptionShort,_descriptionHUD,_notification]; 
   }; 
 
   case 3: 
   { 
    // Define Mission Vars 
    _task = ""; // can be any name 
    _taskPos = []; // target positon marker 
    _taskState = "";  // Statements below 
    _description = ""; // Map Task long text 
    _descriptionShort = ""; // Map Task 
    _descriptionHUD = ""; // Target marker Name 
    _notification = ""; // cfgNotification Name 
 
    _return = [_task,_taskPos,_taskState,_description,_descriptionShort,_descriptionHUD,_notification]; 
   }; 
   case 4: 
   { 
    // Define Mission Vars 
    _task = ""; // can be any name 
    _taskPos = []; // target positon marker 
    _taskState = "";  // Statements below 
    _description = ""; // Map Task long text 
    _descriptionShort = ""; // Map Task 
    _descriptionHUD = ""; // Target marker Name 
    _notification = ""; // cfgNotification Name 
 
    _return = [_task,_taskPos,_taskState,_description,_descriptionShort,_descriptionHUD,_notification]; 
   }; 
 
   case 5: 
   { 
    // Define Mission Vars 
    _task = ""; // can be any name 
    _taskPos = []; // target positon marker 
    _taskState = "";  // Statements below 
    _description = ""; // Map Task long text 
    _descriptionShort = ""; // Map Task 
    _descriptionHUD = ""; // Target marker Name 
    _notification = ""; // cfgNotification Name 
 
    _return = [_task,_taskPos,_taskState,_description,_descriptionShort,_descriptionHUD,_notification]; 
   }; 
  }; 
 }; 
}; 
 
_return;