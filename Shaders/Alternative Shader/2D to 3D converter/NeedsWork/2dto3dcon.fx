uniform int Depth <
	ui_type = "drag";
	ui_min = 0; ui_max = 30;
	ui_label = "Depth Slider";
	ui_tooltip = "Determines the amount of Image Warping and Separation between both eyes.";
> = 10;

uniform int Perspective <
	ui_type = "drag";
	ui_min = -100; ui_max = 100;
	ui_label = "Perspective Slider";
	ui_tooltip = "Determines the perspective point.";
> = 0;

uniform float blur <
	ui_type = "drag";
	ui_min = 1; ui_max = 25;
	ui_label = "Blur Slider";
	ui_tooltip = "Determines the blur seperation of Depth Map Blur.";
> = 7.5;

uniform bool DepthMap <
	ui_label = "Depth Map View";
	ui_tooltip = "Display the Depth Map. Use This to Work on your Own Depth Map for your game.";
> = false;

uniform float Far <
	ui_type = "drag";
	ui_min = 0; ui_max = 5;
	ui_label = "Far";
	ui_tooltip = "Far Depth Map Adjustment.";
> = 1.5;
 
 uniform float Near <
	ui_type = "drag";
	ui_min = 0; ui_max = 5;
	ui_label = "Near";
	ui_tooltip = "Near Depth Map Adjustment.";
> = 1;

uniform int BD <
	ui_type = "combo";
	ui_items = "Off\0Polynomial Distortion\0";
	ui_label = "Barrel Distortion";
	ui_tooltip = "Barrel Distortion for HMD type Displays.";
> = 0;

uniform float Hsquish <
	ui_type = "drag";
	ui_min = 0.5; ui_max = 2;
	ui_label = "Horizontal Squish";
	ui_tooltip = "Horizontal squish cubic distortion value. Default is 1.0.";
> = 1.00;

uniform float Vsquish <
	ui_type = "drag";
	ui_min = 0.5; ui_max = 2;
	ui_label = "Vertical Squish";
	ui_tooltip = "Vertical squish cubic distortion value. Default is 1.0.";
> = 1.0;

uniform int sstbli <
	ui_type = "combo";
	ui_items = "Side by Side\0Top and Bottom\0Line Interlaced\0Checkerboard 3D\0";
	ui_label = "3D Display Mode";
	ui_tooltip = "Side by Side/Top and Bottom/Line Interlaced displays output.";
> = 0;

uniform float Red <
	ui_type = "drag";
	ui_min = 0; ui_max = 1;
	ui_label = "Red Distortion";
	ui_tooltip = "Adjust the Polynomial Distortion Red. Default is 1.0";
> = 2.0;

uniform float Green <
	ui_type = "drag";
	ui_min = 0; ui_max = 1;
	ui_label = "Green Distortion";
	ui_tooltip = "Adjust the Polynomial Distortion Green. Default is 1.0";
> = 1.0;

uniform float Blue <
	ui_type = "drag";
	ui_min = 0; ui_max = 1;
	ui_label = "Blue Distortion";
	ui_tooltip = "Adjust the Polynomial Distortion Blue. Default is 1.0";
> = 1.0;

uniform bool LRRL <
	ui_label = "Eye Swap";
	ui_tooltip = "Left right image change.";
> = false;

/////////////////////////////////////////////D3D Starts Here/////////////////////////////////////////////////////////////////

