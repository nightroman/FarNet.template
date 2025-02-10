namespace ModuleFSharp
open FarNet
open System

[<ModuleCommand(Name = "ModuleFSharp", Prefix = "ModuleFSharp", Id = "0d526cb9-7006-4ab4-8b82-7bc5d3cb8e2b")>]
type Command1() =
    inherit ModuleCommand()

    override _.Invoke(_, e) =
        Far.Api.UI.WriteLine($"{e.Prefix}:{e.Command}", ConsoleColor.Cyan)
