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
Templates                                         Short Name       Language          Tags
--------------------------------------------------------------------------------------------------------
...
FarNet module                                     farnet           [C#], F#          FarNet/Module
...
```

Then you can create projects using the installed template.

To create a C# (default) or F# module project, create a new folder with your
module name, change to it and run:

```
dotnet new farnet
dotnet new farnet -lang F#
```

After creating a project take a look at its [README.md](Common/README.md).
It describes the generated assets, tells how to use, debug, etc.

To uninstall the template, run:

```
dotnet new -u FarNet.template
```
