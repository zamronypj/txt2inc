# txt2inc
Shell program to convert any text file content as Pascal quoted string variable

## Requirement

- [FreePascal](https://www.freepascal.org/) >= 3.0

## Compilation

Clone this repository and run FreePascal compiler.

```
$ fpc txt2inc.pas
```

## Run

```
$ ./txt2inc /path/to/input/text/file /path/to/output/file variableName
```

For example, if content of `/path/to/input/text/file` is like following

```
<html>
<head></head>
<body>
    <a href="link.html">Link</a>
</body>
</html>
```

Then output file will contain text as below

```
variableName : string =
'   <html>' + LineEnding +
'   <head></head>' + LineEnding +
'   <body>' + LineEnding +
'       <a href="link.html">Link</a>' + LineEnding +
'   </body>' + LineEnding +
'   </html>';
```

Which actually a valid Pascal string variable declaration, which then can be
included in Pascal program/unit source code.

```
var

    {$INCLUDE output.inc}
```

## Credit

Original author is irfanbagus

[Multiline string constant discussion](http://forum.lazarus.freepascal.org/index.php?topic=20706.0)
