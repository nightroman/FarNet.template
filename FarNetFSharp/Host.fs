namespace FarNetFSharp
open FarNet

/// The host is created once when the module is loaded.
/// Use its constructor for initializing module pieces.
/// Remove this file if the host is not needed.
[<AllowNullLiteral>]
type Host() as this =
    inherit ModuleHost()
    static let mutable instance : Host = null

    do
        // keep the instance
        instance <- this

        // add your code here
        //...

    /// Use this for GetString, GetHelpTopic, ShowHelpTopic.
    static member public Instance = instance
