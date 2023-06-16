start = plantumlfile

plantumlfile = noise "@startsalt" diagram:namedDiagram openSaltBracket newline filelines:umllines "}" newline noise "@endsalt" noise {
 return `export default class ${diagram} extends React Component{
 constructor(props){
 	super();
 }
 
 render(){
 	return(
 	<div>
 	${filelines.join("\n\t\t")}
 	</div>
 }
 
 }` ;
}

umllines
  = lines:(umlline*) { for (var i = 0; i < lines.length; i++) { if (lines[i]===null) { lines.splice(i, 1); i--; } } return lines; }

umlline
  = MandatoryFunction
  / AlternativeFunction
  / OptionalFunction
  / MandatoryInputFunction
  / AlternativeInputFunction
  / OptionalInputFunction
  / MandatoryJsonFunction
  / OptionalJsonFunction
  / AlternativeJsonFunction
  / commentline { return null }
  / emptyline {return null }
  / include {return null }
  / log {return null}
  / plantvariable {return null}
  / declaratedFunction {return null}

noise
  = [ \t]*  
newline
  = [\r\n]
  / [\n]
  
commentline
  = noise "'" [^\r\n]+ noise
  / noise ".." [^\r\n\.]+ ".." noise
  / noise "--" [^\r\n\-]+ "--" noise
  / noise "__" [^\r\n\_]+ "__" noise
  
_ "whitespace"
  = [ \t\n\r]*
  
virgula
  = ","

emptyline = "\n"

doublequote = '"' chars:DoubleStringCharacter* '"' { return chars.join(""); }

DoubleStringCharacter
  = !('"' / "\\") char:. { return char; }
  / "\\" sequence:EscapeSequence { return sequence; }
  
EscapeSequence
  = "'"
  / '"'
  / "\\"
  / "b"  { return "\b";   }
  / "f"  { return "\f";   }
  / "n"  { return "\n";   }
  / "r"  { return "\r";   }
  / "t"  { return "\t";   }
  / "v"  { return "\x0B"; }  
  
MandatoryFunction = noise "$mandatory(" namecomponent:parameter multiline:numberOrVariable1 lefbracket:parameter midlelement:parameter rightbracket:parameter newline {
	return `<MandatoryFeature component=${namecomponent}/>`;
} 

AlternativeFunction = noise "$alternative(" namecomponent:parameter multiline:numberOrVariable1 leftbracket:parameter midlelement:parameter rightbracket:parameter rule:numberOrVariable1 namealternative:parameter leftalternative:parameter midlealternative:parameter rightalternative:parameter multialternative:numberOrVariable2 newline{
	return `<AlternativeFeature components={[{component:${namecomponent}, rule: },{component:${namealternative}, rule: }]} rule={${rule}}/>`;
}

OptionalFunction = noise "$optional(" namecomponent:parameter multiline:numberOrVariable1 leftbracket:parameter midlelement:parameter rightbracket:parameter rule:numberOrVariable2 newline{
	return `<OptionalFeature component=${namecomponent} rules={${rule}}/>`;
}

MandatoryInputFunction = noise "$mandatoryInput(" namecomponent:parameter parameter newline {
	return `<MandatoryFeature component=${namecomponent}/>`;
}

AlternativeInputFunction = noise "$alternativeInput(" namecomponent:parameter midlelement:parameter rule: numberOrVariable1 midlealternative:parameter namealternative:parameter newline {
	return `<AlternativeFeature components={[{component:${namecomponent}, rule: },{component:${namealternative}, rule: }]} rule={${rule}}/>` ;
}

OptionalInputFunction = noise "$optionalInput(" namecomponent:parameter midlelement:parameter rule:numberOrVariable2 newline {
	return `<OptionalFeature component=${namecomponent} rules={${rule}}/>`;
}

MandatoryJsonFunction = noise "$mandatoryJson(" namecomponent:parameter newline {
	return `<MandatoryFeature component=${namecomponent}/>`;
}

OptionalJsonFunction = noise "$optionalJson(" namecomponent:parameter rule:numberOrVariable2  newline {
	return `<OptionalFeature component=${namecomponent} rules={${rule}}/>`;
}

AlternativeJsonFunction = noise "$alternativeJson(" namecomponent:parameter namealternative:parameter rule:numberOrVariable2 newline {
	return `<AlternativeFeature components={[{component:${namecomponent}, rule: },{component:${namealternative}, rule: }]} rule={${rule}}/>`;
}

numberOrVariable2 = chars:numberOrVariable* ")" {
 if(chars[0] === '$'){
   chars[0] = "";
 }
return chars.join(""); }

numberOrVariable1 = chars:numberOrVariable* "," {
 if(chars[0] === '$'){
   chars[0] = "";
 }
return chars.join(""); }

numberOrVariable
 = char:[a-zA-Z0-9-$] {return char;}

LineOfText = text:$(char+) EOL
   { return text }
  
// this part is to the include part.
char = [^\n\r]
newline1 = '\n' / '\r' '\n'?
EOL = newline1 / !.

include
 = noise "!include" LineOfText
 / noise "!include_many" LineOfText
 / noise "!include_once" LineOfText
 
declaratedFunction
 = noise "!procedure" chars:functionScope* noise "!endprocedure" noise
  / noise "!function" chars:functionScope* noise "!endfunction" noise
  
functionScope
 = noise !("!endprocedure" / "!endfunction") char:. { return char; }
 
log
 = noise "!log" LineOfText
 
plantvariable
 = noise "!$" LineOfText
 
openSaltBracket
 = noise "{" char
  / noise "{"
  
namedDiagram
 = name:LineOfText
 / noise newline {return name;}
 
parameter
 = banana:doublequote virgula {return banana}
 / names:doublequote ")"
 / "$" apple:numberOrVariable2 {return apple;}
 / "$" names:numberOrVariable1 // ","
 {return names;} 