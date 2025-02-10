using FarNet;

namespace ModuleCSharp;

public class Host : ModuleHost
{
	public static Host Instance { get; private set; } = null!;

	public Host()
	{
		Instance = this;
	}
}
