namespace FarNetFSharp
open FarNet
open System
open System.Data.Common

[<ModuleCommand(Name = "FarNetFSharp", Prefix = "FarNetFSharp", Id = "0d526cb9-7006-4ab4-8b82-7bc5d3cb8e2b")>]
type Command1() =
    inherit ModuleCommand()
    override _.Invoke(_, e) =
        try
            // The format of command line is up to the module.
            // Here is the parser of connection string format.
            let parameters = DbConnectionStringBuilder(ConnectionString = e.Command)

            Far.Api.UI.WriteLine($"Parsed {parameters.Count} parameters:")
            for key in parameters.Keys do
                Far.Api.UI.WriteLine($"{key} = {parameters[string key]}");

        with ex ->
            Far.Api.UI.WriteLine(
                $"Please use semicolon separated key=value pairs. Error: {ex.Message}",
                ConsoleColor.Red)
