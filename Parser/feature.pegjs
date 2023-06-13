
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
  / emptyline { return null }
  / emptyline1 {return null }

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

alphabet
  = [a-z]
  / [A-Z]
  / " "
  /[0-9]
  / [\s]
  / [\S]
  / ":"
  / "%"
  / "/"
  / "."
  / ","
  / "("
  / ")"
  / "ç"
  / "^[a-zA-Z0-9!@#$&()-`.+,/\"]*$"
  / "-"
  / "\n"
  
doublequote
 = '"'

commentline
  = noise "'" [^\r\n]+ noise
  / noise ".." [^\r\n\.]+ ".." noise
  / noise "--" [^\r\n\-]+ "--" noise
  / noise "__" [^\r\n\_]+ "__" noise
  
quotedparameter
 = doublequote + alphabet + doublequote
 
_ "whitespace"
  = [ \t\n\r]*
  
virgula
  = ","
emptyline
  = "^(?:[\t ]*(?:\r?\n|\r))+"
  
emptyline1 = "\n"  
  
parameters
  = namecomponent: quotedparameter + virgula + multiline:[0-9]+ virgula + quotedparameter + virgula + quotedparameter + virgula + quotedparameter
  
plantumlfile = "@startsalt" noise newline "{" newline filelines:umllines noise "@endsalt" noise {
 return filelines ;
}

umllines
  = lines:(umlline*) { for (var i = 0; i < lines.length; i++) { if (lines[i]===null) { lines.splice(i, 1); i--; } } return lines; }


MandatoryFunction = "$mandatory("+ namecomponent: quotedparameter + virgula + multiline:[0-9]+ virgula + quotedparameter + virgula + quotedparameter + virgula + quotedparameter + ")" newline {
	return `<MandatoryFeature component=${namecomponent}/>`;
} 

AlternativeFunction = "$alternative(" newline{
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