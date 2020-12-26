<#
.Synopsis
	Build script (https://github.com/nightroman/Invoke-Build)
#>

param(
	$FarHome = (property FarHome C:\Bin\Far\x64),
	$Configuration = (property Configuration Release)
)

task build {
	exec {dotnet build FarNetCSharp\FarNetCSharp.csproj /p:FarHome=$FarHome /p:Configuration=$Configuration}
	exec {dotnet build FarNetFSharp\FarNetFSharp.fsproj /p:FarHome=$FarHome /p:Configuration=$Configuration}
}

task clean {
	remove z, *.nupkg, *\bin, *\obj, *\.vs
}

task sync {
	Assert-SameFile FarNetCSharp\.vscode\launch.json FarNetFSharp\.vscode\launch.json
	Assert-SameFile FarNetCSharp\.vscode\tasks.json FarNetFSharp\.vscode\tasks.json
}

task publish sync, {
	remove z
	exec {robocopy FarNetCSharp z\content\FarNetCSharp /s /xd bin obj .vs} (0..2)
	exec {robocopy FarNetFSharp z\content\FarNetFSharp /s /xd bin obj .vs} (0..2)
	Copy-Item Common\README.md z\content\FarNetCSharp
	Copy-Item Common\README.md z\content\FarNetFSharp
	Copy-Item Package.nuspec z
	$null = mkdir z\images
	Copy-Item C:\ROM\FarDev\Code\Zoo\FarNetLogo.png z\images
}

task nuget publish, {
	exec {NuGet.exe pack z\Package.nuspec}
}

task install {
	assert ($name = (Get-Item FarNet.template.*.nupkg).Name)
	exec {dotnet new -i $name}
}

task uninstall {
	exec {dotnet new -u FarNet.template}
}

function Test-Template($Command) {
	remove C:\tmp\tryFarNetTemplate, $FarHome\FarNet\Modules\tryFarNetTemplate
	$null = mkdir C:\tmp\tryFarNetTemplate
	Push-Location C:\tmp\tryFarNetTemplate
	exec $Command
	exec { dotnet build }
	assert { Test-Path $FarHome\FarNet\Modules\tryFarNetTemplate\tryFarNetTemplate.dll }
	Pop-Location
	remove C:\tmp\tryFarNetTemplate, $FarHome\FarNet\Modules\tryFarNetTemplate
}

task testFarNetCSharp {
	Test-Template {dotnet new farnet}
}

task testFarNetFSharp {
	Test-Template {dotnet new farnet -lang F#}
}

task test testFarNetCSharp, testFarNetFSharp

# Synopsis: Next dev cycle.
task . uninstall, nuget, install, clean
