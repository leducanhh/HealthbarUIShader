// Shader HealthBar_Alpha use for alpha gradient mask texture
Shader "CustomUI/HealthBar_Alpha"
{
	Properties
	{
		[HideInInspector]_MainTex ("Main Texture", 2D) = "white" {}
		_GradTex ("Gradient Texture", 2D) = "white" {}
		[HideInInspector]_Percent ("Percent", Range(0, 1)) = 1
	}
	SubShader
	{
		Blend SrcAlpha OneMinusSrcAlpha

		Pass
		{
			CGPROGRAM
			#pragma vertex vert
			#pragma fragment frag

			sampler2D _MainTex;
			sampler2D _GradTex;
			float _Percent;

			struct vertexInput
			{
				float4 vertex : POSITION;
				float4 color : COLOR;
				float2 texcoord : TEXCOORD0;	
			};

			struct vertexOutput
			{
				float4 pos : SV_POSITION;
				float4 color : COLOR;
				float2 texcoord : TEXCOORD0;
			};

			vertexOutput vert (vertexInput i)
			{
				vertexOutput o;
				UNITY_INITIALIZE_OUTPUT(vertexOutput, o);

				o.pos = UnityObjectToClipPos(i.vertex);
				o.texcoord = i.texcoord;

				return o;
			}

			fixed4 frag (vertexOutput i) : COLOR
			{
				fixed4 mainTex = tex2D(_MainTex, i.texcoord);
				fixed4 gradTex = tex2D(_GradTex, i.texcoord);

				if(_Percent != 1 && gradTex.a >= _Percent)
					mainTex.a = 0;

				return mainTex;
			}

			ENDCG
		}
	}
}
