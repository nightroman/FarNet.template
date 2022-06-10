# FarNet.template

FarNet module template for C# and F# projects

[.NET SDK]: https://dotnet.microsoft.com/learn/dotnet/hello-world-tutorial/intro
[FarNet]: https://github.com/nightroman/FarNet#readme

With [.NET SDK] installed with Visual Studio 2017+ or manually, the easiest way
to create module projects for [FarNet] is using *FarNet.template* from the
NuGet gallery.

Projects created from the template can be used for development and debugging in
Visual Studio and VSCode.

*.NET Core is not supported at the moment*, see [#16](https://github.com/nightroman/FarNet/issues/16).

To install the FarNet module template from the NuGet gallery, run:

```
dotnet new -i FarNet.template
```

Take a look at all templates:

```
dotnet new -l
```

The list should contain "FarNet module":

```
Template Name  Short Name  Language  Tags
-------------  ----------  --------  -------------
FarNet module  farnet      [C#],F#   FarNet/Module
```

To create a C# (default) or F# module project, create a new folder with your
new FarNet module name, change to it, and run:

```
dotnet new farnet
dotnet new farnet -lang F#
```

To uninstall the template, run:

```
dotnet new -u FarNet.template
```

## Created FarNet module

Before opening created projects in Visual Studio or VSCode ensure you have the
environment variable `FARHOME` set to the Far Manager home. If it is missing
then the development location `C:\Bin\Far\x64` is used, see the project file
and change if needed. If you start Visual Studio or VSCode from Far Manager
then FARHOME is set.

## Visual Studio

The project is ready to use in Visual Studio.

## VSCode

Requirements:

- [VSCode C# extension](https://marketplace.visualstudio.com/items?itemName=ms-vscode.csharp) for C# projects and for debugging F# projects.
- [VSCode F# extension](https://marketplace.visualstudio.com/items?itemName=Ionide.Ionide-fsharp) for F# projects.

## Project details

- `.vscode`
    - `launch.json` - VSCode debug settings
    - `tasks.json` - VSCode build task
- `Properties`
    - `launchSettings.json` - Visual Studio debug settings
- `README.md` - documentation file
- `MODULE_NAME.csproj/fsproj` - project file
- `Host.cs/fs` - optional module host and its instance
- `Tool1.cs/fs` - plugin menu item "Hello from MODULE_NAME"
- `Command1.cs/fs` - command invoked using "MODULE_NAME:" prefix

All projects reference assemblies `FarNet` and optional `FarNet.Tools`.

F# projects reference `FSharp.Core.dll` and optional `FarNet.FSharp.dll`. They
are installed together with the module `FarNet.FSharpFar` (really must have if
you develop in F# for Far Manager).

When you build a project the post build step copies built files to the FarNet
module directory. Ensure Far Manager is not running to avoid files in use.

## Debugging

Press `[F5]` to starts debugging.
Debug modes:

- Start Far (Visual Studio, VSCode default mode)
    - The build step is called at first and then debugging starts.`Far.exe`
      should be in the path or you should adjust settings.
- Attach single Far (select in VSCode)
    - Attach to the already running single `Far.exe`.
- Attach selected Far (select in VSCode)
    - Choose one of the several running `Far.exe`.
