using System;
using System.IO;
namespace lyb_gfc;

/// The main gfc class containing all external methods
class Gfc
{
	/*
		String Directory to check
		String Output file location
		bool Wether we should do it recursivly
		String[] File endings that are used for raw files
	*/

	public Result<String> GonFromCode(String pInput)
	{
		return .Err;
	}

	///Retrieves gon information between gcf-start and gfc
	///@param pInput path to the input file
	///@param pOutput path to the output file, will be overwritten
	///@param pRaw If this is set to true it will parse the entire file instead of only inside the bounds
	public Result<void> GonFromFile(StringView pInput, StringView pOutput, bool pRaw = false)
	{
	   if(!File.Exists(pInput))
			return .Err;

		gfcFile file = scope .();
		var gon = file.Read(pInput, pRaw);
		return File.WriteAllText(pOutput, gon.ToString(.. scope .()));
	}
}