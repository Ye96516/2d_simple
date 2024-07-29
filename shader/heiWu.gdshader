shader_type canvas_item;

void fragment() {
    // 获取当前像素的颜色
    vec4 color = texture(TEXTURE, UV);

    // 如果像素的颜色r，则将透明度设为0,因为在这张图片中rgb的值相同
    if (color.r <= 0.3) {
        color.a = 0.0;
    }
	
    if (color.r >=0.8){
		color.rgb=vec3(0.933,0.969,0.949);
	}
    // 输出最终颜色
    COLOR = color;
}

