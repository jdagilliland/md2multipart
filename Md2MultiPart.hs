import System.Environment
import Text.Pandoc
import Text.Pandoc.Error
import Mime

-- | 'main' reads from stdin and outputs the result of conversion
main :: IO ()
main = do
    textToConvert <- getContents
    putStrLn $ md2multi textToConvert

-- | 'md2html' converts a string of markdown text into HTML using pandoc
md2html :: String -> Either PandocError String
md2html inText = do
    pandocParsed <- readMarkdown def inText
    return $ writeHtmlString def pandocParsed

-- | 'md2multi' converts a markdown string into text + HTML multipart, or in
-- case of error, merely returns the original string.
md2multi :: String -> String
md2multi inText = let
    htmlConvert = md2html inText
    multi = case htmlConvert of
        Right htmlContent -> combineParts inText htmlContent
        Left _ -> inText
    in multi

