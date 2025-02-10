namespace ModuleFSharp
open FarNet

[<AllowNullLiteral>]
type Host() as this =
    inherit ModuleHost()

    static let mutable instance : Host = null

    do
        instance <- this

    static member public Instance = instance
