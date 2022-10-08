using FarNet;

namespace ScriptCSharp;

public static class Demo
{
	public static void Message(string name = "unknown", int age = -1)
	{
		Far.Api.Message($"name: {name}, age: {age}");
	}
}
