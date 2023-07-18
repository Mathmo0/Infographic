#version 460

/*

TP1 du cours IMN401 a remettre le 20 fevrier 2023

    Remis par : 
        Ivan Serra Moncadas seri1101
        Mathis MOYSE moym1101
        Robin LEJEUNE lejr0501
*/

uniform vec3 couleur;

layout(location = 0) out vec4 Color; 

in vec2 color;

vec3 posToRGB( vec2 pos )
{
	float a = 0.5*atan(pos.y,pos.x)/3.14159;
	if (a < 0.0)
		a += 1.0 ;
	float l = length(pos);
	vec3 rgb = clamp( abs(mod(a*6.0+vec3(0.0,4.0,2.0), 6.0)-3.0)-1.0, 0.0, 1.0 );
	return mix( vec3(1.0), rgb, l);
}

void main()
{
	Color = vec4(posToRGB(color), 1.0);
}