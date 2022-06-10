namespace FarNetFSharp
open FarNet

[<ModuleTool(Name = "Hello from FarNetFSharp", Options = ModuleToolOptions.AllMenus)>]
[<Guid("cc0ecb2f-552a-4fe4-90f0-227077386890")>]
type Tool1() =
    inherit ModuleTool()
    override _.Invoke(_, e) =
        Far.Api.Message $"Hello from {e.From}"
