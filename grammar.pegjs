// Simple Arithmetics Grammar
// ==========================
//
// Accepts expressions like "2 * (3 + 4)" and computes their value.

{
    let mapArabic ={
        '٠':'0',
        '١':'1',
        '٢':'2',
        '٣':'3',
        '٤':'4',
        '٥':'5',
        '٦':'6',
        '٧':'7',
        '٨':'8',
        '٩':'9',
    }
    function convert(num){
        let res=[]
        
        for (let i = 0; i < num.length; i++) {
            const element = num[i];
            res.push(mapArabic[element])
        }
        let fres = res.join('')
        console.log(`num: ${num},res:: ${res},fres ${fres}`);
        
        return fres
    }
}

Expression
  = head:Term tail:(_ ("+" / "-") _ Term)* {
      return tail.reduce(function(result, element) {
        if (element[1] === "+") { return result + element[3]; }
        if (element[1] === "-") { return result - element[3]; }
      }, head);
    }

Term
  = head:Factor tail:(_ ("*" / "/") _ Factor)* {
      return tail.reduce(function(result, element) {
        if (element[1] === "*") { return result * element[3]; }
        if (element[1] === "/") { return result / element[3]; }
      }, head);
    }

Factor
  = "(" _ expr:Expression _ ")" { return expr; }
  / Integer

Integer "integer"
  = _ [0-9٠-٩]+ { return parseInt(convert(text()), 10); }

_ "whitespace"
  = [ \t\n\r]*