const parser = require("./feature-parser");

/*Using the generated parser is simple — just call its parse method and pass an input string as a parameter.
The method will return a parse result*/

const myFile = `@startsalt perfilInclude
{

    !include https://raw.githubusercontent.com/JoseCarlosDeJesus/PLANTUML-features/main/EstudoDeCasoFeature/definitivefeature.puml

    !$aparecer = 1
    !$desktop = 0

    $optional("BarraPesquisa",0,"","%chr(34) Pesquise Aqui %chr(34) |","",$aparecer)

    $alternative("menuDesktop",1,"{*","Produtos | <b>Meu Carrinho | Meu Perfil","}",$desktop,"menuNavbar","{*","<&menu> | <&cart> %newline() <&menu> | Produtos | Meu Carrinho | - | Meu Perfil","}",0)

    $mandatory("PerfilUsuario",0,"","Nome:Fulano de Tal %newline() Endereço: Gotham City","")
}
@endsalt`;

let generatedOutput = parser.parse(myFile);

console.log(generatedOutput);


