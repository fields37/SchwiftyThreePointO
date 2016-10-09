// Upgrade NOTE: replaced '_Object2World' with 'unity_ObjectToWorld'

// Shader created with Shader Forge v1.28 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.28;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,lico:1,lgpr:1,limd:1,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,rpth:0,vtps:0,hqsc:False,nrmq:0,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:0,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:False,qofs:0,qpre:1,rntp:1,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False;n:type:ShaderForge.SFN_Final,id:4013,x:32969,y:32713,varname:node_4013,prsc:2|diff-1304-RGB,spec-4308-OUT,voffset-7577-OUT;n:type:ShaderForge.SFN_Color,id:1304,x:32567,y:32630,ptovrint:False,ptlb:Color,ptin:_Color,varname:node_1304,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0,c2:0,c3:0,c4:1;n:type:ShaderForge.SFN_Tex2d,id:4895,x:32376,y:32969,ptovrint:False,ptlb:node_4895,ptin:_node_4895,varname:node_4895,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:825d72bf0d6704441a2bc4b6a676e79a,ntxv:0,isnm:False|UVIN-6337-UVOUT;n:type:ShaderForge.SFN_Vector1,id:4308,x:32792,y:32755,varname:node_4308,prsc:2,v1:1;n:type:ShaderForge.SFN_Tex2d,id:4213,x:32376,y:33165,ptovrint:False,ptlb:node_4213,ptin:_node_4213,varname:node_4213,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:86aea3bdf2f2c52458c950c378b74d6a,ntxv:0,isnm:False|UVIN-8935-UVOUT;n:type:ShaderForge.SFN_Rotator,id:8935,x:32109,y:33028,varname:node_8935,prsc:2|UVIN-6956-UVOUT;n:type:ShaderForge.SFN_TexCoord,id:6956,x:31839,y:32948,varname:node_6956,prsc:2,uv:0;n:type:ShaderForge.SFN_Dot,id:2099,x:32580,y:33090,varname:node_2099,prsc:2,dt:3|A-4895-RGB,B-4213-RGB;n:type:ShaderForge.SFN_Panner,id:6337,x:32109,y:32881,varname:node_6337,prsc:2,spu:0.1,spv:0.3|UVIN-6956-UVOUT;n:type:ShaderForge.SFN_Divide,id:7577,x:32777,y:33117,varname:node_7577,prsc:2|A-2099-OUT,B-523-OUT;n:type:ShaderForge.SFN_Vector1,id:523,x:32564,y:33280,varname:node_523,prsc:2,v1:2;proporder:1304-4895-4213;pass:END;sub:END;*/

