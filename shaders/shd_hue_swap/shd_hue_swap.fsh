//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform float hueDelta;

precision mediump float;

// HSV/RGB conversion
// Source: http://lolengine.net/blog/2013/07/27/rgb-to-hsv-in-glsl
vec3 rgb2hsv(vec3 c)
{
    vec4 K = vec4(0.0, -1.0 / 3.0, 2.0 / 3.0, -1.0);
    vec4 p = mix(vec4(c.bg, K.wz), vec4(c.gb, K.xy), step(c.b, c.g));
    vec4 q = mix(vec4(p.xyw, c.r), vec4(c.r, p.yzx), step(p.x, c.r));

    float d = q.x - min(q.w, q.y);
    float e = 1.0e-10;
    return vec3(abs(q.z + (q.w - q.y) / (6.0 * d + e)), d / (q.x + e), q.x);
}

vec3 hsv2rgb(vec3 c)
{
    vec4 K = vec4(1.0, 2.0 / 3.0, 1.0 / 3.0, 3.0);
    vec3 p = abs(fract(c.xxx + K.xyz) * 6.0 - K.www);
    return c.z * mix(K.xxx, clamp(p - K.xxx, 0.0, 1.0), c.y);
}

void main()
{
	// Convert regular color to HSV
	vec4 preColor = v_vColour * texture2D(gm_BaseTexture, v_vTexcoord);
	vec3 hsvColor = rgb2hsv(preColor.xyz);
	
	// Change hue by hue delta
	float newHue = hsvColor.x + hueDelta;
	if (newHue > 1.0) {
		newHue -= 1.0;
	}
	
	vec3 newHsv = vec3(hueDelta, hsvColor.yz);
	vec4 newColor = vec4(hsv2rgb(newHsv), 1.0);
	
    gl_FragColor = newColor;
}
