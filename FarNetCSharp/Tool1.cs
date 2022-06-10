using System;
using FarNet;

namespace FarNetCSharp
{
	[System.Runtime.InteropServices.Guid("f584e496-b801-4df3-be4f-2848d3a6e77c")]
	[ModuleTool(Name = "Hello.C#", Options = ModuleToolOptions.AllMenus)]
	public class Tool1 : ModuleTool
	{
		public override void Invoke(object sender, ModuleToolEventArgs e)
		{
			Far.Api.Message("Hello from C# module!");
		}
	}
}
