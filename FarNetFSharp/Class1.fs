﻿module Test
open FarNet

[<ModuleTool(Name = "Hello.F#", Options = ModuleToolOptions.AllMenus)>]
[<Guid("cc0ecb2f-552a-4fe4-90f0-227077386890")>]
type FSharpTool () =
    inherit ModuleTool ()
    override __.Invoke (_, e) =
        Far.Api.Message "Hello from F# module!"
