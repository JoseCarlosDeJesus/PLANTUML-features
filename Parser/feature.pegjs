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
  / commentline { return null }
  / emptyline {return null }
  / include {return null }
  / log {return null}
  / plantvariable {return null}

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
  
MandatoryFunction =  "$mandatory(" + namecomponent:doublequote + virgula + multiline:numberOrVariable + virgula + lefbracket:doublequote + virgula + midlelement:doublequote + virgula + rightbracket:doublequote ")" newline {
	return `<MandatoryFeature component=${namecomponent}/>`;
} 

AlternativeFunction = "$alternative(" + namecomponent:doublequote + virgula + multiline:numberOrVariable + virgula + leftbracket:doublequote + virgula + midlelement:doublequote + virgula + rightbracket:doublequote + virgula + rule:numberOrVariable1 +  namealternative:doublequote + virgula + leftalternative:doublequote + virgula + midlealternative:doublequote + virgula + rightalternative:doublequote + virgula + multialternative:numberOrVariable + ")" newline{
	return `<AlternativeFeature components={[{component:${namecomponent}, rule: },{component:${namealternative}, rule: }]} rule={${rule}}/>`;
}

OptionalFunction = "$optional(" + namecomponent:doublequote + virgula + multiline:[a-zA-Z0-9-$] + virgula + leftbracket:doublequote + virgula + midlelement:doublequote + virgula + rightbracket:doublequote + virgula + rule:numberOrVariable2 newline{
	return `<OptionalFeature component=${namecomponent} rules={${rule}}/>`;
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

numberOrVariable2 = chars:numberOrVariable* ")" { return chars.join(""); }

numberOrVariable1 = chars:numberOrVariable* "," { return chars.join(""); }

numberOrVariable
 = char:[a-zA-Z0-9-$] {return char;}

LineOfText = text:$(char+) EOL
   { return text }

// this part is to the include part.
char = [^\n\r]
newline1 = '\n' / '\r' '\n'?
EOL = newline1 / !.

include
 = "!include" LineOfText
 / "!include_many" LineOfText
 / "!include_once" LineOfText
 
log
 = "!log" LineOfText
 
plantvariable
 = "!$" LineOfText