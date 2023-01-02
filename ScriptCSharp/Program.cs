using FarNet;

namespace ScriptCSharp;

public static class Program
{
	// fn: script=ScriptCSharp; method=.Program.Run; unload=true :: name=John Doe; age=42
	public static void Run(string name = "unknown", int age = -1)
	{
		Far.Api.Message($"name: {name}, age: {age}");
	}
}
