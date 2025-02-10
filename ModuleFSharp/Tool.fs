namespace ModuleFSharp
open FarNet

[<ModuleTool(Name = "ModuleFSharp", Options = ModuleToolOptions.AllMenus, Id = "cc0ecb2f-552a-4fe4-90f0-227077386890")>]
type Tool1() =
    inherit ModuleTool()

    override _.Invoke(_, e) =
        Far.Api.Message $"Hello from {e.From}"
