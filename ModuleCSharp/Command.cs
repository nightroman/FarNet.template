using FarNet;

namespace ModuleCSharp;

[ModuleCommand(Name = "ModuleCSharp", Prefix = "ModuleCSharp", Id = "30bc4a2c-6e28-43cb-ad38-5c0ee6b7f28f")]
public class Command : ModuleCommand
{
	public override void Invoke(object sender, ModuleCommandEventArgs e)
	{
		Far.Api.UI.WriteLine($"{e.Prefix}:{e.Command}", ConsoleColor.Cyan);
	}
}
