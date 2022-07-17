sampler s0 : register(s0);
float4 p0 : register(c0);
float4 p1 : register(c1);

#define width (p0[0])
#define height (p0[1])
#define counter (p0[2])
#define clock (p0[3])
#define one_over_width (p1[0])
#define one_over_height (p1[1])

#define PI acos(-1)

#define amp 5

float4 main(float2 tex : TEXCOORD0) : COLOR {
  int pixelX = tex.x * width;
  int pixelY = tex.y * height;

  float offset = one_over_width * amp;

  float2 pa = float2(tex.x - offset, tex.y);
  float2 pb = float2(tex.x + offset, tex.y);

  float4 ca = tex2D(s0, pa);
  float4 cb = tex2D(s0, pb);

  float4 c0 = float4(ca[0], cb[1], cb[2], cb[3]);

  return c0;
}
