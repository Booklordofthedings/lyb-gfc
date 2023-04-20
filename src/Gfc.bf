using System;
using System.IO;
namespace lyb_gfc;

/// The main gfc class containing all external methods
class Gfc
{
	/*
		GonFromFile(Input, Output, Raw = false) -> Read the input file and parse everything inside gfc-start/end || if raw is true just simply parse the file as is and copy it to the resulting file
		GonFromDir(Input, Output, RawEndings[]) -> Read all files from the input directory and parse each one into a corresponding gon file. If RawEndings are provided, files that end with one of the raw endings will be full parsed
		GonFromDirRec(Input, Output, RawEndings[]) -> Read all files from the input directory and parse each one into a corresponding gon file recursivly. If RawEndings are provided, files that end with one of the raw endings will be full parsed
		Combine(Input, Output, Seperate = false) -> recursivly combine all .gon files from the given directory into a single file. If seperate is given it will wrap the entire thing into a corresponding file
	*/

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