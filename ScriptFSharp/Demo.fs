module ScriptFSharp.Demo
open FarNet

// fn: script=ScriptFSharp; method=ScriptFSharp.Demo.Message; unload=true :: name=John Doe; age=42
let Message (name: string) (age: int) =
    far.Message($"name: {name}, age: {age}")
