/// @DnDAction : YoYo Games.Mouse & Keyboard.If_Key_Down
/// @DnDVersion : 1
/// @DnDHash : 596E5D75
var l596E5D75_0;l596E5D75_0 = keyboard_check(vk_space);if (l596E5D75_0){	/// @DnDAction : YoYo Games.Movement.Add_Motion
	/// @DnDVersion : 1
	/// @DnDHash : 04B2514B
	/// @DnDParent : 596E5D75
	/// @DnDArgument : "dir" "bbox_right"
	/// @DnDArgument : "speed" "10"
	motion_add(bbox_right, 10);}