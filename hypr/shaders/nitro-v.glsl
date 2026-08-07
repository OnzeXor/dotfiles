#version 300 es
precision mediump float;

// No GLSL 3.00 es, usamos 'in' em vez de 'varying'
in vec2 v_texcoord;

// Precisamos declarar explicitamente a saída de cor
out vec4 fragColor;

uniform sampler2D tex;

void main() {
    // 'texture2D' virou apenas 'texture'
    vec4 texColor = texture(tex, v_texcoord);
    
    // Multiplicadores de Cor (R, G, B)
    // Altere aqui para calibrar a tela do seu Nitro V 15
    float r = 1.0; 
    float g = 0.8; 
    float b = 1; 

    // Definindo a saída final usando a variável declarada acima
    fragColor = vec4(texColor.r * r, texColor.g * g, texColor.b * b, texColor.a);
}
