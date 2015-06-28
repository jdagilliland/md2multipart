import System.Environment
-- import Text.Pandoc

-- | 'main' runs the main program
main :: IO ()
main = getArgs >>= print . haqify . head

haqify :: String -> String
haqify s = "Haq! " ++ s
