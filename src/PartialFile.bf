using System;
using gon_beef.Components;
namespace lyb_gfc;

class PartialFile
{
	//Extract all content lines inside of the gfc block
	public String ExtractedText;

	public this(String pText)
	{
		ExtractedText = new .();
		var enumerator = ExtractedText.Split('\n');
		bool parse = false;
		for(var e in enumerator)
		{
			var stripped = Strip(e);
			if(stripped == "gfc-start")
				parse = true;
			else if(stripped == "gfc-end")
				parse = false;

			if(parse)
				ExtractedText.Append(e);
		}

	}

	public ~this()
	{
		delete ExtractedText;
	}
}