module ScriptFSharp.Script
open FarNet

// fn: script=ScriptFSharp; method=.Test.Message
let Message (name: string) (age: int) =
    far.Message($"name: {name}, age: {age}")
