StartProgress = false;
tf_no_auto_long_range_radio = true; 
tf_west_radio_code = "";
tf_east_radio_code = tf_west_radio_code;
tf_guer_radio_code = tf_west_radio_code;
tf_civ_radio_code = tf_west_radio_code;
player setVariable["tf_receivingDistanceMultiplicator", 10];
player setVariable["tf_sendingDistanceMultiplicator", 10];

[] execVM "briefing.sqf"; //Load Briefing
[] execVM "KRON_Strings.sqf";

StartProgress = true;

ASAGNDJSN = true;