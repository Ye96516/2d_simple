shader_type canvas_item;

void fragment() {
	 // 获取当前像素的颜色
   vec4 color = texture(TEXTURE, UV);
	
	if (color.r >0.4){
		//color.rgb=vec3(0.5,0.5,0.5);
	}
	
	// 输出最终颜色
    COLOR = color;
}

//void light() {
	// Called for every pixel for every light affecting the CanvasItem.
	// Uncomment to replace the default light processing function with this one.
//}
