using System;
using System.IO;
using gon_beef;
namespace lyb_gfc;

class gfcFile
{
	public Gon Read(StringView pInput, bool pAsRaw)
	{
		GonParser parser = new .();
		String Text = File.ReadAllText(pInput, .. scope .()); //gon only needs \n not \n\r so preserve line endings would be bad here

		if(pAsRaw) //Simple and easy
		{
			var result = parser.Parse(.. new .(), Text);

			delete parser;
			return result; //This requires that the called deletes it, so this should only be used internally
		}

		PartialFile p = new PartialFile(Text);
		var result = parser.Parse(.. new .(), p.ExtractedText);

		delete parser;
		return result; //This requires that the called deletes it, so this should only be used internally
	}

}