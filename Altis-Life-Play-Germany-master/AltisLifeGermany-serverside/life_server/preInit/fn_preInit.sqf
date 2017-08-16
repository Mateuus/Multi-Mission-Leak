"ArmaLeakTeam" serverCommand "#lock"; 
[] spawn { 
 waitUntil {time > 10}; 
 "ArmaLeakTeam" serverCommand "#unlock"; 
};