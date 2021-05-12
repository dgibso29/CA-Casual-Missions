class para_Option {
    name = "Option Name"; // Display Name
    variable = "my_option_name"; // Variable name for saving in PFS
    tooltip = ""; // Tooltip
};

class para_OptionCheckbox: para_Option {
    type = "Checkbox";
    default = 0;
};

class para_OptionSlider: para_Option {
    type = "Slider";
    default = 50;
    range[] =  { 0, 100 };
    step = 10;
};

class para_OptionCombobox: para_Option {
    type = "Combobox";
    default = 0;
    values[] = {
        "Value Name",
        "Value Name 2"
    };
};

class para_CfgOptions {
    class para_maxViewDist {
		name = "Max Viewdistance"; // Display Name
		variable = "para_maxViewdist"; // Variable name for saving in PFS
		tooltip = "Max Viewdistance"; // Tooltip
		type = "Slider";
		default = 1000;
		range[] =  { 100, 5000 };
		step = 100;
	};
//     class Test: para_OptionCheckbox {
//         name = "Test option 1";
//         tooltip = "This is the test option 1";
//         variable = "para_test1";
//     };
//     class Test2: para_OptionSlider {
//         name = "Test option 2";
//         tooltip = "This is the test option 2";
//         variable = "para_test2";
//     };
//     class Test3: para_OptionCombobox {
//         name = "Test option 3";
//         tooltip = "This is the test option 3";
//         variable = "para_test3";
//     };
};