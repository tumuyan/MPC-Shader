// $MinimumShaderProfile: ps_3_0

sampler s0 : register(s0);
float4 p0 :  register(c0);

#define width  (p0[0])
#define height (p0[1])
#define clock  (p0[3])

#define freq 2
#define amp_x 0.01
#define amp_y 0.03
#define remove_border true

float4 main(float2 tex : TEXCOORD0) : COLOR
{
	float4 c0 = 0;
	float p = clock * freq;
	float s = 1;
	if (amp_x <= amp_y) {
		s = 1 /(1-amp_y*2);
		tex.x += sin( p / 2) * amp_x;
		tex.y += sin( p) * amp_y;
	}else{
		s = 1 /(1-amp_x*2);
		tex.x += sin( p ) * amp_x;
		tex.y += sin( p / 2) * amp_y;
	}
	
	if (remove_border) {
		float a = 0.5-0.5/s;
		 tex.x = (tex.x - 0.5) / s + 0.5;
		 tex.y = (tex.y - 0.5) / s + 0.5;
	} 
	if (tex.x >= 0 && tex.x <= 1 && tex.y >= 0 && tex.y <= 1) {
		c0 = tex2D(s0, tex);
	}

	return c0;
}
