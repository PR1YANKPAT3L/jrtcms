function GetRandNumber(Number) {
    return Math.ceil(Math.random() * Number);
}
String.prototype.ltrim = function() { return ltrim(this); };
String.prototype.rtrim = function() { return rtrim(this); };
String.prototype.rtrimWithReturn = function() { return rtrimWithReturn(this); };
String.prototype.trim = function() { return trim(this); };

function ltrim(str) {
    var i;
    for (i = 0; i < str.length; i++) {
        if ((str.charAt(i) != " ") && (str.charAt(i) != " ") && (str.charAt(i).charCodeAt() != 13) && (str.charAt(i).charCodeAt() != 10) && (str.charAt(i).charCodeAt() != 32))
            break;
    }
    str = str.substring(i, str.length);
    return str;
}

function rtrim(str) {
    var i;
    for (i = str.length - 1; i >= 0; i--) {
        if ((str.charAt(i) != " ") && (str.charAt(i) != " ") && (str.charAt(i).charCodeAt() != 13) && (str.charAt(i).charCodeAt() != 10) && (str.charAt(i).charCodeAt() != 32))
            break;
    }
    str = str.substring(0, i + 1);
    return str;
}

function rtrimWithReturn(str) {
    var i;
    for (i = str.length - 1; i >= 0; i--) {
        if (str.charAt(i) != " " && str.charAt(i) != " " && str.charAt(i) != "\n")
            break;
    }
    str = str.substring(0, i + 1);
    return str;
}

function trim(str) {
    return ltrim(rtrim(str));
}

function Round(Num, Len) {
    var temp = 1;
    for (var i = 0; i < Len; i++)
        temp *= 10;

    return Math.round(Num * temp) / 100;
}