#define pix float2(BUFFER_RCP_WIDTH, BUFFER_RCP_HEIGHT)

	
texture texCL  { Width = BUFFER_WIDTH; Height = BUFFER_HEIGHT; Format = RGBA32F;}; 
texture texCR  { Width = BUFFER_WIDTH; Height = BUFFER_HEIGHT; Format = RGBA32F;}; 
texture texCC  { Width = BUFFER_WIDTH/2; Height = BUFFER_HEIGHT; Format = RGBA32F;}; 
texture texCCC  { Width = BUFFER_WIDTH/2; Height = BUFFER_HEIGHT; Format = RGBA32F;}; 
texture texCCL  { Width = BUFFER_WIDTH/2; Height = BUFFER_HEIGHT; Format = RGBA32F;}; 
texture texCCM  { Width = BUFFER_WIDTH/2; Height = BUFFER_HEIGHT; Format = RGBA32F;}; 
texture texCCMM  { Width = BUFFER_WIDTH/2; Height = BUFFER_HEIGHT; Format = RGBA32F;}; 
texture texCCMMM  { Width = BUFFER_WIDTH/2; Height = BUFFER_HEIGHT; Format = RGBA32F;}; 
texture texCCS  { Width = BUFFER_WIDTH/2; Height = BUFFER_HEIGHT; Format = RGBA32F;}; 
texture texCDM  { Width = BUFFER_WIDTH/2; Height = BUFFER_HEIGHT; Format = RGBA32F;};

texture PseudoDofTexS < source = "Sgrad.png"; > { Width = 1024; Height = 1024; MipLevels = 1; Format = RGBA8; };
sampler PseudoDofSamplerS { Texture = PseudoDofTexS; };

texture PseudoDofTexC < source = "Cgrad.png"; > { Width = 1024; Height = 1024; MipLevels = 1; Format = RGBA8; };
sampler PseudoDofSamplerC { Texture = PseudoDofTexC; };


texture BackBufferTex : COLOR;

sampler BackBuffer 
	{ 
		Texture = BackBufferTex; 
	};

sampler SamplerCL
	{
		Texture = texCL;
		AddressU = BORDER;
		AddressV = BORDER;
		AddressW = BORDER;
		MipFilter = Linear; 
		MinFilter = Linear; 
		MagFilter = Linear;
	};
	
sampler SamplerCR
	{
		Texture = texCR;
		AddressU = BORDER;
		AddressV = BORDER;
		AddressW = BORDER;
		MipFilter = Linear; 
		MinFilter = Linear; 
		MagFilter = Linear;
	};
	
sampler SamplerCC
	{
		Texture = texCC;
		AddressU = BORDER;
		AddressV = BORDER;
		AddressW = BORDER;
		AddressU = CLAMP;
		AddressV = CLAMP;
		AddressW = CLAMP;
	};
	
sampler SamplerCCC
	{
		Texture = texCCC;
		AddressU = BORDER;
		AddressV = BORDER;
		AddressW = BORDER;
		AddressU = CLAMP;
		AddressV = CLAMP;
		AddressW = CLAMP;
	};
	
sampler SamplerCCL
	{
		Texture = texCCL;
		AddressU = BORDER;
		AddressV = BORDER;
		AddressW = BORDER;
		AddressU = CLAMP;
		AddressV = CLAMP;
		AddressW = CLAMP;
	};
	
sampler SamplerCCM
	{
		Texture = texCCM;
		AddressU = BORDER;
		AddressV = BORDER;
		AddressW = BORDER;
		AddressU = CLAMP;
		AddressV = CLAMP;
		AddressW = CLAMP;
	};
	
	sampler SamplerCCMM
	{
		Texture = texCCMM;
		AddressU = BORDER;
		AddressV = BORDER;
		AddressW = BORDER;
		AddressU = CLAMP;
		AddressV = CLAMP;
		AddressW = CLAMP;
	};

	
	sampler SamplerCCMMM
	{
		Texture = texCCMMM;
		AddressU = BORDER;
		AddressV = BORDER;
		AddressW = BORDER;
		AddressU = CLAMP;
		AddressV = CLAMP;
		AddressW = CLAMP;
	};
	
sampler SamplerCCS
	{
		Texture = texCCS;
		AddressU = BORDER;
		AddressV = BORDER;
		AddressW = BORDER;
		AddressU = CLAMP;
		AddressV = CLAMP;
		AddressW = CLAMP;
	};
	
	
sampler SamplerCDM
	{
		Texture = texCDM;
		MinFilter = LINEAR;
		MagFilter = LINEAR;
		MipFilter = LINEAR;
		AddressU = CLAMP;
		AddressV = CLAMP;
		AddressW = CLAMP;
	};

