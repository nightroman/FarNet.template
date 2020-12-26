
# FarNet module created from template

Before opening created projects in Visual Studio or VSCode ensure you have the
environment variable FARHOME set to the Far Manager directory. If it is missing
then the development location `C:\Bin\Far\x64` is used. Note, if you start
Visual Studio or VSCode from Far Manager then FARHOME is set.

Ensure the project name is the same as the module name. This name is used for
the target assembly and the module directory in `FARHOME\FarNet\Modules`.
Otherwise, amend the project file MSBuild instructions.

## Visual Studio

The project is ready to use in Visual Studio 2017, 2019.

## VSCode

Requirements:

- [VSCode C# extension](https://marketplace.visualstudio.com/items?itemName=ms-vscode.csharp) for C# projects and for debugging F# projects.
- [VSCode F# extension](https://marketplace.visualstudio.com/items?itemName=Ionide.Ionide-fsharp) for F# projects.

## Project content

- *.vscode*
    - *launch.json* - VSCode debug settings
    - *tasks.json* - VSCode build task
- *Properties*
    - *launchSettings.json* - Visual Studio debug settings
- *Name.csproj* or *Name.fsproj* - project file
- *Class1.cs* or *Class1.fs* - plugin menu item "Hello"

All projects have references to the mandatory *FarNet* and optional
*FarNet.Tools* and *FarNet.Settings*.

F# projects have references to the mandatory *FSharp.Core.dll* and optional
*FarNet.FSharp.dll*. These assemblies are installed together with the module
*FarNet.FSharpFar*.

You may remove not used optional references but they are harmless.

When you build a project (<kbd>Ctrl-Shift-B</kbd>) the post build step copies
created DLL and PDB files to the target FarNet module directory. Ensure Far
Manager is not running because the files may be in use.

The module created from the template adds a "Hello" item to Far Manager plugin
menus. This command shows a simple message box.

## Debugging

<kbd>F5</kbd> starts debugging of your module. Debug modes:

- Start Far (Visual Studio, VSCode default mode)
    - The build step is called at first and then debugging starts. *Far.exe*
      should be in the path or you should adjust settings.
- Attach single Far (select in VSCode)
    - Attach to the already running single *Far.exe*.
- Attach selected Far (select in VSCode)
    - Choose one of the several running *Far.exe*.
