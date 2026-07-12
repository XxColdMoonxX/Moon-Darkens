#version 150

#moj_import <minecraft:fog.glsl>
#moj_import <minecraft:dynamictransforms.glsl>

uniform sampler2D Sampler0;

in float sphericalVertexDistance;
in float cylindricalVertexDistance;
in vec4 vertexColor;
in vec2 texCoord0;

out vec4 fragColor;

void main() {
    vec4 color = texture(Sampler0, texCoord0).rrrr * vertexColor * ColorModulator;
    if (color.a < 0.1) {
        discard;
    }

    if (color.r > 0.2509 && color.r < 0.2511
        && color.g > 0.2509 && color.g < 0.2511
        && color.b > 0.2509 && color.b < 0.2511) {
        color = vec4(0.733, 0.733, 0.733, 1.0);
    }
    fragColor = apply_fog(color, sphericalVertexDistance, cylindricalVertexDistance, FogEnvironmentalStart, FogEnvironmentalEnd, FogRenderDistanceStart, FogRenderDistanceEnd, FogColor);
}