float3 RGBtoHSV(float2 RGB)
{
    float3 HCV = tex2D(BackBuffer,RGB).rgb;
    float S = HCV.y / (HCV.z + 0);
    float3 gray_scale = float3(HCV.x, S, HCV.z);	
	return dot(gray_scale, float3(0.3, 0.59, 0.11));//Gray-scale conversion.
}

float3 RGBtoHSVTWO(float2 RGB)
{
    float3 HCV = tex2D(BackBuffer,RGB).rgb;
    float S = HCV.y / (HCV.z + 0.025);
    float3 gray_scale = float3(HCV.x, S, HCV.z);	
	return dot(gray_scale, float3(0.3, 0.59, 0.11));//Gray-scale conversion.
}




#define s2(a, b)				temp = a; a = min(a, b); b = max(temp, b);
#define mn3(a, b, c)			s2(a, b); s2(a, c);
#define mx3(a, b, c)			s2(b, c); s2(a, c);

#define mnmx3(a, b, c)			mx3(a, b, c); s2(a, b);                                   // 3 exchanges
#define mnmx4(a, b, c, d)		s2(a, b); s2(c, d); s2(a, c); s2(b, d);                   // 4 exchanges
#define mnmx5(a, b, c, d, e)	s2(a, b); s2(c, d); mn3(a, c, e); mx3(b, d, e);           // 6 exchanges
#define mnmx6(a, b, c, d, e, f) s2(a, d); s2(b, e); s2(c, f); mn3(a, b, c); mx3(d, e, f); // 7 exchanges

float4 Median(float2 texcoord : TEXCOORD0) : SV_Target
{

float4 color;

  float v[6];

  v[0] = RGBtoHSV(texcoord.xy + float2(-1.0, -1.0) * 2.5 * pix);
  v[1] = RGBtoHSV(texcoord.xy + float2( 0.0, -1.0) * 2.5 * pix);
  v[2] = RGBtoHSV(texcoord.xy + float2(+1.0, -1.0) * 2.5 * pix);
  v[3] = RGBtoHSV(texcoord.xy + float2(-1.0,  0.0) * 2.5 * pix);
  v[4] = RGBtoHSV(texcoord.xy + float2( 0.0,  0.0) * 2.5 * pix);
  v[5] = RGBtoHSV(texcoord.xy + float2(+1.0,  0.0) * 2.5 * pix);

  float temp;
  mnmx6(v[0], v[1], v[2], v[3], v[4], v[5]);

  v[5] = RGBtoHSV(texcoord.xy + float2(-1.0, +1.0) * 2.5 * pix);

  mnmx5(v[1], v[2], v[3], v[4], v[5]);

  v[5] = RGBtoHSV(texcoord.xy + float2( 0.0, +1.0) * 2.5 * pix);

  mnmx4(v[2], v[3], v[4], v[5]);

  v[5] = RGBtoHSV(texcoord.xy + float2(+1.0, +1.0) * 2.5 * pix);

  mnmx3(v[3], v[4], v[5]);
  color = v[4];
  
  return color;

}

float4 Laplace(float2 texcoord : TEXCOORD0) : SV_Target
{  
  
const float samples[4] = {  
0, -1,  
-1, 0  
};

const float samplesS[4] = {  
1, 0,  
0, 1  
};

float4 laplace = -4 * tex2D(SamplerCDM, texcoord);  
  
// Sample the neighbor pixels  
for (int i = 0; i < 4; i++){  
laplace += tex2D(SamplerCDM, texcoord + 0.0031 * float2(samples[i],samplesS[i]));  
}  
  
return (0.5 + 1.0 * laplace);  
}  


