module ScriptFSharp.Demo
open FarNet

let Message (name: string) (age: int) =
    far.Message($"name: {name}, age: {age}")
