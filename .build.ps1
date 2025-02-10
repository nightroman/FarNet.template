<#
.Synopsis
	Build script, https://github.com/nightroman/Invoke-Build
#>

param(
	$FarHome = (property FarHome C:\Bin\Far\x64),
	$Configuration = (property Configuration Release)
)

task build {
	exec { dotnet build ModuleCSharp\ModuleCSharp.csproj /p:FarHome=$FarHome /p:Configuration=$Configuration }
	exec { dotnet build ModuleFSharp\ModuleFSharp.fsproj /p:FarHome=$FarHome /p:Configuration=$Configuration }
	exec { dotnet build ScriptCSharp\ScriptCSharp.csproj /p:FarHome=$FarHome /p:Configuration=$Configuration }
	exec { dotnet build ScriptFSharp\ScriptFSharp.fsproj /p:FarHome=$FarHome /p:Configuration=$Configuration }
}

task clean {
	remove z, *.nupkg, *\bin, *\obj, *\.vs
}

task sync {
	Assert-SameFile ModuleCSharp\.vscode\launch.json ModuleFSharp\.vscode\launch.json
	Assert-SameFile ModuleCSharp\.vscode\launch.json ScriptCSharp\.vscode\launch.json
	Assert-SameFile ModuleCSharp\.vscode\launch.json ScriptFSharp\.vscode\launch.json

	Assert-SameFile ModuleCSharp\.vscode\tasks.json ModuleFSharp\.vscode\tasks.json
	Assert-SameFile ModuleCSharp\.vscode\tasks.json ScriptCSharp\.vscode\tasks.json
	Assert-SameFile ModuleCSharp\.vscode\tasks.json ScriptFSharp\.vscode\tasks.json

	Assert-SameFile ModuleCSharp\Properties\launchSettings.json ModuleFSharp\Properties\launchSettings.json
	Assert-SameFile ModuleCSharp\Properties\launchSettings.json ScriptCSharp\Properties\launchSettings.json
	Assert-SameFile ModuleCSharp\Properties\launchSettings.json ScriptFSharp\Properties\launchSettings.json
}

task package sync, {
	remove z
	exec { robocopy ModuleCSharp z\content\ModuleCSharp /s /xd .vs bin obj } 1
	exec { robocopy ModuleFSharp z\content\ModuleFSharp /s /xd .vs bin obj } 1
	exec { robocopy ScriptCSharp z\content\ScriptCSharp /s /xd .vs bin obj } 1
	exec { robocopy ScriptFSharp z\content\ScriptFSharp /s /xd .vs bin obj } 1

	Copy-Item -Destination z @(
		'README.md'
		'Package.nuspec'
		"$env:FarNetCode\Zoo\FarNetLogo.png"
	)

	Assert-SameFile.ps1 -Text -View $env:MERGE -Result (Get-ChildItem z\content -Recurse -File -Name) -Sample @'
ModuleCSharp\Command.cs
ModuleCSharp\Host.cs
ModuleCSharp\ModuleCSharp.build.ps1
ModuleCSharp\ModuleCSharp.csproj
ModuleCSharp\README.md
ModuleCSharp\Tool.cs
ModuleCSharp\.template.config\template.json
ModuleCSharp\.vscode\launch.json
ModuleCSharp\.vscode\tasks.json
ModuleCSharp\Properties\launchSettings.json
ModuleFSharp\Command.fs
ModuleFSharp\Host.fs
ModuleFSharp\ModuleFSharp.build.ps1
ModuleFSharp\ModuleFSharp.fsproj
ModuleFSharp\README.md
ModuleFSharp\Tool.fs
ModuleFSharp\.template.config\template.json
ModuleFSharp\.vscode\launch.json
ModuleFSharp\.vscode\tasks.json
ModuleFSharp\Properties\launchSettings.json
ScriptCSharp\README.md
ScriptCSharp\ScriptCSharp.build.ps1
ScriptCSharp\ScriptCSharp.csproj
ScriptCSharp\Test.cs
ScriptCSharp\Test.Message.fn.command
ScriptCSharp\.template.config\template.json
ScriptCSharp\.vscode\launch.json
ScriptCSharp\.vscode\tasks.json
ScriptCSharp\Properties\launchSettings.json
ScriptFSharp\README.md
ScriptFSharp\ScriptFSharp.build.ps1
ScriptFSharp\ScriptFSharp.fsproj
ScriptFSharp\Test.fs
ScriptFSharp\Test.Message.fn.command
ScriptFSharp\.template.config\template.json
ScriptFSharp\.vscode\launch.json
ScriptFSharp\.vscode\tasks.json
ScriptFSharp\Properties\launchSettings.json
'@
}

task nuget package, {
	exec { NuGet.exe pack z\Package.nuspec -NoPackageAnalysis }
}

task install {
	assert ($name = (Get-Item FarNet.template.*.nupkg).Name)
	exec { dotnet new install $name }
}

task uninstall {
	# fails if not installed
	dotnet new uninstall FarNet.template
}

function Test-Template($Folder, $Command) {
	remove C:\tmp\tryFarNetTemplate, "$FarHome\FarNet\$Folder\tryFarNetTemplate"
	$null = mkdir C:\tmp\tryFarNetTemplate

	Push-Location C:\tmp\tryFarNetTemplate

	# new project, build, clean
	exec $Command
	Invoke-Build

	requires -Path $FarHome\FarNet\$Folder\tryFarNetTemplate\tryFarNetTemplate.dll

	Pop-Location
	remove C:\tmp\tryFarNetTemplate, $FarHome\FarNet\$Folder\tryFarNetTemplate
}

task testModuleCSharp {
	Test-Template Modules { dotnet new farnet-module }
}

task testModuleFSharp {
	Test-Template Modules { dotnet new farnet-module -lang F# }
}

task testScriptCSharp {
	Test-Template Scripts { dotnet new farnet-script }
}

task testScriptFSharp {
	Test-Template Scripts { dotnet new farnet-script -lang F# }
}

task test testModuleCSharp, testModuleFSharp, testScriptCSharp, testScriptFSharp

# Synopsis: Next dev cycle.
task . uninstall, nuget, install, test, clean