float4 MedianTwo(float2 texcoord : TEXCOORD0) : SV_Target
{

float4 color;

  float v[6];

  v[0] = tex2D(SamplerCCL,texcoord.xy + float2(-1.0, -1.0) * 2.5 * pix);
  v[1] = tex2D(SamplerCCL,texcoord.xy + float2( 0.0, -1.0) * 2.5 * pix);
  v[2] = tex2D(SamplerCCL,texcoord.xy + float2(+1.0, -1.0) * 2.5 * pix);
  v[3] = tex2D(SamplerCCL,texcoord.xy + float2(-1.0,  0.0) * 2.5 * pix);
  v[4] = tex2D(SamplerCCL,texcoord.xy + float2( 0.0,  0.0) * 2.5 * pix);
  v[5] = tex2D(SamplerCCL,texcoord.xy + float2(+1.0,  0.0) * 2.5 * pix);

  float temp;
  mnmx6(v[0], v[1], v[2], v[3], v[4], v[5]);

  v[5] = tex2D(SamplerCCL,texcoord.xy + float2(-1.0, +1.0) * 2.5 * pix);

  mnmx5(v[1], v[2], v[3], v[4], v[5]);

  v[5] = tex2D(SamplerCCL,texcoord.xy + float2( 0.0, +1.0) * 2.5 * pix);

  mnmx4(v[2], v[3], v[4], v[5]);

  v[5] = tex2D(SamplerCCL,texcoord.xy + float2(+1.0, +1.0) * 2.5 * pix);

  mnmx3(v[3], v[4], v[5]);
  color = v[4];
  
  return color;

}

float4 MedianThree(float2 texcoord : TEXCOORD0) : SV_Target
{

float4 color;

  float v[6];

  v[0] = RGBtoHSVTWO(texcoord.xy + float2(-1.0, -1.0) * 5 * pix);
  v[1] = RGBtoHSVTWO(texcoord.xy + float2( 0.0, -1.0) * 5 * pix);
  v[2] = RGBtoHSVTWO(texcoord.xy + float2(+1.0, -1.0) * 5 * pix);
  v[3] = RGBtoHSVTWO(texcoord.xy + float2(-1.0,  0.0) * 5 * pix);
  v[4] = RGBtoHSVTWO(texcoord.xy + float2( 0.0,  0.0) * 5 * pix);
  v[5] = RGBtoHSVTWO(texcoord.xy + float2(+1.0,  0.0) * 5 * pix);

  float temp;
  mnmx6(v[0], v[1], v[2], v[3], v[4], v[5]);

  v[5] = RGBtoHSVTWO(texcoord.xy + float2(-1.0, +1.0) * 5 * pix);

  mnmx5(v[1], v[2], v[3], v[4], v[5]);

  v[5] = RGBtoHSVTWO(texcoord.xy + float2( 0.0, +1.0) * 5 * pix);

  mnmx4(v[2], v[3], v[4], v[5]);

  v[5] = RGBtoHSVTWO(texcoord.xy + float2(+1.0, +1.0) * 5 * pix);

  mnmx3(v[3], v[4], v[5]);
  color = v[4];
  
  return color;

}

float4 MedianFour(float2 texcoord : TEXCOORD0) : SV_Target
{

float4 color;

  float v[6];

  v[0] = tex2D(SamplerCCM,texcoord.xy + float2(-1.0, -1.0) * 5 * pix);
  v[1] = tex2D(SamplerCCM,texcoord.xy + float2( 0.0, -1.0) * 5 * pix);
  v[2] = tex2D(SamplerCCM,texcoord.xy + float2(+1.0, -1.0) * 5 * pix);
  v[3] = tex2D(SamplerCCM,texcoord.xy + float2(-1.0,  0.0) * 5 * pix);
  v[4] = tex2D(SamplerCCM,texcoord.xy + float2( 0.0,  0.0) * 5 * pix);
  v[5] = tex2D(SamplerCCM,texcoord.xy + float2(+1.0,  0.0) * 5 * pix);

  float temp;
  mnmx6(v[0], v[1], v[2], v[3], v[4], v[5]);

  v[5] = tex2D(SamplerCCM,texcoord.xy + float2(-1.0, +1.0) * 5 * pix);

  mnmx5(v[1], v[2], v[3], v[4], v[5]);

  v[5] = tex2D(SamplerCCM,texcoord.xy + float2( 0.0, +1.0) * 5 * pix);

  mnmx4(v[2], v[3], v[4], v[5]);

  v[5] = tex2D(SamplerCCM,texcoord.xy + float2(+1.0, +1.0) * 5 * pix);

  mnmx3(v[3], v[4], v[5]);
  color = v[4];
  
  return color;

}

