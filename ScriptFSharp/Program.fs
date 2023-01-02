module ScriptFSharp.Program
open FarNet

// fn: script=ScriptFSharp; method=.Program.Run; unload=true :: name=John Doe; age=42
let Run (name: string) (age: int) =
    far.Message($"name: {name}, age: {age}")
