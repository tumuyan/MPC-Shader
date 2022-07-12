// $MinimumShaderProfile: ps_3_0
sampler s0 : register(s0);
float4 p0 :  register(c0);
float4 p1 :  register(c1);

#define screen_width	1920
#define screen_height	1080
#define split_v			1
#define black_border	false

#define width   (p0[0])
#define height  (p0[1])
#define counter (p0[2])
#define clock   (p0[3])
#define one_over_width  (p1[0])
#define one_over_height (p1[1])
#define PI acos(-1)

#define split (screen_width * height * split_v / screen_height / width)
#define one_over_split (1/split)
#define padding (split%1/2/split)
#define padding_ (one_over_split - padding )

float4 main(float2 tex : TEXCOORD0) : COLOR
{
	if(split > 1 || split_v > 1 ){
		float4 c0 =float4(0,0,0,0);
		if(black_border){
			if(tex.x >= padding && tex.x + padding <1)
				tex.x =( tex.x - padding) * split % 1;
			else
				return c0;
		} else {
			tex.x =( tex.x + padding_)  * split % 1;
		}
		
		tex.y = tex.y * split_v % 1;
		return tex2D(s0, tex);
	}
	return tex2D(s0, tex);
}