float4 MedianFive(float2 texcoord : TEXCOORD0) : SV_Target
{

float4 color;

  float v[6];

  v[0] = tex2D(SamplerCCMM,texcoord.xy + float2(-1.0, -1.0) * 5 * pix);
  v[1] = tex2D(SamplerCCMM,texcoord.xy + float2( 0.0, -1.0) * 5 * pix);
  v[2] = tex2D(SamplerCCMM,texcoord.xy + float2(+1.0, -1.0) * 5 * pix);
  v[3] = tex2D(SamplerCCMM,texcoord.xy + float2(-1.0,  0.0) * 5 * pix);
  v[4] = tex2D(SamplerCCMM,texcoord.xy + float2( 0.0,  0.0) * 5 * pix);
  v[5] = tex2D(SamplerCCMM,texcoord.xy + float2(+1.0,  0.0) * 5 * pix);

  float temp;
  mnmx6(v[0], v[1], v[2], v[3], v[4], v[5]);

  v[5] = tex2D(SamplerCCMM,texcoord.xy + float2(-1.0, +1.0) * 5 * pix);

  mnmx5(v[1], v[2], v[3], v[4], v[5]);

  v[5] = tex2D(SamplerCCMM,texcoord.xy + float2( 0.0, +1.0) * 5 * pix);

  mnmx4(v[2], v[3], v[4], v[5]);

  v[5] = tex2D(SamplerCCMM,texcoord.xy + float2(+1.0, +1.0) * 5 * pix);

  mnmx3(v[3], v[4], v[5]);
  color = v[4];
  
  return color;

}

float4 MedianSix(float2 texcoord : TEXCOORD0) : SV_Target
{

float4 color;

  float v[6];

  v[0] = tex2D(SamplerCCMMM,texcoord.xy + float2(-1.0, -1.0) * 5 * pix);
  v[1] = tex2D(SamplerCCMMM,texcoord.xy + float2( 0.0, -1.0) * 5 * pix);
  v[2] = tex2D(SamplerCCMMM,texcoord.xy + float2(+1.0, -1.0) * 5 * pix);
  v[3] = tex2D(SamplerCCMMM,texcoord.xy + float2(-1.0,  0.0) * 5 * pix);
  v[4] = tex2D(SamplerCCMMM,texcoord.xy + float2( 0.0,  0.0) * 5 * pix);
  v[5] = tex2D(SamplerCCMMM,texcoord.xy + float2(+1.0,  0.0) * 5 * pix);

  float temp;
  mnmx6(v[0], v[1], v[2], v[3], v[4], v[5]);

  v[5] = tex2D(SamplerCCMMM,texcoord.xy + float2(-1.0, +1.0) * 5 * pix);

  mnmx5(v[1], v[2], v[3], v[4], v[5]);

  v[5] = tex2D(SamplerCCMMM,texcoord.xy + float2( 0.0, +1.0) * 5 * pix);

  mnmx4(v[2], v[3], v[4], v[5]);

  v[5] = tex2D(SamplerCCMMM,texcoord.xy + float2(+1.0, +1.0) * 5 * pix);

  mnmx3(v[3], v[4], v[5]);
  color = v[4];
  
  return color;

}

float4 comb(float2 texcoord : TEXCOORD0) : SV_Target
{  
return (lerp(1 - (tex2D(SamplerCCL,texcoord).r) , tex2D(PseudoDofSamplerC,texcoord).r,0.975) / ((MedianSix(texcoord).r*1.25)));

//tex2D(PseudoDofSamplerS,float2(texcoord.x-uv.x*pix.x, texcoord.y)).r
}

