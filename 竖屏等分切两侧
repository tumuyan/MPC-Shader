// $MinimumShaderProfile: ps_3_0
sampler s0 : register(s0);
float4 p0 :  register(c0);
float4 p1 :  register(c1);

#define split 3

#define width   (p0[0])
#define height  (p0[1])
#define counter (p0[2])
#define clock   (p0[3])
#define one_over_width  (p1[0])
#define one_over_height (p1[1])
#define PI acos(-1)
#define split_left (0.5-0.5/split)
#define split_right (0.5+0.5/split)

float4 main(float2 tex : TEXCOORD0) : COLOR
{
	if(split > 1 ){
		if(tex.x < split_left || tex.x > split_right)
			return float4(0,0,0,0);
		return tex2D(s0, tex);
	}
	return tex2D(s0, tex);
}
