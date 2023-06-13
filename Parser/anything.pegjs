//Example: (in here there can be 'anything' !"#¤);); any character is possible);

Text
 = "(" text:TextUntilTerminator ");" { return text.join(""); }

TextUntilTerminator
 = x:(&HaveTerminatorAhead .)* { return x.map(y => y[1]) }

HaveTerminatorAhead
 = . (!");" .)* ");"
