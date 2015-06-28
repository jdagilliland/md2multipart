import System.Environment
import Data.Either.Unwrap
import Text.Pandoc

-- | 'main' runs the main program
main :: IO ()
main = print pandocConverted

textToConvert = unlines [ "Hello World.\n"
                        , "    this is a Markdown code block\n"
                        , "[This is a link](http://www.latermuse.com/)\n" ]
pandocParsed = readMarkdown def textToConvert
pandocConverted = writeHtmlString def $ fromRight pandocParsed
