# FarNet.template

FarNet module and script template for C# and F# projects

[.NET SDK]: https://dotnet.microsoft.com/learn/dotnet/hello-world-tutorial/intro
[FarNet]: https://github.com/nightroman/FarNet#readme

With [.NET SDK] v6 installed with Visual Studio or manually, the easiest way to
create module and script projects for [FarNet] is using *FarNet.template* from
the NuGet gallery.

Projects created from the template can be used for development and debugging in
Visual Studio and VSCode.

To install the FarNet template from the NuGet gallery, run:

```
dotnet new -i FarNet.template
```

Take a look at all templates:

```
dotnet new -l
```

The list should contain "FarNet module" and "FarNet script":

```
Template Name  Short Name     Language  Tags
-------------  -------------  --------  -------------
FarNet module  farnet-module  [C#],F#   FarNet/Module
FarNet script  farnet-script  [C#],F#   FarNet/Script
```

To create a C# (default) or F# module or script project, create a new folder
with the new module or script name, change to it, and invoke one of these:

```
dotnet new farnet-module
dotnet new farnet-script
dotnet new farnet-module -lang F#
dotnet new farnet-script -lang F#
```

To uninstall the template, run:

```
dotnet new -u FarNet.template
```

## Created FarNet project

Before opening created projects in Visual Studio or VSCode ensure you have the
environment variable `FARHOME` set to the Far Manager home. If it is missing
then the development location `C:\Bin\Far\x64` is used, see the project file
and change if needed.

If you build or start Visual Studio or VSCode from Far Manager then the FARHOME
variable exists and set to this Far Manager directory.

## Visual Studio

The project is ready to use in Visual Studio.

## VSCode

Requirements:

- [VSCode C# extension](https://marketplace.visualstudio.com/items?itemName=ms-vscode.csharp) for C# projects and for debugging F# projects.
- [VSCode F# extension](https://marketplace.visualstudio.com/items?itemName=Ionide.Ionide-fsharp) for F# projects.

## Project details

All projects include:

- `.vscode`
    - `launch.json` - VSCode debug settings
    - `tasks.json` - VSCode build task
- `Properties`
    - `launchSettings.json` - Visual Studio debug settings
- `README.md` - documentation file
- `PROJECT_NAME.csproj/fsproj` - project file

Module projects include:

- `Host.cs/fs` - optional module host and its instance
- `Tool1.cs/fs` - plugin menu item "Hello from PROJECT_NAME"
- `Command1.cs/fs` - command invoked using "PROJECT_NAME:" prefix

Script projects include:

- `Demo.cs/fs` - method invoked by `fn: script=PROJECT_NAME; method=PROJECT_NAME.Demo.Message`

All projects reference `FarNet.dll`.

F# projects reference `FSharp.Core.dll` and optional `FarNet.FSharp.dll`. They
are installed together with the module `FarNet.FSharpFar` (really must have if
you develop in F# for Far Manager).

## Building

This command is used to build projects:

    dotnet build

Alternatively, you may build from Visual Studio or VSCode.

When you build a module project then the post build step publishes files to the
FarNet module directory. Ensure Far Manager is not running to avoid files in
use.

When you build a script project the output is sent to the FarNet script folder.
If you test simple methods with `unload=true` then you do not have to restart.

## Debugging

Press `[F5]` to starts debugging in Visual Studio or VSCode.
Debug modes:

- Start Far (Visual Studio, VSCode default mode)
    - The build step is called at first and then debugging starts.`Far.exe`
      should be in the path or you should adjust settings.
- Attach single Far (select in VSCode)
    - Attach to the already running single `Far.exe`.
- Attach selected Far (select in VSCode)
    - Choose one of the several running `Far.exe`.
