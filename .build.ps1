<#
.Synopsis
	Build script (https://github.com/nightroman/Invoke-Build)
#>

param(
	$FarHome = (property FarHome C:\Bin\Far\x64),
	$Configuration = (property Configuration Release)
)

task build {
	exec {dotnet build ModuleCSharp\ModuleCSharp.csproj /p:FarHome=$FarHome /p:Configuration=$Configuration}
	exec {dotnet build ModuleFSharp\ModuleFSharp.fsproj /p:FarHome=$FarHome /p:Configuration=$Configuration}
}

task clean {
	remove z, *.nupkg, *\bin, *\obj, *\.vs
}

task sync {
	Assert-SameFile ModuleCSharp\.vscode\launch.json ModuleFSharp\.vscode\launch.json
	Assert-SameFile ModuleCSharp\.vscode\tasks.json ModuleFSharp\.vscode\tasks.json
	Assert-SameFile ModuleCSharp\Properties\launchSettings.json ModuleFSharp\Properties\launchSettings.json
}

task publish sync, {
	remove z
	exec {robocopy ModuleCSharp z\content\ModuleCSharp /s /xd bin obj .vs} (0..2)
	exec {robocopy ModuleFSharp z\content\ModuleFSharp /s /xd bin obj .vs} (0..2)
	exec {robocopy ScriptCSharp z\content\ScriptCSharp /s /xd bin obj .vs} (0..2)
	exec {robocopy ScriptFSharp z\content\ScriptFSharp /s /xd bin obj .vs} (0..2)
	Copy-Item -Destination z @(
		'README.md'
		'Package.nuspec'
		"$env:FarNetCode\Zoo\FarNetLogo.png"
	)
}

task nuget publish, {
	exec {NuGet.exe pack z\Package.nuspec}
}

task install {
	assert ($name = (Get-Item FarNet.template.*.nupkg).Name)
	exec {dotnet new install $name}
}

task uninstall {
	# fails if not installed
	dotnet new uninstall FarNet.template
}

function Test-Template($Folder, $Command) {
	remove C:\tmp\tryFarNetTemplate, "$FarHome\FarNet\$Folder\tryFarNetTemplate"
	$null = mkdir C:\tmp\tryFarNetTemplate

	Push-Location C:\tmp\tryFarNetTemplate
	exec $Command
	exec { dotnet build }

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
task . uninstall, nuget, install, clean
