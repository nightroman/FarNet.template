using FarNet;

namespace ModuleCSharp;

[ModuleTool(Name = "ModuleCSharp", Options = ModuleToolOptions.AllMenus, Id = "f584e496-b801-4df3-be4f-2848d3a6e77c")]
public class Tool : ModuleTool
{
	public override void Invoke(object sender, ModuleToolEventArgs e)
	{
		Far.Api.Message($"Hello from {e.From}");
	}
}
