shader_type canvas_item;

void vertex() {
	if (VERTEX.g<0.0){
		VERTEX.x+=sin(TIME*0.5)*125.0;
	}
}

void fragment() {
	// Called for every pixel the material is visible on.
}

//void light() {
	// Called for every pixel for every light affecting the CanvasItem.
	// Uncomment to replace the default light processing function with this one.
//}
