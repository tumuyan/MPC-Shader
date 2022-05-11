// $MinimumShaderProfile: ps_2_0
sampler s0 : register(s0);
float4 main(float2 tex : TEXCOORD0) : COLOR
{
	tex.x = tex.x * 5 % 1;
	tex.y = tex.y * 2 % 1;
	float4 c0 = tex2D(s0, tex);
	return c0;
}