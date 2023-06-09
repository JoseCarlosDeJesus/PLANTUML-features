# Purpose of this Project

This project aims to provide a viable method to represent a Model of Features (Feature Diagram) of an SPL (Software Product Line) in Wireframe Salt of PlantUML.
Therefore, the focus is on representing graphical interfaces of websites in order to help in the prototyping and eventual implementation of the front-end code using the methods of an SPL.
In this way, each Salt widget is considered a feature, being possible to assign the following existing relationships in a Feature Model: mandatory, optional and alternative and a UML diagram. Thus, the main objective is to be able to represent these relationships while being able to visualize the result graphically through Wireframe Salt.

In addition, a Parser was made to transform the Salt UML diagram to the structure of a front-end project in React using the project structure for the [API ReactFeature](https://github.com/Kadurid/LojaVirtualLPS /tree/dev), serving as a precode.

If you already have some prior knowledge of SPLs and the Feature Model, after reading how to import, skip ahead to the section on how to use the functions.

# How to Import e Utilize

To import the feature relationship functions, include in your PlantUML Salt diagram the file available at [definitiveFeature](https://raw.githubusercontent.com/JoseCarlosDeJesus/PLANTUML-features/main/EstudoDeCasoFeature/definitivefeature.puml) from one of the !include, !include_many or !include_once commands made possible by PlantUML:

```
@startsalt howToImportExample
{
    !include https://raw.githubusercontent.com/JoseCarlosDeJesus/PLANTUML-features/main/EstudoDeCasoFeature/definitivefeature.puml

    'or use one of the below:

    !include_many https://raw.githubusercontent.com/JoseCarlosDeJesus/PLANTUML-features/main/EstudoDeCasoFeature/definitivefeature.puml

    !include_once https://raw.githubusercontent.com/JoseCarlosDeJesus/PLANTUML-features/main/EstudoDeCasoFeature/definitivefeature.puml

}
@endsalt
```

Once that's done, just use the functions as normal in a PlantUML UML diagram with the $ followed by the name of the function. Example:

```
@startsalt howToCallFunction
{
    !include https://raw.githubusercontent.com/JoseCarlosDeJesus/PLANTUML-features/main/EstudoDeCasoFeature/definitivefeature.puml

    $mandatory(0,[, This is my button,])
}
@endsalt
```

Note: if you want to use another function available in another file available in this repository, just do the same process, just make sure to copy the URL of the Raw page of the code (click on the button called Raw on the right side) in question to import it.

# Summary on Feature Model and Software Product Line

***Software Product Line(SPL):*** proposes the systematic construction of software based on a family of products from a given area of interest, helping both in the construction of new applications from reusable artifacts (development with reuse) and in the construction of these artifacts (development for reuse) (LINDEN et al., 2007).

Thus, we have to determine from which criteria we build these reusable artifacts, for this we use the concept of *Variability* and *Domain Engineering of an SPL*:

***Variability:*** Software variability is the ability of a software system or artifact to be efficiently extended, modified, customized or configured for a particular context.

***Domain Engineering for the development of SPL:*** process of developing reusable software artifacts for a domain. (CZARNECKI; EISENECKER., 2000).

Among these reusable artifacts of an SPL are the Feature Model and the Features:

***Feature Model:*** models all possible products of an SPL, defining what are the features of an SPL and the relationships between them. It is based on FODA (Feature-Oriented Domain Analysis) which in turn is responsible for producing a domain model by identifying and modeling key similarities and variability between the various domain applications.

***Feature:*** it is a visible, prominent or distinct aspect, quality or characteristic of a software system or systems (KANG et al., 1990).

In the case of this project, it can be said that the domain is the generation of a graphic representation of a website (based on this purpose of the Salt wireframe).

# Types of Relationships between Features
The Feature Model is composed of a diagram of hierarchically organized features composed of relationships between a parent feature and its child features (subfeatures) that can present the following types:

***Mandatory:*** the child feature is included in every product the parent feature appears in.

***Optional:*** the child feature may or may not be included in all products where its parent feature appears.

***Alternativa/XOr:*** We select only one child feature from a set of child features when the parent feature is selected.

In the case of this project, the parent feature, or the root of all the others, would be the page/screen generated by the Salt file.

Note that there is no support in this project for the type of Or relationship between features because it has no correspondent in the ReactFeature API.

# Mandatory Function

The mandatory method signature is given by `$mandatory($multiline, $leftbracket, $midlelement, $rightbracket)` if usage is restricted to Salt (no Parser support in Pegjs for ReactFeature API). The parameters mean:

***$multiline:*** says if the Salt widget you want to represent should be rendered in one line or more. For example, to make a button you need only one line of code in Salt necessarily like `[This is my Button]`, but if you want a Tree Widget or a table you need other lines of code to render them. This parameter indicates whether the rendered Widget will be a simple, single-line Widget or not. As there is no type of Boolean variable in PlantUML, 0 was defined as false and 1 as true. Thus, the representation is if the value of this parameter is 0, then it is a simple widget. If the value is 1, it is a multiline widget.
Variable Type: Integer Number.

***$leftbracket:*** represents the first written part needed to represent the Widget in Salt. For example, to render a button that would look like this in Salt `[this is my button]`, you need to start with a leading character, in this example it is the character "[" . Another example, if now the Widget for tabs `{/ My Tabs 1 | My Tabs 2}`, the leading character is "{/", so that would be the value of the *$leftbracket* parameter in this case.
Variable Type: String.

***$midlelement:*** represents the part between the initial character necessary to start writing a Widget and the final character that indicates the end of writing a Widget. For example, in a button widget `[this is my button]` the midlelement would be equal to "this is my button" which is between the initial character "[" and the final character "]" of a button.
Variable Type: String.

***$rightbracket:*** represents the final character needed to indicate that a Widget is finished writing in Salt. For example, on a Salt button `[Hello World]` the rightbracket parameter would be the character "]".
Variable Type: String.

Notes: It is possible to leave the parameters $leftbracket, $midlelement and $rightbracket empty and still render a Widget as in this case where $rightbracket is empty:

```
@startsalt EmptyParameters
{
     !include https://raw.githubusercontent.com/JoseCarlosDeJesus/PLANTUML-features/main/EstudoDeCasoFeature/definitivefeature.puml

    $mandatory(0,(X),checked radio,"")
}
@endsalt
```
Additionally, there is another mandatory function with Pegjs Parser support that has the following method signature:

`$mandatory($namecomponent,$multiline, $leftbracket, $midlelement, $rightbracket)`

In this method, as well as in others with Parser support, the $namecomponent parameter is included, as in all functions that have Parser support. In Salt itself there is no change in the way Widgets are rendered.

***$namecomponent:*** parameter of type String, which is responsible for telling the Parser what will be the name of the React component called by the MandatoryFeature component of the ReactFeature API.

Lastly, there is the mandatoryInput method which also has support for Parser, with the method signature:
`$mandatoryInput($namecomponent,$midlelement)`

Or for exclusive use in Salt:

`$mandatoryInput($midlelement)`

which in this case only uses the midlelement parameter because this function is only responsible for rendering the Salt input widget, since it will always be enclosed in double quotes.

Example:

```
@startsalt MandatoryExample
{
    !include https://raw.githubusercontent.com/JoseCarlosDeJesus/PLANTUML-features/main/EstudoDeCasoFeature/definitivefeature.puml

    '$mandatory($namecomponent,$multiline, $leftbracket, $midlelement, $rightbracket) supports Parser.
    $mandatory("the name of the component",0, "^", "Droplist", "^")

    !$jsonMandatory = { "multiline": 0, "leftbracket": "[", "midlelement": "json mandatorio", "rightbracket": "]"}

    '$mandatoryJson($json) supports Parser
    $mandatoryJson($jsonMandatory)

    '$mandatoryInput($namecomponent,$midlelement) supports Parser
    $mandatoryInput("MandatoryInputWithParser","this will be in the input field")

    '$mandatoryInput($midlelement) don't supports Parser
    $mandatoryInput("input without Parser")

    '$mandatory($multiline, $leftbracket, $midlelement, $rightbracket) don't supports Parser
    $mandatory(0,(),Unchecked radio,"")
}
@endsalt
```

# Optional Function

The signature of the optional method is given by `$optional($multi, $leftbracket, $midlelement, $rightbracket, $rule)` containing the same parameters as the mandatory functions, as this uses the mandatory function to render the Widget. However, in this method there is a control parameter called $rule that informs whether the Widget should be rendered or not at the moment. This parameter works like a boolean, using the same convention of 0 for false and 1 for true.

To use this function in conjunction with Parser, use this version:

`$optional($namecomponent,$multiline, $leftbracket, $midlelement, $rightbracket, $rule)`

Another way to make the input Widget in Salt with the optional method, in the same way as with the mandatory method:

`$optionalInput($midlelement, $rule)`

With Parser support:

`$optionalInput($namecomponent,$midlelement,$rule)`

Example:
```
@startsalt OptionalExample
{
    !include https://raw.githubusercontent.com/JoseCarlosDeJesus/PLANTUML-features/main/EstudoDeCasoFeature/definitivefeature.puml

    'This variable will be used to control if the Widgets will show or not
    !$myControlVariable = 1

    'JSON Variable for the JSON's functions
    !$jsonOptional = { "multiline": 0, "leftbracket": "[", "midlelement": "json opcional", "rightbracket": "]", "rule": 1}

    '$optional($multi, $leftbracket, $midlelement, $rightbracket, $rule) don't supports Parser
    $optional(1,"{T","+ World %newline()++ America %newline() +++ Canada %newline() +++ USA %newline() ++++ New York %newline() ++++ Boston %newline() +++ Mexico %newline() ++ Europe %newline() +++ Italy %newline() +++ Germany %newline() ++++ Berlin %newline() ++ Africa","}",$myControlVariable)

    '$optionalJson($json) don't supports Parser
    $optionalJson($jsonOptional)

    '$optionalInput($midlelement, $rule) don't supports Parser
    $optionalInput("Input without Parser",$myControlVariable)

    '$optional($namecomponent,$multiline, $leftbracket, $midlelement, $rightbracket, $rule) supports Parser
    $optional("NameParser","","Login: | %chr(34) my name %chr(34)","",$myControlVariable)

    '$optionalJson($json,$rule) supports Parser
    $optionalJson($jsonOptional,"Dummy Text for Parser")

    '$optionalInput($namecomponent,$midlelement,$rule) supports Parser
    $optionalInput("InputParser","Optional Input Parser",$myControlVariable)
}
@endsalt
```

# Alternative Function

The signature of this method is given by `$alternative($multi,$leftbracket, $midlelement, $rightbracket, $rule, $leftalternative,$midlealternative,$rightalternative, $multialternative)` and this method is responsible for rendering a Widget in case the value of the control parameter $rule is 0 or another case is 1. That is, if $rule=0 then the Widget written in the parameters $multi,$leftbracket,$midlelement,$rightbracket will be rendered (the rule for these parameters is the same as the mandatory method), since if $rule=1 then the Widget written in the parameters $multialternative,$leftalternative,$midlealternative,$rightalternative will be rendered.
This method also uses the $mandatory method to render the Widgets.

In the Parser-supported version of this method, `$alternative($namecomponent,$multiline,$leftbracket, $midlelement, $rightbracket, $rule, $namealternative, $leftalternative,$midlealternative,$rightalternative,$multialternative)` the parameter $ namecomponent is the name of the component to be rendered in ReactFeature by the first Widget, while the parameter $namealternative represents the name of the component of the second Widget.

Like the previous methods, the alternative method has a version to represent Salt's Input Widget:

`$alternativeInput($midlelement, $rule, $midlealternative)`

With Parser support:
`$alternativeInput($namecomponent,$midlelement,$rule,$midlealternative,$namealternative)`

where $namecomponent is the name of the first component to be rendered if it is the first Widget rendered and $namealternative is the name of the second if it is the second Widget rendered according to the ReactFeature alternative rule.

Example:
```
@startsalt AlternativeExample
{
    !include https://raw.githubusercontent.com/JoseCarlosDeJesus/PLANTUML-features/main/EstudoDeCasoFeature/definitivefeature.puml

    'This variable will be used to control what Widget will be show
    'in this case will be the second one the 'alternative' one
    !$myControlVariable = 1

    'JSON Variable for the JSON's functions
    !$jsonAlternative = { "multiline": 0, "leftbracket": "[", "midlelement": "ui luigi", "rightbracket": "]", "rule": 0 , "multialternative": 0, "leftalternative": "{*", "midlealternative": "<&menu> | <&cart>", "rightalternative": "}"}

    '$alternative($multi,$leftbracket, $midlelement, $rightbracket, $rule, $leftalternative,$midlealternative,$rightalternative, $multialternative) don't supports Parser
    $alternative(1,"{*","Menu | <b>Another field | the Menu","}",$myControlVariable,"{*","<&menu> | <&cart> %newline() <&menu> | Banana | Apple | - | Avocado","}",0)
    
    '$alternativeInput($midlelement, $rule, $midlealternative) don't supports Parser
    $alternativeInput("first widget",$myControlVariable,"second widget")

    '$alternativeJson($json) don't supports Parser
    $alternativeJson($jsonAlternative)

    '$alternative($namecomponent,$multiline,$leftbracket, $midlelement, $rightbracket, $rule, $namealternative, $leftalternative,$midlealternative,$rightalternative,$multialternative) supports Parser
    $alternative("first widget 1",1,"{*","Menu | <b>Another field | the Menu","}",$myControlVariable,"second widget","{*","<&menu> | <&cart> %newline() <&menu> | Banana | Apple | - | Avocado","}",0)

    '$alternativeJson($json,$namealternative,$rule) supports Parser
    $alternativeJson($jsonAlternative,"json with name","text for the Parser only")

    '$alternativeInput($namecomponent,$midlelement,$rule,$midlealternative,$namealternative) supports Parser
    $alternativeInput("name first widget","first widget in input",$myControlVariable,"input of the second widget","name second widget")
}
```
# How to use the functions to render Complex Widgets

For Salt Widgets that are represented by more than one line of code, or that have separation between lines within the Widget itself, such as Trees and tables, it will be necessary to use the Keyword Argument `%newline()` available by the preprocessor from PlantUML by writing the $midlelement parameter or its corresponding in the Widget.

Example:

```
@startsalt ComplexWidgetExample
{
    !include https://raw.githubusercontent.com/JoseCarlosDeJesus/PLANTUML-features/main/EstudoDeCasoFeature/definitivefeature.puml

    'Advanced table , pay attention to the %newline() keyword where should be a new line to render the Widget
    $mandatory(1,"{#",". | Column 2 | Column 3 %newline() Row header 1 | value 1 | value 2 %newline() Row header 2 | A long cell | *","}")

    'Tree widget [T]
    $mandatory(1,"{T","+ World %newline()++ America %newline() +++ Canada %newline() +++ USA %newline() ++++ New York %newline() ++++ Boston %newline() +++ Mexico %newline() ++ Europe %newline() +++ Italy %newline() +++ Germany %newline() ++++ Berlin %newline() ++ Africa","}")
}
@endsalt
```

It is also possible to render more than one Widget side by side using the "|" character. inside the parameter.

Example:

```
@startsalt gridExample
{
    !include https://raw.githubusercontent.com/JoseCarlosDeJesus/PLANTUML-features/main/EstudoDeCasoFeature/definitivefeature.puml

    $mandatory(0,"","Login: | %chr(34) my name %chr(34)", "")
    $mandatory(0,"Password: |", "%chr(34) ***oi** %chr(34)", "")
    $mandatory(0,"[cancel] |","[Ok]", "")
}
```

We chose to create new methods to render Salt's input Widget, due to the inability to pass double quotes as a parameter in Salt, either '"', or " " ". Another way, however if the user is interested, is to use the Keyword Argument `%chr(34)` where the double quotes would be written inside the parameter.

Example:

```
@startsalt chr34KeywordExample
{
    $mandatory(0,"","%chr(34) This is a input field %chr(34)","")
}
@endsalt
```

If you have doubts about how to write a certain Widget using the methods above, access this [file](https://github.com/JoseCarlosDeJesus/PLANTUML-features/blob/main/Examples/testAllElements.puml) where is all the Widgets of the Salt available in the [PlantUML Guide](https://plantuml.com/guide) and discovered some ways to use the functions to accommodate different scenarios that can occur when writing your Salt.

# JSON Functions

All three types of methods above have a version in which, instead of passing several variables, it receives a JSON type parameter containing the names of the old parameters as attributes to facilitate digitization and/or reuse of variables in the Salt file. writing the Keywords Arguments from the PlantUML preprocessor does not work inside the JSON, the `%newline()` and `%chr(34)` commands will not work which therefore makes it impossible for complex widgets to be rendered using these functions. the use of these functions is restricted to basic Widgets.

No Parser support:
- `$optionalJson($json)`
- `$alternativeJson($json)`

With Parser support:
- `$mandatoryJson($json)`
- `$optionalJson($json,$rule)`
- `$alternativeJson($json,$namealternative,$rule)`

In Parser, the JSON name passed by the function will be the name of the component in the ReactFeature. In the optionalJson and alternativeJson method, $rule is a String parameter that indicates the name of the rule that will be displayed in the ReactFeature, not being the rendering rule itself, which must be contained in a JSON attribute. In the alternativeJson method, the $namealternative parameter is of type String and indicates the name of the second component that can be chosen in the alternative rule of ReactFeature.

Example:
```
@startsalt jsonexample
{   
    'json functions just work with basic widgets! Be warned!

    !include https://raw.githubusercontent.com/JoseCarlosDeJesus/PLANTUML-features/main/EstudoDeCasoFeature/definitivefeature.puml

    !$variavelexemplo = { "multiline": 0, "leftbracket": "[", "midlelement": "json mandatorio", "rightbracket": "]"}
    !$variavelexemplo1 = { "multiline": 0, "leftbracket": "[", "midlelement": "json opcional", "rightbracket": "]", "rule": 1}
    !$variavelalternativa = { "multiline": 0, "leftbracket": "[", "midlelement": "ui luigi", "rightbracket": "]", "rule": 0 , "multialternative": 0, "leftalternative": "{*", "midlealternative": "<&menu> | <&cart>", "rightalternative": "}"}

    $mandatoryJson($variavelexemplo)
    $optionalJson($variavelexemplo1)
    $alternativeJson($variavelalternativa)

}
@endsalt
```

# Parser Pegjs to ReactFeature API

In this project, a [Parser](https://github.com/JoseCarlosDeJesus/PLANTUML-features/blob/main/Parser/feature.pegjs) was made in peg.js(Parser Generator for Javascript). A Parser is a program that takes an input value, parses it into parts and converts it into an output value according to certain rules defined by the specific parser. The Parser made is intended to provide a code structure of a class component in React to be filled in according to the rules and specifications of the developer to make it functional for the [API ReactFeature](https://github. com/Kadurid/LojaVirtualLPS/tree/dev) and be compiled via the Frontend React framework.

Thus, the purpose of this parser is to transform a call of the presented mandatory, optional and alternative methods and transform them into a call of one of the corresponding components of the React Feature API: "<MandatoryFeature/>","<OptionalFeature/>" or "<AlternativeFeature/>". For example, let's say I called the mandatory method in Salt like `$optional("barraSearch",0,"","%chr(34) Search Here %chr(34) |" ,"",$appear)`, the parser will translate it to the ReactFeature like this:

`<OptionalFeature component=barraPesquisa rules={aparecer}/>`

Thus, the parameters of these functions $namecomponent and $namealternative will be interpreted as the name of the component to be rendered by this ReactFeature component and the $rule parameter as the rendering rule of this component by ReactFeature in case it is the optional or alternative methods. If it is a JSON method being called, the name of the JSON type parameter will be used instead of the $namecomponent parameter.

For clarity, suppose you make the following alternative method call `$alternative("first widget 1",1,"{*","Menu | <b>Another field | the Menu","}",$myControlVariable ,"second widget","{*","<&menu> | <&cart> %newline() <&menu> | Banana | Apple | - | Avocado","}",0) then the JSX(way of rendering the React) will render it like this:
`<AlternativeFeature components={[{component:first widget 1, rule: },{component:second widget, rule: }]} rule={myControlVariable}/>`

If the Salt file has a name followed by the UML start, for example `@startsalt filename` the parser will use that name to name the React component that will be produced as output.

To use the Pegjs parser, download the following [Parser in Javascript](https://github.com/JoseCarlosDeJesus/PLANTUML-features/blob/main/Parser/feature-parser.js), place it in the desired folder of your project and then just import normally like any other file in NodeJS and call the parse method with a string as a parameter. If the string is invalid according to Parser rules, an exception will be thrown with a message with more details of the error in question.

For example, let's say I want to pass this Salt file as an input value:

```
@startsalt perfilInclude
{

    !include https://raw.githubusercontent.com/JoseCarlosDeJesus/PLANTUML-features/main/EstudoDeCasoFeature/definitivefeature.puml

    !$aparecer = 1
    !$desktop = 0

    $optional("BarraPesquisa",0,"","%chr(34) Pesquise Aqui %chr(34) |","",$aparecer)

    $alternative("menuDesktop",1,"{*","Produtos | <b>Meu Carrinho | Meu Perfil","}",$desktop,"menuNavbar","{*","<&menu> | <&cart> %newline() <&menu> | Produtos | Meu Carrinho | - | Meu Perfil","}",0)

    $mandatory("PerfilUsuario",0,"","Nome:Fulano de Tal %newline() Endereço: Gotham City","")
}
@endsalt
```
then in the NodeJS file:

```
const parser = require("./feature-parser");

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
```

Which consequently generates the following output value by the parser in the terminal:

```
export default class  perfilInclude extends React Component{
       constructor(props){
        super();
       }

       render(){
        return(
        <div>
        <OptionalFeature component=BarraPesquisa rules={aparecer}/>
                <AlternativeFeature components={[{component:menuDesktop, rule: },{component:menuNavbar, rule: }]} rule={desktop}/>
                <MandatoryFeature component=PerfilUsuario/>
        </div>
        )
       }

       }
```


# What functions supports Parser Pegjs.

This is a list of functions that have Parser support available by this project at [Parser](https://github.com/JoseCarlosDeJesus/PLANTUML-features/blob/main/Parser/feature.pegjs):

- `$mandatory($namecomponent,$multiline, $leftbracket, $midlelement, $rightbracket)`
- `$optional($namecomponent,$multiline, $leftbracket, $midlelement, $rightbracket, $rule)`
- `$alternative($namecomponent,$multiline,$leftbracket, $midlelement, $rightbracket, $rule, $namealternative, $leftalternative,$midlealternative,$rightalternative,$multialternative)`
- `$mandatoryJson($json)`
- `$optionalJson($json,$rule)`
- `$alternativeJson($json,$namealternative,$rule)`
- `$mandatoryInput($namecomponent,$midlelement)`
- `$optionalInput($namecomponent,$midlelement,$rule)`
- `$alternativeInput($namecomponent,$midlelement,$rule,$midlealternative,$namealternative)`

The functions below are not supported by Parser:
- `$mandatory($multiline, $leftbracket, $midlelement, $rightbracket)`
- `$optional($multi, $leftbracket, $midlelement, $rightbracket, $rule)`
- `$alternative($multi,$leftbracket, $midlelement, $rightbracket, $rule, $leftalternative,$midlealternative,$rightalternative, $multialternative)`
- `$mandatoryInput($midlelement)`
- `$optionalInput($midlelement, $rule)`
- `$alternativeInput($midlelement, $rule, $midlealternative)`
- `$optionalJson($json)`
- `$alternativeJson($json)`

# Learn More

Some useful links to go deeper into the subject and tools used

- [PEG.js](https://pegjs.org/)
- [Peg.js Documentation](https://pegjs.org/documentation)
- [PlantUML](https://plantuml.com/)
- [PlantUML PDF Guide](https://plantuml.com/guide)
- [PlantUML Preprocessor](https://plantuml.com/preprocessing)
- [API React Feature](https://github.com/Kadurid/LojaVirtualLPS/tree/dev)
- [React Official Site](https://react.dev/)