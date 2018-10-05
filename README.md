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
'   <html>'#13#10+
'   <head></head>'#13#10+
'<body>'#13#10+
'       <a href="link.html">Link</a>'#13#10+
'</body>'#13#10+
'</html>';
```

Which actually a valid Pascal string variable declaration, which then can be
included in Pascal program/unit source code.

```
{$INCLUDE output.inc}
```
