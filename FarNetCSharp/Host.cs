using FarNet;

namespace FarNetCSharp;

/// <summary>
/// The host is created once when the module is loaded.
/// Use its constructor for initializing module pieces.
/// Remove this file if the host is not needed.
/// </summary>
public class Host : ModuleHost
{
	/// <summary>
	/// Use this for GetString, GetHelpTopic, ShowHelpTopic.
	/// </summary>
	public static Host Instance { get; private set; }

	public Host()
	{
		// keep the instance
		Instance = this;

		// add your code here
		//...
	}
}
