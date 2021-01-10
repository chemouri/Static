# Static
- Analyzes  IPAs and APKs
- Reviews all files, extensions, and patterns

Required
----------
All tools need to be inside `/usr/local/bin`

- APKTool (https://ibotpeaches.github.io/Apktool/)


Usage
----------
```
$ static -h
usage: static -path PATH_TO_APP -output PATH_TO_JSON_OUTPUT_FILE

required arguments:
-path $PATH          the $PATH to the app (IPA and APK).
-output $PATH        the $PATH output where the JSON file is written.
```

Add more
----------
- You can add more rules to the [RulesEngine](https://github.com/evilpenguin/Static/tree/main/Static/Static/RuleEngine)
- Update the words in the [RuleWord](https://github.com/evilpenguin/Static/blob/main/Static/Static/RuleEngine/Rules/RuleWord.m#L75)

Output
----------
```
There is no output right now.
```

JSON Output
----------
```
{
  "package" : {
    "path" : "App.ipa",
    "dir_path" : "Payload/App.app",
    "packageHash" : "2469351be9d12fc6ed659e06f4672cdec2b908cd39f698a0ed0624076cbd59a2"
  },
  "artifacts" : [
      {
        "path" : "Payload/App.app/SomeFile.strings",
        "macho" : {
          "pie" : false,
          "words" : [
            {
              "line" : "somefile.mm",
              "found_word" : "mm"
            }
          ],
          "libraries" : [
            "@rpath\/SomeFramework.framework\/SomeFramework",
            "\/System\/Library\/Frameworks\/Foundation.framework\/Foundation",
            "\/usr\/lib\/libobjc.A.dylib",
            "\/usr\/lib\/libSystem.B.dylib",
            "\/System\/Library\/Frameworks\/CoreFoundation.framework\/CoreFoundation"
          ]
        "words" : [
          {
            "line" : "<key>debug</key>",
            "range" : "{0, 5}",
            "line_number" : 52,
            "found_word" : "debug"
          }
        ],
        "file_name" : "SomeFile.strings",
        "file_hash" : "998e15745d89d451403c87ca80d0d42c0ecd298ad999bebb131d3a2b8e6cbb49"
      }
  ]
}

```