////////////////////////////////////////////////Left/Right Eye////////////////////////////////////////////////////////
void PS_renderLR(in float2 texcoord : TEXCOORD0, out float3 color : SV_Target0 , out float3 colorT: SV_Target1)
{	
	const float samples[10] = {0.5, 0.66, 1, 0.25, 0.60, 0.75, 0.1, 0.42, 2, 1.25};
	float DepthL = 1.0, DepthR = 1.0;
	float2 uv = 0;
	[loop]
	for (int j = 0; j <= 9; ++j) 
	{	
			uv.x = samples[j] * Depth;
			DepthL=  min(DepthL,comb(float2(texcoord.x+uv.x*pix.x, texcoord.y)) );
			DepthR=  min(DepthR,comb(float2(texcoord.x-uv.x*pix.x, texcoord.y)) );
		if(!LRRL)
		{
			//color.rgb = DepthL;
			
			color.rgb = tex2D(BackBuffer , float2(texcoord.xy+float2(DepthL*Depth,0)*pix.xy)).rgb;
		
			colorT.rgb = tex2D(BackBuffer , float2(texcoord.xy-float2(DepthR*Depth,0)*pix.xy)).rgb;
		}
		else
		{		
			colorT.rgb = tex2D(BackBuffer , float2(texcoord.xy+float2(DepthL*Depth,0)*pix.xy)).rgb;
		
			color.rgb = tex2D(BackBuffer , float2(texcoord.xy-float2(DepthR*Depth,0)*pix.xy)).rgb;
		}
	}
}

////////////////////////////////////////////////////Polynomial_Distortion/////////////////////////////////////////////////////

float2 PD(float2 p, float k1)

{

	
	float r2 = (p.x-0.5) * (p.x-0.5) + (p.y-0.5) * (p.y-0.5);       
	float newRadius = 0.0;

	newRadius = (1 + k1*r2);

	 p.x = newRadius * (p.x-0.5)+0.5;
	 p.y = newRadius * (p.y-0.5)+0.5;
	
	return p;
}

float4 PDL(float2 texcoord)

{		
		float4 color;
		float2 uv_red, uv_green, uv_blue;
		float4 color_red, color_green, color_blue;
		float2 sectorOrigin;

    // Radial distort around center
		sectorOrigin = (texcoord.xy-0.5,0,0);

		uv_red = PD(texcoord.xy-sectorOrigin,Red) + sectorOrigin;
		uv_green = PD(texcoord.xy-sectorOrigin,Green) + sectorOrigin;
		uv_blue = PD(texcoord.xy-sectorOrigin,Blue) + sectorOrigin;

		color_red = tex2D(SamplerCL, uv_red).r;
		color_green = tex2D(SamplerCL, uv_green).g;
		color_blue = tex2D(SamplerCL, uv_blue).b;


		if( ((uv_red.x > 0) && (uv_red.x < 1) && (uv_red.y > 0) && (uv_red.y < 1)))
		{
			color = float4(color_red.x, color_green.y, color_blue.z, 1.0);
		}
		else
		{
			color = float4(0,0,0,1);
		}
		return color;
		
	}
	
float4 PDR(float2 texcoord)

