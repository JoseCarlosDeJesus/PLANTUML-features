start = plantumlfile

plantumlfile = "@startsalt" noise newline "{" newline filelines:umllines noise "@endsalt" noise {
 return filelines ;
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
  / plantumlfile
  / commentline { return null }
  / emptyline {return null }

startblock
  = noise [{] noise
endblock
  = noise [}]
noise
  = [ \t]*  
splitter
  = [:]
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
  
MandatoryFunction =  "$mandatory(" + namecomponent:doublequote + virgula + multiline:[a-zA-Z0-9-$] + virgula + lefbracket:doublequote + virgula + midlelement:doublequote + virgula + rightbracket:doublequote ")" newline {
	return `<MandatoryFeature component=${namecomponent}/>`;
} 

AlternativeFunction = "fuck you" {
	return "fuck you";
}

OptionalFunction = "Badass" newline {
	return "badass";
}

MandatoryInputFunction = "oi meu amigo" newline {
	return " oi meu amigo";
}

AlternativeInputFunction = "alternative input" newline {
	return " alternative input" ;
}

OptionalInputFunction = "optional input" newline {
	return "optional input";
}

MandatoryJsonFunction = "mandatoryJson Function" newline {
	return "mandatory json";
}

OptionalJsonFunction = "OptionalJson Function" newline {
	return "optional json";
}

AlternativeJsonFunction = "AlternativeJson Function" newline {
	return "alternative json";
}