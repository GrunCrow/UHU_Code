        ��  ��                        �� ��e     0 
        #version 400

in vec3 VertexPosition;

uniform float posX;
uniform float posY;
uniform float size;

void main()
{
  gl_Position = vec4( size*VertexPosition.x + posX
                    , size*VertexPosition.y + posY
                    , VertexPosition.z, 1.0);
}_       �� ��f     0 
        #version 400

out vec4 FragColor;

void main()
{
  FragColor = vec4(1.0,0.0,0.0,1.0);
}  