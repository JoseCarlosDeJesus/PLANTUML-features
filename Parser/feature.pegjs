
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
  // emptyline { return null }
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

alphabet
  = [a-z]
  / [A-Z]
  / " "
  /[0-9]
  / [\s]
  / [\S]
  // ":"
  // "%"
  // "/"
  // "."
  // ","
  // "("
  // ")"
  / "ç"
  // "^[a-zA-Z0-9!@#$&()-`.+,/\"{}]*$"
  // "-"
  / "\n"
  // "$"
  / $([a-zA-Z0-9!@#$&%:()-`.+,/\"{}|])
  
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

/*emptyline1
  = "^(?:[\t ]*(?:\r?\n|\r))+"
*/

emptyline = "\n"  

number = [0-9]
  
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

AlternativeFunction = "$alternative(" + namecomponent: quotedparameter + virgula + multiline:[0-9]+ virgula + quotedparameter + virgula + quotedparameter + virgula + quotedparameter + rule:number + virgula + namealternative:quotedparameter + virgula + quotedparameter + virgula + quotedparameter + virgula + quotedparameter + virgula + number + ")" newline{
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