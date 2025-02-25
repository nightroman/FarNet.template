using FarNet;

namespace ScriptCSharp;

public static class Script
{
	// fn: script=ScriptCSharp; method=Message
	public static void Message(string name = "unknown", int age = -1)
	{
		Far.Api.Message($"name: {name}, age: {age}");
	}
}