{		
		float4 color;
		float2 uv_red, uv_green, uv_blue;
		float4 color_red, color_green, color_blue;
		float2 sectorOrigin;

    // Radial distort around center
		sectorOrigin = (texcoord.xy-0.5,0,0);
		

		uv_red = PD(texcoord.xy-sectorOrigin,Red) + sectorOrigin;
		uv_green = PD(texcoord.xy-sectorOrigin,Green) + sectorOrigin;
		uv_blue = PD(texcoord.xy-sectorOrigin,Blue) + sectorOrigin;

		color_red = tex2D(SamplerCR, uv_red).r;
		color_green = tex2D(SamplerCR, uv_green).g;
		color_blue = tex2D(SamplerCR, uv_blue).b;


		if( ((uv_red.x > 0) && (uv_red.x < 1) && (uv_red.y > 0) && (uv_red.y < 1)))
		{
			color = float4(color_red.x, color_green.y, color_blue.z, 1.0);
		}
		else
		{
			color = float4(0,0,0,1);
		}
		return color;
		
	}

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
void PS0(float4 position : SV_Position, float2 texcoord : TEXCOORD0, out float3 color : SV_Target)
{
	if(!DepthMap)
	{
	if(sstbli == 0)
	{
	float posH = Hsquish-1;
	float midH = posH*BUFFER_HEIGHT/2*pix.y;
	
	float posV = Vsquish-1;
	float midV = posV*BUFFER_WIDTH/2*pix.x;
	
		if(BD == 0)
		{
		color = texcoord.x < 0.5 ? tex2D(SamplerCL,float2(texcoord.x*2 + Perspective * pix.x,texcoord.y)).rgb : tex2D(SamplerCR,float2(texcoord.x*2-1 - Perspective * pix.x,texcoord.y)).rgb;
		}
		if(BD == 1)
		{
		color = texcoord.x < 0.5 ? PDL(float2(((texcoord.x*2)*Vsquish)-midV + Perspective * pix.x,(texcoord.y*Hsquish)-midH)).rgb : PDR(float2(((texcoord.x*2-1)*Vsquish)-midV - Perspective * pix.x,(texcoord.y*Hsquish)-midH)).rgb;
		}
	
	}
	if(sstbli == 1)
	{
	color = texcoord.y < 0.5 ? tex2D(SamplerCL,float2(texcoord.x + Perspective * pix.x,texcoord.y*2)).rgb : tex2D(SamplerCR,float2(texcoord.x - Perspective * pix.x,texcoord.y*2-1)).rgb;
	}
	if(sstbli == 2)
	{
		float gridL = frac(texcoord.y*(BUFFER_HEIGHT/2));
		if (gridL > 0.5)
		{ 
		color = tex2D(SamplerCL,float2(texcoord.x + Perspective * pix.x,texcoord.y)).rgb;
		}
		else
		{
		color = tex2D(SamplerCR,float2(texcoord.x - Perspective * pix.x,texcoord.y)).rgb;
		}
	}
	if(sstbli == 3)
	{
		float gridy = floor(texcoord.y*(BUFFER_HEIGHT));
		float gridx = floor(texcoord.x*(BUFFER_WIDTH));
		if ((int(gridy+gridx) & 1) == 0)
		{
		color = tex2D(SamplerCL,float2(texcoord.x + Perspective * pix.x,texcoord.y)).rgb;
		}
		else
		{
		color = tex2D(SamplerCR,float2(texcoord.x - Perspective * pix.x,texcoord.y)).rgb;
		}
	}
	}
	else
	{
	color = comb(texcoord.xy).rgb;
	}
}

///////////////////////////////////////////////////////////ReShade.fxh/////////////////////////////////////////////////////////////

// Vertex shader generating a triangle covering the entire screen
void PostProcessVS(in uint id : SV_VertexID, out float4 position : SV_Position, out float2 texcoord : TEXCOORD)
{
	texcoord.x = (id == 2) ? 2.0 : 0.0;
	texcoord.y = (id == 1) ? 2.0 : 0.0;
	position = float4(texcoord * float2(2.0, -2.0) + float2(-1.0, 1.0), 0.0, 1.0);
}

///////////////////////////////////////////////Depth Map View//////////////////////////////////////////////////////////////////////

//*Rendering passes*//
technique Super_2DTO3D
{
					pass
		{
			VertexShader = PostProcessVS;
			PixelShader = Median;
			RenderTarget = texCC;
		}
							pass
		{
			VertexShader = PostProcessVS;
			PixelShader = Laplace;
			RenderTarget = texCCL;
		}
			pass
		{
			VertexShader = PostProcessVS;
			PixelShader = MedianTwo;
			RenderTarget = texCCC;
		}
			pass
		{
			VertexShader = PostProcessVS;
			PixelShader = MedianThree;
			RenderTarget = texCCM;
		}
			pass
		{
			VertexShader = PostProcessVS;
			PixelShader = MedianFour;
			RenderTarget = texCCMM;
		}
			pass
		{
			VertexShader = PostProcessVS;
			PixelShader = MedianFive;
			RenderTarget = texCCMMM;
		}		
			pass
		{
			VertexShader = PostProcessVS;
			PixelShader = PS_renderLR;
			RenderTarget0 = texCL;
			RenderTarget1 = texCR;
		}
			pass
		{
			VertexShader = PostProcessVS;
			PixelShader = PS0;
			
		}
}