Shader "Shader Forge/Antimatter" {
    Properties {
        _Color ("Color", Color) = (0,0,0,1)
        _node_4895 ("node_4895", 2D) = "white" {}
        _node_4213 ("node_4213", 2D) = "white" {}
    }
    SubShader {
        Tags {
            "RenderType"="Opaque"
        }
        Pass {
            Name "FORWARD"
            Tags {
                "LightMode"="ForwardBase"
            }
            
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_FORWARDBASE
            #include "UnityCG.cginc"
            #include "AutoLight.cginc"
            #pragma multi_compile_fwdbase_fullshadows
            #pragma multi_compile_fog
            #pragma exclude_renderers gles3 metal d3d11_9x xbox360 xboxone ps3 ps4 psp2 
            #pragma target 3.0
            #pragma glsl
            uniform float4 _LightColor0;
            uniform float4 _TimeEditor;
            uniform float4 _Color;
            uniform sampler2D _node_4895; uniform float4 _node_4895_ST;
            uniform sampler2D _node_4213; uniform float4 _node_4213_ST;
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float2 texcoord0 : TEXCOORD0;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                float4 posWorld : TEXCOORD1;
                float3 normalDir : TEXCOORD2;
                LIGHTING_COORDS(3,4)
                UNITY_FOG_COORDS(5)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                float4 node_6411 = _Time + _TimeEditor;
                float2 node_6337 = (o.uv0+node_6411.g*float2(0.1,0.3));
                float4 _node_4895_var = tex2Dlod(_node_4895,float4(TRANSFORM_TEX(node_6337, _node_4895),0.0,0));
                float node_8935_ang = node_6411.g;
                float node_8935_spd = 1.0;
                float node_8935_cos = cos(node_8935_spd*node_8935_ang);
                float node_8935_sin = sin(node_8935_spd*node_8935_ang);
                float2 node_8935_piv = float2(0.5,0.5);
                float2 node_8935 = (mul(o.uv0-node_8935_piv,float2x2( node_8935_cos, -node_8935_sin, node_8935_sin, node_8935_cos))+node_8935_piv);
                float4 _node_4213_var = tex2Dlod(_node_4213,float4(TRANSFORM_TEX(node_8935, _node_4213),0.0,0));
                float node_7577 = (abs(dot(_node_4895_var.rgb,_node_4213_var.rgb))/2.0);
                v.vertex.xyz += float3(node_7577,node_7577,node_7577);
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                float3 lightColor = _LightColor0.rgb;
                o.pos = mul(UNITY_MATRIX_MVP, v.vertex );
                UNITY_TRANSFER_FOG(o,o.pos);
                TRANSFER_VERTEX_TO_FRAGMENT(o)
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
                float3 normalDirection = i.normalDir;
                float3 lightDirection = normalize(_WorldSpaceLightPos0.xyz);
                float3 lightColor = _LightColor0.rgb;
                float3 halfDirection = normalize(viewDirection+lightDirection);
////// Lighting:
                float attenuation = LIGHT_ATTENUATION(i);
                float3 attenColor = attenuation * _LightColor0.xyz;
///////// Gloss:
                float gloss = 0.5;
                float specPow = exp2( gloss * 10.0+1.0);
////// Specular:
                float NdotL = max(0, dot( normalDirection, lightDirection ));
                float node_4308 = 1.0;
                float3 specularColor = float3(node_4308,node_4308,node_4308);
                float3 directSpecular = (floor(attenuation) * _LightColor0.xyz) * pow(max(0,dot(halfDirection,normalDirection)),specPow)*specularColor;
                float3 specular = directSpecular;
/////// Diffuse:
                NdotL = max(0.0,dot( normalDirection, lightDirection ));
                float3 directDiffuse = max( 0.0, NdotL) * attenColor;
                float3 indirectDiffuse = float3(0,0,0);
                indirectDiffuse += UNITY_LIGHTMODEL_AMBIENT.rgb; // Ambient Light
                float3 diffuseColor = _Color.rgb;
                float3 diffuse = (directDiffuse + indirectDiffuse) * diffuseColor;
/// Final Color:
                float3 finalColor = diffuse + specular;
                fixed4 finalRGBA = fixed4(finalColor,1);
                UNITY_APPLY_FOG(i.fogCoord, finalRGBA);
                return finalRGBA;
            }
            ENDCG
        }
        Pass {
            Name "FORWARD_DELTA"
            Tags {
                "LightMode"="ForwardAdd"
            }
            Blend One One
            
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_FORWARDADD
            #include "UnityCG.cginc"
            #include "AutoLight.cginc"
            #pragma multi_compile_fwdadd_fullshadows
            #pragma multi_compile_fog
            #pragma exclude_renderers gles3 metal d3d11_9x xbox360 xboxone ps3 ps4 psp2 
            #pragma target 3.0
            #pragma glsl
            uniform float4 _LightColor0;
            uniform float4 _TimeEditor;
            uniform float4 _Color;
            uniform sampler2D _node_4895; uniform float4 _node_4895_ST;
            uniform sampler2D _node_4213; uniform float4 _node_4213_ST;
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float2 texcoord0 : TEXCOORD0;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                float4 posWorld : TEXCOORD1;
                float3 normalDir : TEXCOORD2;
                LIGHTING_COORDS(3,4)
                UNITY_FOG_COORDS(5)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                float4 node_8964 = _Time + _TimeEditor;
                float2 node_6337 = (o.uv0+node_8964.g*float2(0.1,0.3));
                float4 _node_4895_var = tex2Dlod(_node_4895,float4(TRANSFORM_TEX(node_6337, _node_4895),0.0,0));
                float node_8935_ang = node_8964.g;
                float node_8935_spd = 1.0;
                float node_8935_cos = cos(node_8935_spd*node_8935_ang);
                float node_8935_sin = sin(node_8935_spd*node_8935_ang);
                float2 node_8935_piv = float2(0.5,0.5);
                float2 node_8935 = (mul(o.uv0-node_8935_piv,float2x2( node_8935_cos, -node_8935_sin, node_8935_sin, node_8935_cos))+node_8935_piv);
                float4 _node_4213_var = tex2Dlod(_node_4213,float4(TRANSFORM_TEX(node_8935, _node_4213),0.0,0));
                float node_7577 = (abs(dot(_node_4895_var.rgb,_node_4213_var.rgb))/2.0);
                v.vertex.xyz += float3(node_7577,node_7577,node_7577);
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                float3 lightColor = _LightColor0.rgb;
                o.pos = mul(UNITY_MATRIX_MVP, v.vertex );
                UNITY_TRANSFER_FOG(o,o.pos);
                TRANSFER_VERTEX_TO_FRAGMENT(o)
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
                float3 normalDirection = i.normalDir;
                float3 lightDirection = normalize(lerp(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz - i.posWorld.xyz,_WorldSpaceLightPos0.w));
                float3 lightColor = _LightColor0.rgb;
                float3 halfDirection = normalize(viewDirection+lightDirection);
////// Lighting:
                float attenuation = LIGHT_ATTENUATION(i);
                float3 attenColor = attenuation * _LightColor0.xyz;
///////// Gloss:
                float gloss = 0.5;
                float specPow = exp2( gloss * 10.0+1.0);
////// Specular:
                float NdotL = max(0, dot( normalDirection, lightDirection ));
                float node_4308 = 1.0;
                float3 specularColor = float3(node_4308,node_4308,node_4308);
                float3 directSpecular = attenColor * pow(max(0,dot(halfDirection,normalDirection)),specPow)*specularColor;
                float3 specular = directSpecular;
/////// Diffuse:
                NdotL = max(0.0,dot( normalDirection, lightDirection ));
                float3 directDiffuse = max( 0.0, NdotL) * attenColor;
                float3 diffuseColor = _Color.rgb;
                float3 diffuse = directDiffuse * diffuseColor;
/// Final Color:
                float3 finalColor = diffuse + specular;
                fixed4 finalRGBA = fixed4(finalColor * 1,0);
                UNITY_APPLY_FOG(i.fogCoord, finalRGBA);
                return finalRGBA;
            }
            ENDCG
        }
        Pass {
            Name "ShadowCaster"
            Tags {
                "LightMode"="ShadowCaster"
            }
            Offset 1, 1
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_SHADOWCASTER
            #include "UnityCG.cginc"
            #include "Lighting.cginc"
            #pragma fragmentoption ARB_precision_hint_fastest
            #pragma multi_compile_shadowcaster
            #pragma multi_compile_fog
            #pragma exclude_renderers gles3 metal d3d11_9x xbox360 xboxone ps3 ps4 psp2 
            #pragma target 3.0
            #pragma glsl
            uniform float4 _TimeEditor;
            uniform sampler2D _node_4895; uniform float4 _node_4895_ST;
            uniform sampler2D _node_4213; uniform float4 _node_4213_ST;
            struct VertexInput {
                float4 vertex : POSITION;
                float2 texcoord0 : TEXCOORD0;
            };
            struct VertexOutput {
                V2F_SHADOW_CASTER;
                float2 uv0 : TEXCOORD1;
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                float4 node_1892 = _Time + _TimeEditor;
                float2 node_6337 = (o.uv0+node_1892.g*float2(0.1,0.3));
                float4 _node_4895_var = tex2Dlod(_node_4895,float4(TRANSFORM_TEX(node_6337, _node_4895),0.0,0));
                float node_8935_ang = node_1892.g;
                float node_8935_spd = 1.0;
                float node_8935_cos = cos(node_8935_spd*node_8935_ang);
                float node_8935_sin = sin(node_8935_spd*node_8935_ang);
                float2 node_8935_piv = float2(0.5,0.5);
                float2 node_8935 = (mul(o.uv0-node_8935_piv,float2x2( node_8935_cos, -node_8935_sin, node_8935_sin, node_8935_cos))+node_8935_piv);
                float4 _node_4213_var = tex2Dlod(_node_4213,float4(TRANSFORM_TEX(node_8935, _node_4213),0.0,0));
                float node_7577 = (abs(dot(_node_4895_var.rgb,_node_4213_var.rgb))/2.0);
                v.vertex.xyz += float3(node_7577,node_7577,node_7577);
                o.pos = mul(UNITY_MATRIX_MVP, v.vertex );
                TRANSFER_SHADOW_CASTER(o)
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                SHADOW_CASTER_FRAGMENT(i)
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
