start = function

virgula = ","

function = "$mandatory(" + test:doublequote + virgula + test2:doublequote + virgula + doublequote ")"{
	return `<MandatoryComponent namecomponent =${test} rule=${test2}`;
}

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