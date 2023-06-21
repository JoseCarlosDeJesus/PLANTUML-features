# Propósito

Esse projeto tem o intuito de disponibilizar um método viável para representar um Diagrama de Features (Feature Diagram) de uma LPS (Linha de Produto de Software) no Wireframe Salt do PlantUML.Sendo assim, o foco é em representar interfaces gráficas de websites com o intuito de ajudar na prototipação e eventual implementação do código front-end utilizando os métodos de uma LPS. Dessa forma, cada widget do Salt é considerado uma feature, sendo possível atribuir as seguintes relações existentes em um Diagrama de Features: mandatória, opcional e alternativa e um diagrama UML. Assim, o principal objetivo é ser capaz de representar essas relações ao mesmo tempo que é possível visualizar o resultado graficamente por meio do Wireframe Salt.

Além disso, foi feito um Parser para "transformar" o diagrama UML do Salt para a estrutura de um projeto front-end em React utilizando a estrutura de projeto para a API ReactFeature (disponivel em: [Link]https://github.com/Kadurid/LojaVirtualLPS/tree/dev), servindo como um código prévio.

# How to Import e Utilize

Para importar as funções de relações de features inclua em seu diagrama Salt do PlantUML o arquivo disponível em [Link](https://raw.githubusercontent.com/JoseCarlosDeJesus/PLANTUML-features/main/EstudoDeCasoFeature/definitivefeature.puml) a partir de um dos comandos !include,!include_many ou !include_once possibilitados pelo PlantUML:

`
@startsalt howToImportExample
{
    !include https://raw.githubusercontent.com/JoseCarlosDeJesus/PLANTUML-features/main/EstudoDeCasoFeature/definitivefeature.puml

    'or use one of the below:

    !include_many https://raw.githubusercontent.com/JoseCarlosDeJesus/PLANTUML-features/main/EstudoDeCasoFeature/definitivefeature.puml

    !include_once https://raw.githubusercontent.com/JoseCarlosDeJesus/PLANTUML-features/main/EstudoDeCasoFeature/definitivefeature.puml

}
@endsalt
`

Uma vez feito isso, basta utilizar as funções normalmente em um diagrama UML do PlantUML com o $ seguido do nome da função. Exemplo:

`
@startsalt howToCallFunction
{
    !include https://raw.githubusercontent.com/JoseCarlosDeJesus/PLANTUML-features/main/EstudoDeCasoFeature/definitivefeature.puml

    $mandatory(0,[, This is my button,])
}
@endsalt
`

Note: se quiser utilizar outra função disponível em outro arquivo disponível nesse repositório basta fazer o mesmo processo, apenas certifique de copiar a URL da página raw do código (clicar no botão chamado Raw no lado direito) em questão para importá-lo. 


# Mandatory Function

Assim como em um Diagrama de Features, uma feature é mandatória se ela aparece em todas
