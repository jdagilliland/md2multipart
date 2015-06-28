import System.Environment
import Data.Either.Unwrap
import Text.Pandoc
import Text.Pandoc.Error

-- | 'main' runs the main program
main :: IO ()
main = print . fromRight $ md2html textToConvert

md2html :: String -> Either PandocError String
md2html inText = do
    pandocParsed <- readMarkdown def inText
    return $ writeHtmlString def pandocParsed

textToConvert :: String
textToConvert = unlines [ "Hello World.\n"
                        , "    this is a Markdown code block\n"
                        , "[This is a link](http://www.latermuse.com/)\n" ]
