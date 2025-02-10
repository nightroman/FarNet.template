using FarNet;

namespace ScriptCSharp;

public static class Test
{
	// fn: script=ScriptCSharp; method=.Test.Message
	public static void Message(string name = "unknown", int age = -1)
	{
		Far.Api.Message($"name: {name}, age: {age}");
	}
}
