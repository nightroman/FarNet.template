using FarNet;

namespace ScriptCSharp;

public static class Demo
{
	// fn: script=ScriptCSharp; method=ScriptCSharp.Demo.Message; unload=true :: name=John Doe; age=42
	public static void Message(string name = "unknown", int age = -1)
	{
		Far.Api.Message($"name: {name}, age: {age}");
	}
}
