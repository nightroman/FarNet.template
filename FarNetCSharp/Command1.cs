using FarNet;
using System;
using System.Data.Common;

namespace FarNetCSharp;

[ModuleCommand(Name = "FarNetCSharp", Prefix = "FarNetCSharp", Id = "30bc4a2c-6e28-43cb-ad38-5c0ee6b7f28f")]
public class Command1 : ModuleCommand
{
	public override void Invoke(object sender, ModuleCommandEventArgs e)
	{
		try
		{
			// The format of command line is up to the module.
			// Here is the parser of connection string format.
			var parameters = new DbConnectionStringBuilder { ConnectionString = e.Command };

			Far.Api.UI.WriteLine($"Parsed {parameters.Count} parameters:");
			foreach (string key in parameters.Keys)
				Far.Api.UI.WriteLine($"{key} = {parameters[key]}");
		}
		catch (Exception ex)
		{
			Far.Api.UI.WriteLine(
				$"Please use semicolon separated key=value pairs. Error: {ex.Message}",
				ConsoleColor.Red);
		}
	}
}
