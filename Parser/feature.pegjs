
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

Integer "integer"
  = _ [0-9]+ { return parseInt(text(), 10); }

_ "whitespace"
  = [ \t\n\r]*
  
plantumlfile = items: ("@startsalt" noise newline filelines:umllines noise "@endsalt" noise) {
 for (var i = 0; i < items.length; i++)
 { if (items[i] === null) { items.splice(i, 1); i--; } }
 return items
}

umllines
  = lines:(umlline*) { for (var i = 0; i < lines.length; i++) { if (lines[i]===null) { lines.splice(i, 1); i--; } } return lines; }


MandatoryFunction = "[q#" id:[0-9]+ "]" {
	return "<MandatoryFeature component= />";
} 

AlternativeFunction = "fuck you" newline{
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